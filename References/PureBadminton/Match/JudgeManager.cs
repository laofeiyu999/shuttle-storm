using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class JudgeManager : MonoBehaviour
{
	private AudioSource lon;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public AudioClip outClip;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public AudioClip faultClip;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public AudioClip playClip;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public AudioClip allClip;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public AudioClip serviceOverClip;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public AudioClip gamePointClip;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public AudioClip matchPointClip;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public AudioClip gameClip;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public AudioClip matchWonClip;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public List<AudioClip> firstScoreClips;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public List<AudioClip> secondScoreClips;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		lon = GetComponent<AudioSource>();
	}

	public IEnumerator ecx(qu a, re b, bool c, bool? d)
	{
		if (d.HasValue && c != d)
		{
			yield return edc(serviceOverClip);
			yield return this.guu(0.5f);
		}
		if (b.pmi == b.pmj)
		{
			yield return edc(secondScoreClips[b.pmi]);
			if (a.pmb)
			{
				yield return this.guu(0.3f);
				yield return edc(a.pmc ? matchPointClip : gamePointClip);
				yield return this.guu(0.3f);
			}
			yield return edc(allClip);
		}
		else
		{
			yield return edc(firstScoreClips[c ? b.pmi : b.pmj]);
			if (a.pmb)
			{
				yield return this.guu(0.3f);
				yield return edc(a.pmc ? matchPointClip : gamePointClip);
			}
			yield return this.guu(0.5f);
			yield return edc(secondScoreClips[c ? b.pmj : b.pmi]);
		}
		if (b.pmi == 0 && b.pmj == 0)
		{
			yield return this.guu(1.5f);
			yield return edc(playClip);
		}
	}

	public IEnumerator ecy(qu a)
	{
		re re2 = a.mui.Last();
		int index = (re2.pmk ? re2.pmi : re2.pmj);
		int index2 = (re2.pmk ? re2.pmj : re2.pmi);
		yield return edc(firstScoreClips[index]);
		yield return this.guu(0.5f);
		yield return edc(secondScoreClips[index2]);
		yield return this.guu(0.5f);
		yield return edc(gameClip);
	}

	public IEnumerator ecz(qu a)
	{
		yield return edc(gameClip);
		yield return this.guu(0.5f);
		yield return edc(matchWonClip);
		foreach (re item in a.mui)
		{
			yield return this.guu(0.5f);
			yield return edc(firstScoreClips[item.pmi]);
			yield return this.guu(0.5f);
			yield return edc(secondScoreClips[item.pmj]);
			yield return this.guu(0.5f);
		}
	}

	public void eda()
	{
		lon.PlayOneShot(outClip);
	}

	public void edb()
	{
		lon.PlayOneShot(faultClip);
	}

	private IEnumerator edc(AudioClip a)
	{
		lon.PlayOneShot(a);
		yield return this.guu(a.length);
	}
}
