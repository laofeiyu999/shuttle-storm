using FishNet.Broadcast;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
public struct OnlineAuthRequest : IBroadcast
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public string PlayerId;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public string MatchToken;
}
