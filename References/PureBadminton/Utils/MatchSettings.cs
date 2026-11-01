using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using OPS.Obfuscator.Attribute;
using UnityEngine.InputSystem;

[Serializable]
[NotObfuscatedCause("Class: Because the type might be a type called through reflection.")]
[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
[NotObfuscatedCause("Namespace: Because the type might be a type called through reflection.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
public class MatchSettings
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum DeviceType
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Keyboard,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Gamepad
	}

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum PositionOnCourt
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		SideARight,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		SideALeft,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		SideBRight,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		SideBLeft
	}

	[Serializable]
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
	public class TeamSettings
	{
		[JsonIgnore]
		public bool mss { get; private set; }

		[JsonProperty("PlayerA")]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		public PlayerSettings PlayerA
		{
			[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
			get;
			[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
			private set;
		}

		[JsonProperty("PlayerB")]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		public PlayerSettings PlayerB
		{
			[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
			get;
			[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
			private set;
		}

		public IEnumerable<PlayerSettings> pll => new PlayerSettings[2] { PlayerA, PlayerB }.Where((PlayerSettings a) => a != null);

		public float plm
		{
			get
			{
				if (!pll.Any())
				{
					return 1f;
				}
				return pll.Average((PlayerSettings a) => a.Energy);
			}
		}

		public float? mst { get; set; }

		public TeamSettings(bool teamA)
		{
			PlayerA = new PlayerSettings((!teamA) ? PositionOnCourt.SideBRight : PositionOnCourt.SideARight);
			PlayerB = new PlayerSettings(teamA ? PositionOnCourt.SideALeft : PositionOnCourt.SideBLeft);
		}

		public TeamSettings(TeamSettings source)
		{
			PlayerA = new PlayerSettings(source.PlayerA);
			PlayerB = new PlayerSettings(source.PlayerB);
		}
	}

	[Serializable]
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
	public class PlayerSettings
	{
		[JsonProperty("OnlinePlayerId")]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		public string OnlinePlayerId
		{
			[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
			get;
			[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
			set;
		}

		[JsonProperty("PlayerId")]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		public int? PlayerId
		{
			[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
			get;
			[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
			set;
		}

		[JsonProperty("DeviceId")]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		public int? DeviceId
		{
			[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
			get;
			[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
			set;
		}

		[JsonProperty("CharacterInfo")]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		public CharacterInfo CharacterInfo
		{
			[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
			get;
			[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
			set;
		}

		[JsonProperty("Energy")]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		public float Energy
		{
			[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
			get;
			[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
			set;
		} = 1f;


		[JsonProperty("Position")]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		public PositionOnCourt Position
		{
			[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
			get;
			[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
			private set;
		}

		[JsonConstructor]
		private PlayerSettings()
		{
		}

		public PlayerSettings(PositionOnCourt position)
		{
			Position = position;
		}

		public PlayerSettings(PlayerSettings player)
		{
			Position = player.Position;
			OnlinePlayerId = player.OnlinePlayerId;
			PlayerId = player.PlayerId;
			DeviceId = player.DeviceId;
			CharacterInfo = player.CharacterInfo;
		}
	}

	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	public class qn
	{
		public const string msu = "debug-";

		public const string msv = "dedicated-server";

		public string msw;

		public string msx;

		public string msy;

		public string msz;

		public string mta;

		public bool mtb;

		public JObject mtc;

		public AbsenceThresholds mtd = new AbsenceThresholds
		{
			GraceSeconds = 30f,
			BudgetSeconds = 90f,
			EpisodeLimit = 8
		};

		public int mte = 2000;

		public string mtf;

		public ushort mtg;

		public bool mth;

		[JsonIgnore]
		public bool mti;

		public const int mtj = 32;

		[JsonIgnore]
		public bool pln => mta == msy;

		[JsonIgnore]
		public bool plo
		{
			get
			{
				if (msw != null)
				{
					return msw.StartsWith("debug-");
				}
				return false;
			}
		}

		[JsonIgnore]
		public string plp
		{
			get
			{
				string text = (msw ?? "").Replace("-", "");
				if (text.Length <= 32)
				{
					return text;
				}
				return text.Substring(text.Length - 32);
			}
		}

		public qn gbk()
		{
			return (qn)MemberwiseClone();
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class qo
	{
		public MatchSettings mtk;

		public string mtl;

		internal bool gbp(PlayerSettings a)
		{
			return mtk.gbz(a) == mtl;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class qp
	{
		public PositionOnCourt mtm;

		internal bool gbq(PlayerSettings a)
		{
			return a.Position == mtm;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class qq
	{
		public int mtn;

		internal bool gbr(PlayerSettings a)
		{
			return a.DeviceId == mtn;
		}
	}

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public static MatchSettings Current = new MatchSettings();

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public qn Online;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public bool IsDouble;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string Stadium;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public int WinningSets;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public int SetPoints;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public rk.DifficultyLevel Difficulty;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public rk.GameSpeedLevel GameSpeed;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public rk.PlacementAssistanceLevel PlacementAssistance;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public rk.ShuttleTrajectoryOptions ShuttleTrajectory;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public TeamSettings TeamA = new TeamSettings(teamA: true);

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public TeamSettings TeamB = new TeamSettings(teamA: false);

	public static MatchSettings plq
	{
		get
		{
			MatchSettings matchSettings = new MatchSettings();
			matchSettings.IsDouble = false;
			matchSettings.GameSpeed = rk.GameSpeedLevel.Realistic;
			matchSettings.Difficulty = rk.DifficultyLevel.Legend;
			matchSettings.PlacementAssistance = rk.PlacementAssistanceLevel.High;
			matchSettings.ShuttleTrajectory = rk.ShuttleTrajectoryOptions.Trajectory;
			CharacterInfo[] array = os.pjj.Where((CharacterInfo a) => a.gender == "m").ToArray();
			matchSettings.TeamA.PlayerA.CharacterInfo = array[0];
			matchSettings.TeamA.PlayerA.PlayerId = 1;
			matchSettings.TeamA.PlayerA.DeviceId = gci();
			matchSettings.TeamB.PlayerA.CharacterInfo = array[1];
			return matchSettings;
		}
	}

	public PositionOnCourt[] plr
	{
		get
		{
			if (!IsDouble)
			{
				return new PositionOnCourt[2]
				{
					PositionOnCourt.SideARight,
					PositionOnCourt.SideBRight
				};
			}
			return (PositionOnCourt[])Enum.GetValues(typeof(PositionOnCourt));
		}
	}

	public int pls => qu.gec(SetPoints);

	public float plt => rk.ghh(GameSpeed);

	public float plu => gbx(WinningSets, SetPoints);

	public List<PlayerSettings> plv
	{
		get
		{
			if (!IsDouble)
			{
				return new List<PlayerSettings> { TeamA.PlayerA, TeamB.PlayerA };
			}
			return new List<PlayerSettings> { TeamA.PlayerA, TeamA.PlayerB, TeamB.PlayerA, TeamB.PlayerB };
		}
	}

	public PlayerSettings plw => plv.Find((PlayerSettings a) => a.OnlinePlayerId == Online?.msy);

	[JsonIgnore]
	public IEnumerable<string> plx => from a in plv
		where a.OnlinePlayerId != null && a.OnlinePlayerId != Online?.msy
		select a.OnlinePlayerId;

	public bool ply => plv.Count((PlayerSettings a) => a.PlayerId.HasValue) == 1;

	public static float gbx(int a, int b)
	{
		return ((a == 1) ? 0.4f : 1f) * (float)b / 21f;
	}

	public string gbz(PlayerSettings a)
	{
		string text = a.OnlinePlayerId;
		if (text == null)
		{
			qn online = Online;
			if (online == null)
			{
				return null;
			}
			text = online.msy;
		}
		return text;
	}

	public List<PositionOnCourt> gcb(string a)
	{
		return (from a in plv
			where gbz(a) == a
			select a.Position).ToList();
	}

	public MatchSettings()
	{
	}

	public static MatchSettings gce()
	{
		return new MatchSettings
		{
			WinningSets = rk.pmt,
			SetPoints = rk.pmu,
			Difficulty = rk.pmv,
			GameSpeed = rk.pmw,
			PlacementAssistance = rk.pmx,
			ShuttleTrajectory = rk.pmy
		};
	}

	public static MatchSettings gcf(qg a, bool b)
	{
		MatchSettings matchSettings = new MatchSettings
		{
			WinningSets = a.WinningSets,
			SetPoints = a.SetPoints,
			Difficulty = a.Difficulty,
			GameSpeed = rk.pmw,
			PlacementAssistance = rk.pmx,
			ShuttleTrajectory = rk.pmy
		};
		TeamSettings teamSettings = (b ? matchSettings.TeamA : matchSettings.TeamB);
		teamSettings.PlayerA.DeviceId = a.mrh;
		teamSettings.PlayerA.PlayerId = 1;
		if (a.mri.HasValue)
		{
			teamSettings.PlayerB.DeviceId = a.mri;
			teamSettings.PlayerB.PlayerId = 2;
		}
		return matchSettings;
	}

	public MatchSettings(MatchSettings source, bool copyPlayerSettings)
	{
		IsDouble = source.IsDouble;
		WinningSets = source.WinningSets;
		SetPoints = source.SetPoints;
		Difficulty = source.Difficulty;
		GameSpeed = source.GameSpeed;
		PlacementAssistance = source.PlacementAssistance;
		ShuttleTrajectory = source.ShuttleTrajectory;
		Stadium = source.Stadium;
		Online = source.Online?.gbk();
		if (copyPlayerSettings)
		{
			TeamA = new TeamSettings(source.TeamA);
			TeamB = new TeamSettings(source.TeamB);
		}
	}

	public PlayerSettings gcg(PositionOnCourt a)
	{
		return plv.Find((PlayerSettings a) => a.Position == a);
	}

	public PlayerSettings gch(int a)
	{
		return plv.Find((PlayerSettings a) => a.DeviceId == a);
	}

	public static int gci()
	{
		return Gamepad.current?.deviceId ?? Keyboard.current?.deviceId ?? 0;
	}

	public void gcj()
	{
		TeamA.PlayerA.PlayerId = 1;
		TeamA.PlayerA.DeviceId = gci();
	}

	public static PositionOnCourt[] gck(bool a)
	{
		if (a)
		{
			return new PositionOnCourt[2]
			{
				PositionOnCourt.SideARight,
				PositionOnCourt.SideALeft
			};
		}
		return new PositionOnCourt[2]
		{
			PositionOnCourt.SideBRight,
			PositionOnCourt.SideBLeft
		};
	}

	public static bool gcl(PositionOnCourt a)
	{
		if (a != 0)
		{
			return a == PositionOnCourt.SideALeft;
		}
		return true;
	}

	public static PositionOnCourt gcm(PositionOnCourt a)
	{
		return a switch
		{
			PositionOnCourt.SideARight => PositionOnCourt.SideBRight, 
			PositionOnCourt.SideALeft => PositionOnCourt.SideBLeft, 
			PositionOnCourt.SideBRight => PositionOnCourt.SideARight, 
			_ => PositionOnCourt.SideALeft, 
		};
	}

	public static PositionOnCourt gcn(PositionOnCourt a)
	{
		return a switch
		{
			PositionOnCourt.SideARight => PositionOnCourt.SideALeft, 
			PositionOnCourt.SideALeft => PositionOnCourt.SideARight, 
			PositionOnCourt.SideBRight => PositionOnCourt.SideBLeft, 
			_ => PositionOnCourt.SideBRight, 
		};
	}

	[CompilerGenerated]
	private bool gco(PlayerSettings a)
	{
		return a.OnlinePlayerId == Online?.msy;
	}

	[CompilerGenerated]
	private bool gcp(PlayerSettings a)
	{
		if (a.OnlinePlayerId != null)
		{
			return a.OnlinePlayerId != Online?.msy;
		}
		return false;
	}
}
