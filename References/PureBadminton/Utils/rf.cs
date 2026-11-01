using System.Collections.Generic;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class rf
{
	public MatchSettings.PositionOnCourt muv;

	public bool muw;

	public bool mux;

	public bool muy;

	public bool muz;

	public bool mva;

	public bool mvb;

	public Vector3? mvc;

	public Dictionary<MatchSettings.PositionOnCourt, int> mvd = new Dictionary<MatchSettings.PositionOnCourt, int>();

	public Dictionary<MatchSettings.PositionOnCourt, float> mve = new Dictionary<MatchSettings.PositionOnCourt, float>();

	public float mvf;

	public List<rg> mvg = new List<rg>();

	public bool? pmo
	{
		get
		{
			if (!muw)
			{
				return null;
			}
			return mvb ^ (muz || muy || (!mva && mux));
		}
	}
}
