using System.Linq;
using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.InputSystem.Interactions;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CharacterControls : CharacterComponent
{
	private pg lgl;

	private float lgm;

	private float lgn;

	public Vector2 lgg { get; private set; }

	public Vector2 lgh { get; private set; }

	public bool lgi { get; set; }

	public Vector2 lgj { get; set; }

	public Vector2 lgk { get; set; }

	public bool ozo
	{
		get
		{
			if (!lgi)
			{
				return lgg.magnitude < 0.2f;
			}
			return lgj.magnitude < 0.2f;
		}
	}

	public bool ozp
	{
		get
		{
			if (!lgi)
			{
				return lgh.magnitude < 0.2f;
			}
			return lgk.magnitude < 0.2f;
		}
	}

	public Vector2 ozq
	{
		get
		{
			if (!lgi)
			{
				return lgg * ((base.ozl || !base.ozd.Cameras.dey(base.ozc)) ? 1 : (-1));
			}
			return lgj * (base.ozl ? 1 : (-1));
		}
	}

	public Vector2 ozr
	{
		get
		{
			if (!lgi)
			{
				return lgh * ((base.ozl || !base.ozd.Cameras.dey(base.ozc)) ? 1 : (-1));
			}
			return lgk * (base.ozl ? 1 : (-1));
		}
	}

	public pg.GameplayActions? ozs => lgl?.pkt;

	public InputDevice ozt
	{
		get
		{
			if (!base.ozc.Player.DeviceId.HasValue)
			{
				return null;
			}
			return InputSystem.devices.FirstOrDefault((InputDevice a) => a.deviceId == base.ozc.Player.DeviceId);
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		dis();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		if (base.ozc.pap)
		{
			if (lgl == null)
			{
				lgl = qi.gah(ozt);
			}
			lgl.Enable();
			dih();
		}
		qi.mse += dig;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		if (base.ozc.pap)
		{
			dii();
			lgl.Disable();
			lgg = Vector2.zero;
			lgh = Vector2.zero;
		}
		qi.mse -= dig;
	}

	private void dig()
	{
		dis();
	}

	private void dih()
	{
		lgl.pkt.pjv.performed += dij;
		lgl.pkt.pjv.canceled += dik;
		lgl.pkt.pke.performed += dil;
		lgl.pkt.pke.canceled += dim;
		lgl.pkt.pkf.performed += din;
		lgl.pkt.pkf.canceled += dio;
		lgl.pkt.pkg.performed += dip;
		lgl.pkt.pkg.canceled += diq;
	}

	private void dii()
	{
		lgl.pkt.pjv.performed -= dij;
		lgl.pkt.pjv.canceled -= dik;
		lgl.pkt.pke.performed -= dil;
		lgl.pkt.pke.canceled -= dim;
		lgl.pkt.pkf.performed -= din;
		lgl.pkt.pkf.canceled -= dio;
		lgl.pkt.pkg.performed -= dip;
		lgl.pkt.pkg.canceled -= diq;
	}

	private void dij(InputAction.CallbackContext a)
	{
		lgg = a.ReadValue<Vector2>();
	}

	private void dik(InputAction.CallbackContext a)
	{
		lgg = Vector2.zero;
	}

	private void dil(InputAction.CallbackContext a)
	{
		lgh = a.ReadValue<Vector2>();
	}

	private void dim(InputAction.CallbackContext a)
	{
		lgh = Vector2.zero;
	}

	private void din(InputAction.CallbackContext a)
	{
		if (base.ozc.AllowedAction != CharacterManager.PossibleAction.None)
		{
			if (a.interaction is HoldInteraction)
			{
				base.ozc.lhl.pab = true;
				lgm = Time.unscaledTime;
			}
			else if (a.interaction is TapInteraction)
			{
				base.ozc.lhl.djz();
			}
		}
	}

	private void dio(InputAction.CallbackContext a)
	{
		base.ozc.lhl.pab = false;
		if (Time.unscaledTime - lgm < 0.4f)
		{
			base.ozc.lhl.djz();
		}
	}

	private void dip(InputAction.CallbackContext a)
	{
		if (base.ozc.AllowedAction != CharacterManager.PossibleAction.None)
		{
			if (a.interaction is HoldInteraction)
			{
				base.ozc.lhl.pac = true;
				lgn = Time.unscaledTime;
			}
			else if (a.interaction is TapInteraction)
			{
				base.ozc.lhl.dka();
			}
		}
	}

	private void diq(InputAction.CallbackContext a)
	{
		base.ozc.lhl.pac = false;
		if (Time.unscaledTime - lgn < 0.4f)
		{
			base.ozc.lhl.dka();
		}
	}

	public void dir(bool a)
	{
		if (lgl != null)
		{
			if (a)
			{
				lgl.pkt.fur();
				return;
			}
			lgl.pkt.fus();
			lgg = Vector2.zero;
			lgh = Vector2.zero;
		}
	}

	public void dis()
	{
		if (lgl != null)
		{
			lgl.Disable();
			dii();
			lgl.Dispose();
		}
		if (base.ozc.pap)
		{
			lgl = qi.gah(base.ozd.pdy.ply ? null : ozt);
			lgl.Enable();
			dih();
		}
	}

	public Gamepad dit()
	{
		if (ozt is Gamepad)
		{
			return (Gamepad)ozt;
		}
		if (ozt == null)
		{
			return Gamepad.current;
		}
		return null;
	}

	public Vector2 diu()
	{
		float y = (lgi ? lgj.y : lgg.y);
		float y2 = (lgi ? lgk.y : lgh.y);
		Vector2 a = (ozp ? new Vector2(ozq.x, y) : new Vector2(ozr.x, y2));
		a = div(a);
		if (Mathf.Abs(a.x) < 0.3f)
		{
			a.x = GameManager.Current.Court.dvs(GameManager.Current.Shuttle.pgv);
		}
		if (!rk.pmz)
		{
			a.y = 0f;
		}
		return a;
	}

	public static Vector2 div(Vector2 a)
	{
		if (a == Vector2.zero)
		{
			return Vector2.zero;
		}
		float magnitude = a.magnitude;
		float num = Mathf.Max(Mathf.Abs(a.x), Mathf.Abs(a.y));
		if (num == 0f)
		{
			return Vector2.zero;
		}
		float num2 = magnitude / num;
		return a * num2;
	}

	[CompilerGenerated]
	private bool diw(InputDevice a)
	{
		return a.deviceId == base.ozc.Player.DeviceId;
	}
}
