using System.Collections;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class PaginatedGridLayout : GridLayoutGroup
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	public delegate void OnSelectedItemChanged(int selectedId);

	private int nlt;

	private int nlu;

	public int nlr { get; private set; }

	public int nls { get; private set; }

	public int ptc => nlr * nls;

	public int ptd => Mathf.CeilToInt(base.transform.childCount / ptc);

	public int pte
	{
		get
		{
			return nlt;
		}
		set
		{
			if (value != nlt)
			{
				nlt = value;
				hjn();
			}
		}
	}

	public int ptf
	{
		get
		{
			return nlu;
		}
		set
		{
			if (nlu != value)
			{
				nlu = value;
				if (ptc > 0)
				{
					pte = Mathf.FloorToInt(nlu / ptc);
				}
				EventSystem.current.SetSelectedGameObject(base.transform.GetChild(nlu).gameObject);
				this.nlv?.Invoke(nlu);
			}
		}
	}

	public event OnSelectedItemChanged nlv;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		qi.msf += hjm;
		StartCoroutine(hjl());
	}

	public IEnumerator hjl()
	{
		yield return new WaitForEndOfFrame();
		CalculateLayoutInputHorizontal();
		pte = Mathf.FloorToInt(nlu / ptc);
		hjn();
		if (base.transform.childCount > 0)
		{
			EventSystem.current.SetSelectedGameObject(base.transform.GetChild(nlu).gameObject);
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		qi.msf -= hjm;
	}

	private void hjm(MoveDirection a, InputAction.CallbackContext b)
	{
		if (EventSystem.current.currentSelectedGameObject.transform.parent != base.transform)
		{
			return;
		}
		AudioManager.PlayMenuChange();
		int num = (nlu - ptc * pte) % nls;
		int num2 = nlu;
		switch (a)
		{
		case MoveDirection.Left:
			num2 = ((nlu == 0) ? (base.transform.childCount - 1) : (nlu - 1));
			break;
		case MoveDirection.Right:
			num2 = ((nlu != base.transform.childCount - 1) ? (nlu + 1) : 0);
			break;
		case MoveDirection.Up:
			if (nlu < nls)
			{
				num2 = base.transform.childCount - base.transform.childCount % nls + num;
				if (num2 >= base.transform.childCount)
				{
					num2 -= nls;
				}
			}
			else
			{
				num2 = nlu - nls;
			}
			break;
		case MoveDirection.Down:
			num2 += nls;
			if (num2 >= base.transform.childCount)
			{
				num2 = num;
			}
			break;
		}
		ptf = num2;
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void CalculateLayoutInputHorizontal()
	{
		base.CalculateLayoutInputHorizontal();
		float width = base.rectTransform.rect.width;
		float height = base.rectTransform.rect.height;
		nls = Mathf.FloorToInt((width - (float)base.padding.left - (float)base.padding.right + m_Spacing.y) / (base.cellSize.x + m_Spacing.x));
		nlr = Mathf.FloorToInt((height - (float)base.padding.top - (float)base.padding.bottom + m_Spacing.y) / (base.cellSize.y + m_Spacing.y));
	}

	public void hjn()
	{
		int num = pte * ptc;
		for (int i = 0; i < base.transform.childCount; i++)
		{
			base.transform.GetChild(i).gameObject.SetActive(i >= num && i < num + ptc);
		}
	}

	public int hjo(int a, int b)
	{
		return ptc * pte + a * nls + b;
	}

	public (int, int) hjp(int a)
	{
		return (Mathf.FloorToInt(a / nls), a % nls);
	}
}
