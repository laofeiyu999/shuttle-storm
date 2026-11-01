using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public abstract class BaseExerciseManager : MonoBehaviour
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	public delegate void OnScoreIncreased();

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	public delegate void OnMatchScoreChanged();

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	public delegate void OnFinished();

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CharacterManager MainCharacter;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CharacterManager BotCharacter;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public tp ExerciseInfo;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public int Score;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public (int, int) MatchScore;

	protected GameManager phl => GameManager.Current;

	public bool mgs { get; protected set; }

	public event OnScoreIncreased mgt;

	public event OnMatchScoreChanged mgu;

	public event OnFinished mgv;

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public virtual void Initialize()
	{
		MainCharacter.transform.position = new Vector3(phl.Court.pcl.center.x, MainCharacter.transform.position.y, phl.Court.pcl.center.y);
		MainCharacter.gameObject.SetActive(value: true);
	}

	public virtual void fcf()
	{
		mgs = true;
	}

	public virtual void fcg()
	{
		mgs = false;
	}

	public virtual void fch()
	{
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public virtual void FixedUpdate()
	{
	}

	protected void fci()
	{
		Score++;
		this.mgt?.Invoke();
		if (ExerciseInfo.nck.HasValue && Score >= ExerciseInfo.nck)
		{
			AudioManager.fiy();
			this.mgv?.Invoke();
		}
		else
		{
			AudioManager.fix();
		}
	}

	protected void fcj()
	{
		this.mgu?.Invoke();
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	protected void Finish()
	{
		this.mgv?.Invoke();
	}

	protected void fck(Vector2 a)
	{
		phl.TargetDecal.transform.localPosition = new Vector3(a.x, phl.TargetDecal.transform.localPosition.y, a.y);
		phl.TargetDecal.enabled = true;
	}

	protected void fcl()
	{
		phl.TargetDecal.enabled = false;
	}
}
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public abstract class BaseExerciseManager<T> : BaseExerciseManager where T : tp
{
	public T phm => ExerciseInfo as T;
}
