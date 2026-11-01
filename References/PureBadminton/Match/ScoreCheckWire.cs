using System.IO;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
public struct ScoreCheckWire
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public byte SetIndex;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public ushort TeamA;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public ushort TeamB;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public ushort TotalRallies;

	public static ScoreCheckWire eez(ScoreCheck a)
	{
		ScoreCheckWire result = default(ScoreCheckWire);
		result.SetIndex = (byte)a.SetIndex;
		result.TeamA = (ushort)a.TeamAScore;
		result.TeamB = (ushort)a.TeamBScore;
		result.TotalRallies = (ushort)a.TotalRallies;
		return result;
	}

	public void efa(BinaryWriter a)
	{
		a.Write(SetIndex);
		a.Write(TeamA);
		a.Write(TeamB);
		a.Write(TotalRallies);
	}

	public static ScoreCheckWire efb(BinaryReader a)
	{
		ScoreCheckWire result = default(ScoreCheckWire);
		result.SetIndex = a.ReadByte();
		result.TeamA = a.ReadUInt16();
		result.TeamB = a.ReadUInt16();
		result.TotalRallies = a.ReadUInt16();
		return result;
	}
}
