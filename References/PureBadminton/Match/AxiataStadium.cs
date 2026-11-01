using System.Collections.Generic;
using System.Linq;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class AxiataStadium : Stadium
{
	protected static readonly Vector3 mfc = new Vector3(0.587f, 0f, 0f);

	protected static readonly Vector3 mfd = new Vector3(0f, 0.3f, -0.93f);

	protected static readonly Vector3 mfe = new Vector3(0f, 0.6f, -0.75f);

	private float mff = 69f;

	private float mfg = 25f;

	public List<Seat> fal(Vector3 a, Vector3 b, int[] c, int d, Vector3 e, Vector3 f, Seat.VisibleFromSide g = Seat.VisibleFromSide.None)
	{
		List<Seat> list = new List<Seat>();
		List<Seat> list2 = new List<Seat>();
		Quaternion quaternion = Quaternion.Euler(0f, d, 0f);
		for (int i = 0; i < c.Length; i++)
		{
			for (int j = 0; j < c[i]; j++)
			{
				list.Add(new Seat
				{
					Angle = d,
					Position = a + quaternion * e * j + quaternion * f * i,
					Side = g
				});
				list2.Add(new Seat
				{
					Angle = d,
					Position = b - quaternion * e * j + quaternion * f * i,
					Side = g
				});
			}
		}
		return list.Concat(list2).ToList();
	}

	protected override List<Seat> fam()
	{
		List<Seat> list = new List<Seat>();
		bool flag = (float)Screen.width / (float)Screen.height > 5f;
		list.AddRange(fap(new Vector3(-16f, 1.83f, 0.8f), 180, 18, mfc, 4, mfd, 1, null, Seat.VisibleFromSide.SideA));
		list.AddRange(fap(new Vector3(-16f, 3.18f, 5.3f), 180, 18, mfc, 8, mfd, 1, null, Seat.VisibleFromSide.SideA));
		list.AddRange(fap(new Vector3(-29.19f, 1.83f, 0.8f), 180, 18, mfc, 4, mfd, 1, null, Seat.VisibleFromSide.SideA));
		list.AddRange(fap(new Vector3(-29.19f, 3.18f, 5.3f), 180, 18, mfc, 8, mfd, 1, null, Seat.VisibleFromSide.SideA));
		list.AddRange(fap(new Vector3(-42.4f, 1.83f, 0.8f), 180, 18, mfc, 4, mfd, 1, null, Seat.VisibleFromSide.SideA));
		list.AddRange(fap(new Vector3(-42.4f, 3.18f, 5.3f), 180, 18, mfc, 8, mfd, 1, null, Seat.VisibleFromSide.SideA));
		list.AddRange(fal(new Vector3(-55.57f, 1.83f, 0.8f), new Vector3(-13.43f, 1.83f, 0.8f), new int[4] { 13, 14, 15, 15 }, 180, mfc, mfd, Seat.VisibleFromSide.SideA));
		list.AddRange(fal(new Vector3(-55.57f, 3.18f, 5.3f), new Vector3(-13.43f, 3.18f, 5.3f), new int[8] { 16, 17, 18, 18, 19, 19, 20, 20 }, 180, mfc, mfd, Seat.VisibleFromSide.SideA));
		if (flag)
		{
			list.AddRange(fal(new Vector3(-3.45f, 1.83f, -1.75f), new Vector3(-1.75f, 1.83f, -3.45f), new int[4] { 6, 6, 7, 8 }, -135, mfc, mfd));
			list.AddRange(fal(new Vector3(-0.23f, 3.18f, 1.46f), new Vector3(1.46f, 3.18f, -0.23f), new int[8] { 9, 9, 10, 11, 11, 12, 13, 14 }, -135, mfc, mfd));
		}
		if (flag)
		{
			list.AddRange(fal(new Vector3(-1.66f, 1.83f, -21.6f), new Vector3(-3.35f, 1.83f, -23.3f), new int[4] { 6, 6, 7, 8 }, -45, mfc, mfd));
			list.AddRange(fal(new Vector3(1.56f, 3.18f, -24.81f), new Vector3(-0.14f, 3.18f, -26.51f), new int[8] { 9, 9, 10, 11, 11, 12, 13, 14 }, -45, mfc, mfd));
		}
		list.AddRange(fap(new Vector3(-52.85f, 1.83f, -25.85f), 0, 18, mfc, 4, mfd, 1, null, Seat.VisibleFromSide.SideB));
		list.AddRange(fap(new Vector3(-52.85f, 3.18f, -30.33f), 0, 18, mfc, 8, mfd, 1, null, Seat.VisibleFromSide.SideB));
		list.AddRange(fap(new Vector3(-39.67f, 1.83f, -25.85f), 0, 18, mfc, 4, mfd, 1, null, Seat.VisibleFromSide.SideB));
		list.AddRange(fap(new Vector3(-39.67f, 3.18f, -30.33f), 0, 18, mfc, 8, mfd, 1, null, Seat.VisibleFromSide.SideB));
		list.AddRange(fap(new Vector3(-26.47f, 1.83f, -25.85f), 0, 18, mfc, 4, mfd, 1, null, Seat.VisibleFromSide.SideB));
		list.AddRange(fap(new Vector3(-26.47f, 3.18f, -30.33f), 0, 18, mfc, 8, mfd, 1, null, Seat.VisibleFromSide.SideB));
		list.AddRange(fal(new Vector3(-13.29f, 1.83f, -25.85f), new Vector3(-55.71f, 1.83f, -25.85f), new int[4] { 13, 14, 15, 15 }, 0, mfc, mfd, Seat.VisibleFromSide.SideB));
		list.AddRange(fal(new Vector3(-13.29f, 3.18f, -30.33f), new Vector3(-55.71f, 3.18f, -30.33f), new int[8] { 16, 17, 18, 18, 19, 19, 20, 20 }, 0, mfc, mfd, Seat.VisibleFromSide.SideB));
		if (flag)
		{
			list.AddRange(fal(new Vector3(-65.39f, 1.83f, -23.34f), new Vector3(-67.09f, 1.83f, -21.63f), new int[4] { 6, 6, 7, 8 }, 45, mfc, mfd));
			list.AddRange(fal(new Vector3(-68.57f, 3.18f, -26.52f), new Vector3(-70.28f, 3.18f, -24.81f), new int[8] { 9, 9, 10, 11, 11, 12, 13, 14 }, 45, mfc, mfd));
		}
		if (flag)
		{
			list.AddRange(fal(new Vector3(-67.25f, 1.83f, -3.45f), new Vector3(-65.55f, 1.83f, -1.75f), new int[4] { 6, 6, 7, 8 }, 135, mfc, mfd));
			list.AddRange(fal(new Vector3(-70.46f, 3.18f, -0.23f), new Vector3(-68.77f, 3.18f, 1.46f), new int[8] { 9, 9, 10, 11, 11, 12, 13, 14 }, 135, mfc, mfd));
		}
		return list;
	}
}
