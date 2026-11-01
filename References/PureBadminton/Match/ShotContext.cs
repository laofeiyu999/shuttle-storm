using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
public readonly struct ShotContext
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public readonly CourtGeometry Court;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public readonly bool RallyStarted;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public readonly float ServeSign;

	public bool pgr => Court.IsDouble;

	public ShotContext(CourtGeometry court, bool rallyStarted, float serveSign)
	{
		Court = court;
		RallyStarted = rallyStarted;
		ServeSign = serveSign;
	}

	public float ewt(float a, float b)
	{
		if (!RallyStarted)
		{
			return Court.dus(a, ServeSign, b);
		}
		return Court.dur(a, b);
	}

	public static ShotContext ewu(GameManager a)
	{
		return new ShotContext(a.Court.pcb, a.peb, CourtGeometry.dut(a.lmy ^ !a.lmx, a.ped));
	}
}
