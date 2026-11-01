using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.Rendering.Universal;

namespace Assets.Scripts.Utils;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class ty
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class tw
	{
		public string nde;

		public bool ndf;

		internal void gro(TextMeshPro a)
		{
			a.text = nde;
			a.font = Resources.Load<TMP_FontAsset>("Fonts/Jersey M54 SDF");
			a.fontSize = 2.5f;
			a.fontStyle = FontStyles.Bold;
			a.alignment = TextAlignmentOptions.Center;
			a.characterSpacing = -5f;
			a.color = (ndf ? Color.white : Color.black);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class tx
	{
		public CharacterInfo ndg;

		internal Material grp(Material a)
		{
			Material material = new Material(a);
			material.SetColor("_DiffuseColor", ndj[ndg.skinTintId]);
			return material;
		}
	}

	private static readonly HaircutType[] ndh = new HaircutType[7]
	{
		HaircutType.M_21,
		HaircutType.M_23,
		HaircutType.M_24,
		HaircutType.M_25,
		HaircutType.F_2,
		HaircutType.F_3,
		HaircutType.F_6
	};

	public static readonly HaircutType[] ndi = new HaircutType[7]
	{
		HaircutType.M_6,
		HaircutType.M_7,
		HaircutType.M_8,
		HaircutType.M_9,
		HaircutType.M_22,
		HaircutType.M_25,
		HaircutType.M_Haircap
	};

	private static readonly List<Color> ndj = new List<Color>
	{
		qh.fzu("#F1E9DC").Value,
		qh.fzu("#ECD9BF").Value,
		qh.fzu("#E3C59F").Value,
		qh.fzu("#C1AF98").Value,
		qh.fzu("#BFA788").Value
	};

	private static Dictionary<string, int> ndk = new Dictionary<string, int>
	{
		{ "301", 164 },
		{ "305", 170 },
		{ "311", 175 },
		{ "321", 178 },
		{ "322", 162 },
		{ "399", 168 },
		{ "404", 184 },
		{ "407", 178 },
		{ "409", 172 },
		{ "411", 189 },
		{ "412", 180 },
		{ "413", 174 },
		{ "421", 185 },
		{ "422", 175 },
		{ "431", 182 }
	};

	private static readonly List<Texture> ndl = new int[20].Select((int a, int b) => Resources.Load<Texture>("Textures/Eyebrows/" + (b + 1).ToString().PadLeft(2, '0') + "_Opacity")).ToList();

	public static List<HaircutType> grq(string a)
	{
		IEnumerable<HaircutType> source = Enum.GetValues(typeof(HaircutType)).Cast<HaircutType>();
		if (!(a == "m"))
		{
			return source.Where((HaircutType a) => a.ToString().StartsWith("F_")).Concat(new HaircutType[7]
			{
				HaircutType.M_6,
				HaircutType.M_8,
				HaircutType.M_9,
				HaircutType.M_21,
				HaircutType.M_22,
				HaircutType.M_25,
				HaircutType.M_1
			}).ToList();
		}
		return source.Where((HaircutType a) => a.ToString().StartsWith("M_")).ToList();
	}

	public static bool grr(string a)
	{
		return a == "m";
	}

	public static void grs(GameObject a, CharacterInfo b)
	{
		if (b.height != ndk[b.modelId])
		{
			a.transform.localScale = Vector3.one * b.height.gth(ndk[b.modelId] - 2, ndk[b.modelId] + 2) / ndk[b.modelId];
		}
		SkinnedMeshRenderer component = a.transform.Find("CC_Base_Eye").GetComponent<SkinnedMeshRenderer>();
		component.materials = new Material[4]
		{
			component.materials[0],
			new Material(component.materials[1]),
			component.materials[2],
			new Material(component.materials[3])
		};
		Color32 color = b.eyesColor switch
		{
			EyeColor.Brown => new Color32(111, 68, 27, byte.MaxValue), 
			EyeColor.Hazel => new Color32(123, 90, 39, byte.MaxValue), 
			EyeColor.Green => new Color32(84, 94, 50, byte.MaxValue), 
			EyeColor.Blue => new Color32(64, 110, 128, byte.MaxValue), 
			EyeColor.Lightblue => new Color32(123, 167, 185, byte.MaxValue), 
			EyeColor.Grey => new Color32(133, 163, 169, byte.MaxValue), 
			_ => new Color32(61, 45, 30, byte.MaxValue), 
		};
		component.materials[1].SetColor("_IrisColor", color);
		component.materials[3].SetColor("_IrisColor", color);
		Transform transform = a.transform.Find("Eyebrows");
		gru(transform, b.eyebrowsId ?? 1);
		gsb(transform, b.hairColor);
		CharacterOutfit outfit = b.outfit;
		pz.TopType valueOrDefault = (outfit?.Top?.Type).GetValueOrDefault();
		pz.BottomType valueOrDefault2 = (outfit?.Bottom?.Type).GetValueOrDefault();
		int num = outfit?.Shoes?.ModelId ?? 1;
		Transform transform2 = a.transform.Find((valueOrDefault == pz.TopType.TankTop) ? "CC_Base_Body" : "CC_Base_Body_TShirt");
		if (b.skinTintId >= 0 && b.skinTintId < ndj.Count)
		{
			SkinnedMeshRenderer component2 = transform2.GetComponent<SkinnedMeshRenderer>();
			component2.materials = component2.materials.Select(delegate(Material a)
			{
				Material material = new Material(a);
				material.SetColor("_DiffuseColor", ndj[b.skinTintId]);
				return material;
			}).ToArray();
		}
		List<string> list = (from pz.TopType a in Enum.GetValues(typeof(pz.TopType))
			select a.ToString()).ToList();
		List<string> list2 = (from pz.BottomType a in Enum.GetValues(typeof(pz.BottomType))
			select a.ToString()).ToList();
		if ((bool)a.transform.Find("CC_Base_Body_TShirt"))
		{
			a.transform.Find("CC_Base_Body").gameObject.SetActive(valueOrDefault == pz.TopType.TankTop);
			a.transform.Find("CC_Base_Body_TShirt").gameObject.SetActive(valueOrDefault != pz.TopType.TankTop);
		}
		List<Transform> list3 = new List<Transform>();
		for (int i = 0; i < a.transform.childCount; i++)
		{
			Transform child = a.transform.GetChild(i);
			if (child.name.StartsWith("Hair_"))
			{
				bool flag = child.name == $"Hair_{b.haircut}" || child.name.StartsWith($"Hair_{b.haircut}_") || (child.name == "Hair_M_Haircap" && ndh.Contains(b.haircut));
				child.gameObject.SetActive(flag);
				if (flag)
				{
					gsb(child, b.hairColor);
				}
			}
			else if (child.name.StartsWith("Beard_"))
			{
				bool flag2 = (b.beardType.HasValue && child.name.StartsWith($"Beard_{b.beardType}")) || (child.name == "Beard_FullLong" && b.beardType == BeardType.FullVeryLong);
				child.gameObject.SetActive(flag2);
				if (flag2)
				{
					gsb(child, b.beardColor);
					list3.Add(child);
				}
			}
			else if (child.name.StartsWith("Shoes_"))
			{
				child.gameObject.SetActive(child.name.StartsWith($"Shoes_{num}"));
			}
			else if (list.Contains(child.name))
			{
				child.gameObject.SetActive(child.name == valueOrDefault.ToString());
			}
			else if (list2.Contains(child.name))
			{
				child.gameObject.SetActive(child.name == valueOrDefault2.ToString());
			}
		}
		grv(a.transform.Find("Socks"), "Materials/Fabric", outfit?.SocksColor ?? Color.white);
		grw(a.transform.Find($"Shoes_{num}"), $"Materials/Shoes/{num}", "Textures/Shoes/" + (outfit?.Shoes?.Texture ?? $"{num}_White"));
		grx(a.transform.Find(valueOrDefault.ToString()), outfit?.Top?.Texture, outfit?.Top?.Colors);
		if (valueOrDefault2 == pz.BottomType.Short)
		{
			gry(a.transform.Find(valueOrDefault2.ToString()), outfit?.Bottom?.Texture, outfit?.Bottom?.Colors);
		}
		else
		{
			grz(a.transform.Find(valueOrDefault2.ToString()), outfit?.Bottom?.Colors);
		}
		Quaternion rotation = a.transform.rotation;
		a.transform.rotation = Quaternion.identity;
		Color a2 = outfit?.Top?.Colors?.FirstOrDefault() ?? Color.white;
		bool flag3 = outfit?.Top?.TextInWhite ?? qh.fzt(a2);
		gsd(a, b: true, b.lastName.ToUpper(), flag3);
		gsd(a, b: false, Countries.fxf(b.country)?.ToUpper() ?? "", flag3);
		gse(a, "Brand", HumanBodyBones.UpperChest, new Vector3(0.08f, 0.1491f, 0.07f), new Vector3(0f, 180f, 0f), new Vector2(0.04f, 0.04f), (outfit != null && outfit.Top?.Brand != null) ? ("Images/Brands/" + outfit.Top.Brand + (flag3 ? "" : "_black")) : null);
		bool flag4 = qh.fzt(outfit?.Bottom?.Colors?.FirstOrDefault() ?? Color.white);
		Vector3 d = new Vector3(0.08f, (b.gender == "m") ? 0.3f : 0.2f, 0.04f);
		if (valueOrDefault2 == pz.BottomType.Skirt)
		{
			d = new Vector3(0.08f, 0.17f, 0f);
		}
		gse(a, "Brand", HumanBodyBones.LeftUpperLeg, d, new Vector3(0f, 70f, 0f), new Vector2(0.04f, 0.04f), (outfit != null && outfit.Bottom?.Brand != null) ? ("Images/Brands/" + outfit.Bottom.Brand + (flag4 ? "" : "_black")) : null);
		Transform transform3 = a.transform.Find("Headband");
		if (transform3 != null)
		{
			transform3.gameObject.SetActive(outfit?.HeadbandColor.HasValue ?? false);
			if (outfit != null && outfit.HeadbandColor.HasValue)
			{
				grv(transform3, "Materials/Fabric", outfit.HeadbandColor);
			}
		}
		Transform transform4 = a.transform.Find("Wristband");
		if (transform4 != null)
		{
			transform4.gameObject.SetActive(outfit?.WristbandColor.HasValue ?? false);
			if (outfit != null && outfit.WristbandColor.HasValue)
			{
				grv(transform4, "Materials/Fabric", outfit.WristbandColor);
			}
		}
		a.transform.rotation = rotation;
		CharacterRacket component3 = a.GetComponent<CharacterRacket>();
		if (component3 != null)
		{
			grt(component3, b);
		}
		CharacterBlendShapeCustomization characterBlendShapeCustomization = a.GetComponent<CharacterBlendShapeCustomization>();
		if (characterBlendShapeCustomization == null)
		{
			characterBlendShapeCustomization = a.AddComponent<CharacterBlendShapeCustomization>();
		}
		if (b.blendShapes != null)
		{
			characterBlendShapeCustomization.pjd = (from a in new Transform[2] { transform2, transform }.Concat(list3)
				select a.GetComponent<SkinnedMeshRenderer>()).ToList();
			characterBlendShapeCustomization.fra(b.blendShapes);
		}
	}

	public static void grt(CharacterRacket a, CharacterInfo b)
	{
		MeshRenderer component;
		Material material;
		if (b?.outfit?.Racket != null)
		{
			component = a.mns.transform.Find("Frame").GetComponent<MeshRenderer>();
			material = null;
			if (b.outfit.Racket.Texture != null)
			{
				List<Color> colors = b.outfit.Racket.Colors;
				if (colors != null && colors.Count > 0)
				{
					material = UnityEngine.Object.Instantiate(Resources.Load<Material>("Materials/Racket_Colors"));
					material.SetTexture("_Texture", Resources.Load<Texture>("Textures/Rackets/" + b.outfit.Racket.Texture));
					List<Color> colors2 = b.outfit.Racket.Colors;
					if (colors2 != null && colors2.Count > 0)
					{
						material.SetColor("_Color1", b.outfit.Racket.Colors[0]);
					}
					List<Color> colors3 = b.outfit.Racket.Colors;
					if (colors3 != null && colors3.Count > 1)
					{
						material.SetColor("_Color2", b.outfit.Racket.Colors[1]);
					}
					List<Color> colors4 = b.outfit.Racket.Colors;
					if (colors4 != null && colors4.Count > 2)
					{
						material.SetColor("_Color3", b.outfit.Racket.Colors[2]);
					}
					goto IL_0203;
				}
			}
			material = UnityEngine.Object.Instantiate(Resources.Load<Material>("Materials/Racket"));
			if (b.outfit.Racket.Texture != null)
			{
				material.SetTexture("_BaseMap", Resources.Load<Texture>("Textures/Rackets/" + b.outfit.Racket.Texture));
			}
			List<Color> colors5 = b.outfit.Racket.Colors;
			if (colors5 != null && colors5.Count > 0)
			{
				material.color = b.outfit.Racket.Colors[0];
			}
			goto IL_0203;
		}
		goto IL_0209;
		IL_0209:
		if (b != null && (b.outfit?.GripColor).HasValue)
		{
			MeshRenderer component2 = a.mns.transform.Find("Handle").GetComponent<MeshRenderer>();
			component2.material = UnityEngine.Object.Instantiate(component2.material);
			component2.material.color = b.outfit.GripColor.Value;
		}
		if (b != null && (b.outfit?.StringColor).HasValue)
		{
			MeshRenderer component3 = a.mns.transform.Find("Strings").GetComponent<MeshRenderer>();
			MeshRenderer component4 = a.mns.transform.Find("Ropes").GetComponent<MeshRenderer>();
			component3.material = UnityEngine.Object.Instantiate(component3.material);
			component3.material.color = b.outfit.StringColor.Value;
			component4.materials[1] = UnityEngine.Object.Instantiate(component4.materials[1]);
			component4.materials[1].color = b.outfit.StringColor.Value;
		}
		return;
		IL_0203:
		component.material = material;
		goto IL_0209;
	}

	private static void gru(Transform a, int b)
	{
		SkinnedMeshRenderer component = a.GetComponent<SkinnedMeshRenderer>();
		component.materials = component.materials.Select((Material a) => new Material(a)).ToArray();
		Material[] materials = component.materials;
		for (int i = 0; i < materials.Length; i++)
		{
			materials[i].SetTexture("_DiffuseMap", ndl[b - 1]);
		}
	}

	private static void grv(Transform a, string b, Color? c = null)
	{
		if (a != null)
		{
			Material material = UnityEngine.Object.Instantiate(Resources.Load<Material>(b));
			if (c.HasValue)
			{
				material.color = c.Value;
			}
			a.GetComponent<Renderer>().material = material;
		}
	}

	private static void grw(Transform a, string b, string c)
	{
		if (a != null)
		{
			Material material = UnityEngine.Object.Instantiate(Resources.Load<Material>(b));
			material.SetTexture("_BaseMap", Resources.Load<Texture>(c));
			a.GetComponent<Renderer>().material = material;
		}
	}

	private static void grx(Transform a, string b, List<Color> c)
	{
		if (!(a != null))
		{
			return;
		}
		if (b != null && b.StartsWith("Custom_"))
		{
			Material material = UnityEngine.Object.Instantiate(Resources.Load<Material>("Materials/Jersey_Colors"));
			material.SetTexture("_Texture", Resources.Load<Texture>("Textures/Tops/" + b));
			if (c != null && c.Count > 0)
			{
				material.SetColor("_Color1", c[0]);
			}
			if (c != null && c.Count > 1)
			{
				material.SetColor("_Color2", c[1]);
			}
			if (c != null && c.Count > 2)
			{
				material.SetColor("_Color3", c[2]);
			}
			a.GetComponent<Renderer>().material = material;
		}
		else
		{
			Material material2 = UnityEngine.Object.Instantiate(Resources.Load<Material>("Materials/Jersey"));
			material2.SetTexture("_BaseMap", Resources.Load<Texture>("Textures/Tops/" + b));
			if (c != null && c.Count > 0)
			{
				material2.color = c[0];
			}
			a.GetComponent<Renderer>().material = material2;
		}
	}

	private static void gry(Transform a, string b, List<Color> c)
	{
		if (!(a != null))
		{
			return;
		}
		if (b != null && b.StartsWith("Custom_"))
		{
			Material material = UnityEngine.Object.Instantiate(Resources.Load<Material>("Materials/Short_Colors"));
			material.SetTexture("_Texture", Resources.Load<Texture>("Textures/Bottoms/" + b));
			if (c != null && c.Count > 0)
			{
				material.SetColor("_Color1", c[0]);
			}
			if (c != null && c.Count > 1)
			{
				material.SetColor("_Color2", c[1]);
			}
			if (c != null && c.Count > 2)
			{
				material.SetColor("_Color3", c[2]);
			}
			a.GetComponent<Renderer>().material = material;
		}
		else
		{
			Material material2 = UnityEngine.Object.Instantiate(Resources.Load<Material>("Materials/Short"));
			material2.SetTexture("_BaseMap", Resources.Load<Texture>("Textures/Bottoms/" + b));
			if (c != null && c.Count > 0)
			{
				material2.color = c[0];
			}
			a.GetComponent<Renderer>().material = material2;
		}
	}

	private static void grz(Transform a, List<Color> b)
	{
		if (a != null)
		{
			Material material = UnityEngine.Object.Instantiate(Resources.Load<Material>("Materials/Skirt"));
			if (b != null && b.Count > 0)
			{
				material.color = b[0];
			}
			Material material2 = material;
			if (b != null && b.Count > 1)
			{
				material2 = UnityEngine.Object.Instantiate(material);
				material2.color = b[1];
			}
			Material material3 = material2;
			if (b != null && b.Count > 2)
			{
				material3 = UnityEngine.Object.Instantiate(material);
				material3.color = b[2];
			}
			a.GetComponent<Renderer>().materials = new Material[3] { material2, material, material3 };
		}
	}

	private static void gsa(Transform a, string[] b)
	{
		if (a != null)
		{
			a.GetComponent<Renderer>().materials = b.Select((string a) => UnityEngine.Object.Instantiate(Resources.Load<Material>(a))).ToArray();
		}
	}

	private static void gsb(Transform a, ow b)
	{
		Material[] materials = a.gameObject.GetComponent<SkinnedMeshRenderer>().materials;
		gsc(materials[0], b?.moo);
		if (materials.Length > 1)
		{
			gsc(materials[1], b?.mop);
		}
	}

	private static void gsc(Material a, ow.ov b)
	{
		a.SetColor("_DiffuseColor", b?.mok ?? Color.black);
		a.SetColor("_SpecularTint", b?.mol ?? Color.black);
		a.SetFloat("BOOLEAN_ENABLECOLOR", (b != null && b.mom.HasValue) ? 1 : 0);
		if (b != null && b.mom.HasValue)
		{
			a.SetColor("_RootColor", b.mom.Value);
		}
		a.SetColor("_BaseColor", b?.mok ?? Color.black);
	}

	private static void gsd(GameObject a, bool b, string c, bool d)
	{
		Transform boneTransform = a.GetComponent<Animator>().GetBoneTransform(HumanBodyBones.UpperChest);
		Bounds bounds = a.transform.Find("CC_Base_Body").GetComponent<SkinnedMeshRenderer>().bounds;
		float y = 0.1905f * bounds.size.y - 0.1481f - (b ? 0f : 0.07f);
		float num = 0.38f * bounds.size.x - 0.2f - (b ? 0f : 0.1f);
		string text = "Character Shirt Decal " + (b ? "name" : "country");
		GameObject gameObject = boneTransform.Find(text)?.gameObject;
		DecalProjector decalProjector = null;
		if (gameObject == null)
		{
			gameObject = new GameObject(text);
			gameObject.transform.parent = boneTransform;
			gameObject.transform.localPosition = new Vector3(0f, y, -0.12f);
			decalProjector = gameObject.AddComponent<DecalProjector>();
		}
		else
		{
			decalProjector = gameObject.GetComponent<DecalProjector>();
		}
		decalProjector.size = new Vector3((c.Length > 7) ? (num * 7f / (float)c.Length) : num, num, 0.1f);
		decalProjector.pivot = Vector3.zero;
		decalProjector.material = UnityEngine.Object.Instantiate(Resources.Load<Material>("Materials/TextDecal"));
		RenderTexture value = sa.gjw(delegate(TextMeshPro a)
		{
			a.text = c;
			a.font = Resources.Load<TMP_FontAsset>("Fonts/Jersey M54 SDF");
			a.fontSize = 2.5f;
			a.fontStyle = FontStyles.Bold;
			a.alignment = TextAlignmentOptions.Center;
			a.characterSpacing = -5f;
			a.color = (d ? Color.white : Color.black);
		});
		decalProjector.material.SetTexture("Base_Map", value);
	}

	private static void gse(GameObject a, string b, HumanBodyBones c, Vector3 d, Vector3 e, Vector2 f, string g)
	{
		Transform boneTransform = a.GetComponent<Animator>().GetBoneTransform(c);
		string text = "Character Logo Decal " + b;
		GameObject gameObject = boneTransform.Find(text)?.gameObject;
		DecalProjector decalProjector = null;
		if (gameObject == null)
		{
			gameObject = new GameObject(text);
			gameObject.transform.parent = boneTransform;
			decalProjector = gameObject.AddComponent<DecalProjector>();
		}
		else
		{
			decalProjector = gameObject.GetComponent<DecalProjector>();
		}
		gameObject.transform.localPosition = d;
		gameObject.transform.localRotation = Quaternion.Euler(e);
		decalProjector.size = new Vector3(f.x, f.y, 0.08f);
		decalProjector.pivot = Vector3.zero;
		decalProjector.material = UnityEngine.Object.Instantiate(Resources.Load<Material>("Materials/TextDecal"));
		if (g != null)
		{
			decalProjector.material.SetTexture("Base_Map", Resources.Load<Texture>(g));
		}
		gameObject.SetActive(g != null);
	}
}
