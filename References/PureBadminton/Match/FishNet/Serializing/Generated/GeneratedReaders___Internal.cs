using System.Collections.Generic;
using System.Runtime.InteropServices;
using OPS.Obfuscator.Attribute;
using UnityEngine;

namespace FishNet.Serializing.Generated;

[StructLayout(LayoutKind.Auto, CharSet = CharSet.Auto)]
[NotObfuscatedCause("Class: Because of some type skipping settings.")]
[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : Has RuntimeInitializeOnLoadMethodAttribute.")]
[NotObfuscatedCause("Namespace: Because of some type skipping settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class GeneratedReaders___Internal
{
	[RuntimeInitializeOnLoadMethod]
	[NotObfuscatedCause("Because of some type skipping settings.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Has RuntimeInitializeOnLoadMethodAttribute.")]
	private static void InitializeOnce()
	{
		GenericReader<OnlineAuthRequest>.SetRead(GRead___OnlineAuthRequestFishNet_002ESerializing_002EGenerateds);
		GenericReader<OnlineAuthResult>.SetRead(GRead___OnlineAuthResultFishNet_002ESerializing_002EGenerateds);
		GenericReader<ClientMovementState>.SetRead(GRead___ClientMovementStateFishNet_002ESerializing_002EGenerateds);
		GenericReader<CharacterIntensityLevel>.SetRead(GRead___CharacterIntensityLevelFishNet_002ESerializing_002EGenerateds);
		GenericReader<MatchSettings.PositionOnCourt>.SetRead(GRead___MatchSettings_002FPositionOnCourtFishNet_002ESerializing_002EGenerateds);
		GenericReader<Dictionary<MatchSettings.PositionOnCourt, float>>.SetRead(GRead___System_002ECollections_002EGeneric_002EDictionary_00602_003CMatchSettings_002FPositionOnCourt_002CSystem_002ESingle_003EFishNet_002ESerializing_002EGenerateds);
		GenericReader<RallyEndInfo>.SetRead(GRead___RallyEndInfoFishNet_002ESerializing_002EGenerateds);
		GenericReader<ScoreCheck>.SetRead(GRead___ScoreCheckFishNet_002ESerializing_002EGenerateds);
		GenericReader<SetSummaryStats>.SetRead(GRead___SetSummaryStatsFishNet_002ESerializing_002EGenerateds);
		GenericReader<string[]>.SetRead(GRead___System_002EString_005B_005DFishNet_002ESerializing_002EGenerateds);
		GenericReader<MatchSnapshot>.SetRead(GRead___MatchSnapshotFishNet_002ESerializing_002EGenerateds);
		GenericReader<bool[]>.SetRead(GRead___System_002EBoolean_005B_005DFishNet_002ESerializing_002EGenerateds);
		GenericReader<int[]>.SetRead(GRead___System_002EInt32_005B_005DFishNet_002ESerializing_002EGenerateds);
		GenericReader<float[]>.SetRead(GRead___System_002ESingle_005B_005DFishNet_002ESerializing_002EGenerateds);
		GenericReader<SetSummaryStats[]>.SetRead(GRead___SetSummaryStats_005B_005DFishNet_002ESerializing_002EGenerateds);
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static OnlineAuthRequest GRead___OnlineAuthRequestFishNet_002ESerializing_002EGenerateds(Reader reader)
	{
		OnlineAuthRequest result = default(OnlineAuthRequest);
		result.PlayerId = reader.ReadStringAllocated();
		result.MatchToken = reader.ReadStringAllocated();
		return result;
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static OnlineAuthResult GRead___OnlineAuthResultFishNet_002ESerializing_002EGenerateds(Reader reader)
	{
		OnlineAuthResult result = default(OnlineAuthResult);
		result.Passed = reader.ReadBoolean();
		return result;
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static ClientMovementState GRead___ClientMovementStateFishNet_002ESerializing_002EGenerateds(Reader reader)
	{
		ClientMovementState result = default(ClientMovementState);
		result.Tick = reader.ReadUInt32();
		result.Position = reader.ReadVector3();
		result.Angle = reader.ReadSingle();
		result.AnimationName = reader.ReadStringAllocated();
		result.NormalizedTime = reader.ReadSingle();
		result.InPose = reader.ReadBoolean();
		result.MoveStick = reader.ReadVector2();
		result.ShotType = reader.ReadInt32();
		result.ShotPower = reader.ReadSingle();
		result.ShotDirection = reader.ReadVector2();
		return result;
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static CharacterIntensityLevel GRead___CharacterIntensityLevelFishNet_002ESerializing_002EGenerateds(Reader reader)
	{
		return (CharacterIntensityLevel)reader.ReadInt32();
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static MatchSettings.PositionOnCourt GRead___MatchSettings_002FPositionOnCourtFishNet_002ESerializing_002EGenerateds(Reader reader)
	{
		return (MatchSettings.PositionOnCourt)reader.ReadInt32();
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static Dictionary<MatchSettings.PositionOnCourt, float> GRead___System_002ECollections_002EGeneric_002EDictionary_00602_003CMatchSettings_002FPositionOnCourt_002CSystem_002ESingle_003EFishNet_002ESerializing_002EGenerateds(Reader reader)
	{
		return reader.ReadDictionary<MatchSettings.PositionOnCourt, float>();
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static RallyEndInfo GRead___RallyEndInfoFishNet_002ESerializing_002EGenerateds(Reader reader)
	{
		RallyEndInfo result = default(RallyEndInfo);
		result.LastShotByTeamA = reader.ReadBoolean();
		result.TouchedPartner = reader.ReadBoolean();
		result.TouchedOpponent = reader.ReadBoolean();
		result.EndedOut = reader.ReadBoolean();
		result.EndedInNet = reader.ReadBoolean();
		return result;
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static ScoreCheck GRead___ScoreCheckFishNet_002ESerializing_002EGenerateds(Reader reader)
	{
		ScoreCheck result = default(ScoreCheck);
		result.SetIndex = reader.ReadInt32();
		result.TeamAScore = reader.ReadInt32();
		result.TeamBScore = reader.ReadInt32();
		result.TotalRallies = reader.ReadInt32();
		return result;
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static SetSummaryStats GRead___SetSummaryStatsFishNet_002ESerializing_002EGenerateds(Reader reader)
	{
		SetSummaryStats result = default(SetSummaryStats);
		result.Duration = reader.ReadSingle();
		result.AverageShotsPerRally = reader.ReadInt32();
		result.MaxShotsPerRally = reader.ReadInt32();
		result.BadServeCountA = reader.ReadInt32();
		result.BadServeCountB = reader.ReadInt32();
		result.OutCountA = reader.ReadInt32();
		result.OutCountB = reader.ReadInt32();
		result.NetCountA = reader.ReadInt32();
		result.NetCountB = reader.ReadInt32();
		result.TotalDistanceA = reader.ReadInt32();
		result.TotalDistanceB = reader.ReadInt32();
		return result;
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static string[] GRead___System_002EString_005B_005DFishNet_002ESerializing_002EGenerateds(Reader reader)
	{
		return reader.ReadArrayAllocated<string>();
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static MatchSnapshot GRead___MatchSnapshotFishNet_002ESerializing_002EGenerateds(Reader reader)
	{
		MatchSnapshot result = default(MatchSnapshot);
		result.RallyWinners = GRead___System_002EBoolean_005B_005DFishNet_002ESerializing_002EGenerateds(reader);
		result.SetRallyCounts = GRead___System_002EInt32_005B_005DFishNet_002ESerializing_002EGenerateds(reader);
		result.SetDurations = GRead___System_002ESingle_005B_005DFishNet_002ESerializing_002EGenerateds(reader);
		result.SetSummaries = GRead___SetSummaryStats_005B_005DFishNet_002ESerializing_002EGenerateds(reader);
		result.SetHasSummary = GRead___System_002EBoolean_005B_005DFishNet_002ESerializing_002EGenerateds(reader);
		result.TeamAServe = reader.ReadBoolean();
		result.IsTeamAOnSideA = reader.ReadBoolean();
		result.IsTeamAInverted = reader.ReadBoolean();
		result.IsTeamBInverted = reader.ReadBoolean();
		return result;
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static bool[] GRead___System_002EBoolean_005B_005DFishNet_002ESerializing_002EGenerateds(Reader reader)
	{
		return reader.ReadArrayAllocated<bool>();
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static int[] GRead___System_002EInt32_005B_005DFishNet_002ESerializing_002EGenerateds(Reader reader)
	{
		return reader.ReadArrayAllocated<int>();
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static float[] GRead___System_002ESingle_005B_005DFishNet_002ESerializing_002EGenerateds(Reader reader)
	{
		return reader.ReadArrayAllocated<float>();
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static SetSummaryStats[] GRead___SetSummaryStats_005B_005DFishNet_002ESerializing_002EGenerateds(Reader reader)
	{
		return reader.ReadArrayAllocated<SetSummaryStats>();
	}
}
