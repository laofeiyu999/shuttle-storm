using OPS.Obfuscator.Attribute;
using UnityEngine;

[CreateAssetMenu(fileName = "ShuttleBounceParameters", menuName = "Pure Badminton/Shuttle Bounce Parameters")]
[NotObfuscatedCause("Class: Because the type might be a type called through reflection.")]
[NotObfuscatedCause("Class: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because the type might be a type called through reflection.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class ShuttleBounceParameters : ScriptableObject
{
	[Header("Net contact")]
	[Tooltip("Vertical (Z) velocity restitution when shuttle hits the net top.")]
	[Range(0f, 1f)]
	[NotObfuscatedCause("Is in ScriptableObject and this ScriptableObject gets not obfuscated: Obfuscator Free is used.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float netRestitution = 0.2f;

	[Tooltip("Horizontal velocity friction when shuttle hits the net.")]
	[Range(0f, 1f)]
	[NotObfuscatedCause("Is in ScriptableObject and this ScriptableObject gets not obfuscated: Obfuscator Free is used.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float netFriction = 0.6f;

	[Header("Floor contact")]
	[Tooltip("Y position (m) at which the shuttle is considered to touch the floor. Set to match the shuttle's visual ground clearance so it doesn't appear half-buried.")]
	[NotObfuscatedCause("Is in ScriptableObject and this ScriptableObject gets not obfuscated: Obfuscator Free is used.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float floorContactHeight = 0.03f;

	[Tooltip("Vertical (Y) velocity restitution when shuttle hits the floor.")]
	[Range(0f, 1f)]
	[NotObfuscatedCause("Is in ScriptableObject and this ScriptableObject gets not obfuscated: Obfuscator Free is used.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float floorRestitution = 0.4f;

	[Tooltip("Minimum post-bounce upward velocity (m/s). Guarantees a visible bounce on soft impacts. ~1.7 m/s = peak 15 cm.")]
	[NotObfuscatedCause("Is in ScriptableObject and this ScriptableObject gets not obfuscated: Obfuscator Free is used.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float floorMinBounceVelocity = 1.7f;

	[Tooltip("Maximum post-bounce upward velocity (m/s). Caps huge bounces on smashes. ~2.2 m/s = peak 25 cm.")]
	[NotObfuscatedCause("Is in ScriptableObject and this ScriptableObject gets not obfuscated: Obfuscator Free is used.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float floorMaxBounceVelocity = 2.2f;

	[Tooltip("Horizontal velocity friction when shuttle hits the floor.")]
	[Range(0f, 1f)]
	[NotObfuscatedCause("Is in ScriptableObject and this ScriptableObject gets not obfuscated: Obfuscator Free is used.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float floorFriction = 0.6f;

	[Header("Termination")]
	[Tooltip("Stop iterating bounces when |velocity| falls below this (m/s).")]
	[NotObfuscatedCause("Is in ScriptableObject and this ScriptableObject gets not obfuscated: Obfuscator Free is used.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float stopVelocityThreshold = 0.5f;

	[Tooltip("Maximum number of floor bounces to compute.")]
	[NotObfuscatedCause("Is in ScriptableObject and this ScriptableObject gets not obfuscated: Obfuscator Free is used.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public int maxFloorBounces = 3;

	[NotObfuscatedCause("Is in ScriptableObject and this ScriptableObject gets not obfuscated: Obfuscator Free is used.")]
	private static ShuttleBounceParameters _instance;

	public static ShuttleBounceParameters pgt
	{
		get
		{
			if (_instance == null)
			{
				_instance = Resources.Load<ShuttleBounceParameters>("ShuttleBounceParameters");
			}
			return _instance;
		}
	}
}
