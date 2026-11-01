using System.Collections;
using OPS.Obfuscator.Attribute;
using UnityEngine;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class SkewTextExample : MonoBehaviour
{
	private TMP_Text kcd;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public AnimationCurve VertexCurve = new AnimationCurve(new Keyframe(0f, 0f), new Keyframe(0.25f, 2f), new Keyframe(0.5f, 0f), new Keyframe(0.75f, 2f), new Keyframe(1f, 0f));

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float CurveScale = 1f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float ShearAmount = 1f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		kcd = base.gameObject.GetComponent<TMP_Text>();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		StartCoroutine(bhs());
	}

	private AnimationCurve bhr(AnimationCurve a)
	{
		return new AnimationCurve
		{
			keys = a.keys
		};
	}

	private IEnumerator bhs()
	{
		VertexCurve.preWrapMode = WrapMode.Once;
		VertexCurve.postWrapMode = WrapMode.Once;
		kcd.havePropertiesChanged = true;
		CurveScale *= 10f;
		float curveScale = CurveScale;
		float shearAmount = ShearAmount;
		AnimationCurve animationCurve = bhr(VertexCurve);
		while (true)
		{
			if (!kcd.havePropertiesChanged && curveScale == CurveScale && animationCurve.keys[1].value == VertexCurve.keys[1].value && shearAmount == ShearAmount)
			{
				yield return null;
				continue;
			}
			curveScale = CurveScale;
			animationCurve = bhr(VertexCurve);
			shearAmount = ShearAmount;
			kcd.ForceMeshUpdate();
			TMP_TextInfo textInfo = kcd.textInfo;
			int characterCount = textInfo.characterCount;
			if (characterCount == 0)
			{
				continue;
			}
			float x = kcd.bounds.min.x;
			float x2 = kcd.bounds.max.x;
			for (int i = 0; i < characterCount; i++)
			{
				if (textInfo.characterInfo[i].isVisible)
				{
					int vertexIndex = textInfo.characterInfo[i].vertexIndex;
					int materialReferenceIndex = textInfo.characterInfo[i].materialReferenceIndex;
					Vector3[] vertices = textInfo.meshInfo[materialReferenceIndex].vertices;
					Vector3 vector = new Vector2((vertices[vertexIndex].x + vertices[vertexIndex + 2].x) / 2f, textInfo.characterInfo[i].baseLine);
					vertices[vertexIndex] += -vector;
					vertices[vertexIndex + 1] += -vector;
					vertices[vertexIndex + 2] += -vector;
					vertices[vertexIndex + 3] += -vector;
					float num = ShearAmount * 0.01f;
					Vector3 vector2 = new Vector3(num * (textInfo.characterInfo[i].topRight.y - textInfo.characterInfo[i].baseLine), 0f, 0f);
					Vector3 vector3 = new Vector3(num * (textInfo.characterInfo[i].baseLine - textInfo.characterInfo[i].bottomRight.y), 0f, 0f);
					vertices[vertexIndex] += -vector3;
					vertices[vertexIndex + 1] += vector2;
					vertices[vertexIndex + 2] += vector2;
					vertices[vertexIndex + 3] += -vector3;
					float num2 = (vector.x - x) / (x2 - x);
					float num3 = num2 + 0.0001f;
					float y = VertexCurve.Evaluate(num2) * CurveScale;
					float y2 = VertexCurve.Evaluate(num3) * CurveScale;
					Vector3 lhs = new Vector3(1f, 0f, 0f);
					Vector3 rhs = new Vector3(num3 * (x2 - x) + x, y2) - new Vector3(vector.x, y);
					float num4 = Mathf.Acos(Vector3.Dot(lhs, rhs.normalized)) * 57.29578f;
					float z = ((Vector3.Cross(lhs, rhs).z > 0f) ? num4 : (360f - num4));
					Matrix4x4 matrix4x = Matrix4x4.TRS(new Vector3(0f, y, 0f), Quaternion.Euler(0f, 0f, z), Vector3.one);
					vertices[vertexIndex] = matrix4x.MultiplyPoint3x4(vertices[vertexIndex]);
					vertices[vertexIndex + 1] = matrix4x.MultiplyPoint3x4(vertices[vertexIndex + 1]);
					vertices[vertexIndex + 2] = matrix4x.MultiplyPoint3x4(vertices[vertexIndex + 2]);
					vertices[vertexIndex + 3] = matrix4x.MultiplyPoint3x4(vertices[vertexIndex + 3]);
					vertices[vertexIndex] += vector;
					vertices[vertexIndex + 1] += vector;
					vertices[vertexIndex + 2] += vector;
					vertices[vertexIndex + 3] += vector;
				}
			}
			kcd.UpdateVertexData();
			yield return null;
		}
	}
}
