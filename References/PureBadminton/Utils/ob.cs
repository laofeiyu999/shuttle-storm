using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public interface ob
{
	string piz { get; }

	[NotObfuscatedCause("Some other Property in the Property group getting skipped.")]
	int Points
	{
		[NotObfuscatedCause("Belonging property gets skipped: Some other Property in the Property group getting skipped.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Some other Property in the Property group getting skipped.")]
		set;
	}

	[NotObfuscatedCause("Some other Property in the Property group getting skipped.")]
	int? Rank
	{
		[NotObfuscatedCause("Belonging property gets skipped: Some other Property in the Property group getting skipped.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Some other Property in the Property group getting skipped.")]
		set;
	}

	[NotObfuscatedCause("Some other Property in the Property group getting skipped.")]
	int? PreviousRank
	{
		[NotObfuscatedCause("Belonging property gets skipped: Some other Property in the Property group getting skipped.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Some other Property in the Property group getting skipped.")]
		set;
	}
}
