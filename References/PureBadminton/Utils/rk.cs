using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class rk
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum DifficultyLevel
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Beginner,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Amateur,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Intermediate,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Professional,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Elite,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Legend
	}

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum GameSpeedLevel
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Slow,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Medium,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Realistic
	}

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum PlacementAssistanceLevel
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		High,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Low,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Off
	}

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum ShuttleTrajectoryOptions
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Trajectory,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		FallingPoint,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		None
	}

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum PlayModes
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Quick,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Tournament,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Career
	}

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum AfterTutorialAction
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		LaunchMatch,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		BackToMenu
	}

	[NotObfuscatedCause("Class: Because the type might be a type called through reflection.")]
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Because the type might be a type called through reflection.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum CameraMode
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Player = 0,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		PlayerClose = 10,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		PlayerFar = 20,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		PlayerLow = 25,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		TV = 30,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Up = 40,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Team = 50
	}

	public const string mvo = "firstLaunch";

	public const string mvp = "lastPlayedVersion";

	public const string mvq = "stadium";

	public const string mvr = "series";

	public const string mvs = "tournament";

	public const string mvt = "tournamentCategory";

	public const string mvu = "winningSets";

	public const string mvv = "setPoints";

	public const string mvw = "difficulty";

	public const string mvx = "gamespeed";

	public const string mvy = "placementAssistance";

	public const string mvz = "shuttleTrajectory";

	public const string mwa = "advancedAiming";

	public const string mwb = "playMode";

	public const string mwc = "camera";

	public const string mwd = "announceScore";

	public const string mwe = "showOpponentsStamina";

	public const string mwf = "enableFatigueEffect";

	public const string mwg = "firstMatch";

	public const string mwh = "playTutorial";

	public const string mwi = "afterTutorial";

	public const string mwj = "volume";

	public const string mwk = "fpsCap";

	public const string mwl = "locale";

	public const string mwm = "controlsRebind";

	public const string mwn = "showPingInMatch";

	public const string mwo = "friendlyDoubles";

	public const string mwp = "friendlyPublic";

	public const string mwq = "friendlyTypeFilter";

	public static readonly int[] mwt;

	public static readonly string[] mwu;

	private static string mwv;

	private static TournamentSeries? mww;

	private static string mwx;

	private static TournamentCategory? mwy;

	private static int? mwz;

	private static int? mxa;

	private static DifficultyLevel? mxb;

	private static GameSpeedLevel? mxc;

	private static PlacementAssistanceLevel? mxd;

	private static ShuttleTrajectoryOptions? mxe;

	private static bool? mxf;

	private static PlayModes? mxg;

	private static CameraMode? mxh;

	private static bool? mxi;

	private static bool? mxj;

	private static bool? mxk;

	private static bool? mxl;

	private static bool? mxm;

	private static AfterTutorialAction? mxn;

	private static float? mxo;

	private static int? mxp;

	private static string mxq;

	private static string mxr;

	private static bool? mxs;

	private static bool? mxt;

	private static bool? mxu;

	private static string mxv;

	public static bool mwr { get; private set; }

	public static string mws { get; private set; }

	public static string pmp
	{
		get
		{
			if (mwv == null)
			{
				mwv = PlayerPrefs.GetString("stadium", "");
			}
			return mwv;
		}
		set
		{
			PlayerPrefs.SetString("stadium", value);
			mwv = value;
			PlayerPrefs.Save();
		}
	}

	public static TournamentSeries pmq
	{
		get
		{
			if (!mww.HasValue)
			{
				mww = (TournamentSeries)PlayerPrefs.GetInt("series", 0);
			}
			return mww.Value;
		}
		set
		{
			PlayerPrefs.SetInt("series", (int)value);
			mww = value;
			PlayerPrefs.Save();
		}
	}

	public static string pmr
	{
		get
		{
			if (mwx == null)
			{
				mwx = PlayerPrefs.GetString("tournament", string.Empty);
			}
			return mwx;
		}
		set
		{
			PlayerPrefs.SetString("tournament", value);
			mwx = value;
			PlayerPrefs.Save();
		}
	}

	public static TournamentCategory pms
	{
		get
		{
			if (!mwy.HasValue)
			{
				mwy = (TournamentCategory)PlayerPrefs.GetInt("tournamentCategory", 0);
			}
			return mwy.Value;
		}
		set
		{
			PlayerPrefs.SetInt("tournamentCategory", (int)value);
			mwy = value;
			PlayerPrefs.Save();
		}
	}

	public static int pmt
	{
		get
		{
			if (!mwz.HasValue)
			{
				mwz = PlayerPrefs.GetInt("winningSets", 2);
			}
			return mwz.Value;
		}
		set
		{
			PlayerPrefs.SetInt("winningSets", value);
			mwz = value;
			PlayerPrefs.Save();
		}
	}

	public static int pmu
	{
		get
		{
			if (!mxa.HasValue)
			{
				mxa = PlayerPrefs.GetInt("setPoints", 15);
			}
			return mxa.Value;
		}
		set
		{
			PlayerPrefs.SetInt("setPoints", value);
			mxa = value;
			PlayerPrefs.Save();
		}
	}

	public static DifficultyLevel pmv
	{
		get
		{
			if (!mxb.HasValue)
			{
				mxb = (DifficultyLevel)PlayerPrefs.GetInt("difficulty", 0);
			}
			return mxb.Value;
		}
		set
		{
			PlayerPrefs.SetInt("difficulty", (int)value);
			mxb = value;
			PlayerPrefs.Save();
		}
	}

	public static GameSpeedLevel pmw
	{
		get
		{
			if (!mxc.HasValue)
			{
				mxc = (GameSpeedLevel)PlayerPrefs.GetInt("gamespeed", 0);
			}
			return mxc.Value;
		}
		set
		{
			PlayerPrefs.SetInt("gamespeed", (int)value);
			mxc = value;
			PlayerPrefs.Save();
		}
	}

	public static PlacementAssistanceLevel pmx
	{
		get
		{
			if (!mxd.HasValue)
			{
				mxd = (PlacementAssistanceLevel)PlayerPrefs.GetInt("placementAssistance", 0);
			}
			return mxd.Value;
		}
		set
		{
			PlayerPrefs.SetInt("placementAssistance", (int)value);
			mxd = value;
			PlayerPrefs.Save();
		}
	}

	public static ShuttleTrajectoryOptions pmy
	{
		get
		{
			if (!mxe.HasValue)
			{
				mxe = (ShuttleTrajectoryOptions)PlayerPrefs.GetInt("shuttleTrajectory", 0);
			}
			return mxe.Value;
		}
		set
		{
			PlayerPrefs.SetInt("shuttleTrajectory", (int)value);
			mxe = value;
			PlayerPrefs.Save();
		}
	}

	public static bool pmz
	{
		get
		{
			if (!mxf.HasValue)
			{
				mxf = PlayerPrefs.GetInt("advancedAiming", 0) == 1;
			}
			return mxf.Value;
		}
		set
		{
			PlayerPrefs.SetInt("advancedAiming", value ? 1 : 0);
			mxf = value;
			PlayerPrefs.Save();
		}
	}

	public static PlayModes pna
	{
		get
		{
			if (!mxg.HasValue)
			{
				mxg = (PlayModes)PlayerPrefs.GetInt("playMode", 0);
			}
			return mxg.Value;
		}
		set
		{
			PlayerPrefs.SetInt("playMode", (int)value);
			mxg = value;
			PlayerPrefs.Save();
		}
	}

	public static CameraMode pnb
	{
		get
		{
			if (!mxh.HasValue)
			{
				mxh = (CameraMode)PlayerPrefs.GetInt("camera", 0);
			}
			return mxh.Value;
		}
		set
		{
			PlayerPrefs.SetInt("camera", (int)value);
			mxh = value;
			PlayerPrefs.Save();
		}
	}

	public static bool pnc
	{
		get
		{
			if (!mxi.HasValue)
			{
				mxi = PlayerPrefs.GetInt("announceScore", 1) == 1;
			}
			return mxi.Value;
		}
		set
		{
			PlayerPrefs.SetInt("announceScore", value ? 1 : 0);
			mxi = value;
			PlayerPrefs.Save();
		}
	}

	public static bool pnd
	{
		get
		{
			if (!mxj.HasValue)
			{
				mxj = PlayerPrefs.GetInt("showOpponentsStamina", 0) == 1;
			}
			return mxj.Value;
		}
		set
		{
			PlayerPrefs.SetInt("showOpponentsStamina", value ? 1 : 0);
			mxj = value;
			PlayerPrefs.Save();
		}
	}

	public static bool pne
	{
		get
		{
			if (!mxk.HasValue)
			{
				mxk = PlayerPrefs.GetInt("enableFatigueEffect", 1) == 1;
			}
			return mxk.Value;
		}
		set
		{
			PlayerPrefs.SetInt("enableFatigueEffect", value ? 1 : 0);
			mxk = value;
			PlayerPrefs.Save();
		}
	}

	public static bool pnf
	{
		get
		{
			if (!mxl.HasValue)
			{
				mxl = PlayerPrefs.GetInt("firstMatch", 1) == 1;
			}
			return mxl.Value;
		}
		set
		{
			PlayerPrefs.SetInt("firstMatch", value ? 1 : 0);
			mxl = value;
			PlayerPrefs.Save();
		}
	}

	public static bool png
	{
		get
		{
			if (!mxm.HasValue)
			{
				mxm = PlayerPrefs.GetInt("playTutorial", 0) == 1;
			}
			return mxm.Value;
		}
		set
		{
			PlayerPrefs.SetInt("playTutorial", value ? 1 : 0);
			mxm = value;
			PlayerPrefs.Save();
		}
	}

	public static AfterTutorialAction pnh
	{
		get
		{
			if (!mxn.HasValue)
			{
				mxn = (AfterTutorialAction)PlayerPrefs.GetInt("afterTutorial", 0);
			}
			return mxn.Value;
		}
		set
		{
			PlayerPrefs.SetInt("afterTutorial", (int)value);
			mxn = value;
			PlayerPrefs.Save();
		}
	}

	public static float pni
	{
		get
		{
			if (!mxo.HasValue)
			{
				mxo = PlayerPrefs.GetFloat("volume", 1f);
			}
			return mxo.Value;
		}
		set
		{
			PlayerPrefs.SetFloat("volume", value);
			mxo = value;
			PlayerPrefs.Save();
		}
	}

	public static int pnj
	{
		get
		{
			if (!mxp.HasValue)
			{
				mxp = PlayerPrefs.GetInt("fpsCap", -2);
			}
			return mxp.Value;
		}
		set
		{
			PlayerPrefs.SetInt("fpsCap", value);
			mxp = value;
			PlayerPrefs.Save();
		}
	}

	public static string pnk
	{
		get
		{
			if (mxq == null)
			{
				mxq = PlayerPrefs.GetString("locale", null);
			}
			return mxq;
		}
		set
		{
			PlayerPrefs.SetString("locale", value);
			mxq = value;
			PlayerPrefs.Save();
		}
	}

	public static string pnl
	{
		get
		{
			if (mxr == null)
			{
				mxr = PlayerPrefs.GetString("controlsRebind", string.Empty);
			}
			return mxr;
		}
		set
		{
			PlayerPrefs.SetString("controlsRebind", value);
			mxr = value;
			PlayerPrefs.Save();
		}
	}

	public static bool pnm => !string.IsNullOrWhiteSpace(pnl);

	public static bool pnn
	{
		get
		{
			if (!mxs.HasValue)
			{
				mxs = PlayerPrefs.GetInt("showPingInMatch", 1) == 1;
			}
			return mxs.Value;
		}
		set
		{
			PlayerPrefs.SetInt("showPingInMatch", value ? 1 : 0);
			mxs = value;
			PlayerPrefs.Save();
		}
	}

	public static bool pno
	{
		get
		{
			if (!mxt.HasValue)
			{
				mxt = PlayerPrefs.GetInt("friendlyDoubles", 1) == 1;
			}
			return mxt.Value;
		}
		set
		{
			PlayerPrefs.SetInt("friendlyDoubles", value ? 1 : 0);
			mxt = value;
			PlayerPrefs.Save();
		}
	}

	public static bool pnp
	{
		get
		{
			if (!mxu.HasValue)
			{
				mxu = PlayerPrefs.GetInt("friendlyPublic", 0) == 1;
			}
			return mxu.Value;
		}
		set
		{
			PlayerPrefs.SetInt("friendlyPublic", value ? 1 : 0);
			mxu = value;
			PlayerPrefs.Save();
		}
	}

	public static string pnq
	{
		get
		{
			if (mxv == null)
			{
				mxv = PlayerPrefs.GetString("friendlyTypeFilter", "all");
			}
			return mxv;
		}
		set
		{
			PlayerPrefs.SetString("friendlyTypeFilter", value);
			mxv = value;
			PlayerPrefs.Save();
		}
	}

	static rk()
	{
		mwt = new int[3] { 11, 15, 21 };
		mwu = new string[8] { "ChinaXincheng", "FranceCoubertin", "EnglandUtilitaArena", "IndonesiaIstora", "DenmarkArenaFyn", "JapanYoyogi", "IndiaJadhav", "SingaporeIndoorStadium" };
		if (PlayerPrefs.GetInt("firstLaunch", 1) == 1)
		{
			if (pnf)
			{
				mwr = true;
			}
			PlayerPrefs.SetInt("firstLaunch", 0);
		}
		mws = PlayerPrefs.GetString("lastPlayedVersion", null);
		PlayerPrefs.SetString("lastPlayedVersion", Application.version);
	}

	public static float ghh(GameSpeedLevel a)
	{
		return a switch
		{
			GameSpeedLevel.Slow => 0.9f, 
			GameSpeedLevel.Medium => 0.95f, 
			_ => 1f, 
		};
	}
}
