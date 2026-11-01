using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class ry
{
	[NotObfuscatedCause("Because of compatibility component: .Net Framework - Compatibility : Is a special name.")]
	private static ru current;

	public static ru pnt
	{
		get
		{
			if (current == null)
			{
				current = new rx();
			}
			return current;
		}
	}
}
