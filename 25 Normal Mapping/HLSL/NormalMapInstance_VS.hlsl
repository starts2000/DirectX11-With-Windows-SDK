#include "Basic.hlsli"

// ������ɫ��
VertexPosHWNormalTangentTex VS(InstancePosNormalTangentTex vIn)
{
    VertexPosHWNormalTangentTex vOut;
    
    matrix viewProj = mul(g_View, g_Proj);
    vector posW = mul(float4(vIn.PosL, 1.0f), vIn.World);

    vOut.PosW = posW.xyz;
    vOut.PosH = mul(posW, viewProj);
    vOut.NormalW = mul(vIn.NormalL, (float3x3) vIn.WorldInvTranspose);
    vOut.TangentW = mul(vIn.TangentL, vIn.World);
    vOut.Tex = vIn.Tex;
    return vOut;
}