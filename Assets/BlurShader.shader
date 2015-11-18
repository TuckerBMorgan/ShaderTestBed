Shader "Custom/BlurShader" {
	Properties{
		_MainTex("Base (RGB)", 2D) = "white" {}
	}
		SubShader{
		Pass{
			Tags{ "Queue" = "Geometry+2" }
			Stencil{
				Ref 1
				Comp equal
			}

			CGPROGRAM
		#pragma vertex vert_img
		#pragma fragment frag
		#pragma glsl
		#include "UnityCG.cginc"

			uniform sampler2D _MainTex;

			fixed4 frag(v2f_img i) : SV_Target{
				float4 col = tex2D(_MainTex, i.uv);
				return col;
			}
				ENDCG
		}

		Pass{
				
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma glsl
			
			struct VertexInput {
				float4 Pos: POSITION;
			};

			struct vertexOutput{
				float4 norms : TEXCOORD0;
			};

			vertexOutput vert(VertexInput vi)
			{
				vertexOutput vo;

				return vo;
			}

			fixed4 frag(VertexInput i) : COLOR
			{
				return float4(1, 1, 1, 1);
			}
			ENDCG
		}
	}
}
