using System.Collections.Generic;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CoubertinStadium : Stadium
{
	protected static readonly Vector3 mfh = new Vector3(0.612f, 0f, 0f);

	protected static readonly Vector3 mfi = new Vector3(0f, 0.6f, -0.93f);

	protected override List<Seat> fam()
	{
		List<Seat> list = new List<Seat>();
		list.AddRange(fap(new Vector3(-2.85f, 2.13f, 0.8f), 180, 18, mfh, 8, mfi, 1, null, Seat.VisibleFromSide.SideA));
		list.AddRange(fap(new Vector3(-16.59f, 2.13f, 0.8f), 180, 18, mfh, 8, mfi, 1, null, Seat.VisibleFromSide.SideA));
		list.AddRange(fap(new Vector3(-30.33f, 2.13f, 0.8f), 180, 18, mfh, 8, mfi, 1, null, Seat.VisibleFromSide.SideA));
		list.AddRange(fap(new Vector3(-12.8f, 2.14f, -22.77f), 0, 18, mfh, 9, mfi));
		list.AddRange(fap(new Vector3(-17.73f, 3.34f, -24.81f), 0, 5, mfh, 7, mfi, 1, null, Seat.VisibleFromSide.SideB));
		list.AddRange(fap(new Vector3(-23.72f, 3.94f, -25.83f), 0, 6, mfh, 6, mfi, 1, null, Seat.VisibleFromSide.SideB));
		list.AddRange(fap(new Vector3(-28.67f, 3.34f, -24.81f), 0, 5, mfh, 7, mfi, 1, null, Seat.VisibleFromSide.SideB));
		list.AddRange(fap(new Vector3(-41.5f, 2.14f, -22.77f), 0, 18, mfh, 9, mfi));
		return list;
	}
}
