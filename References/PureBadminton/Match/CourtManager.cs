using System;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CourtManager : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameManager Game;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public static float fieldLength = 15.6f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public static float fieldWidth = 8.5f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public static float courtLength = 13.41f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public static float doubleCourtWidth = 6.1f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const float netHeight = 1.55f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public static float halfCourtLength = courtLength / 2f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public static float frontZoneLength = 1.98f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public static float rearZoneLength = 0.76f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public static float sideZoneWidth = 0.42f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public static float singleCourtWidth = doubleCourtWidth - 2f * sideZoneWidth - 2f * pca;

	public static float pca => 0.04f;

	public CourtGeometry pcb => new CourtGeometry(base.transform.position.x, base.transform.position.z, Game.pdy.IsDouble);

	public Vector3 pcc => base.transform.position;

	public float pcd => pcb.pbs;

	public float pce => pcb.pbt;

	public float pcf => pcb.pbu;

	public float pcg => pcb.pbv;

	public float pch => pcb.pbw;

	public float pci => base.transform.position.z;

	public float pcj => base.transform.position.x;

	public Rect pck => pcb.pbx;

	public Rect pcl => new Rect(pce, pcg, pcd, halfCourtLength);

	public Rect pcm => new Rect(pce, pci, pcd, halfCourtLength);

	public float pcn => pcb.pby;

	public float pco => pcb.pbz;

	public Rect pcp => pcb.dup(a: true, b: true);

	public Rect pcq => pcb.dup(a: true, b: false);

	public Rect pcr => pcb.dup(a: false, b: true);

	public Rect pcs => pcb.dup(a: false, b: false);

	public Rect dvp(bool a)
	{
		if (!a)
		{
			return pcm;
		}
		return pcl;
	}

	public Rect dvq(bool a, bool b)
	{
		return pcb.dup(a, b);
	}

	public bool dvr(Vector3 a)
	{
		if (a.x >= pce && a.x <= pcf && a.z >= pcg)
		{
			return a.z <= pch;
		}
		return false;
	}

	public float dvs(Vector3 a)
	{
		return pcb.duq(a);
	}

	public float dvt(float a, bool b, float c = 0f)
	{
		if (b && !Game.peb)
		{
			bool a2 = Game.lmy ^ !Game.lmx;
			return pcb.dus(a, CourtGeometry.dut(a2, Game.ped), c);
		}
		return pcb.dur(a, c);
	}

	public float dvu(Vector3 a)
	{
		return Mathf.Atan((a.y - 1.55f) / Mathf.Abs(a.z - pci)) * 180f / MathF.PI;
	}
}
