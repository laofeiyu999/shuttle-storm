using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class qd : DefaultContractResolver
{
	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	protected override JsonProperty CreateProperty(MemberInfo member, MemberSerialization memberSerialization)
	{
		JsonProperty jsonProperty = base.CreateProperty(member, memberSerialization);
		if (!jsonProperty.Writable)
		{
			bool writable = (member as PropertyInfo)?.GetSetMethod(nonPublic: true) != null;
			jsonProperty.Writable = writable;
		}
		return jsonProperty;
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	protected override IList<JsonProperty> CreateProperties(Type type, MemberSerialization memberSerialization)
	{
		return (from a in base.CreateProperties(type, memberSerialization)
			where a.Writable
			select a).ToList();
	}
}
