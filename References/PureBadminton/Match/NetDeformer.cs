using OPS.Obfuscator.Attribute;
using UnityEngine;

[RequireComponent(typeof(MeshFilter), typeof(MeshRenderer))]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class NetDeformer : MonoBehaviour
{
	[Header("Net Size (meters)")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float width = 6.1f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float height = 0.76f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float bandHeight = 0.05f;

	[Header("Mesh Resolution")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public int xSegments = 100;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public int ySegments = 14;

	[Header("Albedo UV Tiling")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float uvRepeatX = 200f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float uvRepeatY = 28f;

	[Header("Deformation Settings")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float amplitude = 0.05f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float stiffness = 0.15f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float damping = 0.95f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float tensionFactor = 3f;

	[Header("Impact Settings")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float strengthFactor = 5f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float impactRadius = 2f;

	[Header("Materials")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Material netMaterial;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Material bandMaterial;

	private Mesh lvq;

	private Vector3[] lvr;

	private Vector3[] lvs;

	private float[,] lvt;

	private float[,] lvu;

	private int lvv;

	private int lvw;

	private int lvx;

	private float[,] lvy;

	public bool lvz { get; private set; }

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		lvv = xSegments + 1;
		lvw = ySegments + 1;
		elp();
		elq();
		elr();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Update()
	{
		if (lvz)
		{
			els(Time.deltaTime);
			elt();
		}
	}

	private void elp()
	{
		float num = 1f;
		if (Screen.currentResolution.height > 1600)
		{
			num = 1.5f;
		}
		if (Screen.currentResolution.height < 800)
		{
			num = 0.7f;
		}
		lvq = new Mesh();
		lvq.name = "Procedural Net";
		GetComponent<MeshFilter>().mesh = lvq;
		lvr = new Vector3[lvv * lvw];
		lvs = new Vector3[lvr.Length];
		Vector2[] array = new Vector2[lvr.Length];
		_ = width / (float)xSegments;
		_ = height / (float)ySegments;
		lvx = Mathf.RoundToInt((float)ySegments * (bandHeight / height));
		lvx = Mathf.Clamp(lvx, 1, ySegments);
		for (int i = 0; i < lvw; i++)
		{
			for (int j = 0; j < lvv; j++)
			{
				int num2 = i * lvv + j;
				float x = (float)j / (float)xSegments * width - width * 0.5f;
				float y = (float)i / (float)ySegments * height;
				lvr[num2] = new Vector3(x, y, 0f);
				array[num2] = new Vector2((float)j / (float)xSegments * uvRepeatX * num, (float)i / (float)ySegments * uvRepeatY * num);
			}
		}
		lvq.vertices = lvr;
		lvq.uv = array;
		int[] array2 = new int[xSegments * ySegments * 6];
		int[] array3 = new int[xSegments * lvx * 6];
		int num3 = 0;
		int num4 = 0;
		for (int k = 0; k < ySegments; k++)
		{
			for (int l = 0; l < xSegments; l++)
			{
				int num5 = k * (xSegments + 1) + l;
				int num6 = num5 + 1;
				int num7 = num5 + (xSegments + 1);
				int num8 = num7 + 1;
				if (k >= ySegments - lvx)
				{
					array3[num4++] = num5;
					array3[num4++] = num7;
					array3[num4++] = num6;
					array3[num4++] = num6;
					array3[num4++] = num7;
					array3[num4++] = num8;
				}
				else
				{
					array2[num3++] = num5;
					array2[num3++] = num7;
					array2[num3++] = num6;
					array2[num3++] = num6;
					array2[num3++] = num7;
					array2[num3++] = num8;
				}
			}
		}
		lvq.subMeshCount = 2;
		lvq.SetTriangles(array2, 0);
		lvq.SetTriangles(array3, 1);
		lvq.RecalculateNormals();
		lvq.RecalculateBounds();
		GetComponent<MeshRenderer>().materials = new Material[2] { netMaterial, bandMaterial };
	}

	private void elq()
	{
		lvy = new float[lvv, lvw];
		float num = width * 0.5f;
		for (int i = 0; i < lvw; i++)
		{
			for (int j = 0; j < lvv; j++)
			{
				float num2 = 0f - num + width * ((float)j / (float)(lvv - 1));
				float a = Mathf.Abs(num2 + num);
				float b = Mathf.Abs(num2 - num);
				float value = Mathf.Min(a, b) / (width * 0.5f);
				value = Mathf.Clamp01(value);
				float num3 = (float)i / (float)(lvw - 1);
				float num4 = Mathf.Lerp(0.95f, 0.6f, value) * Mathf.Lerp(0.3f, 1f, num3);
				if (value < 0.1f && num3 > 0.85f)
				{
					num4 = 0.98f;
				}
				lvy[j, i] = num4;
			}
		}
	}

	private void elr()
	{
		lvt = new float[lvv, lvw];
		lvu = new float[lvv, lvw];
	}

	private void els(float a)
	{
		for (int i = 1; i < lvv - 1; i++)
		{
			for (int j = 0; j < lvw; j++)
			{
				if (j > ySegments - lvx)
				{
					lvt[i, j] = lvt[i, ySegments - lvx];
					continue;
				}
				float num = ((j == 0) ? ((lvt[i + 1, j] + lvt[i - 1, j] + lvt[i + 1, j + 1]) / 3f) : ((lvt[i + 1, j] + lvt[i - 1, j] + lvt[i, j + 1] + lvt[i, j - 1]) * 0.25f)) - lvt[i, j];
				lvu[i, j] += num * stiffness;
				lvu[i, j] *= damping;
				float num2 = lvy[i, j];
				lvu[i, j] -= lvt[i, j] * num2 * tensionFactor;
				lvt[i, j] += lvu[i, j] * a;
			}
		}
	}

	private void elt()
	{
		bool flag = false;
		for (int i = 0; i < lvw; i++)
		{
			for (int j = 0; j < lvv; j++)
			{
				int num = i * lvv + j;
				Vector3 vector = lvr[num];
				vector += Vector3.forward * lvt[j, i] * amplitude;
				lvs[num] = vector;
				if (!flag && lvt[j, i] > 0.01f)
				{
					flag = true;
				}
			}
		}
		lvq.vertices = lvs;
		lvq.RecalculateNormals();
		if (!flag)
		{
			lvz = false;
		}
	}

	public void elu(Vector2 a, float b)
	{
		int num = Mathf.FloorToInt(a.x * (float)(lvv - 1));
		int num2 = Mathf.FloorToInt(a.y * (float)(lvw - 1));
		float num3 = width / (float)(lvv - 1);
		float num4 = height / (float)(lvw - 1);
		float num5 = (0f - width) * 0.5f + (float)num * num3;
		float num6 = (float)num2 * num4;
		float num7 = impactRadius * impactRadius;
		for (int i = 0; i < lvv; i++)
		{
			float num8 = (0f - width) * 0.5f + (float)i * num3 - num5;
			for (int j = 0; j < lvw; j++)
			{
				float num9 = (float)j * num4 - num6;
				float num10 = num8 * num8 + num9 * num9;
				if (!(num10 > num7))
				{
					float num11 = Mathf.Sqrt(num10);
					float num12 = 1f - num11 / impactRadius;
					lvu[i, j] += b * strengthFactor * num12;
				}
			}
		}
		lvz = true;
	}
}
