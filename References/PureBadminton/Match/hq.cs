using System.Collections.Generic;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;

[CompilerGenerated]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
internal sealed class hq<a, b, c>
{
	[DebuggerBrowsable(DebuggerBrowsableState.Never)]
	private readonly a lfr;

	[DebuggerBrowsable(DebuggerBrowsableState.Never)]
	private readonly b lfs;

	[DebuggerBrowsable(DebuggerBrowsableState.Never)]
	private readonly c lft;

	public a oyk => lfr;

	public b oyl => lfs;

	public c oym => lft;

	[DebuggerHidden]
	public hq(a a, b b, c c)
	{
		lfr = a;
		lfs = b;
		lft = c;
	}

	[DebuggerHidden]
	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override bool Equals(object value)
	{
		hq<a, b, c> hq2 = value as hq<a, b, c>;
		if (this != hq2)
		{
			if (hq2 != null && EqualityComparer<a>.Default.Equals(lfr, hq2.lfr) && EqualityComparer<b>.Default.Equals(lfs, hq2.lfs))
			{
				return EqualityComparer<c>.Default.Equals(lft, hq2.lft);
			}
			return false;
		}
		return true;
	}

	[DebuggerHidden]
	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override int GetHashCode()
	{
		return ((-1916555093 * -1521134295 + EqualityComparer<a>.Default.GetHashCode(lfr)) * -1521134295 + EqualityComparer<b>.Default.GetHashCode(lfs)) * -1521134295 + EqualityComparer<c>.Default.GetHashCode(lft);
	}

	[DebuggerHidden]
	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override string ToString()
	{
		object[] array = new object[3];
		a val = lfr;
		array[0] = ((val != null) ? val.ToString() : null);
		b val2 = lfs;
		array[1] = ((val2 != null) ? val2.ToString() : null);
		c val3 = lft;
		array[2] = ((val3 != null) ? val3.ToString() : null);
		return string.Format(null, "{{ PlayerId = {0}, TeamA = {1}, IsHostRealSeat = {2} }}", array);
	}
}
