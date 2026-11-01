using System.IO;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public sealed class ji : kd
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	public struct RosterSeat
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public byte Seat;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public string PlayerId;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public byte Team;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public bool Human;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public float Defense;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public float Power;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public float Precision;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public float Speed;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public float Stamina;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public ushort Height;

		public CharacterStats eev()
		{
			return new CharacterStats
			{
				defense = Defense,
				power = Power,
				precision = Precision,
				speed = Speed,
				stamina = Stamina
			};
		}
	}

	public const byte lpa = 0;

	public const byte lpb = 1;

	public const byte lpc = 2;

	public string lpd = "";

	public byte lpe = byte.MaxValue;

	public bool lpf;

	public byte lpg;

	public string lph = "";

	public float lpi;

	public float lpj;

	public float lpk;

	public float lpl;

	public byte lpm;

	public float lpn;

	public RosterSeat[] lpo = new RosterSeat[0];

	public MatchLogRecordType peu => MatchLogRecordType.MatchHeader;

	public void eex(BinaryWriter a)
	{
		a.Write(lpd);
		a.Write(lpe);
		a.Write(lpf);
		a.Write(lpg);
		a.Write(lph);
		a.Write(lpi);
		a.Write(lpj);
		a.Write(lpk);
		a.Write(lpl);
		a.Write(lpm);
		a.Write(lpn);
		a.Write((byte)lpo.Length);
		RosterSeat[] array = lpo;
		for (int i = 0; i < array.Length; i++)
		{
			RosterSeat rosterSeat = array[i];
			a.Write(rosterSeat.Seat);
			a.Write(rosterSeat.PlayerId ?? "");
			a.Write(rosterSeat.Team);
			a.Write(rosterSeat.Human);
			a.Write(rosterSeat.Defense);
			a.Write(rosterSeat.Power);
			a.Write(rosterSeat.Precision);
			a.Write(rosterSeat.Speed);
			a.Write(rosterSeat.Stamina);
			a.Write(rosterSeat.Height);
		}
	}

	public static ji eey(BinaryReader a)
	{
		ji ji2 = new ji
		{
			lpd = a.ReadString(),
			lpe = a.ReadByte(),
			lpf = a.ReadBoolean(),
			lpg = a.ReadByte(),
			lph = a.ReadString(),
			lpi = a.ReadSingle(),
			lpj = a.ReadSingle(),
			lpk = a.ReadSingle(),
			lpl = a.ReadSingle(),
			lpm = a.ReadByte(),
			lpn = a.ReadSingle()
		};
		ji2.lpo = new RosterSeat[a.ReadByte()];
		for (int i = 0; i < ji2.lpo.Length; i++)
		{
			ji2.lpo[i] = new RosterSeat
			{
				Seat = a.ReadByte(),
				PlayerId = a.ReadString(),
				Team = a.ReadByte(),
				Human = a.ReadBoolean(),
				Defense = a.ReadSingle(),
				Power = a.ReadSingle(),
				Precision = a.ReadSingle(),
				Speed = a.ReadSingle(),
				Stamina = a.ReadSingle(),
				Height = a.ReadUInt16()
			};
		}
		return ji2;
	}
}
