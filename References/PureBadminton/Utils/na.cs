using System;
using System.IO;
using System.Security.Cryptography;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class na
{
	private static string mko;

	private static string mkp;

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public static void Initialize()
	{
		if (mko != null && mkp != null)
		{
			return;
		}
		using Aes aes = Aes.Create();
		mko = PlayerPrefs.GetString("SaveKey", "");
		if (string.IsNullOrEmpty(mko))
		{
			mko = Convert.ToBase64String(aes.Key);
			PlayerPrefs.SetString("SaveKey", mko);
		}
		mkp = PlayerPrefs.GetString("SaveIV", "");
		if (string.IsNullOrEmpty(mkp))
		{
			mkp = Convert.ToBase64String(aes.IV);
			PlayerPrefs.SetString("SaveIV", mkp);
		}
	}

	private static Aes fhl()
	{
		Aes aes = Aes.Create();
		aes.Key = Convert.FromBase64String(mko);
		aes.IV = Convert.FromBase64String(mkp);
		return aes;
	}

	public static byte[] fhm(byte[] a)
	{
		using Aes aes = fhl();
		using MemoryStream memoryStream = new MemoryStream();
		using (CryptoStream cryptoStream = new CryptoStream(memoryStream, aes.CreateEncryptor(), CryptoStreamMode.Write))
		{
			cryptoStream.Write(a, 0, a.Length);
		}
		return memoryStream.ToArray();
	}

	public static byte[] fhn(byte[] a)
	{
		using Aes aes = fhl();
		using MemoryStream stream = new MemoryStream(a);
		using CryptoStream cryptoStream = new CryptoStream(stream, aes.CreateDecryptor(), CryptoStreamMode.Read);
		byte[] array = new byte[a.Length];
		cryptoStream.Read(array, 0, array.Length);
		return array;
	}
}
