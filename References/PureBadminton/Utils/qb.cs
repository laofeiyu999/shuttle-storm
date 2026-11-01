using System;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public interface qb
{
	[NotObfuscatedCause("Some other Property in the Property group getting skipped.")]
	DateTime StartedDate
	{
		[NotObfuscatedCause("Belonging property gets skipped: Some other Property in the Property group getting skipped.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Some other Property in the Property group getting skipped.")]
		set;
	}

	[NotObfuscatedCause("Some other Property in the Property group getting skipped.")]
	DateTime LastSavedDate
	{
		[NotObfuscatedCause("Belonging property gets skipped: Some other Property in the Property group getting skipped.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Some other Property in the Property group getting skipped.")]
		set;
	}

	string pio { get; }

	qc pip { get; }
}
