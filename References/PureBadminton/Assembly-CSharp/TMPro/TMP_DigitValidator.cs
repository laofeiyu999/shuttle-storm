using System;
using OPS.Obfuscator.Attribute;

namespace TMPro;

[Serializable]
[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
[NotObfuscatedCause("Class: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class TMP_DigitValidator : TMP_InputValidator
{
	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override char Validate(ref string text, ref int pos, char ch)
	{
		if (ch >= '0' && ch <= '9')
		{
			text += ch;
			pos++;
			return ch;
		}
		return '\0';
	}
}
