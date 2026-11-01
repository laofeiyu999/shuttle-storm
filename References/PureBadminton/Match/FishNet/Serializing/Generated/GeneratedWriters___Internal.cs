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
public static class GeneratedWriters___Internal
{
	[RuntimeInitializeOnLoadMethod]
	[NotObfuscatedCause("Because of some type skipping settings.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Has RuntimeInitializeOnLoadMethodAttribute.")]
	private static void InitializeOnce()
	{
		GenericWriter<OnlineAuthRequest>.SetWrite(GWrite___OnlineAuthRequestFishNet_002ESerializing_002EGenerated);
		GenericWriter<OnlineAuthResult>.SetWrite(GWrite___OnlineAuthResultFishNet_002ESerializing_002EGenerated);
		GenericWriter<ClientMovementState>.SetWrite(GWrite___ClientMovementStateFishNet_002ESerializing_002EGenerated);
		GenericWriter<CharacterIntensityLevel>.SetWrite(GWrite___CharacterIntensityLevelFishNet_002ESerializing_002EGenerated);
		GenericWriter<MatchSettings.PositionOnCourt>.SetWrite(GWrite___MatchSettings_002FPositionOnCourtFishNet_002ESerializing_002EGenerated);
		GenericWriter<Dictionary<MatchSettings.PositionOnCourt, float>>.SetWrite(GWrite___System_002ECollections_002EGeneric_002EDictionary_00602_003CMatchSettings_002FPositionOnCourt_002CSystem_002ESingle_003EFishNet_002ESerializing_002EGenerated);
		GenericWriter<RallyEndInfo>.SetWrite(GWrite___RallyEndInfoFishNet_002ESerializing_002EGenerated);
		GenericWriter<ScoreCheck>.SetWrite(GWrite___ScoreCheckFishNet_002ESerializing_002EGenerated);
		GenericWriter<SetSummaryStats>.SetWrite(GWrite___SetSummaryStatsFishNet_002ESerializing_002EGenerated);
		GenericWriter<string[]>.SetWrite(GWrite___System_002EString_005B_005DFishNet_002ESerializing_002EGenerated);
		GenericWriter<MatchSnapshot>.SetWrite(GWrite___MatchSnapshotFishNet_002ESerializing_002EGenerated);
		GenericWriter<bool[]>.SetWrite(GWrite___System_002EBoolean_005B_005DFishNet_002ESerializing_002EGenerated);
		GenericWriter<int[]>.SetWrite(GWrite___System_002EInt32_005B_005DFishNet_002ESerializing_002EGenerated);
		GenericWriter<float[]>.SetWrite(GWrite___System_002ESingle_005B_005DFishNet_002ESerializing_002EGenerated);
		GenericWriter<SetSummaryStats[]>.SetWrite(GWrite___SetSummaryStats_005B_005DFishNet_002ESerializing_002EGenerated);
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static void GWrite___OnlineAuthRequestFishNet_002ESerializing_002EGenerated(this Writer writer, OnlineAuthRequest value)
	{
		writer.WriteString(value.PlayerId);
		writer.WriteString(value.MatchToken);
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static void GWrite___OnlineAuthResultFishNet_002ESerializing_002EGenerated(this Writer writer, OnlineAuthResult value)
	{
		writer.WriteBoolean(value.Passed);
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static void GWrite___ClientMovementStateFishNet_002ESerializing_002EGenerated(this Writer writer, ClientMovementState value)
	{
		writer.WriteUInt32(value.Tick);
		writer.WriteVector3(value.Position);
		writer.WriteSingle(value.Angle);
		writer.WriteString(value.AnimationName);
		writer.WriteSingle(value.NormalizedTime);
		writer.WriteBoolean(value.InPose);
		writer.WriteVector2(value.MoveStick);
		writer.WriteInt32(value.ShotType);
		writer.WriteSingle(value.ShotPower);
		writer.WriteVector2(value.ShotDirection);
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static void GWrite___CharacterIntensityLevelFishNet_002ESerializing_002EGenerated(this Writer writer, CharacterIntensityLevel value)
	{
		writer.WriteInt32((int)value);
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static void GWrite___MatchSettings_002FPositionOnCourtFishNet_002ESerializing_002EGenerated(this Writer writer, MatchSettings.PositionOnCourt value)
	{
		writer.WriteInt32((int)value);
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static void GWrite___System_002ECollections_002EGeneric_002EDictionary_00602_003CMatchSettings_002FPositionOnCourt_002CSystem_002ESingle_003EFishNet_002ESerializing_002EGenerated(this Writer writer, Dictionary<MatchSettings.PositionOnCourt, float> value)
	{
		writer.WriteDictionary(value);
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static void GWrite___RallyEndInfoFishNet_002ESerializing_002EGenerated(this Writer writer, RallyEndInfo value)
	{
		writer.WriteBoolean(value.LastShotByTeamA);
		writer.WriteBoolean(value.TouchedPartner);
		writer.WriteBoolean(value.TouchedOpponent);
		writer.WriteBoolean(value.EndedOut);
		writer.WriteBoolean(value.EndedInNet);
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static void GWrite___ScoreCheckFishNet_002ESerializing_002EGenerated(this Writer writer, ScoreCheck value)
	{
		writer.WriteInt32(value.SetIndex);
		writer.WriteInt32(value.TeamAScore);
		writer.WriteInt32(value.TeamBScore);
		writer.WriteInt32(value.TotalRallies);
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static void GWrite___SetSummaryStatsFishNet_002ESerializing_002EGenerated(this Writer writer, SetSummaryStats value)
	{
		writer.WriteSingle(value.Duration);
		writer.WriteInt32(value.AverageShotsPerRally);
		writer.WriteInt32(value.MaxShotsPerRally);
		writer.WriteInt32(value.BadServeCountA);
		writer.WriteInt32(value.BadServeCountB);
		writer.WriteInt32(value.OutCountA);
		writer.WriteInt32(value.OutCountB);
		writer.WriteInt32(value.NetCountA);
		writer.WriteInt32(value.NetCountB);
		writer.WriteInt32(value.TotalDistanceA);
		writer.WriteInt32(value.TotalDistanceB);
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static void GWrite___System_002EString_005B_005DFishNet_002ESerializing_002EGenerated(this Writer writer, string[] value)
	{
		writer.WriteArray(value);
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static void GWrite___MatchSnapshotFishNet_002ESerializing_002EGenerated(this Writer writer, MatchSnapshot value)
	{
		GWrite___System_002EBoolean_005B_005DFishNet_002ESerializing_002EGenerated(writer, value.RallyWinners);
		GWrite___System_002EInt32_005B_005DFishNet_002ESerializing_002EGenerated(writer, value.SetRallyCounts);
		GWrite___System_002ESingle_005B_005DFishNet_002ESerializing_002EGenerated(writer, value.SetDurations);
		GWrite___SetSummaryStats_005B_005DFishNet_002ESerializing_002EGenerated(writer, value.SetSummaries);
		GWrite___System_002EBoolean_005B_005DFishNet_002ESerializing_002EGenerated(writer, value.SetHasSummary);
		writer.WriteBoolean(value.TeamAServe);
		writer.WriteBoolean(value.IsTeamAOnSideA);
		writer.WriteBoolean(value.IsTeamAInverted);
		writer.WriteBoolean(value.IsTeamBInverted);
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static void GWrite___System_002EBoolean_005B_005DFishNet_002ESerializing_002EGenerated(this Writer writer, bool[] value)
	{
		writer.WriteArray(value);
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static void GWrite___System_002EInt32_005B_005DFishNet_002ESerializing_002EGenerated(this Writer writer, int[] value)
	{
		writer.WriteArray(value);
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static void GWrite___System_002ESingle_005B_005DFishNet_002ESerializing_002EGenerated(this Writer writer, float[] value)
	{
		writer.WriteArray(value);
	}

	[NotObfuscatedCause("Because of some type skipping settings.")]
	public static void GWrite___SetSummaryStats_005B_005DFishNet_002ESerializing_002EGenerated(this Writer writer, SetSummaryStats[] value)
	{
		writer.WriteArray(value);
	}
}
