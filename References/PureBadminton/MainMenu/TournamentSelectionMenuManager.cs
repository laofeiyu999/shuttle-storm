using System.Collections.Generic;
using System.Linq;
using OPS.Obfuscator.Attribute;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TournamentSelectionMenuManager : AnimatedPanel
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public LeftRightSelectManager seriesSelect;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public LeftRightSelectManager tournamentSelect;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Image stadiumImage;

	public List<sz> ojx { get; set; }

	public int pzd
	{
		get
		{
			return (int)rk.pmq;
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			rk.pmq = (TournamentSeries)value;
			jjr();
			jjs();
		}
	}

	public int pze
	{
		get
		{
			return ojx.FindIndex((sz a) => a.Id == rk.pmr);
		}
		[NotObfuscatedCause("Because the method might be a gui method.")]
		set
		{
			rk.pmr = ojx[value].Id;
			jjs();
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected void Start()
	{
		seriesSelect.psa = pzd;
		jjr();
		tournamentSelect.psa = pze;
		jjs();
	}

	private void jjr()
	{
		ojx = tk.pos.Where((sz a) => a.Series == rk.pmq).ToList();
		tournamentSelect.Options = ojx.Select((sz a) => a.Id).ToList();
		pze = 0;
		tournamentSelect.psa = 0;
	}

	private void jjs()
	{
		stadiumImage.sprite = tk.gqj(rk.pmr).gpr();
	}
}
