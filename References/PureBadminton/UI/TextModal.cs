using System;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.Localization;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TextModal : ModalManager
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class vq
	{
		public Func<char, char> nlh;

		internal char hih(string a, int b, char c)
		{
			return nlh(c);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class vr
	{
		public Action<string> nli;

		internal Task<string> hii(string a)
		{
			nli(a);
			return Task.FromResult<string>(null);
		}
	}

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LocalizedTextMeshPro titleText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TMP_InputField textInput;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject errorContainer;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI errorText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject loadingIcon;

	private Func<string, Task<string>> nlj;

	private bool nlk;

	private bool nll;

	private VirtualKeyboard nlm;

	private Func<char, char> nln;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		qi.pli.pkm.performed += hik;
		textInput.onValueChanged.AddListener(hil);
		this.guv(0.1f, delegate
		{
			if (InputSystem.devices.Any((InputDevice a) => a is Keyboard))
			{
				textInput.Select();
				textInput.ActivateInputField();
			}
			else
			{
				nlm = VirtualKeyboard.hnz(textInput.text);
				nlm.nnv += delegate(VirtualKeyboard a, string b)
				{
					textInput.text = b;
				};
				nlm.nnw += delegate
				{
					hin();
				};
				this.guz(delegate
				{
					nlm.Open();
				});
			}
		});
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		qi.pli.pkm.performed -= hik;
		textInput.onValueChanged.RemoveListener(hil);
	}

	protected override void cyr()
	{
		base.cyr();
		if (nlm != null)
		{
			nlm.Close();
		}
	}

	private void hij(string a, LocalizedString b, Func<char, char> c, int d)
	{
		nln = c;
		textInput.onValidateInput = ((c != null) ? ((TMP_InputField.OnValidateInput)((string a, int b, char c) => c(c))) : null);
		if (d > 0)
		{
			textInput.characterLimit = d;
		}
		textInput.text = ((a != null && c != null) ? him(a, c) : a);
		titleText.plk = b;
		hiq();
		hio(a: false);
	}

	private void hik(InputAction.CallbackContext a)
	{
		if (nlm == null)
		{
			hin();
		}
	}

	private void hil(string a)
	{
		hiq();
		if (nln != null && a != null)
		{
			string text = him(a, nln);
			if (!(text == a))
			{
				textInput.SetTextWithoutNotify(text);
				textInput.caretPosition = text.Length;
			}
		}
	}

	private static string him(string a, Func<char, char> b)
	{
		return new string((from a in a.Select(b)
			where a != '\0'
			select a).ToArray());
	}

	private async void hin()
	{
		if (nll)
		{
			return;
		}
		nll = true;
		hiq();
		hio(a: true);
		string text;
		try
		{
			text = await nlj(textInput.text);
		}
		catch (Exception exception)
		{
			Debug.LogException(exception);
			text = tt.gra("Online", "ErrorNetwork");
		}
		if (!(this == null))
		{
			nll = false;
			hio(a: false);
			if (string.IsNullOrEmpty(text))
			{
				Close();
			}
			else
			{
				hip(text);
			}
		}
	}

	private void hio(bool a)
	{
		loadingIcon.SetActive(a);
		textInput.interactable = !a;
		CloseOnBack = !a && nlk;
	}

	private void hip(string a)
	{
		errorContainer.SetActive(value: true);
		errorText.text = a;
	}

	private void hiq()
	{
		errorContainer.SetActive(value: false);
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public static void Open(Action<string> onValidate, string currentText = null, LocalizedString titleLocalizedString = null)
	{
		Open(delegate(string a)
		{
			onValidate(a);
			return Task.FromResult<string>(null);
		}, currentText, titleLocalizedString);
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public static void Open(Func<string, Task<string>> onValidate, string currentText = null, LocalizedString titleLocalizedString = null, bool closeOnBack = true, Func<char, char> normalizeChar = null, int characterLimit = 0)
	{
		TextModal component = UnityEngine.Object.Instantiate(Resources.Load<GameObject>("UI/TextModal")).GetComponent<TextModal>();
		component.AutoClose = true;
		component.nlk = closeOnBack;
		component.DestroyOnClose = true;
		component.Open((Action)delegate
		{
		});
		component.nlj = onValidate;
		component.hij(currentText, titleLocalizedString, normalizeChar, characterLimit);
	}

	[CompilerGenerated]
	private void hir()
	{
		if (InputSystem.devices.Any((InputDevice a) => a is Keyboard))
		{
			textInput.Select();
			textInput.ActivateInputField();
			return;
		}
		nlm = VirtualKeyboard.hnz(textInput.text);
		nlm.nnv += delegate(VirtualKeyboard a, string b)
		{
			textInput.text = b;
		};
		nlm.nnw += delegate
		{
			hin();
		};
		this.guz(delegate
		{
			nlm.Open();
		});
	}

	[CompilerGenerated]
	private void his(VirtualKeyboard a, string b)
	{
		textInput.text = b;
	}

	[CompilerGenerated]
	private void hit(VirtualKeyboard a)
	{
		hin();
	}

	[CompilerGenerated]
	private void hiu()
	{
		nlm.Open();
	}
}
