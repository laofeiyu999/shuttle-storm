using System.Collections.Generic;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.Animations.Rigging;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CharacterLookAt : MonoBehaviour
{
	private RigBuilder mnq;

	public GameObject mnr { get; private set; }

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		GameObject gameObject = new GameObject();
		gameObject.name = "Head Rig";
		Rig rig = gameObject.AddComponent<Rig>();
		rig.weight = 1f;
		gameObject.transform.parent = base.transform;
		gameObject.transform.localPosition = Vector3.zero;
		mnq = base.gameObject.AddComponent<RigBuilder>();
		mnq.layers = new List<RigLayer>
		{
			new RigLayer(rig)
		};
		mnq.enabled = false;
		GameObject gameObject2 = new GameObject();
		gameObject2.name = "Head Aim";
		MultiAimConstraint multiAimConstraint = gameObject2.AddComponent<MultiAimConstraint>();
		multiAimConstraint.data.constrainedObject = GetComponent<Animator>().GetBoneTransform(HumanBodyBones.Head);
		multiAimConstraint.data.aimAxis = MultiAimConstraintData.Axis.Z;
		multiAimConstraint.data.upAxis = MultiAimConstraintData.Axis.Y;
		multiAimConstraint.data.constrainedXAxis = true;
		multiAimConstraint.data.constrainedYAxis = true;
		multiAimConstraint.data.constrainedZAxis = true;
		multiAimConstraint.data.limits = new Vector2(-90f, 90f);
		gameObject2.transform.parent = gameObject.transform;
		gameObject2.transform.localPosition = Vector3.zero;
		mnr = new GameObject();
		mnr.name = "Target";
		mnr.transform.parent = gameObject2.transform;
		multiAimConstraint.data.sourceObjects = new WeightedTransformArray
		{
			new WeightedTransform(mnr.transform, 1f)
		};
		this.guz(delegate
		{
			mnq.enabled = true;
		});
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		if (mnq != null)
		{
			mnq.enabled = true;
		}
	}

	[CompilerGenerated]
	private void frj()
	{
		mnq.enabled = true;
	}
}
