using UnityEngine;
using System.Collections;

public class BoatTest : MonoBehaviour {
    public MeshFilter _mesh;
    public float _counter = 0;
  

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
        transform.position = _mesh.mesh.vertices[(int)_counter];
        _counter += Time.deltaTime;
	}
}
