Shader "Custom/OceanShader" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_FunTexture("Ocean Texture", 2D) = "white"{}
		_shift("Shift", Float) = 0
		_scale("Scale", Float) = 0
		_height("Height", Float) = 0
		_LODLevel("Lod Level", Float) = 0
	}
	SubShader {
		Pass
		{
			CGPROGRAM
			// Physically based Standard lighting model, and enable shadows on all light types
			#pragma target 3.0
			#pragma glsl
			#pragma vertex vert
			#pragma fragment frag


			#include "UnityCG.cginc"

			sampler2D _MainTex;
			sampler2D _FunTexture;
			uniform float4 _Color;
			float _shift;
			float _scale;
			float _height;
			float _LODLevel;

			struct VertexInput {
				float4 Pos: POSITION;
			};

			struct vertexOutput{
				float4 Pos: SV_POSITION;
				float4 norms : TEXCOORD0;
			};

			float rand(float2 co){
				return sin(dot(co.xy, float2(12.9898, 78.233))) * 43758.5453;
			}

			vertexOutput vert(VertexInput i)
			{
				vertexOutput  o;
				float ran = (rand(float2(i.Pos.x, i.Pos.y)));
				float4 height = tex2Dlod(_MainTex, float4((i.Pos.x * _scale) + _shift + ran, (i.Pos.z * _scale) + _shift + ran, i.Pos.y, _LODLevel));
				i.Pos.y += height.z * (_height);
				o.Pos = mul(UNITY_MATRIX_MVP, i.Pos);
				o.norms = height;
				return o;
			};

			float4 frag(vertexOutput i) : COLOR
			{
				return _Color *  (0.5 + i.norms.y);// *tex2D(_FunTexture, i.Pos);
			};

			ENDCG
		}
	} 
	FallBack "Diffuse"
}
