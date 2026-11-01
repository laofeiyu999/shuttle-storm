using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;
using UnityEngine.EventSystems;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public abstract class LeftRightInputManager : Selectable
{
	protected Button njd;

	protected Button nje;

	protected abstract bool pry { get; }

	protected abstract bool prz { get; }

	protected abstract void hem();

	protected abstract void hen();

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void Awake()
	{
		base.Awake();
		njd = base.transform.Find("Left Arrow").GetComponent<Button>();
		nje = base.transform.Find("Right Arrow").GetComponent<Button>();
		njd.onClick.AddListener(delegate
		{
			AudioManager.PlayMenuChange();
			hem();
		});
		nje.onClick.AddListener(delegate
		{
			AudioManager.PlayMenuChange();
			hen();
		});
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		heo();
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void OnPointerEnter(PointerEventData eventData)
	{
		AudioManager.PlayMenuChange();
		EventSystem.current.SetSelectedGameObject(base.gameObject);
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void OnSelect(BaseEventData eventData)
	{
		base.OnSelect(eventData);
		heo(true);
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void OnDeselect(BaseEventData eventData)
	{
		base.OnDeselect(eventData);
		heo(false);
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public override void OnMove(AxisEventData eventData)
	{
		AudioManager.PlayMenuChange();
		if (eventData.moveDir == MoveDirection.Left)
		{
			hem();
		}
		if (eventData.moveDir == MoveDirection.Right)
		{
			hen();
		}
		if (eventData.moveDir == MoveDirection.Up)
		{
			EventSystem.current.SetSelectedGameObject(FindSelectableOnUp()?.gameObject);
		}
		if (eventData.moveDir == MoveDirection.Down)
		{
			EventSystem.current.SetSelectedGameObject(FindSelectableOnDown()?.gameObject);
		}
	}

	protected void heo(bool? a = null)
	{
		if (!(njd == null) && !(nje == null))
		{
			bool num = a ?? (EventSystem.current?.currentSelectedGameObject == base.gameObject);
			bool flag = num && !pry;
			bool flag2 = num && !prz;
			if (njd.gameObject.activeInHierarchy && !flag)
			{
				njd.gameObject.SetActive(value: false);
			}
			if (!njd.gameObject.activeInHierarchy && flag)
			{
				njd.gameObject.SetActive(value: true);
			}
			if (nje.gameObject.activeInHierarchy && !flag2)
			{
				nje.gameObject.SetActive(value: false);
			}
			if (!nje.gameObject.activeInHierarchy && flag2)
			{
				nje.gameObject.SetActive(value: true);
			}
		}
	}

	[CompilerGenerated]
	private void hep()
	{
		AudioManager.PlayMenuChange();
		hem();
	}

	[CompilerGenerated]
	private void heq()
	{
		AudioManager.PlayMenuChange();
		hen();
	}
}
