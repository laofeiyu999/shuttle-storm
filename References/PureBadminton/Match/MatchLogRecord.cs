using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
public readonly struct MatchLogRecord
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public readonly uint Tick;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public readonly kd Payload;

	public MatchLogRecord(uint tick, kd payload)
	{
		Tick = tick;
		Payload = payload;
	}
}
