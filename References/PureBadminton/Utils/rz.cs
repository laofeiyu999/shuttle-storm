using System.Runtime.CompilerServices;
using System.Text.RegularExpressions;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine.InputSystem;
using UnityEngine.InputSystem.DualShock;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class rz : ITextPreprocessor
{
	private static readonly Regex mys = new Regex("<cmd=(.*?)>");

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public string PreprocessText(string text)
	{
		if (string.IsNullOrEmpty(text))
		{
			return text;
		}
		return mys.Replace(text, delegate(Match a)
		{
			string value = a.Groups[1].Value;
			return gjt(value);
		});
	}

	private string gjt(string a)
	{
		InputAction inputAction = qi.msd.FindAction(a);
		if (inputAction == null)
		{
			return "?";
		}
		string value = ((Gamepad.current != null) ? "Gamepad" : "Keyboard");
		foreach (InputBinding binding in inputAction.bindings)
		{
			if (binding.groups != null && binding.groups.Contains(value))
			{
				string text = binding.ToDisplayString();
				string text2 = gju(binding.effectivePath, text);
				return (text2 != null) ? ("<sprite name=\"" + text2 + "\">") : text;
			}
		}
		return "?";
	}

	private string gju(string a, string b)
	{
		string[] array = a.Split('/');
		if (array[0] == "<Gamepad>")
		{
			if (Gamepad.current is DualShockGamepad)
			{
				switch (array[1])
				{
				case "buttonWest":
					return "playstation-square";
				case "buttonSouth":
					return "playstation-cross";
				case "buttonNorth":
					return "playstation-triangle";
				case "buttonEast":
					return "playstation-circle";
				case "start":
					return "gamepad-start";
				case "select":
					return "gamepad-back";
				case "leftShoulder":
					return "playstation-l1";
				case "leftTrigger":
					return "playstation-l2";
				case "rightShoulder":
					return "playstation-r1";
				case "rightTrigger":
					return "playstation-r2";
				}
			}
			else
			{
				switch (array[1])
				{
				case "buttonWest":
					return "gamepad-x";
				case "buttonSouth":
					return "gamepad-a";
				case "buttonNorth":
					return "gamepad-y";
				case "buttonEast":
					return "gamepad-b";
				case "start":
					return "gamepad-start";
				case "select":
					return "gamepad-back";
				case "leftShoulder":
					return "gamepad-lb";
				case "leftTrigger":
					return "gamepad-lt";
				case "rightShoulder":
					return "gamepad-rb";
				case "rightTrigger":
					return "gamepad-rt";
				}
			}
		}
		else
		{
			switch (array[1])
			{
			case "alt":
				return "keyboard-alt";
			case "delete":
				return "keyboard-delete";
			case "enter":
				return "keyboard-enter";
			case "escape":
				return "keyboard-escape";
			case "leftShift":
			case "rightShift":
			case "shift":
				return "keyboard-shift";
			case "space":
				return "keyboard-space";
			case "tab":
				return "keyboard-tab";
			case "leftArrow":
				return "keyboard-arrow-left";
			case "rightArrow":
				return "keyboard-arrow-right";
			case "upArrow":
				return "keyboard-arrow-up";
			case "downArrow":
				return "keyboard-arrow-down";
			}
			switch (b)
			{
			case "A":
				return "keyboard-a";
			case "E":
				return "keyboard-e";
			case "Q":
				return "keyboard-q";
			}
		}
		return null;
	}

	[CompilerGenerated]
	private string gjv(Match a)
	{
		string value = a.Groups[1].Value;
		return gjt(value);
	}
}
