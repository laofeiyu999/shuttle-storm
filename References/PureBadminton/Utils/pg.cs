using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.InputSystem.Utilities;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class pg : IInputActionCollection2, IInputActionCollection, IEnumerable<InputAction>, IEnumerable, IDisposable
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	public struct GameplayActions
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		private pg m_Wrapper;

		public InputAction pjv => m_Wrapper.mpb;

		public InputAction pjw => m_Wrapper.mpc;

		public InputAction pjx => m_Wrapper.mpd;

		public InputAction pjy => m_Wrapper.mpe;

		public InputAction pjz => m_Wrapper.mpf;

		public InputAction pka => m_Wrapper.mpg;

		public InputAction pkb => m_Wrapper.mph;

		public InputAction pkc => m_Wrapper.mpi;

		public InputAction pkd => m_Wrapper.mpj;

		public InputAction pke => m_Wrapper.mpk;

		public InputAction pkf => m_Wrapper.mpl;

		public InputAction pkg => m_Wrapper.mpm;

		public bool pkh => fuq().enabled;

		public GameplayActions(pg wrapper)
		{
			m_Wrapper = wrapper;
		}

		public InputActionMap fuq()
		{
			return m_Wrapper.moz;
		}

		public void fur()
		{
			fuq().Enable();
		}

		public void fus()
		{
			fuq().Disable();
		}

		[SpecialName]
		public static InputActionMap fuu(GameplayActions a)
		{
			return a.fuq();
		}

		public void fuv(pe a)
		{
			if (a != null && !m_Wrapper.mpa.Contains(a))
			{
				m_Wrapper.mpa.Add(a);
				pjv.started += a.fvs;
				pjv.performed += a.fvs;
				pjv.canceled += a.fvs;
				pjw.started += a.fvt;
				pjw.performed += a.fvt;
				pjw.canceled += a.fvt;
				pjx.started += a.fvu;
				pjx.performed += a.fvu;
				pjx.canceled += a.fvu;
				pjy.started += a.fvv;
				pjy.performed += a.fvv;
				pjy.canceled += a.fvv;
				pjz.started += a.fvw;
				pjz.performed += a.fvw;
				pjz.canceled += a.fvw;
				pka.started += a.fvx;
				pka.performed += a.fvx;
				pka.canceled += a.fvx;
				pkb.started += a.fvy;
				pkb.performed += a.fvy;
				pkb.canceled += a.fvy;
				pkc.started += a.fvz;
				pkc.performed += a.fvz;
				pkc.canceled += a.fvz;
				pkd.started += a.fwa;
				pkd.performed += a.fwa;
				pkd.canceled += a.fwa;
				pke.started += a.fwb;
				pke.performed += a.fwb;
				pke.canceled += a.fwb;
				pkf.started += a.fwc;
				pkf.performed += a.fwc;
				pkf.canceled += a.fwc;
				pkg.started += a.fwd;
				pkg.performed += a.fwd;
				pkg.canceled += a.fwd;
			}
		}

		private void fuw(pe a)
		{
			pjv.started -= a.fvs;
			pjv.performed -= a.fvs;
			pjv.canceled -= a.fvs;
			pjw.started -= a.fvt;
			pjw.performed -= a.fvt;
			pjw.canceled -= a.fvt;
			pjx.started -= a.fvu;
			pjx.performed -= a.fvu;
			pjx.canceled -= a.fvu;
			pjy.started -= a.fvv;
			pjy.performed -= a.fvv;
			pjy.canceled -= a.fvv;
			pjz.started -= a.fvw;
			pjz.performed -= a.fvw;
			pjz.canceled -= a.fvw;
			pka.started -= a.fvx;
			pka.performed -= a.fvx;
			pka.canceled -= a.fvx;
			pkb.started -= a.fvy;
			pkb.performed -= a.fvy;
			pkb.canceled -= a.fvy;
			pkc.started -= a.fvz;
			pkc.performed -= a.fvz;
			pkc.canceled -= a.fvz;
			pkd.started -= a.fwa;
			pkd.performed -= a.fwa;
			pkd.canceled -= a.fwa;
			pke.started -= a.fwb;
			pke.performed -= a.fwb;
			pke.canceled -= a.fwb;
			pkf.started -= a.fwc;
			pkf.performed -= a.fwc;
			pkf.canceled -= a.fwc;
			pkg.started -= a.fwd;
			pkg.performed -= a.fwd;
			pkg.canceled -= a.fwd;
		}

		public void fux(pe a)
		{
			if (m_Wrapper.mpa.Remove(a))
			{
				fuw(a);
			}
		}

		public void fuy(pe a)
		{
			foreach (pe item in m_Wrapper.mpa)
			{
				fuw(item);
			}
			m_Wrapper.mpa.Clear();
			fuv(a);
		}
	}

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	public struct MenuActions
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		private pg m_Wrapper;

		public InputAction pki => m_Wrapper.mpp;

		public InputAction pkj => m_Wrapper.mpq;

		public InputAction pkk => m_Wrapper.mpr;

		public InputAction pkl => m_Wrapper.mps;

		public InputAction pkm => m_Wrapper.mpt;

		public InputAction pkn => m_Wrapper.mpu;

		public InputAction pko => m_Wrapper.mpv;

		public InputAction pkp => m_Wrapper.mpw;

		public InputAction pkq => m_Wrapper.mpx;

		public InputAction pkr => m_Wrapper.mpy;

		public bool pks => fvj().enabled;

		public MenuActions(pg wrapper)
		{
			m_Wrapper = wrapper;
		}

		public InputActionMap fvj()
		{
			return m_Wrapper.mpn;
		}

		public void fvk()
		{
			fvj().Enable();
		}

		public void fvl()
		{
			fvj().Disable();
		}

		[SpecialName]
		public static InputActionMap fvn(MenuActions a)
		{
			return a.fvj();
		}

		public void fvo(pf a)
		{
			if (a != null && !m_Wrapper.mpo.Contains(a))
			{
				m_Wrapper.mpo.Add(a);
				pki.started += a.fwe;
				pki.performed += a.fwe;
				pki.canceled += a.fwe;
				pkj.started += a.fwf;
				pkj.performed += a.fwf;
				pkj.canceled += a.fwf;
				pkk.started += a.fwg;
				pkk.performed += a.fwg;
				pkk.canceled += a.fwg;
				pkl.started += a.fwh;
				pkl.performed += a.fwh;
				pkl.canceled += a.fwh;
				pkm.started += a.fwi;
				pkm.performed += a.fwi;
				pkm.canceled += a.fwi;
				pkn.started += a.fwj;
				pkn.performed += a.fwj;
				pkn.canceled += a.fwj;
				pko.started += a.fwk;
				pko.performed += a.fwk;
				pko.canceled += a.fwk;
				pkp.started += a.fwl;
				pkp.performed += a.fwl;
				pkp.canceled += a.fwl;
				pkq.started += a.fwm;
				pkq.performed += a.fwm;
				pkq.canceled += a.fwm;
				pkr.started += a.fwn;
				pkr.performed += a.fwn;
				pkr.canceled += a.fwn;
			}
		}

		private void fvp(pf a)
		{
			pki.started -= a.fwe;
			pki.performed -= a.fwe;
			pki.canceled -= a.fwe;
			pkj.started -= a.fwf;
			pkj.performed -= a.fwf;
			pkj.canceled -= a.fwf;
			pkk.started -= a.fwg;
			pkk.performed -= a.fwg;
			pkk.canceled -= a.fwg;
			pkl.started -= a.fwh;
			pkl.performed -= a.fwh;
			pkl.canceled -= a.fwh;
			pkm.started -= a.fwi;
			pkm.performed -= a.fwi;
			pkm.canceled -= a.fwi;
			pkn.started -= a.fwj;
			pkn.performed -= a.fwj;
			pkn.canceled -= a.fwj;
			pko.started -= a.fwk;
			pko.performed -= a.fwk;
			pko.canceled -= a.fwk;
			pkp.started -= a.fwl;
			pkp.performed -= a.fwl;
			pkp.canceled -= a.fwl;
			pkq.started -= a.fwm;
			pkq.performed -= a.fwm;
			pkq.canceled -= a.fwm;
			pkr.started -= a.fwn;
			pkr.performed -= a.fwn;
			pkr.canceled -= a.fwn;
		}

		public void fvq(pf a)
		{
			if (m_Wrapper.mpo.Remove(a))
			{
				fvp(a);
			}
		}

		public void fvr(pf a)
		{
			foreach (pf item in m_Wrapper.mpo)
			{
				fvp(item);
			}
			m_Wrapper.mpo.Clear();
			fvo(a);
		}
	}

	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	public interface pe
	{
		void fvs(InputAction.CallbackContext a);

		void fvt(InputAction.CallbackContext a);

		void fvu(InputAction.CallbackContext a);

		void fvv(InputAction.CallbackContext a);

		void fvw(InputAction.CallbackContext a);

		void fvx(InputAction.CallbackContext a);

		void fvy(InputAction.CallbackContext a);

		void fvz(InputAction.CallbackContext a);

		void fwa(InputAction.CallbackContext a);

		void fwb(InputAction.CallbackContext a);

		void fwc(InputAction.CallbackContext a);

		void fwd(InputAction.CallbackContext a);
	}

	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	public interface pf
	{
		void fwe(InputAction.CallbackContext a);

		void fwf(InputAction.CallbackContext a);

		void fwg(InputAction.CallbackContext a);

		void fwh(InputAction.CallbackContext a);

		void fwi(InputAction.CallbackContext a);

		void fwj(InputAction.CallbackContext a);

		void fwk(InputAction.CallbackContext a);

		void fwl(InputAction.CallbackContext a);

		void fwm(InputAction.CallbackContext a);

		void fwn(InputAction.CallbackContext a);
	}

	private readonly InputActionMap moz;

	private List<pe> mpa = new List<pe>();

	private readonly InputAction mpb;

	private readonly InputAction mpc;

	private readonly InputAction mpd;

	private readonly InputAction mpe;

	private readonly InputAction mpf;

	private readonly InputAction mpg;

	private readonly InputAction mph;

	private readonly InputAction mpi;

	private readonly InputAction mpj;

	private readonly InputAction mpk;

	private readonly InputAction mpl;

	private readonly InputAction mpm;

	private readonly InputActionMap mpn;

	private List<pf> mpo = new List<pf>();

	private readonly InputAction mpp;

	private readonly InputAction mpq;

	private readonly InputAction mpr;

	private readonly InputAction mps;

	private readonly InputAction mpt;

	private readonly InputAction mpu;

	private readonly InputAction mpv;

	private readonly InputAction mpw;

	private readonly InputAction mpx;

	private readonly InputAction mpy;

	private int mpz = -1;

	private int mqa = -1;

	public InputActionAsset moy { get; }

	[NotObfuscatedCause("Property is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Property in the Property group getting skipped.")]
	public InputBinding? bindingMask
	{
		[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
		[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
		[NotObfuscatedCause("Belonging property gets skipped: Property is in group that has external definition (is in some assembly that gets not obfuscated).")]
		[NotObfuscatedCause("Belonging property gets skipped: Some other Property in the Property group getting skipped.")]
		get
		{
			return moy.bindingMask;
		}
		[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
		[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
		[NotObfuscatedCause("Belonging property gets skipped: Property is in group that has external definition (is in some assembly that gets not obfuscated).")]
		[NotObfuscatedCause("Belonging property gets skipped: Some other Property in the Property group getting skipped.")]
		set
		{
			moy.bindingMask = value;
		}
	}

	[NotObfuscatedCause("Property is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Property in the Property group getting skipped.")]
	public ReadOnlyArray<InputDevice>? devices
	{
		[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
		[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
		[NotObfuscatedCause("Belonging property gets skipped: Property is in group that has external definition (is in some assembly that gets not obfuscated).")]
		[NotObfuscatedCause("Belonging property gets skipped: Some other Property in the Property group getting skipped.")]
		get
		{
			return moy.devices;
		}
		[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
		[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
		[NotObfuscatedCause("Belonging property gets skipped: Property is in group that has external definition (is in some assembly that gets not obfuscated).")]
		[NotObfuscatedCause("Belonging property gets skipped: Some other Property in the Property group getting skipped.")]
		set
		{
			moy.devices = value;
		}
	}

	[NotObfuscatedCause("Property is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Property in the Property group getting skipped.")]
	public ReadOnlyArray<InputControlScheme> controlSchemes
	{
		[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
		[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
		[NotObfuscatedCause("Belonging property gets skipped: Property is in group that has external definition (is in some assembly that gets not obfuscated).")]
		[NotObfuscatedCause("Belonging property gets skipped: Some other Property in the Property group getting skipped.")]
		get
		{
			return moy.controlSchemes;
		}
	}

	[NotObfuscatedCause("Property is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Property in the Property group getting skipped.")]
	public IEnumerable<InputBinding> bindings
	{
		[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
		[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
		[NotObfuscatedCause("Belonging property gets skipped: Property is in group that has external definition (is in some assembly that gets not obfuscated).")]
		[NotObfuscatedCause("Belonging property gets skipped: Some other Property in the Property group getting skipped.")]
		get
		{
			return moy.bindings;
		}
	}

	public GameplayActions pkt => new GameplayActions(this);

	public MenuActions pku => new MenuActions(this);

	public InputControlScheme pkv
	{
		get
		{
			if (mpz == -1)
			{
				mpz = moy.FindControlSchemeIndex("Gamepad");
			}
			return moy.controlSchemes[mpz];
		}
	}

	public InputControlScheme pkw
	{
		get
		{
			if (mqa == -1)
			{
				mqa = moy.FindControlSchemeIndex("Keyboard");
			}
			return moy.controlSchemes[mqa];
		}
	}

	public pg()
	{
		moy = InputActionAsset.FromJson("{\r\n    \"version\": 1,\r\n    \"name\": \"Controls\",\r\n    \"maps\": [\r\n        {\r\n            \"name\": \"Gameplay\",\r\n            \"id\": \"4434a350-316c-4fc9-a988-b69022d6a023\",\r\n            \"actions\": [\r\n                {\r\n                    \"name\": \"Move\",\r\n                    \"type\": \"Value\",\r\n                    \"id\": \"f4ed640f-c2bc-4af0-b21d-1a482c26d47c\",\r\n                    \"expectedControlType\": \"Vector2\",\r\n                    \"processors\": \"\",\r\n                    \"interactions\": \"\",\r\n                    \"initialStateCheck\": true\r\n                },\r\n                {\r\n                    \"name\": \"Clear\",\r\n                    \"type\": \"Button\",\r\n                    \"id\": \"6c1b2b53-331c-4495-9173-c940eb5f18c3\",\r\n                    \"expectedControlType\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"interactions\": \"\",\r\n                    \"initialStateCheck\": true\r\n                },\r\n                {\r\n                    \"name\": \"Smash\",\r\n                    \"type\": \"Button\",\r\n                    \"id\": \"0e7fdbdc-2506-4e4e-828b-10d2b237fd7e\",\r\n                    \"expectedControlType\": \"Button\",\r\n                    \"processors\": \"\",\r\n                    \"interactions\": \"\",\r\n                    \"initialStateCheck\": false\r\n                },\r\n                {\r\n                    \"name\": \"Midcourt\",\r\n                    \"type\": \"Button\",\r\n                    \"id\": \"7b86b111-5daf-4a96-8c8a-a9be62a010f5\",\r\n                    \"expectedControlType\": \"Button\",\r\n                    \"processors\": \"\",\r\n                    \"interactions\": \"\",\r\n                    \"initialStateCheck\": false\r\n                },\r\n                {\r\n                    \"name\": \"Drop\",\r\n                    \"type\": \"Button\",\r\n                    \"id\": \"84e6c622-27a0-4374-9dd9-5360405d5fa6\",\r\n                    \"expectedControlType\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"interactions\": \"\",\r\n                    \"initialStateCheck\": false\r\n                },\r\n                {\r\n                    \"name\": \"Reset\",\r\n                    \"type\": \"Button\",\r\n                    \"id\": \"91d3ff3f-5e4a-44f5-8708-34c73e30465a\",\r\n                    \"expectedControlType\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"interactions\": \"\",\r\n                    \"initialStateCheck\": false\r\n                },\r\n                {\r\n                    \"name\": \"SwitchCamera\",\r\n                    \"type\": \"Button\",\r\n                    \"id\": \"b6b500da-52d9-4054-a587-00770af6af45\",\r\n                    \"expectedControlType\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"interactions\": \"\",\r\n                    \"initialStateCheck\": false\r\n                },\r\n                {\r\n                    \"name\": \"Pause\",\r\n                    \"type\": \"Button\",\r\n                    \"id\": \"56c84160-f678-44bf-a961-a343168066a8\",\r\n                    \"expectedControlType\": \"Button\",\r\n                    \"processors\": \"\",\r\n                    \"interactions\": \"\",\r\n                    \"initialStateCheck\": false\r\n                },\r\n                {\r\n                    \"name\": \"Sprint\",\r\n                    \"type\": \"Button\",\r\n                    \"id\": \"cbb9a51c-7528-4937-9431-a28994a6e5e9\",\r\n                    \"expectedControlType\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"interactions\": \"\",\r\n                    \"initialStateCheck\": false\r\n                },\r\n                {\r\n                    \"name\": \"Aim\",\r\n                    \"type\": \"Value\",\r\n                    \"id\": \"2a96bf77-d74c-446f-85e2-38089d32a4d1\",\r\n                    \"expectedControlType\": \"Vector2\",\r\n                    \"processors\": \"\",\r\n                    \"interactions\": \"\",\r\n                    \"initialStateCheck\": true\r\n                },\r\n                {\r\n                    \"name\": \"IncreaseIntensity\",\r\n                    \"type\": \"Button\",\r\n                    \"id\": \"c7094130-17d3-421b-8eab-e1df66b17f91\",\r\n                    \"expectedControlType\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"interactions\": \"\",\r\n                    \"initialStateCheck\": false\r\n                },\r\n                {\r\n                    \"name\": \"DecreaseIntensity\",\r\n                    \"type\": \"Button\",\r\n                    \"id\": \"8d29d45d-c57f-4df5-887e-9fea9d44bf28\",\r\n                    \"expectedControlType\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"interactions\": \"\",\r\n                    \"initialStateCheck\": false\r\n                }\r\n            ],\r\n            \"bindings\": [\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"be8b5bb0-c7f9-4b64-a2d9-18ad2691db96\",\r\n                    \"path\": \"<Gamepad>/leftStick\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"Move\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"WASD\",\r\n                    \"id\": \"dd3d2205-9fd4-4e67-94bf-f170eb41f2e3\",\r\n                    \"path\": \"2DVector\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \"\",\r\n                    \"action\": \"Move\",\r\n                    \"isComposite\": true,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"up\",\r\n                    \"id\": \"45a56c8e-b4d4-423b-b13b-6f9405ebe1d2\",\r\n                    \"path\": \"<Keyboard>/w\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"Move\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": true\r\n                },\r\n                {\r\n                    \"name\": \"down\",\r\n                    \"id\": \"54d8dfe5-cf9c-4897-9894-6965bd101161\",\r\n                    \"path\": \"<Keyboard>/s\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"Move\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": true\r\n                },\r\n                {\r\n                    \"name\": \"left\",\r\n                    \"id\": \"bef2a171-65f9-444f-bfa2-4fdaa1edae55\",\r\n                    \"path\": \"<Keyboard>/a\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"Move\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": true\r\n                },\r\n                {\r\n                    \"name\": \"right\",\r\n                    \"id\": \"aeca2294-9299-44ab-93a7-c59e83297845\",\r\n                    \"path\": \"<Keyboard>/d\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"Move\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": true\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"4b4a4dcd-06b2-4319-b02e-42b9d9c0134d\",\r\n                    \"path\": \"<Gamepad>/buttonNorth\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"Clear\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"90aa2bb9-fbd4-4d0d-87e6-9b19f3e22f43\",\r\n                    \"path\": \"<Keyboard>/upArrow\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"Clear\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"f51e63e8-1fca-4d47-bc47-80aa0441d78b\",\r\n                    \"path\": \"<Gamepad>/buttonWest\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"Smash\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"053924ae-7d32-4a1c-84e0-e9f2ff1c5a32\",\r\n                    \"path\": \"<Keyboard>/leftArrow\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"Smash\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"e541635d-e48b-4564-8f59-31ebc85daf4c\",\r\n                    \"path\": \"<Gamepad>/buttonSouth\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"Drop\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"5df8199f-3d97-47c2-bbe6-026aa1ef4e60\",\r\n                    \"path\": \"<Keyboard>/downArrow\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"Drop\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"81057969-b6c2-4d34-b2b4-bda485d755c3\",\r\n                    \"path\": \"<Keyboard>/r\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"Reset\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"b9aca6f1-6198-4c4a-b794-eab7fbfb09ea\",\r\n                    \"path\": \"<Gamepad>/select\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"SwitchCamera\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"f7e5030f-4711-41bf-95e7-ecaf340922e3\",\r\n                    \"path\": \"<Keyboard>/tab\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"SwitchCamera\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"3ddd767f-04a7-497f-83a1-b76e63cef543\",\r\n                    \"path\": \"<Gamepad>/start\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"Pause\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"a5e26f45-32de-47bc-937d-7a749b1e972e\",\r\n                    \"path\": \"<Keyboard>/escape\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"Pause\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"317216e3-85ba-41c2-bb97-06612f5f391f\",\r\n                    \"path\": \"<Keyboard>/leftShift\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"Sprint\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"96e074dd-f7f0-4c33-931d-f37a251ef7cf\",\r\n                    \"path\": \"<Gamepad>/rightShoulder\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"Sprint\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"c6c818a2-b411-4574-a557-7b2b21b07dec\",\r\n                    \"path\": \"<Gamepad>/buttonEast\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"Midcourt\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"51df69c0-424e-4ea1-bf66-6a6784809934\",\r\n                    \"path\": \"<Keyboard>/rightArrow\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"Midcourt\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"f243970a-cc23-4470-a070-6a9451c8d044\",\r\n                    \"path\": \"<Gamepad>/rightStick\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"Aim\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"56bee5a3-2fae-4861-9cee-4665943b7888\",\r\n                    \"path\": \"<Keyboard>/shift\",\r\n                    \"interactions\": \"Tap,Hold(duration=0.2)\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"IncreaseIntensity\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"4ed2b863-26b2-4552-bd0b-03d0aa6c66b6\",\r\n                    \"path\": \"<Gamepad>/rightShoulder\",\r\n                    \"interactions\": \"Tap,Hold(duration=0.2)\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"IncreaseIntensity\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"dcaa7c4d-dd81-481c-8b54-6be618f0bd00\",\r\n                    \"path\": \"<Keyboard>/space\",\r\n                    \"interactions\": \"Tap,Hold(duration=0.2)\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"DecreaseIntensity\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"98b8c818-f218-4790-8ea5-7ec8f696c897\",\r\n                    \"path\": \"<Gamepad>/leftShoulder\",\r\n                    \"interactions\": \"Tap,Hold(duration=0.2)\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"DecreaseIntensity\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                }\r\n            ]\r\n        },\r\n        {\r\n            \"name\": \"Menu\",\r\n            \"id\": \"37c8fc02-aec5-46a9-8bca-0d454354fd86\",\r\n            \"actions\": [\r\n                {\r\n                    \"name\": \"MenuTabLeft\",\r\n                    \"type\": \"Button\",\r\n                    \"id\": \"8f42c16c-5d12-4466-8405-291e42322508\",\r\n                    \"expectedControlType\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"interactions\": \"\",\r\n                    \"initialStateCheck\": false\r\n                },\r\n                {\r\n                    \"name\": \"MenuTabRight\",\r\n                    \"type\": \"Button\",\r\n                    \"id\": \"cd42914f-e187-4d05-bc96-d8fee82e7b14\",\r\n                    \"expectedControlType\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"interactions\": \"\",\r\n                    \"initialStateCheck\": false\r\n                },\r\n                {\r\n                    \"name\": \"MenuSkip\",\r\n                    \"type\": \"Button\",\r\n                    \"id\": \"67162f4f-b1f9-484b-bbad-7932922125fa\",\r\n                    \"expectedControlType\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"interactions\": \"\",\r\n                    \"initialStateCheck\": false\r\n                },\r\n                {\r\n                    \"name\": \"MenuDelete\",\r\n                    \"type\": \"Button\",\r\n                    \"id\": \"43e5f270-65b7-4f98-b70b-9b35f545227e\",\r\n                    \"expectedControlType\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"interactions\": \"\",\r\n                    \"initialStateCheck\": false\r\n                },\r\n                {\r\n                    \"name\": \"MenuValidate\",\r\n                    \"type\": \"Button\",\r\n                    \"id\": \"7330ae5c-f722-401e-b606-5224cc3bfe3e\",\r\n                    \"expectedControlType\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"interactions\": \"\",\r\n                    \"initialStateCheck\": false\r\n                },\r\n                {\r\n                    \"name\": \"MenuBack\",\r\n                    \"type\": \"Button\",\r\n                    \"id\": \"5dd44bc1-a99c-4a5d-871b-76d12089fd91\",\r\n                    \"expectedControlType\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"interactions\": \"\",\r\n                    \"initialStateCheck\": false\r\n                },\r\n                {\r\n                    \"name\": \"Left\",\r\n                    \"type\": \"Button\",\r\n                    \"id\": \"c75bd126-68e1-4643-88c8-bda5f5f161e1\",\r\n                    \"expectedControlType\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"interactions\": \"\",\r\n                    \"initialStateCheck\": false\r\n                },\r\n                {\r\n                    \"name\": \"Right\",\r\n                    \"type\": \"Button\",\r\n                    \"id\": \"b839e0a9-0b45-4faa-8a9b-1bc33cecbc88\",\r\n                    \"expectedControlType\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"interactions\": \"\",\r\n                    \"initialStateCheck\": false\r\n                },\r\n                {\r\n                    \"name\": \"Up\",\r\n                    \"type\": \"Button\",\r\n                    \"id\": \"c7901ede-cc80-4791-ad4d-4a4ba4d88593\",\r\n                    \"expectedControlType\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"interactions\": \"\",\r\n                    \"initialStateCheck\": false\r\n                },\r\n                {\r\n                    \"name\": \"Down\",\r\n                    \"type\": \"Button\",\r\n                    \"id\": \"77415b70-c496-4ec2-903f-8d3a4e701914\",\r\n                    \"expectedControlType\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"interactions\": \"\",\r\n                    \"initialStateCheck\": false\r\n                }\r\n            ],\r\n            \"bindings\": [\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"073c9c71-e3b3-43a5-87c3-b2b9b45f1b7c\",\r\n                    \"path\": \"<Keyboard>/q\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"MenuTabLeft\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"bd74895e-fa23-492d-b0b9-5f9409ccc3b0\",\r\n                    \"path\": \"<Gamepad>/leftShoulder\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"MenuTabLeft\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"a8bfc18d-aca3-4fc0-9952-5cd6ac27bacc\",\r\n                    \"path\": \"<Keyboard>/e\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"MenuTabRight\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"b5aeabee-aaa1-4131-a6b8-d9804ccb68c3\",\r\n                    \"path\": \"<Gamepad>/rightShoulder\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"MenuTabRight\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"f1289d19-fc40-4c8b-becd-f06c92bfc553\",\r\n                    \"path\": \"<Keyboard>/tab\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"MenuSkip\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"2675fc33-d723-44c3-81b8-bb0d202fe3a5\",\r\n                    \"path\": \"<Gamepad>/buttonWest\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"MenuSkip\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"dd70ede3-b1d2-4bbb-8c48-18321cba2edb\",\r\n                    \"path\": \"<Keyboard>/delete\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"MenuDelete\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"068ecb3d-0a70-4db4-9aff-f85f922388ed\",\r\n                    \"path\": \"<Gamepad>/buttonWest\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"MenuDelete\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"6999178a-2ffa-46d9-b8fd-196177d10fe2\",\r\n                    \"path\": \"<Keyboard>/enter\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"MenuValidate\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"2d8c79c8-991f-46c9-9a1d-f0df4832f6cd\",\r\n                    \"path\": \"<Gamepad>/buttonSouth\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"MenuValidate\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"a1101d56-432c-4647-a3db-fd5d85268ac8\",\r\n                    \"path\": \"<Keyboard>/numpadEnter\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"MenuValidate\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"14978f26-e184-4139-ba2d-e340f1f17fc3\",\r\n                    \"path\": \"<Keyboard>/escape\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"MenuBack\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"22cf7056-176e-4d1d-a031-0a46d7107851\",\r\n                    \"path\": \"<Gamepad>/buttonEast\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"MenuBack\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"4c24e2b3-04da-4891-b424-a270a83d7b9e\",\r\n                    \"path\": \"<Keyboard>/leftArrow\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"Left\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"95e7be6c-baad-49b9-bea4-bb8ecbfca86d\",\r\n                    \"path\": \"<Gamepad>/leftStick/left\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"Left\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"9d403658-7039-4966-9f28-07857e09b571\",\r\n                    \"path\": \"<Gamepad>/dpad/left\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"Left\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"05bea398-dee9-4132-b5e6-8be0c84f5caa\",\r\n                    \"path\": \"<Keyboard>/rightArrow\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"Right\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"2ae86700-a01a-43d9-b43f-c3523c213645\",\r\n                    \"path\": \"<Gamepad>/leftStick/right\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"Right\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"e45f0bd5-8d69-47b4-a81d-461c22b5ea9a\",\r\n                    \"path\": \"<Gamepad>/dpad/right\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"Right\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"6c04e065-da57-4d2a-b877-58e1453b1939\",\r\n                    \"path\": \"<Keyboard>/upArrow\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"Up\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"4e7e245c-e605-4d19-a388-077ed48f0d95\",\r\n                    \"path\": \"<Gamepad>/leftStick/up\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"Up\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"967ff87d-0974-4220-9a33-81e8422aaa4a\",\r\n                    \"path\": \"<Gamepad>/dpad/up\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"Up\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"cbd6d468-85db-4c4b-9b82-b14e8b365410\",\r\n                    \"path\": \"<Keyboard>/downArrow\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Keyboard\",\r\n                    \"action\": \"Down\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"183dd14b-bf82-4d6a-8c5e-a849f6d1425b\",\r\n                    \"path\": \"<Gamepad>/leftStick/down\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"Down\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                },\r\n                {\r\n                    \"name\": \"\",\r\n                    \"id\": \"4d68139e-58a5-4a82-b85e-33f82f6055b1\",\r\n                    \"path\": \"<Gamepad>/dpad/down\",\r\n                    \"interactions\": \"\",\r\n                    \"processors\": \"\",\r\n                    \"groups\": \";Gamepad\",\r\n                    \"action\": \"Down\",\r\n                    \"isComposite\": false,\r\n                    \"isPartOfComposite\": false\r\n                }\r\n            ]\r\n        }\r\n    ],\r\n    \"controlSchemes\": [\r\n        {\r\n            \"name\": \"Gamepad\",\r\n            \"bindingGroup\": \"Gamepad\",\r\n            \"devices\": [\r\n                {\r\n                    \"devicePath\": \"<Gamepad>\",\r\n                    \"isOptional\": false,\r\n                    \"isOR\": false\r\n                }\r\n            ]\r\n        },\r\n        {\r\n            \"name\": \"Keyboard\",\r\n            \"bindingGroup\": \"Keyboard\",\r\n            \"devices\": [\r\n                {\r\n                    \"devicePath\": \"<Keyboard>\",\r\n                    \"isOptional\": false,\r\n                    \"isOR\": false\r\n                }\r\n            ]\r\n        }\r\n    ]\r\n}");
		moz = moy.FindActionMap("Gameplay", throwIfNotFound: true);
		mpb = moz.FindAction("Move", throwIfNotFound: true);
		mpc = moz.FindAction("Clear", throwIfNotFound: true);
		mpd = moz.FindAction("Smash", throwIfNotFound: true);
		mpe = moz.FindAction("Midcourt", throwIfNotFound: true);
		mpf = moz.FindAction("Drop", throwIfNotFound: true);
		mpg = moz.FindAction("Reset", throwIfNotFound: true);
		mph = moz.FindAction("SwitchCamera", throwIfNotFound: true);
		mpi = moz.FindAction("Pause", throwIfNotFound: true);
		mpj = moz.FindAction("Sprint", throwIfNotFound: true);
		mpk = moz.FindAction("Aim", throwIfNotFound: true);
		mpl = moz.FindAction("IncreaseIntensity", throwIfNotFound: true);
		mpm = moz.FindAction("DecreaseIntensity", throwIfNotFound: true);
		mpn = moy.FindActionMap("Menu", throwIfNotFound: true);
		mpp = mpn.FindAction("MenuTabLeft", throwIfNotFound: true);
		mpq = mpn.FindAction("MenuTabRight", throwIfNotFound: true);
		mpr = mpn.FindAction("MenuSkip", throwIfNotFound: true);
		mps = mpn.FindAction("MenuDelete", throwIfNotFound: true);
		mpt = mpn.FindAction("MenuValidate", throwIfNotFound: true);
		mpu = mpn.FindAction("MenuBack", throwIfNotFound: true);
		mpv = mpn.FindAction("Left", throwIfNotFound: true);
		mpw = mpn.FindAction("Right", throwIfNotFound: true);
		mpx = mpn.FindAction("Up", throwIfNotFound: true);
		mpy = mpn.FindAction("Down", throwIfNotFound: true);
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	~pg()
	{
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public void Dispose()
	{
		UnityEngine.Object.Destroy(moy);
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public bool Contains(InputAction action)
	{
		return moy.Contains(action);
	}

	[NotObfuscatedCause("Because of compatibility component: .Net Framework - Compatibility : Is Special.")]
	public IEnumerator<InputAction> GetEnumerator()
	{
		return moy.GetEnumerator();
	}

	private IEnumerator fwp()
	{
		return GetEnumerator();
	}

	IEnumerator IEnumerable.GetEnumerator()
	{
		//ILSpy generated this explicit interface implementation from .override directive in fwp
		return this.fwp();
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public void Enable()
	{
		moy.Enable();
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public void Disable()
	{
		moy.Disable();
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public InputAction FindAction(string actionNameOrId, bool throwIfNotFound = false)
	{
		return moy.FindAction(actionNameOrId, throwIfNotFound);
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public int FindBinding(InputBinding bindingMask, out InputAction action)
	{
		return moy.FindBinding(bindingMask, out action);
	}
}
