using System.IO;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public sealed class jl : kd
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	public struct SeatEnergy
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public byte Seat;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public ushort Energy;
	}

	public bool lpy;

	public SeatEnergy[] lpz = new SeatEnergy[0];

	public MatchLogRecordType peu => MatchLogRecordType.Energy;

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public static SeatEnergy Seat(byte seat, float energy)
	{
		SeatEnergy result = default(SeatEnergy);
		result.Seat = seat;
		result.Energy = kc.egm(energy);
		return result;
	}

	public void eex(BinaryWriter a)
	{
		a.Write(lpy);
		a.Write((byte)lpz.Length);
		SeatEnergy[] array = lpz;
		for (int i = 0; i < array.Length; i++)
		{
			SeatEnergy seatEnergy = array[i];
			a.Write(seatEnergy.Seat);
			a.Write(seatEnergy.Energy);
		}
	}

	public static jl eff(BinaryReader a)
	{
		jl jl2 = new jl
		{
			lpy = a.ReadBoolean()
		};
		jl2.lpz = new SeatEnergy[a.ReadByte()];
		for (int i = 0; i < jl2.lpz.Length; i++)
		{
			jl2.lpz[i] = new SeatEnergy
			{
				Seat = a.ReadByte(),
				Energy = a.ReadUInt16()
			};
		}
		return jl2;
	}
}
