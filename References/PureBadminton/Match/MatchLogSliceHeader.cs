using System.IO;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
public struct MatchLogSliceHeader
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public const ushort FORMAT_VERSION = 1;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public static readonly byte[] MAGIC = new byte[4] { 80, 66, 76, 71 };

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public uint NetVersion;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public byte[] MatchId;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public MatchLogAuthorKind AuthorKind;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public byte[] AuthorId;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public ushort Seq;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public uint StartTick;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public uint EndTick;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public bool IsFinal;

	public void ehc(BinaryWriter a)
	{
		a.Write(MAGIC);
		a.Write((ushort)1);
		a.Write(NetVersion);
		a.Write(MatchId ?? new byte[16]);
		a.Write((byte)AuthorKind);
		a.Write(AuthorId ?? new byte[16]);
		a.Write(Seq);
		a.Write(StartTick);
		a.Write(EndTick);
		a.Write((byte)(IsFinal ? 1u : 0u));
	}

	public static MatchLogSliceHeader ehd(BinaryReader a)
	{
		byte[] array = a.ReadBytes(4);
		if (array.Length != 4 || array[0] != MAGIC[0] || array[1] != MAGIC[1] || array[2] != MAGIC[2] || array[3] != MAGIC[3])
		{
			throw new MatchLogFormatException("not a match log slice");
		}
		ushort num = a.ReadUInt16();
		if (num != 1)
		{
			throw new MatchLogFormatException($"unknown slice format {num}");
		}
		MatchLogSliceHeader result = default(MatchLogSliceHeader);
		result.NetVersion = a.ReadUInt32();
		result.MatchId = a.ReadBytes(16);
		result.AuthorKind = (MatchLogAuthorKind)a.ReadByte();
		result.AuthorId = a.ReadBytes(16);
		result.Seq = a.ReadUInt16();
		result.StartTick = a.ReadUInt32();
		result.EndTick = a.ReadUInt32();
		result.IsFinal = (a.ReadByte() & 1) != 0;
		return result;
	}
}
