using System.IO;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public sealed class jv : kd
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	public struct SeatPosition
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public byte Seat;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public short X;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public short Z;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public short Angle;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public byte Phase;
	}

	public SeatPosition[] lrq = new SeatPosition[0];

	public MatchLogRecordType peu => MatchLogRecordType.Positions;

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public static SeatPosition Seat(byte seat, Vector3 position, float angle, MatchLogPhase phase)
	{
		SeatPosition result = default(SeatPosition);
		result.Seat = seat;
		result.X = kc.ego(position.x);
		result.Z = kc.ego(position.z);
		result.Angle = kc.egq(angle);
		result.Phase = (byte)phase;
		return result;
	}

	public void eex(BinaryWriter a)
	{
		a.Write((byte)lrq.Length);
		SeatPosition[] array = lrq;
		for (int i = 0; i < array.Length; i++)
		{
			SeatPosition seatPosition = array[i];
			a.Write(seatPosition.Seat);
			a.Write(seatPosition.X);
			a.Write(seatPosition.Z);
			a.Write(seatPosition.Angle);
			a.Write(seatPosition.Phase);
		}
	}

	public static jv efy(BinaryReader a)
	{
		SeatPosition[] array = new SeatPosition[a.ReadByte()];
		for (int i = 0; i < array.Length; i++)
		{
			array[i] = new SeatPosition
			{
				Seat = a.ReadByte(),
				X = a.ReadInt16(),
				Z = a.ReadInt16(),
				Angle = a.ReadInt16(),
				Phase = a.ReadByte()
			};
		}
		return new jv
		{
			lrq = array
		};
	}
}
