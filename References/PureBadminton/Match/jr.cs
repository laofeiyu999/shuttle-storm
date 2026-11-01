using System.IO;
using System.Text;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class jr
{
	public static kd efq(MatchLogRecordType a, byte[] b)
	{
		using MemoryStream input = new MemoryStream(b);
		using BinaryReader binaryReader = new BinaryReader(input, Encoding.UTF8);
		return a switch
		{
			MatchLogRecordType.MatchHeader => ji.eey(binaryReader), 
			MatchLogRecordType.InputSent => js.eft(a: false, binaryReader), 
			MatchLogRecordType.InputReceived => js.eft(a: true, binaryReader), 
			MatchLogRecordType.StateSent => jt.efv(a: false, binaryReader), 
			MatchLogRecordType.StateReceived => jt.efv(a: true, binaryReader), 
			MatchLogRecordType.Clamp => ju.efx(binaryReader), 
			MatchLogRecordType.Positions => jv.efy(binaryReader), 
			MatchLogRecordType.PotentialShot => jw.ega(binaryReader), 
			MatchLogRecordType.PreShotInputs => jx.egc(binaryReader), 
			MatchLogRecordType.AuthShot => jy.egf(binaryReader), 
			MatchLogRecordType.CancelShot => jz.egg(binaryReader), 
			MatchLogRecordType.ShuttleReseed => ka.egi(binaryReader), 
			MatchLogRecordType.RallyEnd => jj.efd(binaryReader), 
			MatchLogRecordType.Intensity => jk.efe(binaryReader), 
			MatchLogRecordType.Energy => jl.eff(binaryReader), 
			MatchLogRecordType.Rtt => jm.efi(binaryReader), 
			MatchLogRecordType.ServeForced => kb.egj(binaryReader), 
			MatchLogRecordType.Resync => jn.efl(binaryReader), 
			MatchLogRecordType.Connection => jo.efn(binaryReader), 
			MatchLogRecordType.Alert => jp.efp(binaryReader), 
			_ => new jq
			{
				lqo = a,
				lqp = b
			}, 
		};
	}
}
