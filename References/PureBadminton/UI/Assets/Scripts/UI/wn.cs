using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;
using Unity.Services.Analytics;
using Unity.Services.Core;
using UnityEngine;
using UnityEngine.InputSystem;

namespace Assets.Scripts.UI;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class wn
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class wj
	{
		public bool? noa;

		internal int hpc(re a)
		{
			return a.gfq(noa.Value);
		}

		internal int hpd(re a)
		{
			return a.gfr(noa.Value);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class wk
	{
		public object noc;

		internal object hpe(PropertyInfo a)
		{
			return a.GetValue(noc, null);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class wl
	{
		public MatchSettings.PlayerSettings nod;

		internal bool hpf(InputDevice a)
		{
			return a.deviceId == nod.DeviceId;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class wm
	{
		public bool? noe;

		internal int hpg(re a)
		{
			return a.gfq(noe.Value);
		}

		internal int hph(re a)
		{
			return a.gfr(noe.Value);
		}
	}

	public static bool nof { get; private set; }

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public static void Initialize()
	{
		if (nof)
		{
			return;
		}
		nof = true;
		InitializationOptions initializationOptions = new InitializationOptions();
		initializationOptions.SetOption("com.unity.services.core.environment-name", pp.pla);
		UnityServices.InitializeAsync(initializationOptions);
		switch (PlayerPrefs.GetInt("AllowAnalytics", -1))
		{
		case -1:
			SimpleModal.hia(tt.gra("Global", "TrackingAgreement"), delegate
			{
				Debug.Log("Tracking Accepted");
				PlayerPrefs.SetInt("AllowAnalytics", 1);
			}, delegate
			{
				Debug.Log("Tracking Refused");
				PlayerPrefs.SetInt("AllowAnalytics", 0);
			});
			break;
		case 1:
			AnalyticsService.Instance.StartDataCollection();
			break;
		}
	}

	public static void hpk(string a)
	{
		if (nof)
		{
			AnalyticsService.Instance.RecordEvent(a);
		}
	}

	public static void hpl(string a, object b)
	{
		Dictionary<string, object> b2 = b.GetType().GetProperties().ToDictionary((PropertyInfo a) => a.Name, (PropertyInfo a) => a.GetValue(b, null));
		hpm(a, b2);
	}

	public static void hpm(string a, Dictionary<string, object> b)
	{
		CustomEvent customEvent = new CustomEvent(a);
		foreach (var (key, obj2) in b)
		{
			if (obj2 != null)
			{
				customEvent[key] = obj2;
			}
		}
		if (nof)
		{
			AnalyticsService.Instance.RecordEvent(customEvent);
		}
	}

	public static void hpn(string a, Dictionary<string, object> b = null)
	{
		try
		{
			Func<MatchSettings.PlayerSettings, string> func = delegate(MatchSettings.PlayerSettings a)
			{
				if (!a.DeviceId.HasValue)
				{
					return (string)null;
				}
				InputDevice inputDevice = InputSystem.devices.FirstOrDefault((InputDevice a) => a.deviceId == a.DeviceId);
				if (inputDevice is Keyboard)
				{
					return "Keyboard";
				}
				return (inputDevice is Gamepad) ? "Gamepad" : inputDevice?.GetType()?.ToString();
			};
			MatchSettings current = MatchSettings.Current;
			if (b == null)
			{
				b = new Dictionary<string, object>();
			}
			hpm(a, b.Concat(new Dictionary<string, object>
			{
				{
					"StartedFrom",
					(Career.Current != null) ? "Career" : ((Tournament.Current != null) ? "Tournament" : "MainMenu")
				},
				{ "IsDouble", current.IsDouble },
				{
					"Stadium",
					current.Stadium.ToString()
				},
				{ "WinningSets", current.WinningSets },
				{ "SetPoints", current.SetPoints },
				{
					"Difficulty",
					current.Difficulty.ToString()
				},
				{
					"GameSpeed",
					current.GameSpeed.ToString()
				},
				{
					"PlacementAssistance",
					current.PlacementAssistance.ToString()
				},
				{
					"ShuttleTrajectory",
					current.ShuttleTrajectory.ToString()
				},
				{
					"PlayersCount",
					current.plv.Count((MatchSettings.PlayerSettings a) => a.DeviceId.HasValue)
				},
				{
					"TeamAPlayerADevice",
					func(current.TeamA.PlayerA)
				},
				{
					"TeamAPlayerACharacter",
					current.TeamA.PlayerA.CharacterInfo?.id
				},
				{
					"TeamAPlayerBDevice",
					func(current.TeamA.PlayerB)
				},
				{
					"TeamAPlayerBCharacter",
					current.TeamA.PlayerB.CharacterInfo?.id
				},
				{
					"TeamBPlayerADevice",
					func(current.TeamB.PlayerA)
				},
				{
					"TeamBPlayerACharacter",
					current.TeamB.PlayerA.CharacterInfo?.id
				},
				{
					"TeamBPlayerBDevice",
					func(current.TeamB.PlayerB)
				},
				{
					"TeamBPlayerBCharacter",
					current.TeamB.PlayerB.CharacterInfo?.id
				}
			}).ToDictionary((KeyValuePair<string, object> a) => a.Key, (KeyValuePair<string, object> a) => a.Value));
		}
		catch
		{
			hpk(a);
		}
	}

	public static void hpo(MatchSettings a, qu b)
	{
		try
		{
			IEnumerable<MatchSettings.PlayerSettings> source = a.plv.Where((MatchSettings.PlayerSettings a) => a.PlayerId.HasValue);
			bool? noe = (source.All((MatchSettings.PlayerSettings a) => MatchSettings.gcl(a.Position)) ? new bool?(true) : (source.All((MatchSettings.PlayerSettings a) => !MatchSettings.gcl(a.Position)) ? new bool?(false) : null));
			qz qz = (a.ply ? qu.mug.Recap.geu(a.plv.First()) : null);
			hpn("EndMatch", new Dictionary<string, object>
			{
				{
					"Scores",
					string.Join(" | ", qu.mug.mui.Select((re a) => $"{a.pmi}-{a.pmj}"))
				},
				{
					"Win",
					(!noe.HasValue) ? null : (noe ^ qu.mug.Recap.pmf)
				},
				{
					"ScoreBalance",
					a.ply ? ((object)(qu.mug.mui.Sum((re a) => a.pmi - a.pmj) * (noe.Value ? 1 : (-1)))) : null
				},
				{
					"AverageShotsPerRally",
					qu.mug.Recap.AverageRallyLength
				},
				{
					"PercentShotsOut",
					a.ply ? ((object)Mathf.RoundToInt(qu.mug.mui.Sum((re a) => a.gfq(noe.Value)) * 100 / qu.mug.mui.Sum((re a) => a.mus.Count))) : null
				},
				{
					"PercentShotsNet",
					a.ply ? ((object)Mathf.RoundToInt(qu.mug.mui.Sum((re a) => a.gfr(noe.Value)) * 100 / qu.mug.mui.Sum((re a) => a.mus.Count))) : null
				},
				{
					"TotalDistance",
					qz?.TotalDistance
				},
				{
					"PercentTimeAggressive",
					qz?.PercentTimeAggressive
				},
				{
					"PercentClearShots",
					(qz != null) ? ((object)(qz.TotalClear * 100 / qz.pmh)) : null
				},
				{
					"PercentDropShots",
					(qz != null) ? ((object)(qz.TotalDrop * 100 / qz.pmh)) : null
				},
				{
					"PercentSmashShots",
					(qz != null) ? ((object)(qz.TotalSmash * 100 / qz.pmh)) : null
				},
				{
					"PercentMidcourtShots",
					(qz != null) ? ((object)(qz.TotalMidcourt * 100 / qz.pmh)) : null
				}
			});
		}
		catch (Exception)
		{
			hpk("EndMatch");
			Debug.LogError("Fail to send end match tracking");
		}
	}

	public static void hpp(MatchSettings a, qu b)
	{
		try
		{
			IEnumerable<MatchSettings.PlayerSettings> source = a.plv.Where((MatchSettings.PlayerSettings a) => a.PlayerId.HasValue);
			bool? noa = (source.All((MatchSettings.PlayerSettings a) => MatchSettings.gcl(a.Position)) ? new bool?(true) : (source.All((MatchSettings.PlayerSettings a) => !MatchSettings.gcl(a.Position)) ? new bool?(false) : null));
			qu.mug.gem();
			qz qz = (a.ply ? qu.mug.Recap.geu(a.plv.First()) : null);
			int num = qu.mug.mui.Sum((re a) => a.mus.Count);
			hpn("ExitMatch", new Dictionary<string, object>
			{
				{
					"Scores",
					string.Join(" | ", qu.mug.mui.Select((re a) => $"{a.pmi}-{a.pmj}"))
				},
				{
					"ScoreBalance",
					a.ply ? ((object)(qu.mug.mui.Sum((re a) => a.pmi - a.pmj) * (noa.Value ? 1 : (-1)))) : null
				},
				{
					"AverageShotsPerRally",
					qu.mug.Recap.AverageRallyLength
				},
				{
					"PercentShotsOut",
					(a.ply && num > 0) ? ((object)Mathf.RoundToInt((float)qu.mug.mui.Sum((re a) => a.gfq(noa.Value)) * 100f / (float)num)) : null
				},
				{
					"PercentShotsNet",
					(a.ply && num > 0) ? ((object)Mathf.RoundToInt((float)qu.mug.mui.Sum((re a) => a.gfr(noa.Value)) * 100f / (float)num)) : null
				},
				{
					"TotalDistance",
					qz?.TotalDistance
				},
				{
					"PercentTimeAggressive",
					qz?.PercentTimeAggressive
				},
				{
					"PercentClearShots",
					(qz != null && qz.pmh > 0) ? ((object)(qz.TotalClear * 100 / qz.pmh)) : null
				},
				{
					"PercentDropShots",
					(qz != null && qz.pmh > 0) ? ((object)(qz.TotalDrop * 100 / qz.pmh)) : null
				},
				{
					"PercentSmashShots",
					(qz != null && qz.pmh > 0) ? ((object)(qz.TotalSmash * 100 / qz.pmh)) : null
				},
				{
					"PercentMidcourtShots",
					(qz != null && qz.pmh > 0) ? ((object)(qz.TotalMidcourt * 100 / qz.pmh)) : null
				}
			});
		}
		catch (Exception)
		{
			hpk("ExitMatch");
			Debug.LogError("Fail to send exit match tracking");
		}
	}
}
