using System;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
public class MatchLogFormatException : Exception
{
	public MatchLogFormatException(string message, Exception inner = null)
		: base(message, inner)
	{
	}
}
