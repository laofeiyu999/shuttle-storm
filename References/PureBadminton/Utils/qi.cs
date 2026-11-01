using OPS.Obfuscator.Attribute;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class qi
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	public delegate void OnBindingChanged();

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	public delegate void OnNavigate(MoveDirection direction, InputAction.CallbackContext context);

	public static pg msd { get; private set; }

	public static pg.GameplayActions plh => msd.pkt;

	public static pg.MenuActions pli => msd.pku;

	public static event OnBindingChanged mse;

	public static event OnNavigate msf;

	static qi()
	{
		msd = new pg();
		if (rk.pnm)
		{
			msd.LoadBindingOverridesFromJson(rk.pnl);
		}
		msd.Enable();
		msd.pku.pko.performed += gag;
		msd.pku.pkp.performed += gag;
		msd.pku.pkq.performed += gag;
		msd.pku.pkr.performed += gag;
	}

	public static void gae()
	{
		msd.LoadBindingOverridesFromJson(rk.pnl);
		qi.mse?.Invoke();
	}

	public static void gaf()
	{
		msd.RemoveAllBindingOverrides();
		qi.mse?.Invoke();
	}

	private static void gag(InputAction.CallbackContext a)
	{
		if (a.action == msd.pku.pko)
		{
			qi.msf?.Invoke(MoveDirection.Left, a);
		}
		if (a.action == msd.pku.pkp)
		{
			qi.msf?.Invoke(MoveDirection.Right, a);
		}
		if (a.action == msd.pku.pkq)
		{
			qi.msf?.Invoke(MoveDirection.Up, a);
		}
		if (a.action == msd.pku.pkr)
		{
			qi.msf?.Invoke(MoveDirection.Down, a);
		}
	}

	public static pg gah(InputDevice a = null)
	{
		pg pg2 = new pg();
		pg2.LoadBindingOverridesFromJson(rk.pnl);
		if (a != null)
		{
			pg2.devices = new InputDevice[1] { a };
		}
		return pg2;
	}
}
