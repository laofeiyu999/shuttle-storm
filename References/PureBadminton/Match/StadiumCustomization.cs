using System.Linq;
using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.Rendering.Universal;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class StadiumCustomization : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public MeshRenderer CourtMesh;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public MeshRenderer[] FloorMeshes;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public DecalProjector[] LocationDecals;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public DecalProjector[] TournamentSeriesDecals;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public MeshRenderer[] JudgeChairMeshes;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public MeshRenderer[] Walls;

	private rs mfk;

	public rs phd
	{
		get
		{
			return mfk;
		}
		set
		{
			mfk = value;
			fat();
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public void Start()
	{
		fat();
	}

	private void fat()
	{
		if (phd == null)
		{
			return;
		}
		MeshRenderer[] floorMeshes = FloorMeshes;
		if (floorMeshes != null && floorMeshes.Length != 0 && phd.FloorColor.HasValue)
		{
			fav(FloorMeshes, phd.FloorColor.Value);
		}
		if (CourtMesh != null && phd.CourtColor.HasValue)
		{
			fau(CourtMesh, phd.CourtColor.Value);
		}
		MeshRenderer[] judgeChairMeshes = JudgeChairMeshes;
		if (judgeChairMeshes != null && judgeChairMeshes.Length != 0 && phd.JudgeChairColor.HasValue)
		{
			fav(JudgeChairMeshes, phd.JudgeChairColor.Value);
		}
		MeshRenderer[] walls = Walls;
		if (walls != null && walls.Length != 0 && phd.WallsColor.HasValue)
		{
			fav(Walls, phd.WallsColor.Value);
		}
		DecalProjector[] locationDecals = LocationDecals;
		if (locationDecals != null && locationDecals.Length != 0 && phd.Location != null)
		{
			Material material = Object.Instantiate(Resources.Load<Material>("Materials/TextDecal"));
			RenderTexture value = sa.gjw(delegate(TextMeshPro a)
			{
				a.text = phd.Location;
				a.fontSize = 2.5f;
				a.fontStyle = FontStyles.Bold | FontStyles.UpperCase;
				a.alignment = TextAlignmentOptions.Center;
				a.color = Color.white;
			});
			material.SetTexture("Base_Map", value);
			DecalProjector[] locationDecals2 = LocationDecals;
			foreach (DecalProjector obj in locationDecals2)
			{
				obj.material = material;
				obj.size = new Vector3(1.6f, 4f, 1f);
			}
		}
		if (Tournament.Current != null && Tournament.Current.Properties.Series <= TournamentSeries.Super750)
		{
			string text = ((Tournament.Current.Properties.Series == TournamentSeries.WorldTournaments) ? Tournament.Current.Properties.Id : Tournament.Current.Properties.Series.ToString());
			Material material2 = null;
			DecalProjector[] locationDecals2 = TournamentSeriesDecals;
			foreach (DecalProjector decalProjector in locationDecals2)
			{
				if (material2 == null)
				{
					material2 = new Material(decalProjector.material);
					Texture value2 = Resources.Load<Texture>("Images/TournamentSeriesDecal/" + text);
					material2.SetTexture("Base_Map", value2);
				}
				decalProjector.material = material2;
				decalProjector.gameObject.SetActive(value: true);
			}
		}
		else
		{
			DecalProjector[] locationDecals2 = TournamentSeriesDecals;
			for (int i = 0; i < locationDecals2.Length; i++)
			{
				locationDecals2[i].gameObject.SetActive(value: false);
			}
		}
	}

	private void fau(MeshRenderer a, Color b)
	{
		a.material = Object.Instantiate(a.material);
		a.material.color = b;
	}

	private void fav(MeshRenderer[] a, Color b)
	{
		Material material = Object.Instantiate(a.First().material);
		material.color = b;
		for (int i = 0; i < a.Length; i++)
		{
			a[i].material = material;
		}
	}

	[CompilerGenerated]
	private void faw(TextMeshPro a)
	{
		a.text = phd.Location;
		a.fontSize = 2.5f;
		a.fontStyle = FontStyles.Bold | FontStyles.UpperCase;
		a.alignment = TextAlignmentOptions.Center;
		a.color = Color.white;
	}
}
