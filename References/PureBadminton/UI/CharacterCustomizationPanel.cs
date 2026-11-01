using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;
using UnityEngine.Localization;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CharacterCustomizationPanel : AnimatedPanel
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class uu
	{
		public string ngy;

		public CharacterCustomizationPanel ngz;

		internal bool gyz(CharacterInfo a)
		{
			return a.gender == ngy;
		}

		internal string gza(CharacterInfo a, int b)
		{
			return ngz.gut("MainMenu_CharacterCreation", "PlayerX", b + 1);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class uv
	{
		public pz.EquipmentType nha;

		internal bool gzb(CareerUnlockedEquipment a)
		{
			if (a.Type == nha)
			{
				return a.Unread;
			}
			return false;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class uw
	{
		public CharacterCustomizationPanel nhb;

		public pz.pq nhc;

		internal bool gzc(CareerUnlockedEquipment a)
		{
			if (a.Type == nhb.nhk)
			{
				return a.Id == nhc.Id;
			}
			return false;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class uz
	{
		public string nhd;

		public pz.EquipmentType nhe;

		internal bool gzd(Color a)
		{
			return a.ToString() == nhd;
		}

		internal bool gze(pz.pq a)
		{
			return a.Id == nhd;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class va
	{
		public pz.pq nhf;

		public uz nhg;

		internal bool gzf(CareerUnlockedEquipment a)
		{
			if (a.Type == nhg.nhe)
			{
				return a.Id == nhf.Id;
			}
			return false;
		}
	}

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private AnimatedPanel appearanceCard;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private AnimatedPanel headCard;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private AnimatedPanel clothingCard;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private AnimatedPanel racketCard;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private AnimatedPanel equipmentSelectionCard;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	public StatsAssignmentPanel statsCard;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextSelectManager firstnameSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextSelectManager lastnameSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CountrySelectManager countrySelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager genderSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager playerSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager handednessSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CustomSelectManager headSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CustomSelectManager clothingSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CustomSelectManager racketSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CustomSelectManager statsSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager haircutSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager haircutColorSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager beardSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager beardColorSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LeftRightSelectManager eyesColorSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CustomSelectManager topSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CustomSelectManager bottomSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CustomSelectManager socksSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CustomSelectManager shoesSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CustomSelectManager racketFrameSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CustomSelectManager gripSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CustomSelectManager stringSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject validateSelect;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private ButtonIndication validateButtonIndication;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject beardContainer;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject beardColorContainer;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Image clothingBadge;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Image racketBadge;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Image topBadge;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Image bottomBadge;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Image shoesBadge;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Image racketFrameBadge;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LocalizedTextMeshPro equipmentCardTitle;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private PaginatedGridLayout equipmentList;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CharactersPreviewScene charactersPreview;

	[NonSerialized]
	private CharacterInfo nhi;

	private List<pz.pq> nhl;

	private Vector3 nhm = new Vector3(1f, 3.2f, -33f);

	[field: NonSerialized]
	public CharacterInfo nhh { get; set; }

	private List<CharacterInfo> nhj { get; set; }

	public bool pqj => EventSystem.current.currentSelectedGameObject == validateSelect;

	private pz.EquipmentType? nhk { get; set; }

	private AnimatedPanel pqk
	{
		get
		{
			if (!nhk.HasValue)
			{
				return null;
			}
			if (!new pz.EquipmentType[3]
			{
				pz.EquipmentType.Racket,
				pz.EquipmentType.Grip,
				pz.EquipmentType.String
			}.ToList().Contains(nhk.Value))
			{
				return clothingCard;
			}
			return racketCard;
		}
	}

	public bool pql
	{
		get
		{
			if (!nhk.HasValue)
			{
				return appearanceCard.pqc;
			}
			return false;
		}
	}

	private Vector3 pqm => new Vector3(1.3f, (float)nhh.height / 100f + 0.75f, -20f);

	public Func<string, Task<string>> pqn
	{
		get
		{
			return lastnameSelect.AsyncValidator;
		}
		set
		{
			lastnameSelect.AsyncValidator = value;
		}
	}

	public string pqo
	{
		get
		{
			return nhh.firstName;
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			nhh.firstName = value;
		}
	}

	public string pqp
	{
		get
		{
			return nhh.lastName;
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			nhh.lastName = value;
			haj();
		}
	}

	public Country pqq
	{
		get
		{
			if (nhh.country == null)
			{
				return null;
			}
			return Countries.fxc(nhh.country);
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			if (!(value?.alpha3 == nhh.country))
			{
				nhh.country = value?.alpha3;
				if (value != null)
				{
					nhh.fsu(value.Outfit, b: true);
				}
				haj();
			}
		}
	}

	public int pqr
	{
		get
		{
			if (!(nhh.gender == "f"))
			{
				return 0;
			}
			return 1;
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			string text = ((value == 1) ? "f" : "m");
			if (text != nhh.gender)
			{
				nhh.gender = text;
				hag();
				hae();
				haf();
			}
		}
	}

	public int pqs
	{
		get
		{
			return nhj.FindIndex((CharacterInfo a) => a.id == nhh.id);
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			CharacterInfo characterInfo = nhj[value];
			if (characterInfo.id != nhh.id)
			{
				nhh.id = characterInfo.id;
				nhh.modelId = characterInfo.modelId;
				nhh.skinTintId = characterInfo.skinTintId;
				nhh.height = characterInfo.height;
				nhh.haircut = characterInfo.haircut;
				nhh.hairColor = characterInfo.hairColor;
				nhh.beardType = characterInfo.beardType;
				nhh.beardColor = characterInfo.beardColor;
				nhh.eyebrowsId = characterInfo.eyebrowsId;
				nhh.eyesColor = characterInfo.eyesColor;
				hah();
			}
		}
	}

	public int pqt
	{
		get
		{
			if (!nhh.leftHanded)
			{
				return 1;
			}
			return 0;
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			bool flag = value == 0;
			if (flag != nhh.leftHanded)
			{
				nhh.leftHanded = flag;
				hai();
			}
		}
	}

	public List<HaircutType> pqu => ty.grq(nhh.gender);

	public int pqv
	{
		get
		{
			return pqu.IndexOf(nhh.haircut);
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			if (value != pqv && value >= 0 && value < pqu.Count)
			{
				nhh.haircut = pqu[value];
				haj();
			}
		}
	}

	public int pqw
	{
		get
		{
			return ow.moq.IndexOf(nhh.hairColor);
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			if (value != pqw && value >= 0 && value < ow.moq.Count)
			{
				nhh.hairColor = ow.moq[value];
				haj();
			}
		}
	}

	public int pqx
	{
		get
		{
			if (!nhh.beardType.HasValue)
			{
				return 0;
			}
			return (int)(nhh.beardType.Value + 1);
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			if (value != pqx)
			{
				nhh.beardType = ((value > 0) ? new BeardType?((BeardType)(value - 1)) : null);
				haj();
			}
		}
	}

	public int pqy
	{
		get
		{
			return ow.moq.IndexOf(nhh.beardColor);
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			if (value != pqy && value >= 0 && value < ow.moq.Count)
			{
				nhh.beardColor = ow.moq[value];
				haj();
			}
		}
	}

	public int pqz
	{
		get
		{
			return (int)nhh.eyesColor.GetValueOrDefault();
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			if (value != pqz)
			{
				nhh.eyesColor = (EyeColor)value;
				haj();
			}
		}
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public bool Validate(bool displayErrorModal)
	{
		if (firstnameSelect.gameObject.activeInHierarchy && (string.IsNullOrEmpty(nhh.firstName) || nhh.firstName.Trim().Length < 2))
		{
			if (displayErrorModal)
			{
				SimpleModal.hic(this.gut("MainMenu_CharacterCreation", "InvalidFirstName"));
			}
			return false;
		}
		if (string.IsNullOrEmpty(nhh.lastName) || nhh.lastName.Trim().Length < 2)
		{
			if (displayErrorModal)
			{
				SimpleModal.hic(this.gut("MainMenu_CharacterCreation", "InvalidLastName"));
			}
			return false;
		}
		return true;
	}

	private void hae()
	{
		string ngy = nhh?.gender ?? "m";
		nhj = os.pjk.Where((CharacterInfo a) => a.gender == ngy).ToList();
		playerSelect.Options = nhj.Select((CharacterInfo a, int b) => this.gut("MainMenu_CharacterCreation", "PlayerX", b + 1)).ToList();
	}

	private void haf()
	{
		pqs = UnityEngine.Random.Range(0, playerSelect.Options.Count);
		playerSelect.psa = pqs;
		hah();
	}

	private void hag()
	{
		bool active = ty.grr(nhh?.gender ?? "m");
		beardContainer.SetActive(active);
		beardColorContainer.SetActive(active);
		haircutSelect.Options = Enumerable.Range(0, pqu.Count).Select((int a, int b) => this.gut("MainMenu_CharacterCreation", "HaircutX", b + 1)).ToList();
	}

	private void hah()
	{
		haircutSelect.psa = pqv;
		haircutColorSelect.psa = pqw;
		beardSelect.psa = pqx;
		beardColorSelect.psa = pqy;
		eyesColorSelect.psa = pqz;
		hai();
	}

	private void hai()
	{
		charactersPreview.hbg(CharactersPreviewScenePosition.Right, nhh, CharacterIdlePose.Racket);
	}

	private void haj()
	{
		charactersPreview.RightCharacter.gyr(nhh);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		qi.pli.pkm.performed += hak;
		qi.pli.pkn.performed += hal;
		equipmentList.nlv += han;
		haircutColorSelect.Options = ow.moq.Select((ow a) => a.mon).ToList();
		beardSelect.Options = new int[Enum.GetValues(typeof(BeardType)).Length + 1].Select((int a, int b) => this.gut("MainMenu_CharacterCreation", "BeardX", b + 1)).ToList();
		beardColorSelect.Options = haircutColorSelect.Options;
		eyesColorSelect.Options = (from a in Enum.GetValues(typeof(EyeColor)).OfType<EyeColor>()
			select a.ToString()).ToList();
		hag();
		hae();
		if (nhh.modelId != null)
		{
			playerSelect.psa = pqs;
			hah();
		}
		else
		{
			haf();
		}
		genderSelect.psa = pqr;
		firstnameSelect.ptu = nhh.firstName;
		lastnameSelect.ptu = nhh.lastName;
		if (nhh.country != null)
		{
			countrySelect.pre = Countries.fxc(nhh.country);
		}
		handednessSelect.psa = pqt;
		statsCard.Stats = nhh.stats;
		ham();
		charactersPreview.hbj(nhm);
		charactersPreview.RightCharacter.pqi = true;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		charactersPreview.RightCharacter.pqi = false;
		qi.pli.pkm.performed -= hak;
		qi.pli.pkn.performed -= hal;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Update()
	{
		GameObject gameObject = ((EventSystem.current != null) ? EventSystem.current.currentSelectedGameObject : null);
		bool flag = gameObject == null || gameObject.GetComponent<LeftRightSelectManager>() == null;
		if (validateButtonIndication.gameObject.activeSelf != flag)
		{
			validateButtonIndication.gameObject.SetActive(flag);
		}
	}

	protected override void cyr()
	{
		base.cyr();
		charactersPreview.hbj();
		charactersPreview.hbi();
	}

	private void hak(InputAction.CallbackContext a)
	{
		if (!this.gus())
		{
			return;
		}
		if (nhk.HasValue)
		{
			nhh = nhi;
			AudioManager.fjc();
			equipmentSelectionCard.FadeOut();
			pqk.FadeIn();
			nhk = null;
			haj();
			return;
		}
		if (EventSystem.current.currentSelectedGameObject == headSelect.gameObject)
		{
			AudioManager.fiu();
			appearanceCard.FadeOut();
			headCard.FadeIn();
			charactersPreview.hbj(pqm);
			charactersPreview.RightCharacter.gyt(200f);
		}
		if (EventSystem.current.currentSelectedGameObject == clothingSelect.gameObject)
		{
			AudioManager.fiu();
			appearanceCard.FadeOut();
			clothingCard.FadeIn();
			charactersPreview.RightCharacter.gyt(200f);
		}
		if (EventSystem.current.currentSelectedGameObject == racketSelect.gameObject)
		{
			AudioManager.fiu();
			appearanceCard.FadeOut();
			racketCard.FadeIn();
			charactersPreview.hbj(pqm);
			charactersPreview.RightCharacter.gyt(nhh.leftHanded ? (-10) : 20);
		}
		if (EventSystem.current.currentSelectedGameObject == statsSelect.gameObject)
		{
			AudioManager.fiu();
			appearanceCard.FadeOut();
			statsCard.FadeIn();
		}
		if (EventSystem.current.currentSelectedGameObject == topSelect.gameObject)
		{
			hao(pz.EquipmentType.Top, nhh.outfit.Top?.Id);
		}
		if (EventSystem.current.currentSelectedGameObject == bottomSelect.gameObject)
		{
			hao(pz.EquipmentType.Bottom, nhh.outfit.Bottom?.Id);
		}
		if (EventSystem.current.currentSelectedGameObject == socksSelect.gameObject)
		{
			hao(pz.EquipmentType.Socks, nhh.outfit.SocksColor?.ToString());
		}
		if (EventSystem.current.currentSelectedGameObject == shoesSelect.gameObject)
		{
			hao(pz.EquipmentType.Shoes, nhh.outfit.Shoes?.Id);
		}
		if (EventSystem.current.currentSelectedGameObject == racketFrameSelect.gameObject)
		{
			hao(pz.EquipmentType.Racket, nhh.outfit.Racket?.Id);
		}
		if (EventSystem.current.currentSelectedGameObject == gripSelect.gameObject)
		{
			hao(pz.EquipmentType.Grip, nhh.outfit.GripColor?.ToString());
		}
		if (EventSystem.current.currentSelectedGameObject == stringSelect.gameObject)
		{
			hao(pz.EquipmentType.String, nhh.outfit.StringColor?.ToString());
		}
	}

	private void hal(InputAction.CallbackContext a)
	{
		if (this.gus())
		{
			if (nhk.HasValue)
			{
				AudioManager.fiu();
				equipmentSelectionCard.FadeOut();
				pqk.FadeIn();
				nhk = null;
				haj();
			}
			else if (statsCard.pqc)
			{
				nhh.stats = statsCard.Stats;
				AudioManager.fiu();
				statsCard.FadeOut();
				appearanceCard.FadeIn();
			}
			else if (racketCard.pqc)
			{
				AudioManager.fiu();
				racketCard.FadeOut();
				appearanceCard.FadeIn();
				charactersPreview.hbj(nhm);
				charactersPreview.RightCharacter.gyt(200f);
			}
			else if (clothingCard.pqc)
			{
				AudioManager.fiu();
				clothingCard.FadeOut();
				appearanceCard.FadeIn();
			}
			else if (headCard.pqc)
			{
				AudioManager.fiu();
				headCard.FadeOut();
				appearanceCard.FadeIn();
				charactersPreview.hbj(nhm);
				charactersPreview.RightCharacter.gyt(200f);
			}
		}
	}

	private void ham()
	{
		Func<pz.EquipmentType, bool> func = (pz.EquipmentType a) => Career.Current != null && Career.Current.UnlockedEquipments.Any((CareerUnlockedEquipment a) => a.Type == a && a.Unread);
		topBadge.gameObject.SetActive(func(pz.EquipmentType.Top));
		bottomBadge.gameObject.SetActive(func(pz.EquipmentType.Bottom));
		shoesBadge.gameObject.SetActive(func(pz.EquipmentType.Shoes));
		racketFrameBadge.gameObject.SetActive(func(pz.EquipmentType.Racket));
		racketBadge.gameObject.SetActive(racketFrameBadge.gameObject.activeSelf);
		clothingBadge.gameObject.SetActive(topBadge.gameObject.activeSelf || bottomBadge.gameObject.activeSelf || shoesBadge.gameObject.activeSelf);
	}

	private void han(int a)
	{
		List<pz.pq> list = nhl;
		pz.pq nhc = ((list != null && list.Count > a) ? nhl[a] : null);
		Color? color = ((pz.mqu.Count > a) ? new Color?(pz.mqu[a]) : null);
		if (nhc != null)
		{
			bool num = ne.fhw(nhk.Value, nhc.Id);
			CareerUnlockedEquipment careerUnlockedEquipment = Career.Current?.UnlockedEquipments.Find((CareerUnlockedEquipment a) => a.Type == nhk && a.Id == nhc.Id);
			if (careerUnlockedEquipment != null && careerUnlockedEquipment.Unread)
			{
				careerUnlockedEquipment.Unread = false;
				equipmentList.transform.GetChild(equipmentList.ptf).GetComponent<EquipmentItem>().hcr();
				ham();
			}
			if (num && !ne.fhx(nhk.Value, nhc.Id))
			{
				return;
			}
		}
		switch (nhk)
		{
		case pz.EquipmentType.Top:
			nhi.outfit.Top = nhc as pz.pr;
			break;
		case pz.EquipmentType.Bottom:
			nhi.outfit.Bottom = nhc as pz.ps;
			break;
		case pz.EquipmentType.Shoes:
			nhi.outfit.Shoes = nhc as pz.pt;
			break;
		case pz.EquipmentType.Racket:
			nhi.outfit.Racket = nhc as pz.pu;
			break;
		case pz.EquipmentType.Socks:
			nhi.outfit.SocksColor = color.Value;
			break;
		case pz.EquipmentType.Grip:
			nhi.outfit.GripColor = color.Value;
			break;
		case pz.EquipmentType.String:
			nhi.outfit.StringColor = color.Value;
			break;
		}
		charactersPreview.RightCharacter.gyr(nhi);
	}

	private void hao(pz.EquipmentType a, string b)
	{
		nhk = a;
		nhi = nhh.fsp();
		equipmentCardTitle.plk = new LocalizedString("MainMenu_CharacterCreation", pz.fyu(a));
		AudioManager.fiu();
		if (racketCard.pqc)
		{
			racketCard.FadeOut();
		}
		if (clothingCard.pqc)
		{
			clothingCard.FadeOut();
		}
		if (appearanceCard.pqc)
		{
			appearanceCard.FadeOut();
		}
		equipmentSelectionCard.FadeIn();
		equipmentList.transform.guj();
		int num = 0;
		if (pz.mqv.Contains(a))
		{
			foreach (Color item in pz.mqu)
			{
				UnityEngine.Object.Instantiate(Resources.Load<GameObject>("UI/Career/ColorItem"), equipmentList.transform).transform.Find("Color").GetComponent<Image>().color = item;
			}
			num = pz.mqu.FindIndex((Color a) => a.ToString() == b);
		}
		else
		{
			nhl = pz.fyt(a, nhh.gender).ToList();
			if (pqq != null && a == pz.EquipmentType.Top)
			{
				nhl.Insert(0, pqq.Outfit.Top);
			}
			if (pqq != null && a == pz.EquipmentType.Bottom && pqq.Outfit.Bottom.Id.StartsWith("Country_"))
			{
				nhl.Insert(0, pqq.Outfit.Bottom);
			}
			foreach (pz.pq nhf in nhl)
			{
				EquipmentItem equipmentItem = UnityEngine.Object.Instantiate(EquipmentItem.prj, equipmentList.transform);
				bool num2 = ne.fhw(a, nhf.Id);
				equipmentItem.hcq(c: num2 && !ne.fhx(a, nhf.Id), d: (num2 ? Career.Current?.UnlockedEquipments.Find((CareerUnlockedEquipment a) => a.Type == a && a.Id == nhf.Id) : null)?.Unread ?? false, a: a, b: nhf);
			}
			num = nhl.FindIndex((pz.pq a) => a.Id == b);
		}
		if (num == -1)
		{
			num = 0;
		}
		equipmentList.ptf = num;
	}

	[CompilerGenerated]
	private bool hap(CharacterInfo a)
	{
		return a.id == nhh.id;
	}

	[CompilerGenerated]
	private string haq(int a, int b)
	{
		return this.gut("MainMenu_CharacterCreation", "HaircutX", b + 1);
	}

	[CompilerGenerated]
	private string har(int a, int b)
	{
		return this.gut("MainMenu_CharacterCreation", "BeardX", b + 1);
	}
}
