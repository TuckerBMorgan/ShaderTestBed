Shader "Windows"
{
	Properties
	{
		_MainTex("Texture", 2D) = "white" {}
	}
		SubShader{
		// Draw ourselves after all opaque geometry
		Tags{ "Queue" = "Geometry+1" }
		ColorMask 0
		ZWrite Off
		// Grab the screen behind the object into _GrabTexture, using default values
		GrabPass{}

		// Render the object with the texture generated above.
		Pass{
			Stencil{
				Ref 1
				Comp always
			}

			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0

			#include "UnityCG.cginc"	

			sampler2D _GrabTexture;

			float4 vert(appdata_base v) : POSITION{
				return mul(UNITY_MATRIX_MVP, v.vertex);
			}

			fixed4 frag(float4 sp:VPOS) : SV_Target{
				float2 wcoord = sp.xy / _ScreenParams.xy;
				float4 total = tex2D(_GrabTexture, wcoord);
				return total;
			}

			ENDCG

		}
	}
}
