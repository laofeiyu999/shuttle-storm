using System;
using System.Collections.Generic;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class vu
{
	public Dictionary<string, object> nmq;

	public float? nmr;

	public Color? nms;

	public Color? nmt;

	public float? nmu;

	public FontStyles? nmv;

	public Action<GameObject, vu, int, bool, Table> nmw;

	public vu()
	{
	}

	public vu(Dictionary<string, object> a)
	{
		nmq = a;
	}

	public vu(Action<GameObject, vu, int, bool, Table> a)
	{
		nmw = a;
	}
}
