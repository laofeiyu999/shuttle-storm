using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CharacterRacket : MonoBehaviour
{
	private bool mnt;

	private Animator mnu;

	public GameObject mns { get; private set; }

	public bool pje
	{
		get
		{
			return mns?.activeInHierarchy ?? false;
		}
		set
		{
			mns?.SetActive(value);
		}
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void Initialize(bool isLeftHanded)
	{
		mnt = isLeftHanded;
		mnu = GetComponent<Animator>();
		GameObject original = Resources.Load<GameObject>("Racket");
		mns = Object.Instantiate(original, new Vector3(0f, 0f, 0f), Quaternion.Euler(0f, 0f, 0f));
		mns.name = "Racket";
		mns.transform.parent = mnu.GetBoneTransform(isLeftHanded ? HumanBodyBones.LeftHand : HumanBodyBones.RightHand);
		mns.transform.localPosition = new Vector3(0.03f * (float)((!isLeftHanded) ? 1 : (-1)), 0.075f, 0.02f);
		mns.transform.localRotation = Quaternion.Euler(0f, 180f, 90f);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void LateUpdate()
	{
		if (pje)
		{
			if (mnt)
			{
				mnu.GetBoneTransform(HumanBodyBones.LeftThumbProximal).localEulerAngles = new Vector3(55.31f, 321.64f, 14.93f);
				mnu.GetBoneTransform(HumanBodyBones.LeftThumbIntermediate).localEulerAngles = new Vector3(325.85f, 357.12f, 353.66f);
				mnu.GetBoneTransform(HumanBodyBones.LeftThumbDistal).localEulerAngles = new Vector3(312.3f, 358.84f, 355.74f);
				mnu.GetBoneTransform(HumanBodyBones.LeftIndexProximal).localEulerAngles = new Vector3(1.22f, 359.79f, 59.68f);
				mnu.GetBoneTransform(HumanBodyBones.LeftIndexIntermediate).localEulerAngles = new Vector3(1.26f, 0.66f, 78.33f);
				mnu.GetBoneTransform(HumanBodyBones.LeftIndexDistal).localEulerAngles = new Vector3(0.77f, 0.21f, 45.46f);
				mnu.GetBoneTransform(HumanBodyBones.LeftMiddleProximal).localEulerAngles = new Vector3(0.14f, 0.79f, 67.89f);
				mnu.GetBoneTransform(HumanBodyBones.LeftMiddleIntermediate).localEulerAngles = new Vector3(0.62f, 0.4f, 86.5f);
				mnu.GetBoneTransform(HumanBodyBones.LeftMiddleDistal).localEulerAngles = new Vector3(1.42f, 0.16f, 26.58f);
				mnu.GetBoneTransform(HumanBodyBones.LeftRingProximal).localEulerAngles = new Vector3(1.31f, 0.29f, 61.11f);
				mnu.GetBoneTransform(HumanBodyBones.LeftRingIntermediate).localEulerAngles = new Vector3(359.51f, 359.99f, 93.94f);
				mnu.GetBoneTransform(HumanBodyBones.LeftRingDistal).localEulerAngles = new Vector3(0.39f, 0.21f, 41.8f);
				mnu.GetBoneTransform(HumanBodyBones.LeftLittleProximal).localEulerAngles = new Vector3(1.84f, 0.16f, 63.08f);
				mnu.GetBoneTransform(HumanBodyBones.LeftLittleIntermediate).localEulerAngles = new Vector3(0.77f, 359.7f, 87.31f);
				mnu.GetBoneTransform(HumanBodyBones.LeftLittleDistal).localEulerAngles = new Vector3(1.72f, 8.2f, 12.73f);
			}
			else
			{
				mnu.GetBoneTransform(HumanBodyBones.RightThumbProximal).localEulerAngles = new Vector3(58.3f, 23.35f, 336.22f);
				mnu.GetBoneTransform(HumanBodyBones.RightThumbIntermediate).localEulerAngles = new Vector3(330.85f, 356.48f, 6.01f);
				mnu.GetBoneTransform(HumanBodyBones.RightThumbDistal).localEulerAngles = new Vector3(305.7f, 356.06f, 4.91f);
				mnu.GetBoneTransform(HumanBodyBones.RightIndexProximal).localEulerAngles = new Vector3(0.76f, 0.55f, 301.18f);
				mnu.GetBoneTransform(HumanBodyBones.RightIndexIntermediate).localEulerAngles = new Vector3(1.26f, 0.66f, 284.95f);
				mnu.GetBoneTransform(HumanBodyBones.RightIndexDistal).localEulerAngles = new Vector3(0.77f, 0.21f, 314.54f);
				mnu.GetBoneTransform(HumanBodyBones.RightMiddleProximal).localEulerAngles = new Vector3(3.06f, 358.59f, 297.71f);
				mnu.GetBoneTransform(HumanBodyBones.RightMiddleIntermediate).localEulerAngles = new Vector3(0.62f, 0.4f, 273.5f);
				mnu.GetBoneTransform(HumanBodyBones.RightMiddleDistal).localEulerAngles = new Vector3(1.42f, 0.16f, 333.42f);
				mnu.GetBoneTransform(HumanBodyBones.RightRingProximal).localEulerAngles = new Vector3(2.32f, 358.17f, 295.46f);
				mnu.GetBoneTransform(HumanBodyBones.RightRingIntermediate).localEulerAngles = new Vector3(359.51f, 359.99f, 278.66f);
				mnu.GetBoneTransform(HumanBodyBones.RightRingDistal).localEulerAngles = new Vector3(0.39f, 0.21f, 318.2f);
				mnu.GetBoneTransform(HumanBodyBones.RightLittleProximal).localEulerAngles = new Vector3(3.1f, 356.57f, 289.29f);
				mnu.GetBoneTransform(HumanBodyBones.RightLittleIntermediate).localEulerAngles = new Vector3(0.77f, 359.7f, 287.27f);
				mnu.GetBoneTransform(HumanBodyBones.RightLittleDistal).localEulerAngles = new Vector3(1.72f, 8.2f, 347.27f);
			}
		}
	}
}
