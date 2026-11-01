using System.Collections.Generic;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.Rendering;

[RequireComponent(typeof(StadiumSpectators))]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public abstract class Stadium : MonoBehaviour
{
	[NotObfuscatedCause("Class: Because the type might be a type called through reflection.")]
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	[NotObfuscatedCause("Namespace: Because the type might be a type called through reflection.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	public struct Seat
	{
		[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
		[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
		[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
		public enum VisibleFromSide
		{
			[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
			None,
			[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
			SideA,
			[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
			SideB
		}

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public VisibleFromSide Side;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public Vector3 Position;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public int Angle;
	}

	private List<Seat> mfj;

	public List<Seat> phb
	{
		get
		{
			if (mfj == null)
			{
				mfj = fam();
			}
			return mfj;
		}
	}

	public StadiumSpectators phc => GetComponent<StadiumSpectators>();

	protected abstract List<Seat> fam();

	protected List<Seat> fap(Vector3 a, int b, int c, Vector3 d, int e, Vector3 f, int g = 1, Vector3? h = null, Seat.VisibleFromSide i = Seat.VisibleFromSide.None)
	{
		List<Seat> list = new List<Seat>();
		Quaternion quaternion = Quaternion.Euler(0f, b, 0f);
		if (!h.HasValue)
		{
			h = Vector3.zero;
		}
		for (int j = 0; j < g; j++)
		{
			for (int k = 0; k < e; k++)
			{
				for (int l = 0; l < c; l++)
				{
					list.Add(new Seat
					{
						Angle = b,
						Position = a + quaternion * d * l + quaternion * f * k + quaternion * h.Value * j,
						Side = i
					});
				}
			}
		}
		return list;
	}

	private void faq()
	{
		GameObject gameObject = new GameObject("Seats positions");
		float num = 0.1f;
		foreach (Seat item in phb)
		{
			GameObject obj = GameObject.CreatePrimitive(PrimitiveType.Sphere);
			obj.name = "Seat";
			obj.transform.parent = gameObject.transform;
			obj.GetComponent<SphereCollider>().enabled = false;
			obj.GetComponent<Renderer>().material.color = Color.yellow;
			obj.GetComponent<MeshRenderer>().shadowCastingMode = ShadowCastingMode.Off;
			obj.GetComponent<MeshRenderer>().receiveShadows = false;
			obj.transform.localScale = new Vector3(num, num, num);
			obj.transform.position = item.Position;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public void Start()
	{
		rs rs2 = rr.gjj(MatchSettings.Current.Stadium);
		if (rs2 != null)
		{
			base.gameObject.GetComponent<StadiumCustomization>().phd = rs2;
		}
	}
}
