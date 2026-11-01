using OPS.Obfuscator.Attribute;
using UnityEngine;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CameraController : MonoBehaviour
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum CameraModes
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Follow,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Isometric,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Free
	}

	private Transform kay;

	private Transform kaz;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Transform CameraTarget;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float FollowDistance = 30f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float MaxFollowDistance = 100f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float MinFollowDistance = 2f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float ElevationAngle = 30f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float MaxElevationAngle = 85f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float MinElevationAngle;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float OrbitalAngle;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CameraModes CameraMode;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool MovementSmoothing = true;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool RotationSmoothing;

	private bool kba;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float MovementSmoothingValue = 25f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float RotationSmoothingValue = 5f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float MoveSensitivity = 2f;

	private Vector3 kbb = Vector3.zero;

	private Vector3 kbc;

	private float kbd;

	private float kbe;

	private Vector3 kbf;

	private float kbg;

	private const string kbh = "Slider - Smoothing Value";

	private const string kbi = "Slider - Camera Zoom";

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		if (QualitySettings.vSyncCount > 0)
		{
			Application.targetFrameRate = 60;
		}
		else
		{
			Application.targetFrameRate = -1;
		}
		if (Application.platform == RuntimePlatform.IPhonePlayer || Application.platform == RuntimePlatform.Android)
		{
			Input.simulateMouseWithTouches = false;
		}
		kay = base.transform;
		kba = MovementSmoothing;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		if (CameraTarget == null)
		{
			kaz = new GameObject("Camera Target").transform;
			CameraTarget = kaz;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void LateUpdate()
	{
		bhh();
		if (CameraTarget != null)
		{
			if (CameraMode == CameraModes.Isometric)
			{
				kbc = CameraTarget.position + Quaternion.Euler(ElevationAngle, OrbitalAngle, 0f) * new Vector3(0f, 0f, 0f - FollowDistance);
			}
			else if (CameraMode == CameraModes.Follow)
			{
				kbc = CameraTarget.position + CameraTarget.TransformDirection(Quaternion.Euler(ElevationAngle, OrbitalAngle, 0f) * new Vector3(0f, 0f, 0f - FollowDistance));
			}
			if (MovementSmoothing)
			{
				kay.position = Vector3.SmoothDamp(kay.position, kbc, ref kbb, MovementSmoothingValue * Time.fixedDeltaTime);
			}
			else
			{
				kay.position = kbc;
			}
			if (RotationSmoothing)
			{
				kay.rotation = Quaternion.Lerp(kay.rotation, Quaternion.LookRotation(CameraTarget.position - kay.position), RotationSmoothingValue * Time.deltaTime);
			}
			else
			{
				kay.LookAt(CameraTarget);
			}
		}
	}

	private void bhh()
	{
		kbf = Vector3.zero;
		kbg = Input.GetAxis("Mouse ScrollWheel");
		float num = Input.touchCount;
		if (Input.GetKey(KeyCode.LeftShift) || Input.GetKey(KeyCode.RightShift) || num > 0f)
		{
			kbg *= 10f;
			if (Input.GetKeyDown(KeyCode.I))
			{
				CameraMode = CameraModes.Isometric;
			}
			if (Input.GetKeyDown(KeyCode.F))
			{
				CameraMode = CameraModes.Follow;
			}
			if (Input.GetKeyDown(KeyCode.S))
			{
				MovementSmoothing = !MovementSmoothing;
			}
			if (Input.GetMouseButton(1))
			{
				kbe = Input.GetAxis("Mouse Y");
				kbd = Input.GetAxis("Mouse X");
				if (kbe > 0.01f || kbe < -0.01f)
				{
					ElevationAngle -= kbe * MoveSensitivity;
					ElevationAngle = Mathf.Clamp(ElevationAngle, MinElevationAngle, MaxElevationAngle);
				}
				if (kbd > 0.01f || kbd < -0.01f)
				{
					OrbitalAngle += kbd * MoveSensitivity;
					if (OrbitalAngle > 360f)
					{
						OrbitalAngle -= 360f;
					}
					if (OrbitalAngle < 0f)
					{
						OrbitalAngle += 360f;
					}
				}
			}
			if (num == 1f && Input.GetTouch(0).phase == TouchPhase.Moved)
			{
				Vector2 deltaPosition = Input.GetTouch(0).deltaPosition;
				if (deltaPosition.y > 0.01f || deltaPosition.y < -0.01f)
				{
					ElevationAngle -= deltaPosition.y * 0.1f;
					ElevationAngle = Mathf.Clamp(ElevationAngle, MinElevationAngle, MaxElevationAngle);
				}
				if (deltaPosition.x > 0.01f || deltaPosition.x < -0.01f)
				{
					OrbitalAngle += deltaPosition.x * 0.1f;
					if (OrbitalAngle > 360f)
					{
						OrbitalAngle -= 360f;
					}
					if (OrbitalAngle < 0f)
					{
						OrbitalAngle += 360f;
					}
				}
			}
			if (Input.GetMouseButton(0) && Physics.Raycast(Camera.main.ScreenPointToRay(Input.mousePosition), out var hitInfo, 300f, 23552))
			{
				if (hitInfo.transform == CameraTarget)
				{
					OrbitalAngle = 0f;
				}
				else
				{
					CameraTarget = hitInfo.transform;
					OrbitalAngle = 0f;
					MovementSmoothing = kba;
				}
			}
			if (Input.GetMouseButton(2))
			{
				if (kaz == null)
				{
					kaz = new GameObject("Camera Target").transform;
					kaz.position = CameraTarget.position;
					kaz.rotation = CameraTarget.rotation;
					CameraTarget = kaz;
					kba = MovementSmoothing;
					MovementSmoothing = false;
				}
				else if (kaz != CameraTarget)
				{
					kaz.position = CameraTarget.position;
					kaz.rotation = CameraTarget.rotation;
					CameraTarget = kaz;
					kba = MovementSmoothing;
					MovementSmoothing = false;
				}
				kbe = Input.GetAxis("Mouse Y");
				kbd = Input.GetAxis("Mouse X");
				kbf = kay.TransformDirection(kbd, kbe, 0f);
				kaz.Translate(-kbf, Space.World);
			}
		}
		if (num == 2f)
		{
			Touch touch = Input.GetTouch(0);
			Touch touch2 = Input.GetTouch(1);
			Vector2 vector = touch.position - touch.deltaPosition;
			Vector2 vector2 = touch2.position - touch2.deltaPosition;
			float magnitude = (vector - vector2).magnitude;
			float magnitude2 = (touch.position - touch2.position).magnitude;
			float num2 = magnitude - magnitude2;
			if (num2 > 0.01f || num2 < -0.01f)
			{
				FollowDistance += num2 * 0.25f;
				FollowDistance = Mathf.Clamp(FollowDistance, MinFollowDistance, MaxFollowDistance);
			}
		}
		if (kbg < -0.01f || kbg > 0.01f)
		{
			FollowDistance -= kbg * 5f;
			FollowDistance = Mathf.Clamp(FollowDistance, MinFollowDistance, MaxFollowDistance);
		}
	}
}
