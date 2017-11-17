cbuffer ModelViewProjectionConstantBuffer : register(b0)
{
	matrix model;
	matrix view;
	matrix projection;
};

struct VertexShaderInput
{
	float3 pos : POSITION;
	float4 color : COLOR0;
	float2 texcoord: TEXCOORD0;
	float map_tex:PARAM0;
};

struct VertexShaderOutput
{
	float4 pos : SV_POSITION;
	float4 color : COLOR0;
	float2 texcoord: TEXCOORD0;
	float map_tex:PARAM0;
};

VertexShaderOutput main(VertexShaderInput input)
{
	VertexShaderOutput output;
	float4 pos = float4(input.pos, 1.0f);

	// Transform the vertex position into projected space.
	pos = mul(pos, model);
	pos = mul(pos, view);
	pos = mul(pos, projection);
	output.pos = pos;
	output.texcoord = input.texcoord;
	output.map_tex = input.map_tex;
	output.color = input.color;

	return output;
}
