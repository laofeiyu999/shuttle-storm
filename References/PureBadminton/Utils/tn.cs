using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class tn
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class tl
	{
		public CharacterStats nbx;

		internal bool gqv(KeyValuePair<CharacterStatsType, float> a)
		{
			return nbx.ftn(a.Key) < a.Value;
		}
	}

	public const float nby = 70f;

	public const float nbz = 80f;

	public TrainingType nca;

	public int ncb;

	public List<tp> ncc;

	public Dictionary<CharacterStatsType, float> ncd;

	public Dictionary<CharacterStatsType, float> nce;

	public static List<tn> ncf = new List<tn>
	{
		new tn
		{
			nca = TrainingType.Movements,
			ncb = 1,
			nce = new Dictionary<CharacterStatsType, float>
			{
				{
					CharacterStatsType.Speed,
					0.7f
				},
				{
					CharacterStatsType.Stamina,
					0.3f
				}
			},
			ncc = new List<tp>
			{
				new tq
				{
					nch = "Shadow-2zones",
					nci = "Shadow-Description",
					ncm = tq.ShadowZones.FrontCorners,
					ncj = 40,
					ncl = (10, 15, 20)
				},
				new tq
				{
					nch = "Shadow-4zones",
					nci = "Shadow-Description",
					ncm = tq.ShadowZones.RearCorners,
					ncj = 60,
					ncl = (10, 15, 20)
				},
				new tq
				{
					nch = "Shadow-6zones",
					nci = "Shadow-Description",
					ncm = tq.ShadowZones.FrontRearCenter,
					ncj = 60,
					ncl = (10, 15, 20)
				},
				new tr
				{
					nch = "Movements-Shuttle",
					nci = "Movements-Shuttle-Description",
					ncj = 60,
					ncl = (10, 15, 20),
					ncp = 6f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[3]
					{
						ShotType.Drop,
						ShotType.Midcourt,
						ShotType.Clear
					},
					ncu = new float[2] { -1f, 1f }
				}
			}
		},
		new tn
		{
			nca = TrainingType.Movements,
			ncb = 2,
			nce = new Dictionary<CharacterStatsType, float>
			{
				{
					CharacterStatsType.Speed,
					0.7f
				},
				{
					CharacterStatsType.Stamina,
					0.3f
				}
			},
			ncd = new Dictionary<CharacterStatsType, float> { 
			{
				CharacterStatsType.Speed,
				70f
			} },
			ncc = new List<tp>
			{
				new tq
				{
					nch = "Shadow-4zones",
					nci = "Shadow-Description",
					ncm = tq.ShadowZones.RearCorners,
					ncj = 60,
					ncl = (15, 20, 25)
				},
				new tq
				{
					nch = "Shadow-6zones",
					nci = "Shadow-Description",
					ncm = tq.ShadowZones.FrontRearCenter,
					ncj = 60,
					ncl = (15, 20, 25)
				},
				new tr
				{
					nch = "Movements-Shuttle",
					nci = "Movements-Shuttle-Description",
					ncj = 60,
					ncl = (15, 20, 25),
					ncp = 6f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[3]
					{
						ShotType.Drop,
						ShotType.Midcourt,
						ShotType.Clear
					},
					ncu = new float[2] { -1f, 1f }
				}
			}
		},
		new tn
		{
			nca = TrainingType.Movements,
			ncb = 3,
			nce = new Dictionary<CharacterStatsType, float>
			{
				{
					CharacterStatsType.Speed,
					0.7f
				},
				{
					CharacterStatsType.Stamina,
					0.3f
				}
			},
			ncd = new Dictionary<CharacterStatsType, float> { 
			{
				CharacterStatsType.Speed,
				80f
			} },
			ncc = new List<tp>
			{
				new tq
				{
					nch = "Shadow-4zones",
					nci = "Shadow-Description",
					ncm = tq.ShadowZones.RearCorners,
					ncj = 80,
					ncl = (20, 25, 30)
				},
				new tq
				{
					nch = "Shadow-6zones",
					nci = "Shadow-Description",
					ncm = tq.ShadowZones.FrontRearCenter,
					ncj = 80,
					ncl = (20, 25, 30)
				},
				new tr
				{
					nch = "Movements-Shuttle",
					nci = "Movements-Shuttle-Description",
					ncj = 80,
					ncl = (20, 25, 30),
					ncp = 6f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[3]
					{
						ShotType.Drop,
						ShotType.Midcourt,
						ShotType.Clear
					},
					ncu = new float[2] { -1f, 1f }
				}
			}
		},
		new tn
		{
			nca = TrainingType.ClearLiftShot,
			ncb = 1,
			nce = new Dictionary<CharacterStatsType, float>
			{
				{
					CharacterStatsType.Power,
					0.5f
				},
				{
					CharacterStatsType.Precision,
					0.3f
				},
				{
					CharacterStatsType.Stamina,
					0.2f
				}
			},
			ncc = new List<tp>
			{
				new tr
				{
					nch = "ClearShot",
					nci = "ClearShot-Description",
					ncj = 60,
					ncl = (10, 15, 20),
					ncp = 3f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[1],
					ncu = new float[1],
					nda = new Rect[1]
					{
						new Rect(-3.05f, 5.945f, 6.1f, 0.76f)
					}
				},
				new tr
				{
					nch = "ClearShot-Zones",
					nci = "ClearShot-Zones-Description",
					ncj = 60,
					ncl = (10, 15, 20),
					ncp = 3f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[1],
					ncu = new float[1],
					nda = new Rect[3]
					{
						new Rect(-3.05f, 5.945f, 1.5f, 0.76f),
						new Rect(-0.75f, 5.945f, 1.5f, 0.76f),
						new Rect(1.55f, 5.945f, 1.5f, 0.76f)
					}
				},
				new tr
				{
					nch = "LiftShot",
					nci = "LiftShot-Description",
					ncj = 60,
					ncl = (15, 20, 25),
					ncp = 7f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[1] { ShotType.Drop },
					ncu = new float[1],
					nda = new Rect[1]
					{
						new Rect(-3.05f, 5.945f, 6.1f, 0.76f)
					}
				},
				new tr
				{
					nch = "LiftShot-Zones",
					nci = "LiftShot-Zones-Description",
					ncj = 60,
					ncl = (10, 15, 20),
					ncp = 7f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[1] { ShotType.Drop },
					ncu = new float[1],
					nda = new Rect[3]
					{
						new Rect(-3.05f, 5.945f, 1.5f, 0.76f),
						new Rect(-0.75f, 5.945f, 1.5f, 0.76f),
						new Rect(1.55f, 5.945f, 1.5f, 0.76f)
					}
				},
				new ts
				{
					nch = "ThemeMatch",
					nci = "ClearLiftShot-ThemeMatch-Description",
					ndd = new Rect[1]
					{
						new Rect(-3.05f, 5.945f, 6.1f, 0.76f)
					}
				}
			}
		},
		new tn
		{
			nca = TrainingType.ClearLiftShot,
			ncb = 2,
			nce = new Dictionary<CharacterStatsType, float>
			{
				{
					CharacterStatsType.Power,
					0.5f
				},
				{
					CharacterStatsType.Precision,
					0.3f
				},
				{
					CharacterStatsType.Stamina,
					0.2f
				}
			},
			ncd = new Dictionary<CharacterStatsType, float> { 
			{
				CharacterStatsType.Power,
				70f
			} },
			ncc = new List<tp>
			{
				new tr
				{
					nch = "ClearShot",
					nci = "ClearShot-Description",
					ncj = 60,
					ncl = (10, 15, 20),
					ncp = 3f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[1],
					ncu = new float[3] { -1f, 0f, 1f },
					nda = new Rect[1]
					{
						new Rect(-3.05f, 5.945f, 6.1f, 0.76f)
					}
				},
				new tr
				{
					nch = "ClearShot-Zones",
					nci = "ClearShot-Zones-Description",
					ncj = 60,
					ncl = (10, 15, 20),
					ncp = 3f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[1],
					ncu = new float[3] { -1f, 0f, 1f },
					nda = new Rect[2]
					{
						new Rect(-3.05f, 5.945f, 1.5f, 0.76f),
						new Rect(1.55f, 5.945f, 1.5f, 0.76f)
					}
				},
				new tr
				{
					nch = "LiftShot",
					nci = "LiftShot-Description",
					ncj = 60,
					ncl = (10, 15, 20),
					ncp = 7f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[1] { ShotType.Drop },
					ncu = new float[3] { -1f, 0f, 1f },
					nda = new Rect[1]
					{
						new Rect(-3.05f, 5.945f, 6.1f, 0.76f)
					}
				},
				new tr
				{
					nch = "LiftShot-Zones",
					nci = "LiftShot-Zones-Description",
					ncj = 60,
					ncl = (10, 15, 20),
					ncp = 7f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[1] { ShotType.Drop },
					ncu = new float[3] { -1f, 0f, 1f },
					nda = new Rect[2]
					{
						new Rect(-3.05f, 5.945f, 1.5f, 0.76f),
						new Rect(1.55f, 5.945f, 1.5f, 0.76f)
					}
				},
				new ts
				{
					nch = "ThemeMatch",
					nci = "ClearLiftShot-ThemeMatch-Description",
					ndd = new Rect[1]
					{
						new Rect(-3.05f, 5.945f, 6.1f, 0.76f)
					}
				}
			}
		},
		new tn
		{
			nca = TrainingType.ClearLiftShot,
			ncb = 3,
			nce = new Dictionary<CharacterStatsType, float>
			{
				{
					CharacterStatsType.Power,
					0.5f
				},
				{
					CharacterStatsType.Precision,
					0.3f
				},
				{
					CharacterStatsType.Stamina,
					0.2f
				}
			},
			ncd = new Dictionary<CharacterStatsType, float> { 
			{
				CharacterStatsType.Power,
				80f
			} },
			ncc = new List<tp>
			{
				new tr
				{
					nch = "ClearLiftShot",
					nci = "ClearLiftShot-Description",
					ncj = 60,
					ncl = (10, 15, 20),
					ncp = 3f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[3]
					{
						ShotType.Drop,
						ShotType.Midcourt,
						ShotType.Clear
					},
					ncu = new float[3] { -1f, 0f, 1f },
					nda = new Rect[1]
					{
						new Rect(-3.05f, 5.945f, 6.1f, 0.76f)
					}
				},
				new tr
				{
					nch = "ClearLiftShot-Zones",
					nci = "ClearLiftShot-Zones-Description",
					ncj = 60,
					ncl = (10, 15, 20),
					ncp = 3f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[3]
					{
						ShotType.Drop,
						ShotType.Midcourt,
						ShotType.Clear
					},
					ncu = new float[3] { -1f, 0f, 1f },
					nda = new Rect[2]
					{
						new Rect(-3.05f, 5.945f, 1.5f, 0.76f),
						new Rect(1.55f, 5.945f, 1.5f, 0.76f)
					}
				},
				new ts
				{
					nch = "ThemeMatch",
					nci = "ClearLiftShot-ThemeMatch-Description",
					ndd = new Rect[1]
					{
						new Rect(-3.05f, 5.945f, 6.1f, 0.76f)
					}
				}
			}
		},
		new tn
		{
			nca = TrainingType.DropNetShot,
			ncb = 1,
			nce = new Dictionary<CharacterStatsType, float>
			{
				{
					CharacterStatsType.Precision,
					0.9f
				},
				{
					CharacterStatsType.Stamina,
					0.1f
				}
			},
			ncc = new List<tp>
			{
				new tr
				{
					nch = "DropShot",
					nci = "DropShot-Description",
					ncj = 60,
					ncl = (5, 10, 15),
					ncp = 4f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[1],
					ncu = new float[1],
					nda = new Rect[1]
					{
						new Rect(-3.05f, 0f, 6.1f, 2.2f)
					}
				},
				new tr
				{
					nch = "DropShot-Zones",
					nci = "DropShot-Zones-Description",
					ncj = 60,
					ncl = (5, 10, 15),
					ncp = 3f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[1],
					ncu = new float[1],
					nda = new Rect[3]
					{
						new Rect(-3.05f, 0f, 1.5f, 2.2f),
						new Rect(-0.75f, 0f, 1.5f, 2.2f),
						new Rect(1.55f, 0f, 1.5f, 2.2f)
					}
				},
				new tr
				{
					nch = "NetShot",
					nci = "NetShot-Description",
					ncj = 60,
					ncl = (10, 15, 20),
					ncp = 7f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[1] { ShotType.Drop },
					ncu = new float[1],
					nda = new Rect[1]
					{
						new Rect(-3.05f, 0f, 6.1f, 1.8f)
					}
				},
				new tr
				{
					nch = "NetShot-Zones",
					nci = "NetShot-Zones-Description",
					ncj = 60,
					ncl = (10, 15, 20),
					ncp = 7f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[1] { ShotType.Drop },
					ncu = new float[1],
					nda = new Rect[3]
					{
						new Rect(-3.05f, 0f, 1.5f, 1.8f),
						new Rect(-0.75f, 0f, 1.5f, 1.8f),
						new Rect(1.55f, 0f, 1.5f, 1.8f)
					}
				},
				new ts
				{
					nch = "ThemeMatch",
					nci = "DropNetShot-ThemeMatch-Description",
					ndc = (rf a) => a.mvg.Last().mvi == ShotType.Drop
				}
			}
		},
		new tn
		{
			nca = TrainingType.DropNetShot,
			ncb = 2,
			nce = new Dictionary<CharacterStatsType, float>
			{
				{
					CharacterStatsType.Precision,
					0.9f
				},
				{
					CharacterStatsType.Stamina,
					0.1f
				}
			},
			ncd = new Dictionary<CharacterStatsType, float> { 
			{
				CharacterStatsType.Precision,
				70f
			} },
			ncc = new List<tp>
			{
				new tr
				{
					nch = "DropShot",
					nci = "DropShot-Description",
					ncj = 60,
					ncl = (5, 10, 15),
					ncp = 4f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[1],
					ncu = new float[3] { -1f, 0f, 1f },
					nda = new Rect[1]
					{
						new Rect(-3.05f, 0f, 6.1f, 2.2f)
					}
				},
				new tr
				{
					nch = "DropShot-Zones",
					nci = "DropShot-Zones-Description",
					ncj = 60,
					ncl = (5, 10, 15),
					ncp = 3f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[1],
					ncu = new float[3] { -1f, 0f, 1f },
					nda = new Rect[2]
					{
						new Rect(-3.05f, 0f, 1.5f, 2.2f),
						new Rect(1.55f, 0f, 1.5f, 2.2f)
					}
				},
				new tr
				{
					nch = "NetShot",
					nci = "NetShot-Description",
					ncj = 60,
					ncl = (10, 15, 20),
					ncp = 7f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[1] { ShotType.Drop },
					ncu = new float[3] { -1f, 0f, 1f },
					nda = new Rect[1]
					{
						new Rect(-3.05f, 0f, 6.1f, 1.8f)
					}
				},
				new tr
				{
					nch = "NetShot-Zones",
					nci = "NetShot-Zones-Description",
					ncj = 60,
					ncl = (10, 15, 20),
					ncp = 7f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[1] { ShotType.Drop },
					ncu = new float[3] { -1f, 0f, 1f },
					nda = new Rect[2]
					{
						new Rect(-3.05f, 0f, 1.5f, 1.8f),
						new Rect(1.55f, 0f, 1.5f, 1.8f)
					}
				},
				new ts
				{
					nch = "ThemeMatch",
					nci = "DropNetShot-ThemeMatch-Description",
					ndc = (rf a) => a.mvg.Last().mvi == ShotType.Drop
				}
			}
		},
		new tn
		{
			nca = TrainingType.DropNetShot,
			ncb = 3,
			nce = new Dictionary<CharacterStatsType, float>
			{
				{
					CharacterStatsType.Precision,
					0.9f
				},
				{
					CharacterStatsType.Stamina,
					0.1f
				}
			},
			ncd = new Dictionary<CharacterStatsType, float> { 
			{
				CharacterStatsType.Precision,
				80f
			} },
			ncc = new List<tp>
			{
				new tr
				{
					nch = "DropNetShot",
					nci = "DropNetShot-Description",
					ncj = 60,
					ncl = (10, 15, 20),
					ncp = 4f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[3]
					{
						ShotType.Drop,
						ShotType.Midcourt,
						ShotType.Clear
					},
					ncu = new float[3] { -1f, 0f, 1f },
					nda = new Rect[1]
					{
						new Rect(-3.05f, 0f, 6.1f, 2.2f)
					}
				},
				new tr
				{
					nch = "DropNetShot-Zones",
					nci = "DropNetShot-Zones-Description",
					ncj = 60,
					ncl = (5, 10, 15),
					ncp = 3f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[3]
					{
						ShotType.Drop,
						ShotType.Midcourt,
						ShotType.Clear
					},
					ncu = new float[3] { -1f, 0f, 1f },
					nda = new Rect[2]
					{
						new Rect(-3.05f, 0f, 1.5f, 2.2f),
						new Rect(1.55f, 0f, 1.5f, 2.2f)
					}
				},
				new ts
				{
					nch = "ThemeMatch",
					nci = "DropNetShot-ThemeMatch-Description",
					ndc = (rf a) => a.mvg.Last().mvi == ShotType.Drop
				}
			}
		},
		new tn
		{
			nca = TrainingType.SmashKillShot,
			ncb = 1,
			nce = new Dictionary<CharacterStatsType, float>
			{
				{
					CharacterStatsType.Power,
					0.7f
				},
				{
					CharacterStatsType.Stamina,
					0.3f
				}
			},
			ncc = new List<tp>
			{
				new tr
				{
					nch = "SmashShot",
					nci = "SmashShot-Description",
					ncj = 60,
					ncl = (10, 15, 20),
					ncp = 4f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[1],
					ncu = new float[1],
					ndb = new ShotType[1] { ShotType.Smash },
					nda = new Rect[1]
					{
						new Rect(-3.05f, 0.5f, 6.1f, 5.44f)
					}
				},
				new tr
				{
					nch = "SmashShot-Zones",
					nci = "SmashShot-Zones-Description",
					ncj = 60,
					ncl = (5, 10, 15),
					ncp = 3f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[1],
					ncu = new float[1],
					ndb = new ShotType[1] { ShotType.Smash },
					nda = new Rect[3]
					{
						new Rect(-3.05f, 0.5f, 1.5f, 5.44f),
						new Rect(-0.75f, 0.5f, 1.5f, 5.44f),
						new Rect(1.55f, 0.5f, 1.5f, 5.44f)
					}
				},
				new tr
				{
					nch = "KillShot",
					nci = "KillShot-Description",
					ncj = 60,
					ncl = (10, 15, 20),
					ncp = 7f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[1] { ShotType.Drop },
					ncr = 1f,
					ncu = new float[1],
					ndb = new ShotType[1] { ShotType.Smash },
					nda = new Rect[1]
					{
						new Rect(-3.05f, 0.5f, 6.1f, 5.44f)
					}
				},
				new tr
				{
					nch = "KillShot-2zones",
					nci = "KillShot-2zones-Description",
					ncj = 60,
					ncl = (5, 10, 15),
					ncp = 7f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[1] { ShotType.Drop },
					ncu = new float[2] { -0.7f, 0.7f },
					ndb = new ShotType[1] { ShotType.Smash },
					nda = new Rect[1]
					{
						new Rect(-3.05f, 0.5f, 6.1f, 5.44f)
					},
					ncr = 1.5f
				},
				new ts
				{
					nch = "ThemeMatch",
					nci = "SmashKillShot-ThemeMatch-Description",
					ndc = (rf a) => a.mvg.Last().mvi == ShotType.Smash && a.mvg.Last().mvj.y < 0f
				}
			}
		},
		new tn
		{
			nca = TrainingType.SmashKillShot,
			ncb = 2,
			nce = new Dictionary<CharacterStatsType, float>
			{
				{
					CharacterStatsType.Power,
					0.7f
				},
				{
					CharacterStatsType.Stamina,
					0.3f
				}
			},
			ncd = new Dictionary<CharacterStatsType, float> { 
			{
				CharacterStatsType.Power,
				70f
			} },
			ncc = new List<tp>
			{
				new tr
				{
					nch = "SmashShot",
					nci = "SmashShot-Description",
					ncj = 60,
					ncl = (10, 15, 20),
					ncp = 4f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[1],
					ncu = new float[3] { -1f, 0f, 1f },
					ndb = new ShotType[1] { ShotType.Smash },
					nda = new Rect[1]
					{
						new Rect(-3.05f, 0.5f, 6.1f, 5.44f)
					}
				},
				new tr
				{
					nch = "SmashShot-Zones",
					nci = "SmashShot-Zones-Description",
					ncj = 60,
					ncl = (5, 10, 15),
					ncp = 3f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[1],
					ncu = new float[3] { -1f, 0f, 1f },
					ndb = new ShotType[1] { ShotType.Smash },
					nda = new Rect[2]
					{
						new Rect(-3.05f, 0.5f, 1.5f, 5.44f),
						new Rect(1.55f, 0.5f, 1.5f, 5.44f)
					}
				},
				new tr
				{
					nch = "KillShot",
					nci = "KillShot-Description",
					ncj = 60,
					ncl = (10, 15, 20),
					ncp = 7f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[1] { ShotType.Drop },
					ncr = 1.5f,
					ncu = new float[3] { -0.7f, 0f, -0.7f },
					ndb = new ShotType[1] { ShotType.Smash },
					nda = new Rect[1]
					{
						new Rect(-3.05f, 0.5f, 6.1f, 5.44f)
					}
				},
				new tr
				{
					nch = "KillShot-Zones",
					nci = "KillShot-Zones-Description",
					ncj = 60,
					ncl = (5, 10, 15),
					ncp = 7f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[1] { ShotType.Drop },
					ncu = new float[3] { -0.7f, 0f, -0.7f },
					ndb = new ShotType[1] { ShotType.Smash },
					nda = new Rect[2]
					{
						new Rect(-3.05f, 0.5f, 1.5f, 5.44f),
						new Rect(1.55f, 0.5f, 1.5f, 5.44f)
					},
					ncr = 1.5f
				},
				new ts
				{
					nch = "ThemeMatch",
					nci = "SmashKillShot-ThemeMatch-Description",
					ndc = (rf a) => a.mvg.Last().mvi == ShotType.Smash && a.mvg.Last().mvj.y < 0f
				}
			}
		},
		new tn
		{
			nca = TrainingType.SmashKillShot,
			ncb = 3,
			nce = new Dictionary<CharacterStatsType, float>
			{
				{
					CharacterStatsType.Power,
					0.7f
				},
				{
					CharacterStatsType.Stamina,
					0.3f
				}
			},
			ncd = new Dictionary<CharacterStatsType, float> { 
			{
				CharacterStatsType.Power,
				80f
			} },
			ncc = new List<tp>
			{
				new tr
				{
					nch = "SmashKillShot",
					nci = "SmashKillShot-Description",
					ncj = 60,
					ncl = (10, 15, 20),
					ncp = 7f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[2]
					{
						ShotType.Clear,
						ShotType.Drop
					},
					ncr = 1.5f,
					ncu = new float[3] { -0.7f, 0f, -0.7f },
					ndb = new ShotType[1] { ShotType.Smash },
					nda = new Rect[1]
					{
						new Rect(-3.05f, 0.5f, 6.1f, 5.44f)
					}
				},
				new tr
				{
					nch = "SmashKillShot-Zones",
					nci = "SmashKillShot-Zones-Description",
					ncj = 60,
					ncl = (5, 10, 15),
					ncp = 7f,
					nco = 1f,
					ncn = true,
					ncq = 0.5f,
					ncs = new ShotType[2]
					{
						ShotType.Clear,
						ShotType.Drop
					},
					ncu = new float[3] { -0.7f, 0f, -0.7f },
					ndb = new ShotType[1] { ShotType.Smash },
					nda = new Rect[2]
					{
						new Rect(-3.05f, 0.5f, 1.5f, 5.44f),
						new Rect(1.55f, 0.5f, 1.5f, 5.44f)
					},
					ncr = 1.5f
				},
				new ts
				{
					nch = "ThemeMatch",
					nci = "SmashKillShot-ThemeMatch-Description",
					ndc = (rf a) => a.mvg.Last().mvi == ShotType.Smash && a.mvg.Last().mvj.y < 0f
				}
			}
		},
		new tn
		{
			nca = TrainingType.DriveShot,
			ncb = 1,
			nce = new Dictionary<CharacterStatsType, float>
			{
				{
					CharacterStatsType.Defense,
					0.3f
				},
				{
					CharacterStatsType.Speed,
					0.5f
				},
				{
					CharacterStatsType.Stamina,
					0.2f
				}
			},
			ncc = new List<tp>
			{
				new tr
				{
					nch = "DriveShot-Easy",
					nci = "DriveShot-Description",
					ncj = 60,
					ncl = (10, 20, 30),
					ncp = 4f,
					nco = 1f,
					ncq = 0.8f,
					ncs = new ShotType[1] { ShotType.Smash },
					ncu = new float[3] { -0.3f, 0f, 0.3f },
					ndb = new ShotType[1] { ShotType.Smash }
				},
				new tr
				{
					nch = "DriveShot-Medium",
					nci = "DriveShot-Description",
					ncj = 60,
					ncl = (10, 20, 30),
					ncp = 4f,
					nco = 1f,
					ncq = 0.8f,
					ncs = new ShotType[1] { ShotType.Smash },
					ncu = new float[5] { -0.7f, -0.3f, 0f, 0.3f, 0.7f },
					ndb = new ShotType[1] { ShotType.Smash }
				},
				new tr
				{
					nch = "DriveShot-Hard",
					nci = "DriveShot-Description",
					ncj = 60,
					ncl = (10, 20, 30),
					ncp = 4f,
					nco = 1f,
					ncq = 0.8f,
					ncs = new ShotType[1] { ShotType.Smash },
					ncu = new float[7] { -1f, -0.7f, -0.5f, 0f, 0.5f, 0.7f, 0.1f },
					ndb = new ShotType[1] { ShotType.Smash }
				}
			}
		},
		new tn
		{
			nca = TrainingType.DriveShot,
			ncb = 2,
			nce = new Dictionary<CharacterStatsType, float>
			{
				{
					CharacterStatsType.Defense,
					0.3f
				},
				{
					CharacterStatsType.Speed,
					0.5f
				},
				{
					CharacterStatsType.Stamina,
					0.2f
				}
			},
			ncd = new Dictionary<CharacterStatsType, float> { 
			{
				CharacterStatsType.Speed,
				70f
			} },
			ncc = new List<tp>
			{
				new tr
				{
					nch = "DriveShot-Easy",
					nci = "DriveShot-Description",
					ncj = 60,
					ncl = (20, 30, 40),
					ncp = 4f,
					nco = 1f,
					ncq = 0.6f,
					ncs = new ShotType[1] { ShotType.Smash },
					ncu = new float[3] { -0.3f, 0f, 0.3f },
					ndb = new ShotType[1] { ShotType.Smash }
				},
				new tr
				{
					nch = "DriveShot-Medium",
					nci = "DriveShot-Description",
					ncj = 60,
					ncl = (20, 30, 40),
					ncp = 4f,
					nco = 1f,
					ncq = 0.6f,
					ncs = new ShotType[1] { ShotType.Smash },
					ncu = new float[5] { -0.7f, -0.3f, 0f, 0.3f, 0.7f },
					ndb = new ShotType[1] { ShotType.Smash }
				},
				new tr
				{
					nch = "DriveShot-Hard",
					nci = "DriveShot-Description",
					ncj = 60,
					ncl = (20, 30, 40),
					ncp = 4f,
					nco = 1f,
					ncq = 0.6f,
					ncs = new ShotType[1] { ShotType.Smash },
					ncu = new float[7] { -1f, -0.7f, -0.5f, 0f, 0.5f, 0.7f, 0.1f },
					ndb = new ShotType[1] { ShotType.Smash }
				}
			}
		},
		new tn
		{
			nca = TrainingType.DriveShot,
			ncb = 3,
			nce = new Dictionary<CharacterStatsType, float>
			{
				{
					CharacterStatsType.Defense,
					0.3f
				},
				{
					CharacterStatsType.Speed,
					0.5f
				},
				{
					CharacterStatsType.Stamina,
					0.2f
				}
			},
			ncd = new Dictionary<CharacterStatsType, float> { 
			{
				CharacterStatsType.Speed,
				80f
			} },
			ncc = new List<tp>
			{
				new tr
				{
					nch = "DriveShot-Easy",
					nci = "DriveShot-Description",
					ncj = 60,
					ncl = (30, 45, 60),
					ncp = 4f,
					nco = 1f,
					ncq = 0.4f,
					ncs = new ShotType[1] { ShotType.Smash },
					ncu = new float[3] { -0.3f, 0f, 0.3f },
					ndb = new ShotType[1] { ShotType.Smash }
				},
				new tr
				{
					nch = "DriveShot-Medium",
					nci = "DriveShot-Description",
					ncj = 60,
					ncl = (30, 45, 60),
					ncp = 4f,
					nco = 1f,
					ncq = 0.4f,
					ncs = new ShotType[1] { ShotType.Smash },
					ncu = new float[5] { -0.7f, -0.3f, 0f, 0.3f, 0.7f },
					ndb = new ShotType[1] { ShotType.Smash }
				},
				new tr
				{
					nch = "DriveShot-Hard",
					nci = "DriveShot-Description",
					ncj = 60,
					ncl = (30, 45, 60),
					ncp = 4f,
					nco = 1f,
					ncq = 0.4f,
					ncs = new ShotType[1] { ShotType.Smash },
					ncu = new float[7] { -1f, -0.7f, -0.5f, 0f, 0.5f, 0.7f, 0.1f },
					ndb = new ShotType[1] { ShotType.Smash }
				}
			}
		},
		new tn
		{
			nca = TrainingType.Defense,
			ncb = 1,
			nce = new Dictionary<CharacterStatsType, float>
			{
				{
					CharacterStatsType.Defense,
					0.9f
				},
				{
					CharacterStatsType.Stamina,
					0.1f
				}
			},
			ncc = new List<tp>
			{
				new tr
				{
					nch = "Defense-Long",
					nci = "Defense-Long-Description",
					ncj = 60,
					ncl = (5, 10, 12),
					ncp = -8f,
					nco = 3f,
					ncq = 0.8f,
					ncs = new ShotType[1],
					ncu = new float[1],
					ncv = new ShotType[1] { ShotType.Smash },
					ncw = new float[1],
					ncz = false,
					ncy = new Vector2(0f, 4f),
					ndb = new ShotType[1],
					nda = new Rect[1]
					{
						new Rect(-3.05f, 5.945f, 6.1f, 0.76f)
					}
				},
				new tr
				{
					nch = "Defense-Long-Zones",
					nci = "Defense-Long-Zones-Description",
					ncj = 60,
					ncl = (5, 10, 12),
					ncp = -8f,
					nco = 3f,
					ncq = 0.8f,
					ncs = new ShotType[1],
					ncu = new float[1],
					ncv = new ShotType[1] { ShotType.Smash },
					ncw = new float[3] { -0.5f, 0f, 0.5f },
					ncz = false,
					ncy = new Vector2(0f, 4f),
					ndb = new ShotType[1],
					nda = new Rect[2]
					{
						new Rect(-3.05f, 5.945f, 3.05f, 0.76f),
						new Rect(0f, 5.945f, 3.05f, 0.76f)
					}
				},
				new tr
				{
					nch = "Defense-Short",
					nci = "Defense-Short-Description",
					ncj = 60,
					ncl = (5, 10, 12),
					ncp = -8f,
					nco = 3f,
					ncq = 0.8f,
					ncs = new ShotType[1],
					ncu = new float[1],
					ncv = new ShotType[1] { ShotType.Smash },
					ncw = new float[1],
					ncz = false,
					ncy = new Vector2(0f, 4f),
					ndb = new ShotType[1] { ShotType.Drop },
					nda = new Rect[1]
					{
						new Rect(-3.05f, 0f, 6.1f, 3.4f)
					}
				},
				new tr
				{
					nch = "Defense-Short-Zones",
					nci = "Defense-Short-Zones-Description",
					ncj = 60,
					ncl = (5, 10, 12),
					ncp = -8f,
					nco = 3f,
					ncq = 0.8f,
					ncs = new ShotType[1],
					ncu = new float[1],
					ncv = new ShotType[1] { ShotType.Smash },
					ncw = new float[3] { -0.5f, 0f, 0.5f },
					ncz = false,
					ncy = new Vector2(0f, 4f),
					ndb = new ShotType[1] { ShotType.Drop },
					nda = new Rect[2]
					{
						new Rect(-3.05f, 0f, 3.05f, 3.4f),
						new Rect(0f, 0f, 3.05f, 3.4f)
					}
				},
				new ts
				{
					nch = "ThemeMatch",
					nci = "Defense-ThemeMatch-Description",
					ndc = (rf a) => a.mvg.Count > 2 && a.mvg[a.mvg.Count - 2].mvi == ShotType.Smash && a.mvg[a.mvg.Count - 2].mvj.y < 0f
				}
			}
		},
		new tn
		{
			nca = TrainingType.Defense,
			ncb = 2,
			nce = new Dictionary<CharacterStatsType, float>
			{
				{
					CharacterStatsType.Defense,
					0.9f
				},
				{
					CharacterStatsType.Stamina,
					0.1f
				}
			},
			ncd = new Dictionary<CharacterStatsType, float> { 
			{
				CharacterStatsType.Defense,
				70f
			} },
			ncc = new List<tp>
			{
				new tr
				{
					nch = "Defense-Long",
					nci = "Defense-Long-Description",
					ncj = 60,
					ncl = (5, 10, 12),
					ncp = -8f,
					nco = 3f,
					ncq = 0.5f,
					ncs = new ShotType[1],
					ncu = new float[1],
					ncv = new ShotType[1] { ShotType.Smash },
					ncw = new float[3] { -1f, 0f, 1f },
					ncz = false,
					ncy = new Vector2(0f, 4f),
					ndb = new ShotType[1],
					nda = new Rect[1]
					{
						new Rect(-3.05f, 5.945f, 6.1f, 0.76f)
					}
				},
				new tr
				{
					nch = "Defense-Long-Zones",
					nci = "Defense-Long-Zones-Description",
					ncj = 60,
					ncl = (5, 10, 12),
					ncp = -8f,
					nco = 3f,
					ncq = 0.5f,
					ncs = new ShotType[1],
					ncu = new float[1],
					ncv = new ShotType[1] { ShotType.Smash },
					ncw = new float[3] { -1f, 0f, 1f },
					ncz = false,
					ncy = new Vector2(0f, 4f),
					ndb = new ShotType[1],
					nda = new Rect[2]
					{
						new Rect(-3.05f, 5.945f, 3.05f, 0.76f),
						new Rect(0f, 5.945f, 3.05f, 0.76f)
					}
				},
				new tr
				{
					nch = "Defense-Short",
					nci = "Defense-Short-Description",
					ncj = 60,
					ncl = (5, 10, 12),
					ncp = -8f,
					nco = 3f,
					ncq = 0.5f,
					ncs = new ShotType[1],
					ncu = new float[1],
					ncv = new ShotType[1] { ShotType.Smash },
					ncw = new float[3] { -1f, 0f, 1f },
					ncz = false,
					ncy = new Vector2(0f, 4f),
					ndb = new ShotType[1] { ShotType.Drop },
					nda = new Rect[1]
					{
						new Rect(-3.05f, 0f, 6.1f, 3f)
					}
				},
				new tr
				{
					nch = "Defense-Short-Zones",
					nci = "Defense-Short-Zones-Description",
					ncj = 60,
					ncl = (5, 10, 12),
					ncp = -8f,
					nco = 3f,
					ncq = 0.5f,
					ncs = new ShotType[1],
					ncu = new float[1],
					ncv = new ShotType[1] { ShotType.Smash },
					ncw = new float[3] { -1f, 0f, 1f },
					ncz = false,
					ncy = new Vector2(0f, 4f),
					ndb = new ShotType[1] { ShotType.Drop },
					nda = new Rect[2]
					{
						new Rect(-3.05f, 0f, 3.05f, 3f),
						new Rect(0f, 0f, 3.05f, 3f)
					}
				},
				new ts
				{
					nch = "ThemeMatch",
					nci = "Defense-ThemeMatch-Description",
					ndc = (rf a) => a.mvg.Count > 2 && a.mvg[a.mvg.Count - 2].mvi == ShotType.Smash && a.mvg[a.mvg.Count - 2].mvj.y < 0f
				}
			}
		},
		new tn
		{
			nca = TrainingType.Defense,
			ncb = 3,
			nce = new Dictionary<CharacterStatsType, float>
			{
				{
					CharacterStatsType.Defense,
					0.9f
				},
				{
					CharacterStatsType.Stamina,
					0.1f
				}
			},
			ncd = new Dictionary<CharacterStatsType, float> { 
			{
				CharacterStatsType.Defense,
				80f
			} },
			ncc = new List<tp>
			{
				new tr
				{
					nch = "Defense-Long-Zones",
					nci = "Defense-Long-Zones-Description",
					ncj = 60,
					ncl = (5, 10, 12),
					ncp = -8f,
					nco = 3f,
					ncq = 0.5f,
					ncs = new ShotType[1],
					ncu = new float[5] { -1f, -0.5f, 0f, 0.5f, 1f },
					ncv = new ShotType[1] { ShotType.Smash },
					ncw = new float[3] { -1f, 0f, 1f },
					ncz = false,
					ncy = new Vector2(0f, 4f),
					ndb = new ShotType[1],
					nda = new Rect[2]
					{
						new Rect(-3.05f, 5.945f, 3.05f, 0.76f),
						new Rect(0f, 5.945f, 3.05f, 0.76f)
					}
				},
				new tr
				{
					nch = "Defense-Short-Zones",
					nci = "Defense-Short-Zones-Description",
					ncj = 60,
					ncl = (5, 10, 12),
					ncp = -8f,
					nco = 3f,
					ncq = 0.5f,
					ncs = new ShotType[1],
					ncu = new float[5] { -1f, -0.5f, 0f, 0.5f, 1f },
					ncv = new ShotType[1] { ShotType.Smash },
					ncw = new float[3] { -1f, 0f, 1f },
					ncz = false,
					ncy = new Vector2(0f, 4f),
					ndb = new ShotType[1] { ShotType.Drop },
					nda = new Rect[2]
					{
						new Rect(-3.05f, 0f, 3.05f, 2.8f),
						new Rect(0f, 0f, 3.05f, 2.8f)
					}
				},
				new tr
				{
					nch = "Defense-Flat-Zones",
					nci = "Defense-Flat-Zones-Description",
					ncj = 90,
					ncl = (5, 10, 12),
					ncp = -8f,
					nco = 3f,
					ncq = 0.5f,
					ncs = new ShotType[1],
					ncu = new float[5] { -1f, -0.5f, 0f, 0.5f, 1f },
					ncv = new ShotType[1] { ShotType.Smash },
					ncw = new float[3] { -1f, 0f, 1f },
					ncz = false,
					ncy = new Vector2(0f, 4f),
					ndb = new ShotType[1] { ShotType.Smash },
					nda = new Rect[2]
					{
						new Rect(-3.05f, 0.5f, 1.5f, 6.2f),
						new Rect(1.55f, 0.5f, 1.5f, 6.2f)
					}
				},
				new ts
				{
					nch = "ThemeMatch",
					nci = "Defense-ThemeMatch-Description",
					ndc = (rf a) => a.mvg.Count > 2 && a.mvg[a.mvg.Count - 2].mvi == ShotType.Smash && a.mvg[a.mvg.Count - 2].mvj.y < 0f
				}
			}
		}
	}.OrderBy((tn a) => a.ncb).ToList();

	public static List<tp> ncg = new List<tp>
	{
		new tr
		{
			nch = "Tutorial-Clear",
			nci = "Tutorial-Clear-Description",
			nck = 5,
			ncp = 3f,
			nco = 1f,
			ncq = 2.5f,
			ncs = new ShotType[1],
			ncu = new float[3] { -0.3f, 0f, 0.3f },
			ndb = new ShotType[1],
			nda = new Rect[1]
			{
				new Rect(-3.05f, 5.945f, 6.1f, 0.76f)
			}
		},
		new tr
		{
			nch = "Tutorial-Smash",
			nci = "Tutorial-Smash-Description",
			nck = 5,
			ncp = 4f,
			nco = 1f,
			ncq = 1.5f,
			ncs = new ShotType[1],
			ncu = new float[3] { -0.3f, 0f, 0.3f },
			ndb = new ShotType[1] { ShotType.Smash },
			nda = new Rect[1]
			{
				new Rect(-3.05f, 0.5f, 6.1f, 5.44f)
			}
		},
		new tr
		{
			nch = "Tutorial-Net",
			nci = "Tutorial-Net-Description",
			nck = 5,
			ncp = 7f,
			nco = 1.5f,
			ncq = 1f,
			ncs = new ShotType[1] { ShotType.Drop },
			ncu = new float[3] { -0.3f, 0f, 0.3f },
			ndb = new ShotType[1] { ShotType.Drop },
			nda = new Rect[1]
			{
				new Rect(-3.05f, 0f, 6.1f, 1.8f)
			}
		},
		new tr
		{
			nch = "Tutorial-Defense",
			nci = "Tutorial-Defense-Description",
			nck = 5,
			ncp = -8f,
			nco = 3f,
			ncq = 1.5f,
			ncs = new ShotType[1],
			ncu = new float[1],
			ncv = new ShotType[1] { ShotType.Smash },
			ncw = new float[3] { -0.3f, 0f, 0.3f },
			ncz = false,
			ncy = new Vector2(0f, 4f),
			nda = new Rect[1]
			{
				new Rect(-3.05f, 0f, 6.1f, 6.705f)
			}
		}
	};

	public bool gqw(CharacterStats a)
	{
		if (ncd != null)
		{
			return ncd.Any((KeyValuePair<CharacterStatsType, float> a) => a.ftn(a.Key) < a.Value);
		}
		return false;
	}
}
