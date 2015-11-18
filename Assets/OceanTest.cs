using UnityEngine;
using System.Collections;

public class OceanTest : MonoBehaviour {
    MeshFilter mf;
    Vector3[] verts;
    Vector2 sample;
    public float scale = 10;
    public float power = 0;

    float XCorrd = 0;
    float YCorrd = 0;

	// Use this for initialization
	void Start () {

        mf = GetComponent<MeshFilter>();
      sample = new Vector2(Random.Range(0.0f, 100.0f), Random.Range(0.0f, 100.0f));
	}
	
	// Update is called once per frame
	void Update () {
        GetComponent<Renderer>().material.SetFloat("_shift", power);
        power += Time.deltaTime * 0.1f;
	}
}
