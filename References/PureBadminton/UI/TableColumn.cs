using System;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.Localization;

[Serializable]
[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
public class TableColumn
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum ColumnType
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		String,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Int,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Image,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Gauge,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Rank,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Custom
	}

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string Label;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string Field;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public LocalizedString LocalizedString;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public ColumnType Type;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public float? Size;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public Action<GameObject, vu, int, bool, Table> Render;

	public TableColumn(string label, string field, ColumnType type, float? size = null)
	{
		Label = label;
		Field = field;
		Type = type;
		Size = size;
	}

	public TableColumn(LocalizedString localizedString, string field, ColumnType type, float? size = null)
	{
		LocalizedString = localizedString;
		Field = field;
		Type = type;
		Size = size;
	}

	public TableColumn(string label, Action<GameObject, vu, int, bool, Table> render, float? size = null)
	{
		Label = label;
		Type = ColumnType.Custom;
		Render = render;
		Size = size;
	}

	public TableColumn(LocalizedString localizedString, Action<GameObject, vu, int, bool, Table> render, float? size = null)
	{
		LocalizedString = localizedString;
		Type = ColumnType.Custom;
		Render = render;
		Size = size;
	}
}
