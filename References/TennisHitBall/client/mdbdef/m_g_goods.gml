// 创建日期:2011-7-14 16:36:09
// Access文件名:D:\Tennis_Trunk\Project0\publish\mdb\m_g_goods.mdb

set window
{
	var M_G_GOODS                                         ="m_g_goods.mdb";

	var AWARD                                             ="Award";
	var M_G_GOODS_AWARD_ENTRYID                           =0;   
	var M_G_GOODS_AWARD_ENTRYID_STR                       ="EntryId";                    // DBTYPE_I4           领奖识别id,物品ID

	var M_G_GOODS_AWARD_NAME                              =1;   
	var M_G_GOODS_AWARD_NAME_STR                          ="Name";                       // DBTYPE_WVARCHAR     名称

	var M_G_GOODS_AWARD_TYPE                              =2;   
	var M_G_GOODS_AWARD_TYPE_STR                          ="Type";                       // DBTYPE_I4           奖品的ID，例如：1001 法国3日游

	var M_G_GOODS_AWARD_INFO                              =3;   
	var M_G_GOODS_AWARD_INFO_STR                          ="Info";                       // DBTYPE_WVARCHAR     奖品描述


	var AWARDCHANGE                                       ="AwardChange";
	var M_G_GOODS_AWARDCHANGE_ID                          =0;   
	var M_G_GOODS_AWARDCHANGE_ID_STR                      ="id";                         // DBTYPE_NUMERIC      

	var M_G_GOODS_AWARDCHANGE_ITEMID                      =1;   
	var M_G_GOODS_AWARDCHANGE_ITEMID_STR                  ="ItemId";                     // DBTYPE_NUMERIC      

	var M_G_GOODS_AWARDCHANGE_ENTRYID                     =2;   
	var M_G_GOODS_AWARDCHANGE_ENTRYID_STR                 ="EntryId";                    // DBTYPE_I4           

	var M_G_GOODS_AWARDCHANGE_AWARDTYPE                   =3;   
	var M_G_GOODS_AWARDCHANGE_AWARDTYPE_STR               ="AwardType";                  // DBTYPE_I4           

	var M_G_GOODS_AWARDCHANGE_NAME                        =4;   
	var M_G_GOODS_AWARDCHANGE_NAME_STR                    ="Name";                       // DBTYPE_WVARCHAR     

	var M_G_GOODS_AWARDCHANGE_ADDRESS                     =5;   
	var M_G_GOODS_AWARDCHANGE_ADDRESS_STR                 ="Address";                    // DBTYPE_WVARCHAR     

	var M_G_GOODS_AWARDCHANGE_POSTCODE                    =6;   
	var M_G_GOODS_AWARDCHANGE_POSTCODE_STR                ="Postcode";                   // DBTYPE_WVARCHAR     

	var M_G_GOODS_AWARDCHANGE_PHONE                       =7;   
	var M_G_GOODS_AWARDCHANGE_PHONE_STR                   ="Phone";                      // DBTYPE_WVARCHAR     

	var M_G_GOODS_AWARDCHANGE_EMAIL                       =8;   
	var M_G_GOODS_AWARDCHANGE_EMAIL_STR                   ="EMail";                      // DBTYPE_WVARCHAR     

	var M_G_GOODS_AWARDCHANGE_CREATEDATE                  =9;   
	var M_G_GOODS_AWARDCHANGE_CREATEDATE_STR              ="CreateDate";                 // DBTYPE_DATE         


	var BOXINFO                                           ="BoxInfo";
	var M_G_GOODS_BOXINFO_ENTRYID                         =0;   
	var M_G_GOODS_BOXINFO_ENTRYID_STR                     ="EntryId";                    // DBTYPE_I4           宝箱开启id

	var M_G_GOODS_BOXINFO_CONSUMEITEMID                   =1;   
	var M_G_GOODS_BOXINFO_CONSUMEITEMID_STR               ="ConsumeItemId";              // DBTYPE_I4           开启宝箱钥匙id

	var M_G_GOODS_BOXINFO_CONSUMENUM                      =2;   
	var M_G_GOODS_BOXINFO_CONSUMENUM_STR                  ="ConsumeNum";                 // DBTYPE_I4           开启宝箱钥匙数量

	var M_G_GOODS_BOXINFO_PRICETYPE                       =3;   
	var M_G_GOODS_BOXINFO_PRICETYPE_STR                   ="PriceType";                  // DBTYPE_I4           开启宝箱花费类型

	var M_G_GOODS_BOXINFO_PRICE                           =4;   
	var M_G_GOODS_BOXINFO_PRICE_STR                       ="Price";                      // DBTYPE_I4           开启宝箱花费数量

	var M_G_GOODS_BOXINFO_MALEZONE1                       =5;   
	var M_G_GOODS_BOXINFO_MALEZONE1_STR                   ="MaleZone1";                  // DBTYPE_I4           掉落id

	var M_G_GOODS_BOXINFO_MALEZONE2                       =6;   
	var M_G_GOODS_BOXINFO_MALEZONE2_STR                   ="MaleZone2";                  // DBTYPE_I4           掉落id

	var M_G_GOODS_BOXINFO_MALEZONE3                       =7;   
	var M_G_GOODS_BOXINFO_MALEZONE3_STR                   ="MaleZone3";                  // DBTYPE_I4           掉落id

	var M_G_GOODS_BOXINFO_MALEZONE4                       =8;   
	var M_G_GOODS_BOXINFO_MALEZONE4_STR                   ="MaleZone4";                  // DBTYPE_I4           掉落id

	var M_G_GOODS_BOXINFO_MALEZONE5                       =9;   
	var M_G_GOODS_BOXINFO_MALEZONE5_STR                   ="MaleZone5";                  // DBTYPE_I4           掉落id

	var M_G_GOODS_BOXINFO_FEMALEZONE1                     =10;  
	var M_G_GOODS_BOXINFO_FEMALEZONE1_STR                 ="FemaleZone1";                // DBTYPE_I4           掉落id

	var M_G_GOODS_BOXINFO_FEMALEZONE2                     =11;  
	var M_G_GOODS_BOXINFO_FEMALEZONE2_STR                 ="FemaleZone2";                // DBTYPE_I4           掉落id

	var M_G_GOODS_BOXINFO_FEMALEZONE3                     =12;  
	var M_G_GOODS_BOXINFO_FEMALEZONE3_STR                 ="FemaleZone3";                // DBTYPE_I4           掉落id

	var M_G_GOODS_BOXINFO_FEMALEZONE4                     =13;  
	var M_G_GOODS_BOXINFO_FEMALEZONE4_STR                 ="FemaleZone4";                // DBTYPE_I4           掉落id

	var M_G_GOODS_BOXINFO_FEMALEZONE5                     =14;  
	var M_G_GOODS_BOXINFO_FEMALEZONE5_STR                 ="FemaleZone5";                // DBTYPE_I4           掉落id


	var DROPZONE                                          ="DropZone";
	var M_G_GOODS_DROPZONE_ENTRYID                        =0;   
	var M_G_GOODS_DROPZONE_ENTRYID_STR                    ="EntryId";                    // DBTYPE_I4           NPC掉落ID

	var M_G_GOODS_DROPZONE_DROPNUMODDS                    =1;   
	var M_G_GOODS_DROPZONE_DROPNUMODDS_STR                ="DropNumOdds";                // DBTYPE_WVARCHAR     掉落数量几率(数量,几率)

	var M_G_GOODS_DROPZONE_COLLECT1                       =2;   
	var M_G_GOODS_DROPZONE_COLLECT1_STR                   ="Collect1";                   // DBTYPE_WVARCHAR     集合内物品是否立即掉落不用随机(0:否,1:是);集合内物品最大筛选次数(0:无限制);物品集合1（物品i0,有效时间(单位:天,0:无限制),一次掉落数量,允许出现最大次数(0无限制),随机几率(80.00);）,总几率为各个物品掉落几率的集合,掉落限制数量未满时进入下一个集合

	var M_G_GOODS_DROPZONE_COLLECT2                       =3;   
	var M_G_GOODS_DROPZONE_COLLECT2_STR                   ="Collect2";                   // DBTYPE_WVARCHAR     物品集合2（同上）(多样物品尽量都写到同一个集合里)

	var M_G_GOODS_DROPZONE_COLLECT3                       =4;   
	var M_G_GOODS_DROPZONE_COLLECT3_STR                   ="Collect3";                   // DBTYPE_WVARCHAR     物品集合3（同上）

	var M_G_GOODS_DROPZONE_COLLECT4                       =5;   
	var M_G_GOODS_DROPZONE_COLLECT4_STR                   ="Collect4";                   // DBTYPE_WVARCHAR     物品集合4（同上）

	var M_G_GOODS_DROPZONE_COLLECT5                       =6;   
	var M_G_GOODS_DROPZONE_COLLECT5_STR                   ="Collect5";                   // DBTYPE_WVARCHAR     物品集合5（同上）


	var INLAYITEM                                         ="InlayItem";
	var M_G_GOODS_INLAYITEM_ENTRYID                       =0;   
	var M_G_GOODS_INLAYITEM_ENTRYID_STR                   ="EntryId";                    // DBTYPE_I4           0镶嵌物品id

	var M_G_GOODS_INLAYITEM_ROLELEVEL                     =1;   
	var M_G_GOODS_INLAYITEM_ROLELEVEL_STR                 ="RoleLevel";                  // DBTYPE_I4           1镶嵌需求角色等级,-1无限制

	var M_G_GOODS_INLAYITEM_ROLETITLE                     =2;   
	var M_G_GOODS_INLAYITEM_ROLETITLE_STR                 ="RoleTitle";                  // DBTYPE_I4           2镶嵌需求角色称号,-1无限制

	var M_G_GOODS_INLAYITEM_ITEMENTRYID                   =3;   
	var M_G_GOODS_INLAYITEM_ITEMENTRYID_STR               ="ItemEntryId";                // DBTYPE_I4           3镶嵌需求物品id,-1无限制

	var M_G_GOODS_INLAYITEM_ITEMLEVEL                     =4;   
	var M_G_GOODS_INLAYITEM_ITEMLEVEL_STR                 ="ItemLevel";                  // DBTYPE_I4           4镶嵌需求物品等级,-1无限制

	var M_G_GOODS_INLAYITEM_ITEMQUALITY                   =5;   
	var M_G_GOODS_INLAYITEM_ITEMQUALITY_STR               ="ItemQuality";                // DBTYPE_I4           5镶嵌需求物品品质,-1无限制

	var M_G_GOODS_INLAYITEM_SLOTPOS                       =6;   
	var M_G_GOODS_INLAYITEM_SLOTPOS_STR                   ="SlotPos";                    // DBTYPE_WVARCHAR     6镶嵌槽限制位置,为空则无限制(例子:1,4)

	var M_G_GOODS_INLAYITEM_PRICETYPE                     =7;   
	var M_G_GOODS_INLAYITEM_PRICETYPE_STR                 ="PriceType";                  // DBTYPE_I4           7镶嵌价格类型

	var M_G_GOODS_INLAYITEM_PRICE                         =8;   
	var M_G_GOODS_INLAYITEM_PRICE_STR                     ="Price";                      // DBTYPE_I4           8镶嵌价格

	var M_G_GOODS_INLAYITEM_SLOT1                         =9;   
	var M_G_GOODS_INLAYITEM_SLOT1_STR                     ="Slot1";                      // DBTYPE_I4           9镶嵌物品类型

	var M_G_GOODS_INLAYITEM_SLOT2                         =10;  
	var M_G_GOODS_INLAYITEM_SLOT2_STR                     ="Slot2";                      // DBTYPE_I4           10镶嵌物品类型

	var M_G_GOODS_INLAYITEM_SLOT3                         =11;  
	var M_G_GOODS_INLAYITEM_SLOT3_STR                     ="Slot3";                      // DBTYPE_I4           11镶嵌物品类型

	var M_G_GOODS_INLAYITEM_SLOT4                         =12;  
	var M_G_GOODS_INLAYITEM_SLOT4_STR                     ="Slot4";                      // DBTYPE_I4           12镶嵌物品类型

	var M_G_GOODS_INLAYITEM_SLOT5                         =13;  
	var M_G_GOODS_INLAYITEM_SLOT5_STR                     ="Slot5";                      // DBTYPE_I4           13镶嵌物品类型

	var M_G_GOODS_INLAYITEM_LVTYPE1                       =14;  
	var M_G_GOODS_INLAYITEM_LVTYPE1_STR                   ="LVType1";                    // DBTYPE_I4           镶嵌时需求角色类型为1：网前力量的等级

	var M_G_GOODS_INLAYITEM_LVTYPE2                       =15;  
	var M_G_GOODS_INLAYITEM_LVTYPE2_STR                   ="LVType2";                    // DBTYPE_I4           镶嵌时需求角色类型为2：底线力量的等级

	var M_G_GOODS_INLAYITEM_LVTYPE3                       =16;  
	var M_G_GOODS_INLAYITEM_LVTYPE3_STR                   ="LVType3";                    // DBTYPE_I4           镶嵌时需求角色类型为3：网前技巧的等级

	var M_G_GOODS_INLAYITEM_LVTYPE4                       =17;  
	var M_G_GOODS_INLAYITEM_LVTYPE4_STR                   ="LVType4";                    // DBTYPE_I4           镶嵌时需求角色类型为4：底线技巧的等级


	var ITEM_CLASS                                        ="Item_Class";
	var M_G_GOODS_ITEM_CLASS_ENTRYID                      =0;   
	var M_G_GOODS_ITEM_CLASS_ENTRYID_STR                  ="EntryId";                    // DBTYPE_I4           物品索引ID,对应DropCollect里指定的物品集合ID

	var M_G_GOODS_ITEM_CLASS_ITEM_LIST1                   =1;   
	var M_G_GOODS_ITEM_CLASS_ITEM_LIST1_STR               ="Item_List1";                 // DBTYPE_I4           返回第1类别物品ID;

	var M_G_GOODS_ITEM_CLASS_ITEM_LIST2                   =2;   
	var M_G_GOODS_ITEM_CLASS_ITEM_LIST2_STR               ="Item_List2";                 // DBTYPE_I4           返回第2类别物品ID;

	var M_G_GOODS_ITEM_CLASS_ITEM_LIST3                   =3;   
	var M_G_GOODS_ITEM_CLASS_ITEM_LIST3_STR               ="Item_List3";                 // DBTYPE_I4           返回第3类别物品ID;

	var M_G_GOODS_ITEM_CLASS_ITEM_LIST4                   =4;   
	var M_G_GOODS_ITEM_CLASS_ITEM_LIST4_STR               ="Item_List4";                 // DBTYPE_I4           返回第4类别物品ID;

	var M_G_GOODS_ITEM_CLASS_ITEM_LIST5                   =5;   
	var M_G_GOODS_ITEM_CLASS_ITEM_LIST5_STR               ="Item_List5";                 // DBTYPE_I4           返回第5类别物品ID;

	var M_G_GOODS_ITEM_CLASS_ITEM_LIST6                   =6;   
	var M_G_GOODS_ITEM_CLASS_ITEM_LIST6_STR               ="Item_List6";                 // DBTYPE_I4           返回第6类别物品ID;

	var M_G_GOODS_ITEM_CLASS_ITEM_LIST7                   =7;   
	var M_G_GOODS_ITEM_CLASS_ITEM_LIST7_STR               ="Item_List7";                 // DBTYPE_I4           返回第7类别物品ID;

	var M_G_GOODS_ITEM_CLASS_ITEM_LIST8                   =8;   
	var M_G_GOODS_ITEM_CLASS_ITEM_LIST8_STR               ="Item_List8";                 // DBTYPE_I4           返回第8类别物品ID;

	var M_G_GOODS_ITEM_CLASS_ITEM_LIST9                   =9;   
	var M_G_GOODS_ITEM_CLASS_ITEM_LIST9_STR               ="Item_List9";                 // DBTYPE_I4           返回第9类别物品ID;

	var M_G_GOODS_ITEM_CLASS_ITEM_LIST10                  =10;  
	var M_G_GOODS_ITEM_CLASS_ITEM_LIST10_STR              ="Item_List10";                // DBTYPE_I4           返回第10类别物品ID;

	var M_G_GOODS_ITEM_CLASS_ITEM_LIST11                  =11;  
	var M_G_GOODS_ITEM_CLASS_ITEM_LIST11_STR              ="Item_List11";                // DBTYPE_I4           返回第11类别物品ID;

	var M_G_GOODS_ITEM_CLASS_ITEM_LIST12                  =12;  
	var M_G_GOODS_ITEM_CLASS_ITEM_LIST12_STR              ="Item_List12";                // DBTYPE_I4           返回第12类别物品ID;

	var M_G_GOODS_ITEM_CLASS_ITEM_LIST13                  =13;  
	var M_G_GOODS_ITEM_CLASS_ITEM_LIST13_STR              ="Item_List13";                // DBTYPE_I4           返回第13类别物品ID;

	var M_G_GOODS_ITEM_CLASS_ITEM_LIST14                  =14;  
	var M_G_GOODS_ITEM_CLASS_ITEM_LIST14_STR              ="Item_List14";                // DBTYPE_I4           返回第14类别物品ID;

	var M_G_GOODS_ITEM_CLASS_ITEM_LIST15                  =15;  
	var M_G_GOODS_ITEM_CLASS_ITEM_LIST15_STR              ="Item_List15";                // DBTYPE_I4           返回第15类别物品ID;


	var ITEMATTUP                                         ="ItemAttUp";
	var M_G_GOODS_ITEMATTUP_ENTRYID                       =0;   
	var M_G_GOODS_ITEMATTUP_ENTRYID_STR                   ="EntryId";                    // DBTYPE_I4           唯一识别

	var M_G_GOODS_ITEMATTUP_ATTUPID                       =1;   
	var M_G_GOODS_ITEMATTUP_ATTUPID_STR                   ="AttUpId";                    // DBTYPE_I4           物品识别Id

	var M_G_GOODS_ITEMATTUP_LEVEL                         =2;   
	var M_G_GOODS_ITEMATTUP_LEVEL_STR                     ="Level";                      // DBTYPE_I4           等级

	var M_G_GOODS_ITEMATTUP_DAMAGETYPE1                   =3;   
	var M_G_GOODS_ITEMATTUP_DAMAGETYPE1_STR               ="DamageType1";                // DBTYPE_I4           伤害类型

	var M_G_GOODS_ITEMATTUP_DAMAGEMIN1                    =4;   
	var M_G_GOODS_ITEMATTUP_DAMAGEMIN1_STR                ="DamageMin1";                 // DBTYPE_R4           最小伤害

	var M_G_GOODS_ITEMATTUP_DAMAGEMAX1                    =5;   
	var M_G_GOODS_ITEMATTUP_DAMAGEMAX1_STR                ="DamageMax1";                 // DBTYPE_R4           最大伤害

	var M_G_GOODS_ITEMATTUP_DAMAGETYPE2                   =6;   
	var M_G_GOODS_ITEMATTUP_DAMAGETYPE2_STR               ="DamageType2";                // DBTYPE_I4           

	var M_G_GOODS_ITEMATTUP_DAMAGEMIN2                    =7;   
	var M_G_GOODS_ITEMATTUP_DAMAGEMIN2_STR                ="DamageMin2";                 // DBTYPE_R4           

	var M_G_GOODS_ITEMATTUP_DAMAGEMAX2                    =8;   
	var M_G_GOODS_ITEMATTUP_DAMAGEMAX2_STR                ="DamageMax2";                 // DBTYPE_R4           

	var M_G_GOODS_ITEMATTUP_DAMAGETYPE3                   =9;   
	var M_G_GOODS_ITEMATTUP_DAMAGETYPE3_STR               ="DamageType3";                // DBTYPE_I4           

	var M_G_GOODS_ITEMATTUP_DAMAGEMIN3                    =10;  
	var M_G_GOODS_ITEMATTUP_DAMAGEMIN3_STR                ="DamageMin3";                 // DBTYPE_R4           

	var M_G_GOODS_ITEMATTUP_DAMAGEMAX3                    =11;  
	var M_G_GOODS_ITEMATTUP_DAMAGEMAX3_STR                ="DamageMax3";                 // DBTYPE_R4           

	var M_G_GOODS_ITEMATTUP_DAMAGETYPE4                   =12;  
	var M_G_GOODS_ITEMATTUP_DAMAGETYPE4_STR               ="DamageType4";                // DBTYPE_I4           

	var M_G_GOODS_ITEMATTUP_DAMAGEMIN4                    =13;  
	var M_G_GOODS_ITEMATTUP_DAMAGEMIN4_STR                ="DamageMin4";                 // DBTYPE_R4           

	var M_G_GOODS_ITEMATTUP_DAMAGEMAX4                    =14;  
	var M_G_GOODS_ITEMATTUP_DAMAGEMAX4_STR                ="DamageMax4";                 // DBTYPE_R4           

	var M_G_GOODS_ITEMATTUP_DAMAGETYPE5                   =15;  
	var M_G_GOODS_ITEMATTUP_DAMAGETYPE5_STR               ="DamageType5";                // DBTYPE_I4           

	var M_G_GOODS_ITEMATTUP_DAMAGEMIN5                    =16;  
	var M_G_GOODS_ITEMATTUP_DAMAGEMIN5_STR                ="DamageMin5";                 // DBTYPE_R4           

	var M_G_GOODS_ITEMATTUP_DAMAGEMAX5                    =17;  
	var M_G_GOODS_ITEMATTUP_DAMAGEMAX5_STR                ="DamageMax5";                 // DBTYPE_R4           

	var M_G_GOODS_ITEMATTUP_ATTTYPE1                      =18;  
	var M_G_GOODS_ITEMATTUP_ATTTYPE1_STR                  ="AttType1";                   // DBTYPE_I4           附加属性类型

	var M_G_GOODS_ITEMATTUP_ATTVALUE1                     =19;  
	var M_G_GOODS_ITEMATTUP_ATTVALUE1_STR                 ="AttValue1";                  // DBTYPE_R4           附加属性类型值

	var M_G_GOODS_ITEMATTUP_ATTTYPE2                      =20;  
	var M_G_GOODS_ITEMATTUP_ATTTYPE2_STR                  ="AttType2";                   // DBTYPE_I4           

	var M_G_GOODS_ITEMATTUP_ATTVALUE2                     =21;  
	var M_G_GOODS_ITEMATTUP_ATTVALUE2_STR                 ="AttValue2";                  // DBTYPE_R4           

	var M_G_GOODS_ITEMATTUP_ATTTYPE3                      =22;  
	var M_G_GOODS_ITEMATTUP_ATTTYPE3_STR                  ="AttType3";                   // DBTYPE_I4           

	var M_G_GOODS_ITEMATTUP_ATTVALUE3                     =23;  
	var M_G_GOODS_ITEMATTUP_ATTVALUE3_STR                 ="AttValue3";                  // DBTYPE_R4           

	var M_G_GOODS_ITEMATTUP_ATTTYPE4                      =24;  
	var M_G_GOODS_ITEMATTUP_ATTTYPE4_STR                  ="AttType4";                   // DBTYPE_I4           

	var M_G_GOODS_ITEMATTUP_ATTVALUE4                     =25;  
	var M_G_GOODS_ITEMATTUP_ATTVALUE4_STR                 ="AttValue4";                  // DBTYPE_R4           

	var M_G_GOODS_ITEMATTUP_ATTTYPE5                      =26;  
	var M_G_GOODS_ITEMATTUP_ATTTYPE5_STR                  ="AttType5";                   // DBTYPE_I4           

	var M_G_GOODS_ITEMATTUP_ATTVALUE5                     =27;  
	var M_G_GOODS_ITEMATTUP_ATTVALUE5_STR                 ="AttValue5";                  // DBTYPE_R4           


	var ITEMLEVELUP                                       ="ItemLevelUp";
	var M_G_GOODS_ITEMLEVELUP_ENTRYID                     =0;   
	var M_G_GOODS_ITEMLEVELUP_ENTRYID_STR                 ="EntryId";                    // DBTYPE_I4           唯一识别

	var M_G_GOODS_ITEMLEVELUP_LEVELUPID                   =1;   
	var M_G_GOODS_ITEMLEVELUP_LEVELUPID_STR               ="LevelUpId";                  // DBTYPE_I4           等级升级Id

	var M_G_GOODS_ITEMLEVELUP_LEVEL                       =2;   
	var M_G_GOODS_ITEMLEVELUP_LEVEL_STR                   ="Level";                      // DBTYPE_I4           等级

	var M_G_GOODS_ITEMLEVELUP_EXP                         =3;   
	var M_G_GOODS_ITEMLEVELUP_EXP_STR                     ="Exp";                        // DBTYPE_I4           经验


	var ITEMLIMIT                                         ="ItemLimit";
	var M_G_GOODS_ITEMLIMIT_ENTRYID                       =0;   
	var M_G_GOODS_ITEMLIMIT_ENTRYID_STR                   ="EntryId";                    // DBTYPE_I4           

	var M_G_GOODS_ITEMLIMIT_CLASS                         =1;   
	var M_G_GOODS_ITEMLIMIT_CLASS_STR                     ="Class";                      // DBTYPE_I4           主类别

	var M_G_GOODS_ITEMLIMIT_SUBCLASS                      =2;   
	var M_G_GOODS_ITEMLIMIT_SUBCLASS_STR                  ="SubClass";                   // DBTYPE_I4           子类别

	var M_G_GOODS_ITEMLIMIT_BUY                           =3;   
	var M_G_GOODS_ITEMLIMIT_BUY_STR                       ="Buy";                        // DBTYPE_BOOL         购买

	var M_G_GOODS_ITEMLIMIT_SELL                          =4;   
	var M_G_GOODS_ITEMLIMIT_SELL_STR                      ="Sell";                       // DBTYPE_BOOL         出售

	var M_G_GOODS_ITEMLIMIT_DEAL                          =5;   
	var M_G_GOODS_ITEMLIMIT_DEAL_STR                      ="Deal";                       // DBTYPE_BOOL         交易

	var M_G_GOODS_ITEMLIMIT_REPAIR                        =6;   
	var M_G_GOODS_ITEMLIMIT_REPAIR_STR                    ="Repair";                     // DBTYPE_BOOL         修理

	var M_G_GOODS_ITEMLIMIT_DISCARD                       =7;   
	var M_G_GOODS_ITEMLIMIT_DISCARD_STR                   ="Discard";                    // DBTYPE_BOOL         丢弃

	var M_G_GOODS_ITEMLIMIT_MAIL                          =8;   
	var M_G_GOODS_ITEMLIMIT_MAIL_STR                      ="Mail";                       // DBTYPE_BOOL         邮件

	var M_G_GOODS_ITEMLIMIT_PRESENT                       =9;   
	var M_G_GOODS_ITEMLIMIT_PRESENT_STR                   ="Present";                    // DBTYPE_BOOL         赠送

	var M_G_GOODS_ITEMLIMIT_ATTACH                        =10;  
	var M_G_GOODS_ITEMLIMIT_ATTACH_STR                    ="Attach";                     // DBTYPE_BOOL         当作附加材料

	var M_G_GOODS_ITEMLIMIT_EQUIP                         =11;  
	var M_G_GOODS_ITEMLIMIT_EQUIP_STR                     ="Equip";                      // DBTYPE_BOOL         装备

	var M_G_GOODS_ITEMLIMIT_REQUIREDCLASS                 =12;  
	var M_G_GOODS_ITEMLIMIT_REQUIREDCLASS_STR             ="RequiredClass";              // DBTYPE_WVARCHAR     装备需求人物职业

	var M_G_GOODS_ITEMLIMIT_SHORTCUT                      =13;  
	var M_G_GOODS_ITEMLIMIT_SHORTCUT_STR                  ="Shortcut";                   // DBTYPE_BOOL         快捷栏拖拽

	var M_G_GOODS_ITEMLIMIT_PACKUSE                       =14;  
	var M_G_GOODS_ITEMLIMIT_PACKUSE_STR                   ="PackUse";                    // DBTYPE_BOOL         背包内使用

	var M_G_GOODS_ITEMLIMIT_INLAY                         =15;  
	var M_G_GOODS_ITEMLIMIT_INLAY_STR                     ="Inlay";                      // DBTYPE_BOOL         是否能够镶嵌

	var M_G_GOODS_ITEMLIMIT_BUYINDEX                      =16;  
	var M_G_GOODS_ITEMLIMIT_BUYINDEX_STR                  ="BuyIndex";                   // DBTYPE_I4           购买的显示排序

	var M_G_GOODS_ITEMLIMIT_RELET                         =17;  
	var M_G_GOODS_ITEMLIMIT_RELET_STR                     ="Relet";                      // DBTYPE_BOOL         期权续费


	var ITEMPACK                                          ="ItemPack";
	var M_G_GOODS_ITEMPACK_ENTRYID                        =0;   
	var M_G_GOODS_ITEMPACK_ENTRYID_STR                    ="EntryId";                    // DBTYPE_I4           打包物品id

	var M_G_GOODS_ITEMPACK_SUBENTRYID1                    =1;   
	var M_G_GOODS_ITEMPACK_SUBENTRYID1_STR                ="SubEntryId1";                // DBTYPE_I4           子物品id

	var M_G_GOODS_ITEMPACK_SUBNUM1                        =2;   
	var M_G_GOODS_ITEMPACK_SUBNUM1_STR                    ="SubNum1";                    // DBTYPE_I4           子物品数量

	var M_G_GOODS_ITEMPACK_SUBENTRYID2                    =3;   
	var M_G_GOODS_ITEMPACK_SUBENTRYID2_STR                ="SubEntryId2";                // DBTYPE_I4           

	var M_G_GOODS_ITEMPACK_SUBNUM2                        =4;   
	var M_G_GOODS_ITEMPACK_SUBNUM2_STR                    ="SubNum2";                    // DBTYPE_I4           

	var M_G_GOODS_ITEMPACK_SUBENTRYID3                    =5;   
	var M_G_GOODS_ITEMPACK_SUBENTRYID3_STR                ="SubEntryId3";                // DBTYPE_I4           

	var M_G_GOODS_ITEMPACK_SUBNUM3                        =6;   
	var M_G_GOODS_ITEMPACK_SUBNUM3_STR                    ="SubNum3";                    // DBTYPE_I4           

	var M_G_GOODS_ITEMPACK_SUBENTRYID4                    =7;   
	var M_G_GOODS_ITEMPACK_SUBENTRYID4_STR                ="SubEntryId4";                // DBTYPE_I4           

	var M_G_GOODS_ITEMPACK_SUBNUM4                        =8;   
	var M_G_GOODS_ITEMPACK_SUBNUM4_STR                    ="SubNum4";                    // DBTYPE_I4           

	var M_G_GOODS_ITEMPACK_SUBENTRYID5                    =9;   
	var M_G_GOODS_ITEMPACK_SUBENTRYID5_STR                ="SubEntryId5";                // DBTYPE_I4           

	var M_G_GOODS_ITEMPACK_SUBNUM5                        =10;  
	var M_G_GOODS_ITEMPACK_SUBNUM5_STR                    ="SubNum5";                    // DBTYPE_I4           

	var M_G_GOODS_ITEMPACK_SUBENTRYID6                    =11;  
	var M_G_GOODS_ITEMPACK_SUBENTRYID6_STR                ="SubEntryId6";                // DBTYPE_I4           

	var M_G_GOODS_ITEMPACK_SUBNUM6                        =12;  
	var M_G_GOODS_ITEMPACK_SUBNUM6_STR                    ="SubNum6";                    // DBTYPE_I4           

	var M_G_GOODS_ITEMPACK_SUBENTRYID7                    =13;  
	var M_G_GOODS_ITEMPACK_SUBENTRYID7_STR                ="SubEntryId7";                // DBTYPE_I4           

	var M_G_GOODS_ITEMPACK_SUBNUM7                        =14;  
	var M_G_GOODS_ITEMPACK_SUBNUM7_STR                    ="SubNum7";                    // DBTYPE_I4           

	var M_G_GOODS_ITEMPACK_SUBENTRYID8                    =15;  
	var M_G_GOODS_ITEMPACK_SUBENTRYID8_STR                ="SubEntryId8";                // DBTYPE_I4           

	var M_G_GOODS_ITEMPACK_SUBNUM8                        =16;  
	var M_G_GOODS_ITEMPACK_SUBNUM8_STR                    ="SubNum8";                    // DBTYPE_I4           

	var M_G_GOODS_ITEMPACK_SUBENTRYID9                    =17;  
	var M_G_GOODS_ITEMPACK_SUBENTRYID9_STR                ="SubEntryId9";                // DBTYPE_I4           

	var M_G_GOODS_ITEMPACK_SUBNUM9                        =18;  
	var M_G_GOODS_ITEMPACK_SUBNUM9_STR                    ="SubNum9";                    // DBTYPE_I4           

	var M_G_GOODS_ITEMPACK_SUBENTRYID10                   =19;  
	var M_G_GOODS_ITEMPACK_SUBENTRYID10_STR               ="SubEntryId10";               // DBTYPE_I4           

	var M_G_GOODS_ITEMPACK_SUBNUM10                       =20;  
	var M_G_GOODS_ITEMPACK_SUBNUM10_STR                   ="SubNum10";                   // DBTYPE_I4           


	var ITEMPRESENT                                       ="ItemPresent";
	var M_G_GOODS_ITEMPRESENT_ENTRYID                     =0;   
	var M_G_GOODS_ITEMPRESENT_ENTRYID_STR                 ="EntryId";                    // DBTYPE_NUMERIC      识别id

	var M_G_GOODS_ITEMPRESENT_SENDUSERID                  =1;   
	var M_G_GOODS_ITEMPRESENT_SENDUSERID_STR              ="SendUserId";                 // DBTYPE_I4           发起玩家id

	var M_G_GOODS_ITEMPRESENT_SENDUSER                    =2;   
	var M_G_GOODS_ITEMPRESENT_SENDUSER_STR                ="SendUser";                   // DBTYPE_WVARCHAR     发起玩家名字

	var M_G_GOODS_ITEMPRESENT_USERID                      =3;   
	var M_G_GOODS_ITEMPRESENT_USERID_STR                  ="UserId";                     // DBTYPE_I4           用户id

	var M_G_GOODS_ITEMPRESENT_TITLE                       =4;   
	var M_G_GOODS_ITEMPRESENT_TITLE_STR                   ="Title";                      // DBTYPE_WVARCHAR     标题

	var M_G_GOODS_ITEMPRESENT_MSG                         =5;   
	var M_G_GOODS_ITEMPRESENT_MSG_STR                     ="Msg";                        // DBTYPE_WLONGVARCHAR 留言

	var M_G_GOODS_ITEMPRESENT_ITEMGOODSID                 =6;   
	var M_G_GOODS_ITEMPRESENT_ITEMGOODSID_STR             ="ItemGoodsId";                // DBTYPE_NUMERIC      物品唯一id

	var M_G_GOODS_ITEMPRESENT_ITEMENTRYID                 =7;   
	var M_G_GOODS_ITEMPRESENT_ITEMENTRYID_STR             ="ItemEntryId";                // DBTYPE_I4           物品识别id

	var M_G_GOODS_ITEMPRESENT_NUMBER                      =8;   
	var M_G_GOODS_ITEMPRESENT_NUMBER_STR                  ="Number";                     // DBTYPE_I4           物品数量

	var M_G_GOODS_ITEMPRESENT_STATE                       =9;   
	var M_G_GOODS_ITEMPRESENT_STATE_STR                   ="State";                      // DBTYPE_I4           状态

	var M_G_GOODS_ITEMPRESENT_DEADLINE                    =10;  
	var M_G_GOODS_ITEMPRESENT_DEADLINE_STR                ="Deadline";                   // DBTYPE_NUMERIC      到期时间(秒)

	var M_G_GOODS_ITEMPRESENT_CREATEDATE                  =11;  
	var M_G_GOODS_ITEMPRESENT_CREATEDATE_STR              ="createdate";                 // DBTYPE_DATE         创建时间记录用

	var M_G_GOODS_ITEMPRESENT_ISCHECK                     =12;  
	var M_G_GOODS_ITEMPRESENT_ISCHECK_STR                 ="isCheck";                    // DBTYPE_I4           界面用 1选中 0未选中

	var M_G_GOODS_ITEMPRESENT_ISREAD                      =13;  
	var M_G_GOODS_ITEMPRESENT_ISREAD_STR                  ="isRead";                     // DBTYPE_I4           界面用 1已读 0未读


	var ITEMS                                             ="items";
	var M_G_GOODS_ITEMS_ENTRY                             =0;   
	var M_G_GOODS_ITEMS_ENTRY_STR                         ="Entry";                      // DBTYPE_I4           0 识别id 0

	var M_G_GOODS_ITEMS_CLASS                             =1;   
	var M_G_GOODS_ITEMS_CLASS_STR                         ="Class";                      // DBTYPE_I4           1 网球：主类别：分类  主类别*100+子类别（服装1: 上装0 裙/裤1 手套2 袜3 鞋4 球拍5；美容2: 头发0 五官1 ；饰品3: 护腕/手链0 项链1 眼镜2 背饰3 附件4）

	var M_G_GOODS_ITEMS_SUBCLASS                          =2;   
	var M_G_GOODS_ITEMS_SUBCLASS_STR                      ="SubClass";                   // DBTYPE_I4           注释接上（技能4：上旋0 削球1 扣杀2 放高球3 发球4；道具5：0聊天类 1辅助类） 2 子类别：持有就行0 宝箱1 老虎机2 点券金币兑换券3 实物兑换券4 大礼包5

	var M_G_GOODS_ITEMS_NAME                              =3;   
	var M_G_GOODS_ITEMS_NAME_STR                          ="Name";                       // DBTYPE_WVARCHAR     3 网球：名称

	var M_G_GOODS_ITEMS_DESCRIBE                          =4;   
	var M_G_GOODS_ITEMS_DESCRIBE_STR                      ="Describe";                   // DBTYPE_WVARCHAR     4 网球：描述

	var M_G_GOODS_ITEMS_MAXCOUNT                          =5;   
	var M_G_GOODS_ITEMS_MAXCOUNT_STR                      ="MaxCount";                   // DBTYPE_I4           5 网球：最大数量 0为无限多

	var M_G_GOODS_ITEMS_STACKABLE                         =6;   
	var M_G_GOODS_ITEMS_STACKABLE_STR                     ="Stackable";                  // DBTYPE_I4           6 网球：叠加数量 在一个格子中可以放入几个

	var M_G_GOODS_ITEMS_PACKCONTENT                       =7;   
	var M_G_GOODS_ITEMS_PACKCONTENT_STR                   ="PackContent";                // DBTYPE_I2           7 背包容量 不调用

	var M_G_GOODS_ITEMS_DURABLE                           =8;   
	var M_G_GOODS_ITEMS_DURABLE_STR                       ="Durable";                    // DBTYPE_I4           8 耐久

	var M_G_GOODS_ITEMS_DURABLESCALE                      =9;   
	var M_G_GOODS_ITEMS_DURABLESCALE_STR                  ="DurableScale";               // DBTYPE_I4           9 1点耐久比例

	var M_G_GOODS_ITEMS_QUALITY                           =10;  
	var M_G_GOODS_ITEMS_QUALITY_STR                       ="Quality";                    // DBTYPE_I4           10 等级

	var M_G_GOODS_ITEMS_BIND                              =11;  
	var M_G_GOODS_ITEMS_BIND_STR                          ="Bind";                       // DBTYPE_I4           11 绑定类别 0：无绑定 1：拾取绑定 2：装备绑定

	var M_G_GOODS_ITEMS_INVENTORYTYPE                     =12;  
	var M_G_GOODS_ITEMS_INVENTORYTYPE_STR                 ="Inventorytype";              // DBTYPE_I4           12 装备位置

	var M_G_GOODS_ITEMS_RANDPROP                          =13;  
	var M_G_GOODS_ITEMS_RANDPROP_STR                      ="RandProp";                   // DBTYPE_I4           13 随机属性id

	var M_G_GOODS_ITEMS_DISPLAY                           =14;  
	var M_G_GOODS_ITEMS_DISPLAY_STR                       ="Display";                    // DBTYPE_I4           14 显示id

	var M_G_GOODS_ITEMS_UNIQUELY                          =15;  
	var M_G_GOODS_ITEMS_UNIQUELY_STR                      ="Uniquely";                   // DBTYPE_I4           15 唯一物品

	var M_G_GOODS_ITEMS_REQUIREDCLASS                     =16;  
	var M_G_GOODS_ITEMS_REQUIREDCLASS_STR                 ="RequiredClass";              // DBTYPE_WVARCHAR     16 装备需求人物职业

	var M_G_GOODS_ITEMS_REQUIREDLEVEL                     =17;  
	var M_G_GOODS_ITEMS_REQUIREDLEVEL_STR                 ="RequiredLevel";              // DBTYPE_I4           17 装备需求人物等级

	var M_G_GOODS_ITEMS_REQUIREDRACE                      =18;  
	var M_G_GOODS_ITEMS_REQUIREDRACE_STR                  ="RequiredRace";               // DBTYPE_WVARCHAR     18 装备需求人物

	var M_G_GOODS_ITEMS_REQUIREDSKILL                     =19;  
	var M_G_GOODS_ITEMS_REQUIREDSKILL_STR                 ="RequiredSkill";              // DBTYPE_I4           19 装备需求技能

	var M_G_GOODS_ITEMS_REQUIREDSKILLLEVEL                =20;  
	var M_G_GOODS_ITEMS_REQUIREDSKILLLEVEL_STR            ="RequiredSkillLevel";         // DBTYPE_I4           20 装备需求技能等级

	var M_G_GOODS_ITEMS_REQUIREDMAPID                     =21;  
	var M_G_GOODS_ITEMS_REQUIREDMAPID_STR                 ="RequiredMapId";              // DBTYPE_I4           21 装备地图

	var M_G_GOODS_ITEMS_MAPID                             =22;  
	var M_G_GOODS_ITEMS_MAPID_STR                         ="MapID";                      // DBTYPE_I4           22 所属地图id

	var M_G_GOODS_ITEMS_USEPRICETYPE                      =23;  
	var M_G_GOODS_ITEMS_USEPRICETYPE_STR                  ="UsePriceType";               // DBTYPE_I4           23 网球：购买所需金币类型 1.金币 2.点券 3.奖券

	var M_G_GOODS_ITEMS_SELLPRICE                         =24;  
	var M_G_GOODS_ITEMS_SELLPRICE_STR                     ="SellPrice";                  // DBTYPE_I4           24 卖出价格

	var M_G_GOODS_ITEMS_BUYPRICE                          =25;  
	var M_G_GOODS_ITEMS_BUYPRICE_STR                      ="BuyPrice";                   // DBTYPE_I4           25 购买价格

	var M_G_GOODS_ITEMS_REPAIRPRICE                       =26;  
	var M_G_GOODS_ITEMS_REPAIRPRICE_STR                   ="RepairPrice";                // DBTYPE_I4           26 修理价格

	var M_G_GOODS_ITEMS_ATTVALUE                          =27;  
	var M_G_GOODS_ITEMS_ATTVALUE_STR                      ="AttValue";                   // DBTYPE_WVARCHAR     27 附加属性类型值 1.力量 2.技巧 3.网前 4.后场 5.发球 6.能量最大值 7.体力多个用逗号隔开

	var M_G_GOODS_ITEMS_SKILLTYPE                         =28;  
	var M_G_GOODS_ITEMS_SKILLTYPE_STR                     ="SkillType";                  // DBTYPE_I4           28 附加技能号

	var M_G_GOODS_ITEMS_SKILLSLOTCOLOR1                   =29;  
	var M_G_GOODS_ITEMS_SKILLSLOTCOLOR1_STR               ="SkillSlotColor1";            // DBTYPE_I4           29 技能槽 -1：无技能 其他数字:当前可镶嵌技能的ClassID

	var M_G_GOODS_ITEMS_SKILLSLOTCOLOR2                   =30;  
	var M_G_GOODS_ITEMS_SKILLSLOTCOLOR2_STR               ="SkillSlotColor2";            // DBTYPE_I4           30

	var M_G_GOODS_ITEMS_SKILLSLOTCOLOR3                   =31;  
	var M_G_GOODS_ITEMS_SKILLSLOTCOLOR3_STR               ="SkillSlotColor3";            // DBTYPE_I4           31

	var M_G_GOODS_ITEMS_SKILLSLOTCOLOR4                   =32;  
	var M_G_GOODS_ITEMS_SKILLSLOTCOLOR4_STR               ="SkillSlotColor4";            // DBTYPE_I4           32

	var M_G_GOODS_ITEMS_SKILLSLOTCOLOR5                   =33;  
	var M_G_GOODS_ITEMS_SKILLSLOTCOLOR5_STR               ="SkillSlotColor5";            // DBTYPE_I4           33

	var M_G_GOODS_ITEMS_LIMITTIME                         =34;  
	var M_G_GOODS_ITEMS_LIMITTIME_STR                     ="LimitTime";                  // DBTYPE_I4           34 时间限制

	var M_G_GOODS_ITEMS_ITEMSETID                         =35;  
	var M_G_GOODS_ITEMS_ITEMSETID_STR                     ="ItemSetId";                  // DBTYPE_I4           35 所属套装

	var M_G_GOODS_ITEMS_RANDODDSEFFECT                    =36;  
	var M_G_GOODS_ITEMS_RANDODDSEFFECT_STR                ="RandOddsEffect";             // DBTYPE_WVARCHAR     36 物品的随机几率效果

	var M_G_GOODS_ITEMS_COOLID                            =37;  
	var M_G_GOODS_ITEMS_COOLID_STR                        ="CoolId";                     // DBTYPE_I4           37 冷却BuffId

	var M_G_GOODS_ITEMS_HOTSELL                           =38;  
	var M_G_GOODS_ITEMS_HOTSELL_STR                       ="HotSell";                    // DBTYPE_I4           38 热卖标志 0:非热卖品 1:热卖品 废弃

	var M_G_GOODS_ITEMS_NEWITEMS                          =39;  
	var M_G_GOODS_ITEMS_NEWITEMS_STR                      ="NewItems";                   // DBTYPE_I4           39 新品标志 0:非新品 1:新品 废弃

	var M_G_GOODS_ITEMS_FUNCTIONINFO                      =40;  
	var M_G_GOODS_ITEMS_FUNCTIONINFO_STR                  ="FunctionInfo";               // DBTYPE_WVARCHAR     40 功能描述

	var M_G_GOODS_ITEMS_SCRIPTFUN                         =41;  
	var M_G_GOODS_ITEMS_SCRIPTFUN_STR                     ="ScriptFun";                  // DBTYPE_WVARCHAR     41 调用脚本函数名

	var M_G_GOODS_ITEMS_EQUIPFUN                          =42;  
	var M_G_GOODS_ITEMS_EQUIPFUN_STR                      ="EquipFun";                   // DBTYPE_WVARCHAR     42 装备/使用物品调用脚本函数名

	var M_G_GOODS_ITEMS_UNEQUIPFUN                        =43;  
	var M_G_GOODS_ITEMS_UNEQUIPFUN_STR                    ="UnEquipFun";                 // DBTYPE_WVARCHAR     43 卸载物品调用脚本函数名

	var M_G_GOODS_ITEMS_CANUSEFUN                         =44;  
	var M_G_GOODS_ITEMS_CANUSEFUN_STR                     ="CanUseFun";                  // DBTYPE_WVARCHAR     44 检查物品能否使用调用脚本函数名 95

	var M_G_GOODS_ITEMS_OPENBOXID                         =45;  
	var M_G_GOODS_ITEMS_OPENBOXID_STR                     ="OpenBoxId";                  // DBTYPE_I4           45 宝箱开启id

	var M_G_GOODS_ITEMS_LIMITBUYTIMECOUNT                 =46;  
	var M_G_GOODS_ITEMS_LIMITBUYTIMECOUNT_STR             ="LimitBuyTimeCount";          // DBTYPE_I4           46 网球：限时购买数量

	var M_G_GOODS_ITEMS_LIMITBUYTIME                      =47;  
	var M_G_GOODS_ITEMS_LIMITBUYTIME_STR                  ="LimitBuyTime";               // DBTYPE_I4           47 限时购买时长

	var M_G_GOODS_ITEMS_VALUE                             =48;  
	var M_G_GOODS_ITEMS_VALUE_STR                         ="value";                      // DBTYPE_I4           48 物品价值

	var M_G_GOODS_ITEMS_LEVELUPID                         =49;  
	var M_G_GOODS_ITEMS_LEVELUPID_STR                     ="LevelUpId";                  // DBTYPE_I4           49 等级升级id

	var M_G_GOODS_ITEMS_ATTUPID                           =50;  
	var M_G_GOODS_ITEMS_ATTUPID_STR                       ="AttUpId";                    // DBTYPE_I4           50 属性升级id

	var M_G_GOODS_ITEMS_CONVENIENT                        =51;  
	var M_G_GOODS_ITEMS_CONVENIENT_STR                    ="Convenient";                 // DBTYPE_I4           51 T网球大厅等热销标志 0:非热销品 1:热销品 废弃

	var M_G_GOODS_ITEMS_STATE                             =52;  
	var M_G_GOODS_ITEMS_STATE_STR                         ="State";                      // DBTYPE_I4           52 物品定义状态 0:关闭 1:有效（没有改变） 2:有效（关键信息有所改变） 3:有效（物品限制信息需要更新） 4:有效（整条信息需要更新和物品限制信息需要更新）

	var M_G_GOODS_ITEMS_OBJECTID                          =53;  
	var M_G_GOODS_ITEMS_OBJECTID_STR                      ="ObjectID";                   // DBTYPE_I4           53 与ObjectDef.csv表中对应的id

	var M_G_GOODS_ITEMS_SUBENTRY                          =54;  
	var M_G_GOODS_ITEMS_SUBENTRY_STR                      ="SubEntry";                   // DBTYPE_I4           54 网球：子物品id,打包物品

	var M_G_GOODS_ITEMS_SUBNUM                            =55;  
	var M_G_GOODS_ITEMS_SUBNUM_STR                        ="SubNum";                     // DBTYPE_I4           55 网球：子物品数量,打包物品

	var M_G_GOODS_ITEMS_DURABLEMAXSUB                     =56;  
	var M_G_GOODS_ITEMS_DURABLEMAXSUB_STR                 ="DurableMaxSub";              // DBTYPE_I4           56 耐久最大值减少(千位)

	var M_G_GOODS_ITEMS_CHOICE_QUALITY                    =57;  
	var M_G_GOODS_ITEMS_CHOICE_QUALITY_STR                ="Choice_Quality";             // DBTYPE_WVARCHAR     57 装备获得品质抽取几率(白装几率;绿装几率;蓝装几率)

	var M_G_GOODS_ITEMS_SEX                               =58;  
	var M_G_GOODS_ITEMS_SEX_STR                           ="Sex";                        // DBTYPE_I4           58 性别:1男 2女

	var M_G_GOODS_ITEMS_FREETRY                           =59;  
	var M_G_GOODS_ITEMS_FREETRY_STR                       ="FreeTry";                    // DBTYPE_I4           59 网球：物品的显示类型  0普通可购买物品 1是创建角色时的物品 -1不显示(不可购买)

	var M_G_GOODS_ITEMS_TBUYPRICE                         =60;  
	var M_G_GOODS_ITEMS_TBUYPRICE_STR                     ="TBuyPrice";                  // DBTYPE_WVARCHAR     60 网球：物品的购买价格 格式："700,1500,3000"

	var M_G_GOODS_ITEMS_TLIMITBUYTIME                     =61;  
	var M_G_GOODS_ITEMS_TLIMITBUYTIME_STR                 ="TLimitBuyTime";              // DBTYPE_WVARCHAR     61 网球：物品有效期 -1永久有效 0(7天) 1(15天) 2(30天):格式："7,15,30"

	var M_G_GOODS_ITEMS_ITENICON                          =62;  
	var M_G_GOODS_ITEMS_ITENICON_STR                      ="ItenIcon";                   // DBTYPE_WVARCHAR     62 网球：物品的图表名称

	var M_G_GOODS_ITEMS_EQUIPSKILL                        =63;  
	var M_G_GOODS_ITEMS_EQUIPSKILL_STR                    ="EquipSkill";                 // DBTYPE_WVARCHAR     63 网球：球拍上装备的技能 格式：“40001,40101,40201,40301,40401”

	var M_G_GOODS_ITEMS_ITEMPOS                           =64;  
	var M_G_GOODS_ITEMS_ITEMPOS_STR                       ="ItemPos";                    // DBTYPE_WVARCHAR     64 1发型 2面容 3眼镜 4项链 5上衣 6裙裤 7袜子 8鞋 9手套 10球拍 11背饰

	var M_G_GOODS_ITEMS_UIINDEX                           =65;  
	var M_G_GOODS_ITEMS_UIINDEX_STR                       ="uiindex";                    // DBTYPE_I4           65 网球：界面排序显示字段 可以按照类别单独排序

	var M_G_GOODS_ITEMS_SUITLIST                          =66;  
	var M_G_GOODS_ITEMS_SUITLIST_STR                      ="suitList";                   // DBTYPE_WVARCHAR     66 网球：套装列表

	var M_G_GOODS_ITEMS_TZONE                             =67;  
	var M_G_GOODS_ITEMS_TZONE_STR                         ="TZone";                      // DBTYPE_I4           67 网球：0.普通区 1.精品区 2.休闲区

	var M_G_GOODS_ITEMS_TSTATE                            =68;  
	var M_G_GOODS_ITEMS_TSTATE_STR                        ="TState";                     // DBTYPE_I4           68 网球：0.正常 1.限时 2.限量 3.新品 4.折扣 5.热销

	var M_G_GOODS_ITEMS_TSTARTTIME                        =69;  
	var M_G_GOODS_ITEMS_TSTARTTIME_STR                    ="TStartTime";                 // DBTYPE_DATE         69 网球：开始时间

	var M_G_GOODS_ITEMS_TENDTIME                          =70;  
	var M_G_GOODS_ITEMS_TENDTIME_STR                      ="TEndTime";                   // DBTYPE_DATE         70 网球：结束时间

	var M_G_GOODS_ITEMS_TDISCOUNT                         =71;  
	var M_G_GOODS_ITEMS_TDISCOUNT_STR                     ="TDiscount";                  // DBTYPE_WVARCHAR     71 网球：购买折扣价格 格式："700,1500,3000"

	var M_G_GOODS_ITEMS_TPRICEVIP                         =72;  
	var M_G_GOODS_ITEMS_TPRICEVIP_STR                     ="TPriceVIP";                  // DBTYPE_WVARCHAR     72 网球：VIP价格 格式："700,1500,3000"

	var M_G_GOODS_ITEMS_TPRICETYPEVIP                     =73;  
	var M_G_GOODS_ITEMS_TPRICETYPEVIP_STR                 ="TPriceTypeVIP";              // DBTYPE_I4           73 网球：VIP价格类型

	var M_G_GOODS_ITEMS_TAGIO                             =74;  
	var M_G_GOODS_ITEMS_TAGIO_STR                         ="TAgio";                      // DBTYPE_I4           74 网球：折扣

	var M_G_GOODS_ITEMS_TAGIOTYPE                         =75;  
	var M_G_GOODS_ITEMS_TAGIOTYPE_STR                     ="TAgioType";                  // DBTYPE_I4           75 网球：折扣卡类型 0：永久有效 1：一次性

	var M_G_GOODS_ITEMS_MALLBUYINDEX                      =76;  
	var M_G_GOODS_ITEMS_MALLBUYINDEX_STR                  ="MallBuyIndex";               // DBTYPE_I4           76商城物品排列顺序


	var ITEMSET                                           ="ItemSet";
	var M_G_GOODS_ITEMSET_ENTRYID                         =0;   
	var M_G_GOODS_ITEMSET_ENTRYID_STR                     ="EntryId";                    // DBTYPE_I4           套装id

	var M_G_GOODS_ITEMSET_NAME                            =1;   
	var M_G_GOODS_ITEMSET_NAME_STR                        ="Name";                       // DBTYPE_WVARCHAR     套装名称

	var M_G_GOODS_ITEMSET_ITEMID1                         =2;   
	var M_G_GOODS_ITEMSET_ITEMID1_STR                     ="ItemId1";                    // DBTYPE_I4           组件id

	var M_G_GOODS_ITEMSET_ITEMID2                         =3;   
	var M_G_GOODS_ITEMSET_ITEMID2_STR                     ="ItemId2";                    // DBTYPE_I4           

	var M_G_GOODS_ITEMSET_ITEMID3                         =4;   
	var M_G_GOODS_ITEMSET_ITEMID3_STR                     ="ItemId3";                    // DBTYPE_I4           

	var M_G_GOODS_ITEMSET_ITEMID4                         =5;   
	var M_G_GOODS_ITEMSET_ITEMID4_STR                     ="ItemId4";                    // DBTYPE_I4           

	var M_G_GOODS_ITEMSET_ITEMID5                         =6;   
	var M_G_GOODS_ITEMSET_ITEMID5_STR                     ="ItemId5";                    // DBTYPE_I4           

	var M_G_GOODS_ITEMSET_ITEMID6                         =7;   
	var M_G_GOODS_ITEMSET_ITEMID6_STR                     ="ItemId6";                    // DBTYPE_I4           

	var M_G_GOODS_ITEMSET_ITEMID7                         =8;   
	var M_G_GOODS_ITEMSET_ITEMID7_STR                     ="ItemId7";                    // DBTYPE_I4           

	var M_G_GOODS_ITEMSET_ITEMID8                         =9;   
	var M_G_GOODS_ITEMSET_ITEMID8_STR                     ="ItemId8";                    // DBTYPE_I4           

	var M_G_GOODS_ITEMSET_TRIGGER                         =10;  
	var M_G_GOODS_ITEMSET_TRIGGER_STR                     ="Trigger";                    // DBTYPE_I4           奖励触发 0：无效果 1：装备 2：携带

	var M_G_GOODS_ITEMSET_BOUN1                           =11;  
	var M_G_GOODS_ITEMSET_BOUN1_STR                       ="Boun1";                      // DBTYPE_WVARCHAR     附加奖励1(格式：类型，id，数值)

	var M_G_GOODS_ITEMSET_BOUN2                           =12;  
	var M_G_GOODS_ITEMSET_BOUN2_STR                       ="Boun2";                      // DBTYPE_WVARCHAR     

	var M_G_GOODS_ITEMSET_BOUN3                           =13;  
	var M_G_GOODS_ITEMSET_BOUN3_STR                       ="Boun3";                      // DBTYPE_WVARCHAR     

	var M_G_GOODS_ITEMSET_BOUN4                           =14;  
	var M_G_GOODS_ITEMSET_BOUN4_STR                       ="Boun4";                      // DBTYPE_WVARCHAR     

	var M_G_GOODS_ITEMSET_BOUN5                           =15;  
	var M_G_GOODS_ITEMSET_BOUN5_STR                       ="Boun5";                      // DBTYPE_WVARCHAR     

	var M_G_GOODS_ITEMSET_BOUN6                           =16;  
	var M_G_GOODS_ITEMSET_BOUN6_STR                       ="Boun6";                      // DBTYPE_WVARCHAR     

	var M_G_GOODS_ITEMSET_BOUN7                           =17;  
	var M_G_GOODS_ITEMSET_BOUN7_STR                       ="Boun7";                      // DBTYPE_WVARCHAR     

	var M_G_GOODS_ITEMSET_BOUN8                           =18;  
	var M_G_GOODS_ITEMSET_BOUN8_STR                       ="Boun8";                      // DBTYPE_WVARCHAR     


	var LIMITTIMEITEM                                     ="LimitTimeItem";
	var M_G_GOODS_LIMITTIMEITEM_ID                        =0;   
	var M_G_GOODS_LIMITTIMEITEM_ID_STR                    ="Id";                         // DBTYPE_NUMERIC      唯一标示

	var M_G_GOODS_LIMITTIMEITEM_SERVERID                  =1;   
	var M_G_GOODS_LIMITTIMEITEM_SERVERID_STR              ="ServerId";                   // DBTYPE_I4           用户服务器

	var M_G_GOODS_LIMITTIMEITEM_ENTRYID                   =2;   
	var M_G_GOODS_LIMITTIMEITEM_ENTRYID_STR               ="EntryId";                    // DBTYPE_I4           物品定义id

	var M_G_GOODS_LIMITTIMEITEM_NUM                       =3;   
	var M_G_GOODS_LIMITTIMEITEM_NUM_STR                   ="Num";                        // DBTYPE_I4           数量

	var M_G_GOODS_LIMITTIMEITEM_STARTTIME                 =4;   
	var M_G_GOODS_LIMITTIMEITEM_STARTTIME_STR             ="StartTime";                  // DBTYPE_DATE         开始时间

	var M_G_GOODS_LIMITTIMEITEM_ENDTIME                   =5;   
	var M_G_GOODS_LIMITTIMEITEM_ENDTIME_STR               ="EndTime";                    // DBTYPE_DATE         结束时间


	var MSYSIMEXCOLUMNS                                   ="MSysIMEXColumns";
	var M_G_GOODS_MSYSIMEXCOLUMNS_ATTRIBUTES              =0;   
	var M_G_GOODS_MSYSIMEXCOLUMNS_ATTRIBUTES_STR          ="Attributes";                 // DBTYPE_I4           

	var M_G_GOODS_MSYSIMEXCOLUMNS_DATATYPE                =1;   
	var M_G_GOODS_MSYSIMEXCOLUMNS_DATATYPE_STR            ="DataType";                   // DBTYPE_I2           

	var M_G_GOODS_MSYSIMEXCOLUMNS_FIELDNAME               =2;   
	var M_G_GOODS_MSYSIMEXCOLUMNS_FIELDNAME_STR           ="FieldName";                  // DBTYPE_WVARCHAR     

	var M_G_GOODS_MSYSIMEXCOLUMNS_INDEXTYPE               =3;   
	var M_G_GOODS_MSYSIMEXCOLUMNS_INDEXTYPE_STR           ="IndexType";                  // DBTYPE_UI1          

	var M_G_GOODS_MSYSIMEXCOLUMNS_SKIPCOLUMN              =4;   
	var M_G_GOODS_MSYSIMEXCOLUMNS_SKIPCOLUMN_STR          ="SkipColumn";                 // DBTYPE_BOOL         

	var M_G_GOODS_MSYSIMEXCOLUMNS_SPECID                  =5;   
	var M_G_GOODS_MSYSIMEXCOLUMNS_SPECID_STR              ="SpecID";                     // DBTYPE_I4           

	var M_G_GOODS_MSYSIMEXCOLUMNS_START                   =6;   
	var M_G_GOODS_MSYSIMEXCOLUMNS_START_STR               ="Start";                      // DBTYPE_I2           

	var M_G_GOODS_MSYSIMEXCOLUMNS_WIDTH                   =7;   
	var M_G_GOODS_MSYSIMEXCOLUMNS_WIDTH_STR               ="Width";                      // DBTYPE_I2           


	var MSYSIMEXSPECS                                     ="MSysIMEXSpecs";
	var M_G_GOODS_MSYSIMEXSPECS_DATEDELIM                 =0;   
	var M_G_GOODS_MSYSIMEXSPECS_DATEDELIM_STR             ="DateDelim";                  // DBTYPE_WVARCHAR     

	var M_G_GOODS_MSYSIMEXSPECS_DATEFOURDIGITYEAR         =1;   
	var M_G_GOODS_MSYSIMEXSPECS_DATEFOURDIGITYEAR_STR     ="DateFourDigitYear";          // DBTYPE_BOOL         

	var M_G_GOODS_MSYSIMEXSPECS_DATELEADINGZEROS          =2;   
	var M_G_GOODS_MSYSIMEXSPECS_DATELEADINGZEROS_STR      ="DateLeadingZeros";           // DBTYPE_BOOL         

	var M_G_GOODS_MSYSIMEXSPECS_DATEORDER                 =3;   
	var M_G_GOODS_MSYSIMEXSPECS_DATEORDER_STR             ="DateOrder";                  // DBTYPE_I2           

	var M_G_GOODS_MSYSIMEXSPECS_DECIMALPOINT              =4;   
	var M_G_GOODS_MSYSIMEXSPECS_DECIMALPOINT_STR          ="DecimalPoint";               // DBTYPE_WVARCHAR     

	var M_G_GOODS_MSYSIMEXSPECS_FIELDSEPARATOR            =5;   
	var M_G_GOODS_MSYSIMEXSPECS_FIELDSEPARATOR_STR        ="FieldSeparator";             // DBTYPE_WVARCHAR     

	var M_G_GOODS_MSYSIMEXSPECS_FILETYPE                  =6;   
	var M_G_GOODS_MSYSIMEXSPECS_FILETYPE_STR              ="FileType";                   // DBTYPE_I2           

	var M_G_GOODS_MSYSIMEXSPECS_SPECID                    =7;   
	var M_G_GOODS_MSYSIMEXSPECS_SPECID_STR                ="SpecID";                     // DBTYPE_I4           

	var M_G_GOODS_MSYSIMEXSPECS_SPECNAME                  =8;   
	var M_G_GOODS_MSYSIMEXSPECS_SPECNAME_STR              ="SpecName";                   // DBTYPE_WVARCHAR     

	var M_G_GOODS_MSYSIMEXSPECS_SPECTYPE                  =9;   
	var M_G_GOODS_MSYSIMEXSPECS_SPECTYPE_STR              ="SpecType";                   // DBTYPE_UI1          

	var M_G_GOODS_MSYSIMEXSPECS_STARTROW                  =10;  
	var M_G_GOODS_MSYSIMEXSPECS_STARTROW_STR              ="StartRow";                   // DBTYPE_I4           

	var M_G_GOODS_MSYSIMEXSPECS_TEXTDELIM                 =11;  
	var M_G_GOODS_MSYSIMEXSPECS_TEXTDELIM_STR             ="TextDelim";                  // DBTYPE_WVARCHAR     

	var M_G_GOODS_MSYSIMEXSPECS_TIMEDELIM                 =12;  
	var M_G_GOODS_MSYSIMEXSPECS_TIMEDELIM_STR             ="TimeDelim";                  // DBTYPE_WVARCHAR     


	var PLAYERCOLUMN                                      ="PlayerColumn";
	var M_G_GOODS_PLAYERCOLUMN_ENTRYID                    =0;   
	var M_G_GOODS_PLAYERCOLUMN_ENTRYID_STR                ="EntryId";                    // DBTYPE_I4           识别id

	var M_G_GOODS_PLAYERCOLUMN_OWNERID                    =1;   
	var M_G_GOODS_PLAYERCOLUMN_OWNERID_STR                ="OwnerId";                    // DBTYPE_I4           拥有者id

	var M_G_GOODS_PLAYERCOLUMN_FRAMEID                    =2;   
	var M_G_GOODS_PLAYERCOLUMN_FRAMEID_STR                ="FrameId";                    // DBTYPE_I4           栏位id（1-8）

	var M_G_GOODS_PLAYERCOLUMN_SLOT1_GID                  =3;   
	var M_G_GOODS_PLAYERCOLUMN_SLOT1_GID_STR              ="Slot1_gid";                  // DBTYPE_I4           物品唯一id

	var M_G_GOODS_PLAYERCOLUMN_SLOT1_CID                  =4;   
	var M_G_GOODS_PLAYERCOLUMN_SLOT1_CID_STR              ="Slot1_cid";                  // DBTYPE_I4           物品识别id

	var M_G_GOODS_PLAYERCOLUMN_SLOT2_GID                  =5;   
	var M_G_GOODS_PLAYERCOLUMN_SLOT2_GID_STR              ="Slot2_gid";                  // DBTYPE_I4           

	var M_G_GOODS_PLAYERCOLUMN_SLOT2_CID                  =6;   
	var M_G_GOODS_PLAYERCOLUMN_SLOT2_CID_STR              ="Slot2_cid";                  // DBTYPE_I4           物品识别id

	var M_G_GOODS_PLAYERCOLUMN_SLOT3_GID                  =7;   
	var M_G_GOODS_PLAYERCOLUMN_SLOT3_GID_STR              ="Slot3_gid";                  // DBTYPE_I4           

	var M_G_GOODS_PLAYERCOLUMN_SLOT3_CID                  =8;   
	var M_G_GOODS_PLAYERCOLUMN_SLOT3_CID_STR              ="Slot3_cid";                  // DBTYPE_I4           

	var M_G_GOODS_PLAYERCOLUMN_SLOT4_GID                  =9;   
	var M_G_GOODS_PLAYERCOLUMN_SLOT4_GID_STR              ="Slot4_gid";                  // DBTYPE_I4           

	var M_G_GOODS_PLAYERCOLUMN_SLOT4_CID                  =10;  
	var M_G_GOODS_PLAYERCOLUMN_SLOT4_CID_STR              ="Slot4_cid";                  // DBTYPE_I4           

	var M_G_GOODS_PLAYERCOLUMN_SLOT5_GID                  =11;  
	var M_G_GOODS_PLAYERCOLUMN_SLOT5_GID_STR              ="Slot5_gid";                  // DBTYPE_I4           

	var M_G_GOODS_PLAYERCOLUMN_SLOT5_CID                  =12;  
	var M_G_GOODS_PLAYERCOLUMN_SLOT5_CID_STR              ="Slot5_cid";                  // DBTYPE_I4           

	var M_G_GOODS_PLAYERCOLUMN_SLOT6_GID                  =13;  
	var M_G_GOODS_PLAYERCOLUMN_SLOT6_GID_STR              ="Slot6_gid";                  // DBTYPE_I4           

	var M_G_GOODS_PLAYERCOLUMN_SLOT6_CID                  =14;  
	var M_G_GOODS_PLAYERCOLUMN_SLOT6_CID_STR              ="Slot6_cid";                  // DBTYPE_I4           

	var M_G_GOODS_PLAYERCOLUMN_SLOT7_GID                  =15;  
	var M_G_GOODS_PLAYERCOLUMN_SLOT7_GID_STR              ="Slot7_gid";                  // DBTYPE_I4           

	var M_G_GOODS_PLAYERCOLUMN_SLOT7_CID                  =16;  
	var M_G_GOODS_PLAYERCOLUMN_SLOT7_CID_STR              ="Slot7_cid";                  // DBTYPE_I4           

	var M_G_GOODS_PLAYERCOLUMN_SLOT8_GID                  =17;  
	var M_G_GOODS_PLAYERCOLUMN_SLOT8_GID_STR              ="Slot8_gid";                  // DBTYPE_I4           

	var M_G_GOODS_PLAYERCOLUMN_SLOT8_CID                  =18;  
	var M_G_GOODS_PLAYERCOLUMN_SLOT8_CID_STR              ="Slot8_cid";                  // DBTYPE_I4           


	var PLAYERITEMS                                       ="playerItems";
	var M_G_GOODS_PLAYERITEMS_GID                         =0;   
	var M_G_GOODS_PLAYERITEMS_GID_STR                     ="gid";                        // DBTYPE_NUMERIC      物品唯一id

	var M_G_GOODS_PLAYERITEMS_CID                         =1;   
	var M_G_GOODS_PLAYERITEMS_CID_STR                     ="cid";                        // DBTYPE_I4           物品识别id

	var M_G_GOODS_PLAYERITEMS_OWNERID                     =2;   
	var M_G_GOODS_PLAYERITEMS_OWNERID_STR                 ="ownerid";                    // DBTYPE_I4           拥有者

	var M_G_GOODS_PLAYERITEMS_AUTHOR                      =3;   
	var M_G_GOODS_PLAYERITEMS_AUTHOR_STR                  ="author";                     // DBTYPE_WVARCHAR     制造者名称

	var M_G_GOODS_PLAYERITEMS_NUM                         =4;   
	var M_G_GOODS_PLAYERITEMS_NUM_STR                     ="num";                        // DBTYPE_I4           数量

	var M_G_GOODS_PLAYERITEMS_DURABILITY                  =5;   
	var M_G_GOODS_PLAYERITEMS_DURABILITY_STR              ="durability";                 // DBTYPE_I4           耐久

	var M_G_GOODS_PLAYERITEMS_DURABILITYMAX               =6;   
	var M_G_GOODS_PLAYERITEMS_DURABILITYMAX_STR           ="durabilityMax";              // DBTYPE_I4           最大耐久

	var M_G_GOODS_PLAYERITEMS_EQUIP                       =7;   
	var M_G_GOODS_PLAYERITEMS_EQUIP_STR                   ="equip";                      // DBTYPE_NUMERIC      装备人物

	var M_G_GOODS_PLAYERITEMS_EQUIPPOS                    =8;   
	var M_G_GOODS_PLAYERITEMS_EQUIPPOS_STR                ="equippos";                   // DBTYPE_I4           装备位置

	var M_G_GOODS_PLAYERITEMS_QUALITY                     =9;   
	var M_G_GOODS_PLAYERITEMS_QUALITY_STR                 ="quality";                    // DBTYPE_I2           品质

	var M_G_GOODS_PLAYERITEMS_LV                          =10;  
	var M_G_GOODS_PLAYERITEMS_LV_STR                      ="lv";                         // DBTYPE_I4           成长等级

	var M_G_GOODS_PLAYERITEMS_LVMAX                       =11;  
	var M_G_GOODS_PLAYERITEMS_LVMAX_STR                   ="lvMax";                      // DBTYPE_I4           最大成长等级

	var M_G_GOODS_PLAYERITEMS_EXP                         =12;  
	var M_G_GOODS_PLAYERITEMS_EXP_STR                     ="exp";                        // DBTYPE_I4           成长经验

	var M_G_GOODS_PLAYERITEMS_BIND                        =13;  
	var M_G_GOODS_PLAYERITEMS_BIND_STR                    ="bind";                       // DBTYPE_I4           绑定状态

	var M_G_GOODS_PLAYERITEMS_PACKID                      =14;  
	var M_G_GOODS_PLAYERITEMS_PACKID_STR                  ="packId";                     // DBTYPE_I4           背包id

	var M_G_GOODS_PLAYERITEMS_PACKPOS                     =15;  
	var M_G_GOODS_PLAYERITEMS_PACKPOS_STR                 ="packPos";                    // DBTYPE_I4           背包位置

	var M_G_GOODS_PLAYERITEMS_GEMSLOT1                    =16;  
	var M_G_GOODS_PLAYERITEMS_GEMSLOT1_STR                ="gemSlot1";                   // DBTYPE_I4           宝石槽

	var M_G_GOODS_PLAYERITEMS_GEMSLOT2                    =17;  
	var M_G_GOODS_PLAYERITEMS_GEMSLOT2_STR                ="gemSlot2";                   // DBTYPE_I4           

	var M_G_GOODS_PLAYERITEMS_GEMSLOT3                    =18;  
	var M_G_GOODS_PLAYERITEMS_GEMSLOT3_STR                ="gemSlot3";                   // DBTYPE_I4           

	var M_G_GOODS_PLAYERITEMS_GEMSLOT4                    =19;  
	var M_G_GOODS_PLAYERITEMS_GEMSLOT4_STR                ="gemSlot4";                   // DBTYPE_I4           

	var M_G_GOODS_PLAYERITEMS_GEMSLOT5                    =20;  
	var M_G_GOODS_PLAYERITEMS_GEMSLOT5_STR                ="gemSlot5";                   // DBTYPE_I4           

	var M_G_GOODS_PLAYERITEMS_ATTACH1                     =21;  
	var M_G_GOODS_PLAYERITEMS_ATTACH1_STR                 ="attach1";                    // DBTYPE_WVARCHAR     附加能力

	var M_G_GOODS_PLAYERITEMS_ATTACH2                     =22;  
	var M_G_GOODS_PLAYERITEMS_ATTACH2_STR                 ="attach2";                    // DBTYPE_WVARCHAR     

	var M_G_GOODS_PLAYERITEMS_DEADLINE                    =23;  
	var M_G_GOODS_PLAYERITEMS_DEADLINE_STR                ="Deadline";                   // DBTYPE_NUMERIC      截止日期

	var M_G_GOODS_PLAYERITEMS_STATE                       =24;  
	var M_G_GOODS_PLAYERITEMS_STATE_STR                   ="state";                      // DBTYPE_I4           状态

	var M_G_GOODS_PLAYERITEMS_CREATER                     =25;  
	var M_G_GOODS_PLAYERITEMS_CREATER_STR                 ="creater";                    // DBTYPE_I4           创建者

	var M_G_GOODS_PLAYERITEMS_CREATETYPE                  =26;  
	var M_G_GOODS_PLAYERITEMS_CREATETYPE_STR              ="createtype";                 // DBTYPE_I4           

	var M_G_GOODS_PLAYERITEMS_CREATETM                    =27;  
	var M_G_GOODS_PLAYERITEMS_CREATETM_STR                ="createtm";                   // DBTYPE_WCHAR        


	var RANDITEM                                          ="RandItem";
	var M_G_GOODS_RANDITEM_ENTRYID                        =0;   
	var M_G_GOODS_RANDITEM_ENTRYID_STR                    ="EntryId";                    // DBTYPE_I4           随机识别id

	var M_G_GOODS_RANDITEM_NAME                           =1;   
	var M_G_GOODS_RANDITEM_NAME_STR                       ="Name";                       // DBTYPE_WVARCHAR     随机名称

	var M_G_GOODS_RANDITEM_PREFIXALINDEX                  =2;   
	var M_G_GOODS_RANDITEM_PREFIXALINDEX_STR              ="PrefixalIndex";              // DBTYPE_WVARCHAR     随机前缀

	var M_G_GOODS_RANDITEM_ITEMQUALITY                    =3;   
	var M_G_GOODS_RANDITEM_ITEMQUALITY_STR                ="ItemQuality";                // DBTYPE_WVARCHAR     随机物品品质

	var M_G_GOODS_RANDITEM_ITEMLEVEL                      =4;   
	var M_G_GOODS_RANDITEM_ITEMLEVEL_STR                  ="ItemLevel";                  // DBTYPE_WVARCHAR     随机物品等级

	var M_G_GOODS_RANDITEM_ITEMDISPLAY                    =5;   
	var M_G_GOODS_RANDITEM_ITEMDISPLAY_STR                ="ItemDisplay";                // DBTYPE_WVARCHAR     随机物品显示id

	var M_G_GOODS_RANDITEM_RANDCOEFFICIENT                =6;   
	var M_G_GOODS_RANDITEM_RANDCOEFFICIENT_STR            ="RandCoefficient";            // DBTYPE_I4           系数

	var M_G_GOODS_RANDITEM_RANDPROP1                      =7;   
	var M_G_GOODS_RANDITEM_RANDPROP1_STR                  ="RandProp1";                  // DBTYPE_WVARCHAR     随机属性，<0或不填为无效的随机属性id，（格式：9[80:10]，为随机属性id9，随机3次，基本几率依次为100、80、10）

	var M_G_GOODS_RANDITEM_RANDPROP2                      =8;   
	var M_G_GOODS_RANDITEM_RANDPROP2_STR                  ="RandProp2";                  // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDITEM_RANDPROP3                      =9;   
	var M_G_GOODS_RANDITEM_RANDPROP3_STR                  ="RandProp3";                  // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDITEM_RANDPROP4                      =10;  
	var M_G_GOODS_RANDITEM_RANDPROP4_STR                  ="RandProp4";                  // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDITEM_RANDPROP5                      =11;  
	var M_G_GOODS_RANDITEM_RANDPROP5_STR                  ="RandProp5";                  // DBTYPE_WVARCHAR     


	var RANDPROP                                          ="RandProp";
	var M_G_GOODS_RANDPROP_ENTRYID                        =0;   
	var M_G_GOODS_RANDPROP_ENTRYID_STR                    ="EntryId";                    // DBTYPE_I4           随机属性识别id

	var M_G_GOODS_RANDPROP_ATTACKTYPE1                    =1;   
	var M_G_GOODS_RANDPROP_ATTACKTYPE1_STR                ="AttackType1";                // DBTYPE_WVARCHAR     攻击类型

	var M_G_GOODS_RANDPROP_ATTACKMIN1                     =2;   
	var M_G_GOODS_RANDPROP_ATTACKMIN1_STR                 ="AttackMin1";                 // DBTYPE_WVARCHAR     攻击力最小值

	var M_G_GOODS_RANDPROP_ATTACKMAX1                     =3;   
	var M_G_GOODS_RANDPROP_ATTACKMAX1_STR                 ="AttackMax1";                 // DBTYPE_WVARCHAR     攻击力最大值

	var M_G_GOODS_RANDPROP_ATTACKTYPE2                    =4;   
	var M_G_GOODS_RANDPROP_ATTACKTYPE2_STR                ="AttackType2";                // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_ATTACKMIN2                     =5;   
	var M_G_GOODS_RANDPROP_ATTACKMIN2_STR                 ="AttackMin2";                 // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_ATTACKMAX2                     =6;   
	var M_G_GOODS_RANDPROP_ATTACKMAX2_STR                 ="AttackMax2";                 // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_ATTACKTYPE3                    =7;   
	var M_G_GOODS_RANDPROP_ATTACKTYPE3_STR                ="AttackType3";                // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_ATTACKMIN3                     =8;   
	var M_G_GOODS_RANDPROP_ATTACKMIN3_STR                 ="AttackMin3";                 // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_ATTACKMAX3                     =9;   
	var M_G_GOODS_RANDPROP_ATTACKMAX3_STR                 ="AttackMax3";                 // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_ATTACKTYPE4                    =10;  
	var M_G_GOODS_RANDPROP_ATTACKTYPE4_STR                ="AttackType4";                // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_ATTACKMIN4                     =11;  
	var M_G_GOODS_RANDPROP_ATTACKMIN4_STR                 ="AttackMin4";                 // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_ATTACKMAX4                     =12;  
	var M_G_GOODS_RANDPROP_ATTACKMAX4_STR                 ="AttackMax4";                 // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_ATTACKTYPE5                    =13;  
	var M_G_GOODS_RANDPROP_ATTACKTYPE5_STR                ="AttackType5";                // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_ATTACKMIN5                     =14;  
	var M_G_GOODS_RANDPROP_ATTACKMIN5_STR                 ="AttackMin5";                 // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_ATTACKMAX5                     =15;  
	var M_G_GOODS_RANDPROP_ATTACKMAX5_STR                 ="AttackMax5";                 // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_ATTTYPE1                       =16;  
	var M_G_GOODS_RANDPROP_ATTTYPE1_STR                   ="AttType1";                   // DBTYPE_WVARCHAR     属性类型

	var M_G_GOODS_RANDPROP_ATTVALUE1                      =17;  
	var M_G_GOODS_RANDPROP_ATTVALUE1_STR                  ="AttValue1";                  // DBTYPE_WVARCHAR     属性值

	var M_G_GOODS_RANDPROP_ATTTYPE2                       =18;  
	var M_G_GOODS_RANDPROP_ATTTYPE2_STR                   ="AttType2";                   // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_ATTVALUE2                      =19;  
	var M_G_GOODS_RANDPROP_ATTVALUE2_STR                  ="AttValue2";                  // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_ATTTYPE3                       =20;  
	var M_G_GOODS_RANDPROP_ATTTYPE3_STR                   ="AttType3";                   // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_ATTVALUE3                      =21;  
	var M_G_GOODS_RANDPROP_ATTVALUE3_STR                  ="AttValue3";                  // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_ATTTYPE4                       =22;  
	var M_G_GOODS_RANDPROP_ATTTYPE4_STR                   ="AttType4";                   // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_ATTVALUE4                      =23;  
	var M_G_GOODS_RANDPROP_ATTVALUE4_STR                  ="AttValue4";                  // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_ATTTYPE5                       =24;  
	var M_G_GOODS_RANDPROP_ATTTYPE5_STR                   ="AttType5";                   // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_ATTVALUE5                      =25;  
	var M_G_GOODS_RANDPROP_ATTVALUE5_STR                  ="AttValue5";                  // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_SPELLTYPE1                     =26;  
	var M_G_GOODS_RANDPROP_SPELLTYPE1_STR                 ="SpellType1";                 // DBTYPE_WVARCHAR     能力id

	var M_G_GOODS_RANDPROP_SPELLTRIGGER1                  =27;  
	var M_G_GOODS_RANDPROP_SPELLTRIGGER1_STR              ="SpellTrigger1";              // DBTYPE_WVARCHAR     能力发动类型

	var M_G_GOODS_RANDPROP_SPELLTYPE2                     =28;  
	var M_G_GOODS_RANDPROP_SPELLTYPE2_STR                 ="SpellType2";                 // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_SPELLTRIGGER2                  =29;  
	var M_G_GOODS_RANDPROP_SPELLTRIGGER2_STR              ="SpellTrigger2";              // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_SPELLTYPE3                     =30;  
	var M_G_GOODS_RANDPROP_SPELLTYPE3_STR                 ="SpellType3";                 // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_SPELLTRIGGER3                  =31;  
	var M_G_GOODS_RANDPROP_SPELLTRIGGER3_STR              ="SpellTrigger3";              // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_SPELLTYPE4                     =32;  
	var M_G_GOODS_RANDPROP_SPELLTYPE4_STR                 ="SpellType4";                 // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_SPELLTRIGGER4                  =33;  
	var M_G_GOODS_RANDPROP_SPELLTRIGGER4_STR              ="SpellTrigger4";              // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_SPELLTYPE5                     =34;  
	var M_G_GOODS_RANDPROP_SPELLTYPE5_STR                 ="SpellType5";                 // DBTYPE_WVARCHAR     

	var M_G_GOODS_RANDPROP_SPELLTRIGGER5                  =35;  
	var M_G_GOODS_RANDPROP_SPELLTRIGGER5_STR              ="SpellTrigger5";              // DBTYPE_WVARCHAR     


	var ROLEINFO                                          ="RoleInfo";
	var M_G_GOODS_ROLEINFO_ENTRYID                        =0;   
	var M_G_GOODS_ROLEINFO_ENTRYID_STR                    ="EntryId";                    // DBTYPE_I4           识别id

	var M_G_GOODS_ROLEINFO_NAME                           =1;   
	var M_G_GOODS_ROLEINFO_NAME_STR                       ="Name";                       // DBTYPE_WVARCHAR     角色名称

	var M_G_GOODS_ROLEINFO_DESCRIBE                       =2;   
	var M_G_GOODS_ROLEINFO_DESCRIBE_STR                   ="Describe";                   // DBTYPE_WVARCHAR     角色描述

	var M_G_GOODS_ROLEINFO_DISPLAY                        =3;   
	var M_G_GOODS_ROLEINFO_DISPLAY_STR                    ="Display";                    // DBTYPE_I4           显示id

	var M_G_GOODS_ROLEINFO_BASELEVEL                      =4;   
	var M_G_GOODS_ROLEINFO_BASELEVEL_STR                  ="BaseLevel";                  // DBTYPE_I4           基础等级

	var M_G_GOODS_ROLEINFO_MAXLEVEL                       =5;   
	var M_G_GOODS_ROLEINFO_MAXLEVEL_STR                   ="MaxLevel";                   // DBTYPE_I4           最大等级

	var M_G_GOODS_ROLEINFO_BASEEXP                        =6;   
	var M_G_GOODS_ROLEINFO_BASEEXP_STR                    ="BaseExp";                    // DBTYPE_I4           基础经验

	var M_G_GOODS_ROLEINFO_ATT                            =7;   
	var M_G_GOODS_ROLEINFO_ATT_STR                        ="Att";                        // DBTYPE_WCHAR        基础属性

	var M_G_GOODS_ROLEINFO_ITEM                           =8;   
	var M_G_GOODS_ROLEINFO_ITEM_STR                       ="Item";                       // DBTYPE_WCHAR        基础物品

	var M_G_GOODS_ROLEINFO_SKILL                          =9;   
	var M_G_GOODS_ROLEINFO_SKILL_STR                      ="Skill";                      // DBTYPE_WVARCHAR     基础技能

	var M_G_GOODS_ROLEINFO_CLASS                          =10;  
	var M_G_GOODS_ROLEINFO_CLASS_STR                      ="Class";                      // DBTYPE_WVARCHAR     所能担任职业(不填代表全部职业)

	var M_G_GOODS_ROLEINFO_DEFINEPART0                    =11;  
	var M_G_GOODS_ROLEINFO_DEFINEPART0_STR                ="DefinePart0";                // DBTYPE_I4           头发

	var M_G_GOODS_ROLEINFO_DEFINEPART1                    =12;  
	var M_G_GOODS_ROLEINFO_DEFINEPART1_STR                ="DefinePart1";                // DBTYPE_I4           五官

	var M_G_GOODS_ROLEINFO_DEFINEPART2                    =13;  
	var M_G_GOODS_ROLEINFO_DEFINEPART2_STR                ="DefinePart2";                // DBTYPE_I4           上装

	var M_G_GOODS_ROLEINFO_DEFINEPART3                    =14;  
	var M_G_GOODS_ROLEINFO_DEFINEPART3_STR                ="DefinePart3";                // DBTYPE_I4           裙/裤

	var M_G_GOODS_ROLEINFO_DEFINEPART4                    =15;  
	var M_G_GOODS_ROLEINFO_DEFINEPART4_STR                ="DefinePart4";                // DBTYPE_I4           手套

	var M_G_GOODS_ROLEINFO_DEFINEPART5                    =16;  
	var M_G_GOODS_ROLEINFO_DEFINEPART5_STR                ="DefinePart5";                // DBTYPE_I4           袜

	var M_G_GOODS_ROLEINFO_DEFINEPART6                    =17;  
	var M_G_GOODS_ROLEINFO_DEFINEPART6_STR                ="DefinePart6";                // DBTYPE_I4           鞋

	var M_G_GOODS_ROLEINFO_DEFINEPART7                    =18;  
	var M_G_GOODS_ROLEINFO_DEFINEPART7_STR                ="DefinePart7";                // DBTYPE_I4           背饰

	var M_G_GOODS_ROLEINFO_DEFINEPART8                    =19;  
	var M_G_GOODS_ROLEINFO_DEFINEPART8_STR                ="DefinePart8";                // DBTYPE_I4           球拍

	var M_G_GOODS_ROLEINFO_DEFINEPART9                    =20;  
	var M_G_GOODS_ROLEINFO_DEFINEPART9_STR                ="DefinePart9";                // DBTYPE_I4           眼镜

	var M_G_GOODS_ROLEINFO_DEFINEPART10                   =21;  
	var M_G_GOODS_ROLEINFO_DEFINEPART10_STR               ="DefinePart10";               // DBTYPE_I4           护腕/手链

	var M_G_GOODS_ROLEINFO_DEFINEPART11                   =22;  
	var M_G_GOODS_ROLEINFO_DEFINEPART11_STR               ="DefinePart11";               // DBTYPE_I4           项链

	var M_G_GOODS_ROLEINFO_DEFINEPART12                   =23;  
	var M_G_GOODS_ROLEINFO_DEFINEPART12_STR               ="DefinePart12";               // DBTYPE_I4           附件

	var M_G_GOODS_ROLEINFO_DEFINEPART13                   =24;  
	var M_G_GOODS_ROLEINFO_DEFINEPART13_STR               ="DefinePart13";               // DBTYPE_I4           

	var M_G_GOODS_ROLEINFO_DEFINEPART14                   =25;  
	var M_G_GOODS_ROLEINFO_DEFINEPART14_STR               ="DefinePart14";               // DBTYPE_I4           

	var M_G_GOODS_ROLEINFO_DEFINEPART15                   =26;  
	var M_G_GOODS_ROLEINFO_DEFINEPART15_STR               ="DefinePart15";               // DBTYPE_I4           

	var M_G_GOODS_ROLEINFO_PRICETYPE                      =27;  
	var M_G_GOODS_ROLEINFO_PRICETYPE_STR                  ="PriceType";                  // DBTYPE_I4           招募所需金钱类型

	var M_G_GOODS_ROLEINFO_SELLPRICE                      =28;  
	var M_G_GOODS_ROLEINFO_SELLPRICE_STR                  ="SellPrice";                  // DBTYPE_I4           招募所需金钱

	var M_G_GOODS_ROLEINFO_HEADIMG                        =29;  
	var M_G_GOODS_ROLEINFO_HEADIMG_STR                    ="HeadImg";                    // DBTYPE_WVARCHAR     头像图片

	var M_G_GOODS_ROLEINFO_INFOROFFSET                    =30;  
	var M_G_GOODS_ROLEINFO_INFOROFFSET_STR                ="InforOffset";                // DBTYPE_R4           人物模型上显示的头像，血量等信息的偏移

	var M_G_GOODS_ROLEINFO_BODYRADIUS                     =31;  
	var M_G_GOODS_ROLEINFO_BODYRADIUS_STR                 ="BodyRadius";                 // DBTYPE_R4           角色半径。根据这个半径挤人

	var M_G_GOODS_ROLEINFO_BODYHEIGHT                     =32;  
	var M_G_GOODS_ROLEINFO_BODYHEIGHT_STR                 ="BodyHeight";                 // DBTYPE_R4           高度，人的高度，挤人用

	var M_G_GOODS_ROLEINFO_BODYMASS                       =33;  
	var M_G_GOODS_ROLEINFO_BODYMASS_STR                   ="BodyMass";                   // DBTYPE_R4           质量。挤人用，越重越难挤动

	var M_G_GOODS_ROLEINFO_ARROWPOSX                      =34;  
	var M_G_GOODS_ROLEINFO_ARROWPOSX_STR                  ="ArrowPosX";                  // DBTYPE_R4           远程武器发射位置。多个发射点（左投右投）怎么办

	var M_G_GOODS_ROLEINFO_ARROWPOSY                      =35;  
	var M_G_GOODS_ROLEINFO_ARROWPOSY_STR                  ="ArrowPosY";                  // DBTYPE_R4           

	var M_G_GOODS_ROLEINFO_ARROWPOSZ                      =36;  
	var M_G_GOODS_ROLEINFO_ARROWPOSZ_STR                  ="ArrowPosZ";                  // DBTYPE_R4           

	var M_G_GOODS_ROLEINFO_SERIAL                         =37;  
	var M_G_GOODS_ROLEINFO_SERIAL_STR                     ="Serial";                     // DBTYPE_I4           人物顺序

	var M_G_GOODS_ROLEINFO_USERTYPE                       =38;  
	var M_G_GOODS_ROLEINFO_USERTYPE_STR                   ="UserType";                   // DBTYPE_I4           角色属性 0:用户角色,1:杂兵,2:特殊兵,3:队长,4:BOSS,5:道具

	var M_G_GOODS_ROLEINFO_CANRECRUIT                     =39;  
	var M_G_GOODS_ROLEINFO_CANRECRUIT_STR                 ="CanRecruit";                 // DBTYPE_BOOL         是否可以招募

	var M_G_GOODS_ROLEINFO_DROPID                         =40;  
	var M_G_GOODS_ROLEINFO_DROPID_STR                     ="DropId";                     // DBTYPE_I4           掉落物品id

	var M_G_GOODS_ROLEINFO_THROWVEL                       =41;  
	var M_G_GOODS_ROLEINFO_THROWVEL_STR                   ="ThrowVel";                   // DBTYPE_R4           扔道具的速度

	var M_G_GOODS_ROLEINFO_GUNOBJID                       =42;  
	var M_G_GOODS_ROLEINFO_GUNOBJID_STR                   ="GunObjID";                   // DBTYPE_I4           每个角色对应的枪的id


	var SPLITITEMS                                        ="SplitItems";
	var M_G_GOODS_SPLITITEMS_ENTRY_ID                     =0;   
	var M_G_GOODS_SPLITITEMS_ENTRY_ID_STR                 ="Entry_Id";                   // DBTYPE_I4           拆分公式索引ID

	var M_G_GOODS_SPLITITEMS_SPLIT_NAME                   =1;   
	var M_G_GOODS_SPLITITEMS_SPLIT_NAME_STR               ="Split_Name";                 // DBTYPE_WVARCHAR     拆分公式名称

	var M_G_GOODS_SPLITITEMS_ITEM_ID                      =2;   
	var M_G_GOODS_SPLITITEMS_ITEM_ID_STR                  ="Item_ID";                    // DBTYPE_I4           被拆分物品ID

	var M_G_GOODS_SPLITITEMS_ITEM_QUALITY                 =3;   
	var M_G_GOODS_SPLITITEMS_ITEM_QUALITY_STR             ="Item_Quality";               // DBTYPE_I4           被拆分物品品质

	var M_G_GOODS_SPLITITEMS_PRICE_TYPE                   =4;   
	var M_G_GOODS_SPLITITEMS_PRICE_TYPE_STR               ="Price_Type";                 // DBTYPE_I4           拆分花费类型

	var M_G_GOODS_SPLITITEMS_SPLIT_PRICE                  =5;   
	var M_G_GOODS_SPLITITEMS_SPLIT_PRICE_STR              ="Split_Price";                // DBTYPE_I4           拆分花费

	var M_G_GOODS_SPLITITEMS_SPLIT_TOOL_ID1               =6;   
	var M_G_GOODS_SPLITITEMS_SPLIT_TOOL_ID1_STR           ="Split_Tool_ID1";             // DBTYPE_I4           拆分工具1ID

	var M_G_GOODS_SPLITITEMS_SPLIT_LIST1                  =7;   
	var M_G_GOODS_SPLITITEMS_SPLIT_LIST1_STR              ="Split_List1";                // DBTYPE_WVARCHAR     拆分素材集合1,抽取物品不可重复

	var M_G_GOODS_SPLITITEMS_SPLIT_TOOL_ID2               =8;   
	var M_G_GOODS_SPLITITEMS_SPLIT_TOOL_ID2_STR           ="Split_Tool_ID2";             // DBTYPE_I4           拆分工具2ID

	var M_G_GOODS_SPLITITEMS_SPLIT_LIST2                  =9;   
	var M_G_GOODS_SPLITITEMS_SPLIT_LIST2_STR              ="Split_List2";                // DBTYPE_WVARCHAR     拆分素材集合2,抽取物品不可重复

	var M_G_GOODS_SPLITITEMS_SPLIT_TOOL_ID3               =10;  
	var M_G_GOODS_SPLITITEMS_SPLIT_TOOL_ID3_STR           ="Split_Tool_ID3";             // DBTYPE_I4           拆分工具3ID

	var M_G_GOODS_SPLITITEMS_SPLIT_LIST3                  =11;  
	var M_G_GOODS_SPLITITEMS_SPLIT_LIST3_STR              ="Split_List3";                // DBTYPE_WVARCHAR     拆分素材集合3,抽取物品不可重复


	var SUPPLYITEM                                        ="SupplyItem";
	var M_G_GOODS_SUPPLYITEM_ENTRYID                      =0;   
	var M_G_GOODS_SUPPLYITEM_ENTRYID_STR                  ="EntryId";                    // DBTYPE_I4           

	var M_G_GOODS_SUPPLYITEM_STATE                        =1;   
	var M_G_GOODS_SUPPLYITEM_STATE_STR                    ="State";                      // DBTYPE_I4           

	var M_G_GOODS_SUPPLYITEM_ITEMID1                      =2;   
	var M_G_GOODS_SUPPLYITEM_ITEMID1_STR                  ="ItemId1";                    // DBTYPE_I4           

	var M_G_GOODS_SUPPLYITEM_ITEMNUM1                     =3;   
	var M_G_GOODS_SUPPLYITEM_ITEMNUM1_STR                 ="ItemNum1";                   // DBTYPE_I4           

	var M_G_GOODS_SUPPLYITEM_ITEMID2                      =4;   
	var M_G_GOODS_SUPPLYITEM_ITEMID2_STR                  ="ItemId2";                    // DBTYPE_I4           

	var M_G_GOODS_SUPPLYITEM_ITEMNUM2                     =5;   
	var M_G_GOODS_SUPPLYITEM_ITEMNUM2_STR                 ="ItemNum2";                   // DBTYPE_I4           

	var M_G_GOODS_SUPPLYITEM_ITEMID3                      =6;   
	var M_G_GOODS_SUPPLYITEM_ITEMID3_STR                  ="ItemId3";                    // DBTYPE_I4           

	var M_G_GOODS_SUPPLYITEM_ITEMNUM3                     =7;   
	var M_G_GOODS_SUPPLYITEM_ITEMNUM3_STR                 ="ItemNum3";                   // DBTYPE_I4           

	var M_G_GOODS_SUPPLYITEM_ITEMID4                      =8;   
	var M_G_GOODS_SUPPLYITEM_ITEMID4_STR                  ="ItemId4";                    // DBTYPE_I4           

	var M_G_GOODS_SUPPLYITEM_ITEMNUM4                     =9;   
	var M_G_GOODS_SUPPLYITEM_ITEMNUM4_STR                 ="ItemNum4";                   // DBTYPE_I4           

	var M_G_GOODS_SUPPLYITEM_ITEMID5                      =10;  
	var M_G_GOODS_SUPPLYITEM_ITEMID5_STR                  ="ItemId5";                    // DBTYPE_I4           

	var M_G_GOODS_SUPPLYITEM_ITEMNUM5                     =11;  
	var M_G_GOODS_SUPPLYITEM_ITEMNUM5_STR                 ="ItemNum5";                   // DBTYPE_I4           


	var SYNTHETIC                                         ="Synthetic";
	var M_G_GOODS_SYNTHETIC_ENTRYID                       =0;   
	var M_G_GOODS_SYNTHETIC_ENTRYID_STR                   ="EntryId";                    // DBTYPE_I4           合成公式id

	var M_G_GOODS_SYNTHETIC_NAME                          =1;   
	var M_G_GOODS_SYNTHETIC_NAME_STR                      ="Name";                       // DBTYPE_WVARCHAR     合成公式名称

	var M_G_GOODS_SYNTHETIC_CLASS                         =2;   
	var M_G_GOODS_SYNTHETIC_CLASS_STR                     ="Class";                      // DBTYPE_I4           合成公式类别(哪种类型物品)

	var M_G_GOODS_SYNTHETIC_LEVEL                         =3;   
	var M_G_GOODS_SYNTHETIC_LEVEL_STR                     ="Level";                      // DBTYPE_I4           所需玩家等级

	var M_G_GOODS_SYNTHETIC_PRICETYPE                     =4;   
	var M_G_GOODS_SYNTHETIC_PRICETYPE_STR                 ="PriceType";                  // DBTYPE_I4           合成花费类型

	var M_G_GOODS_SYNTHETIC_SELLPRICE                     =5;   
	var M_G_GOODS_SYNTHETIC_SELLPRICE_STR                 ="SellPrice";                  // DBTYPE_I4           合成花费

	var M_G_GOODS_SYNTHETIC_MAKEITEMID                    =6;   
	var M_G_GOODS_SYNTHETIC_MAKEITEMID_STR                ="MakeItemId";                 // DBTYPE_I4           合成物品id

	var M_G_GOODS_SYNTHETIC_MAKEITEMNUM                   =7;   
	var M_G_GOODS_SYNTHETIC_MAKEITEMNUM_STR               ="MakeItemNum";                // DBTYPE_I4           合成物品数量

	var M_G_GOODS_SYNTHETIC_MAKEITEMRAND                  =8;   
	var M_G_GOODS_SYNTHETIC_MAKEITEMRAND_STR              ="MakeItemRand";               // DBTYPE_I4           合成物品随机模板id,填<0的值则使用默认随机模板id

	var M_G_GOODS_SYNTHETIC_MAKEROLE                      =9;   
	var M_G_GOODS_SYNTHETIC_MAKEROLE_STR                  ="MakeRole";                   // DBTYPE_I4           生成物品角色专属判定id

	var M_G_GOODS_SYNTHETIC_ODDS                          =10;  
	var M_G_GOODS_SYNTHETIC_ODDS_STR                      ="Odds";                       // DBTYPE_R4           打造成功几率(无附加材料)

	var M_G_GOODS_SYNTHETIC_KEYMATERIALID                 =11;  
	var M_G_GOODS_SYNTHETIC_KEYMATERIALID_STR             ="KeyMaterialId";              // DBTYPE_I4           打造所需关键素材id

	var M_G_GOODS_SYNTHETIC_KEYMATERIALNUM                =12;  
	var M_G_GOODS_SYNTHETIC_KEYMATERIALNUM_STR            ="KeyMaterialNum";             // DBTYPE_I4           打造所需关键素材数量

	var M_G_GOODS_SYNTHETIC_KEYMATERIALQUALITY            =13;  
	var M_G_GOODS_SYNTHETIC_KEYMATERIALQUALITY_STR        ="KeyMaterialQuality";         // DBTYPE_I4           打造所需关键素材品质

	var M_G_GOODS_SYNTHETIC_MATERIALID1                   =14;  
	var M_G_GOODS_SYNTHETIC_MATERIALID1_STR               ="MaterialId1";                // DBTYPE_I4           合成所需素材id

	var M_G_GOODS_SYNTHETIC_MATERIALNUM1                  =15;  
	var M_G_GOODS_SYNTHETIC_MATERIALNUM1_STR              ="MaterialNum1";               // DBTYPE_I4           合成所需素材数量

	var M_G_GOODS_SYNTHETIC_MATERIALID2                   =16;  
	var M_G_GOODS_SYNTHETIC_MATERIALID2_STR               ="MaterialId2";                // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALNUM2                  =17;  
	var M_G_GOODS_SYNTHETIC_MATERIALNUM2_STR              ="MaterialNum2";               // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALID3                   =18;  
	var M_G_GOODS_SYNTHETIC_MATERIALID3_STR               ="MaterialId3";                // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALNUM3                  =19;  
	var M_G_GOODS_SYNTHETIC_MATERIALNUM3_STR              ="MaterialNum3";               // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALID4                   =20;  
	var M_G_GOODS_SYNTHETIC_MATERIALID4_STR               ="MaterialId4";                // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALNUM4                  =21;  
	var M_G_GOODS_SYNTHETIC_MATERIALNUM4_STR              ="MaterialNum4";               // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALID5                   =22;  
	var M_G_GOODS_SYNTHETIC_MATERIALID5_STR               ="MaterialId5";                // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALNUM5                  =23;  
	var M_G_GOODS_SYNTHETIC_MATERIALNUM5_STR              ="MaterialNum5";               // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALID6                   =24;  
	var M_G_GOODS_SYNTHETIC_MATERIALID6_STR               ="MaterialId6";                // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALNUM6                  =25;  
	var M_G_GOODS_SYNTHETIC_MATERIALNUM6_STR              ="MaterialNum6";               // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALID7                   =26;  
	var M_G_GOODS_SYNTHETIC_MATERIALID7_STR               ="MaterialId7";                // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALNUM7                  =27;  
	var M_G_GOODS_SYNTHETIC_MATERIALNUM7_STR              ="MaterialNum7";               // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALID8                   =28;  
	var M_G_GOODS_SYNTHETIC_MATERIALID8_STR               ="MaterialId8";                // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALNUM8                  =29;  
	var M_G_GOODS_SYNTHETIC_MATERIALNUM8_STR              ="MaterialNum8";               // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALID9                   =30;  
	var M_G_GOODS_SYNTHETIC_MATERIALID9_STR               ="MaterialId9";                // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALNUM9                  =31;  
	var M_G_GOODS_SYNTHETIC_MATERIALNUM9_STR              ="MaterialNum9";               // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALID10                  =32;  
	var M_G_GOODS_SYNTHETIC_MATERIALID10_STR              ="MaterialId10";               // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALNUM10                 =33;  
	var M_G_GOODS_SYNTHETIC_MATERIALNUM10_STR             ="MaterialNum10";              // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALID11                  =34;  
	var M_G_GOODS_SYNTHETIC_MATERIALID11_STR              ="MaterialId11";               // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALNUM11                 =35;  
	var M_G_GOODS_SYNTHETIC_MATERIALNUM11_STR             ="MaterialNum11";              // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALID12                  =36;  
	var M_G_GOODS_SYNTHETIC_MATERIALID12_STR              ="MaterialId12";               // DBTYPE_WLONGVARCHAR 

	var M_G_GOODS_SYNTHETIC_MATERIALNUM12                 =37;  
	var M_G_GOODS_SYNTHETIC_MATERIALNUM12_STR             ="MaterialNum12";              // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALID13                  =38;  
	var M_G_GOODS_SYNTHETIC_MATERIALID13_STR              ="MaterialId13";               // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALNUM13                 =39;  
	var M_G_GOODS_SYNTHETIC_MATERIALNUM13_STR             ="MaterialNum13";              // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALID14                  =40;  
	var M_G_GOODS_SYNTHETIC_MATERIALID14_STR              ="MaterialId14";               // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALNUM14                 =41;  
	var M_G_GOODS_SYNTHETIC_MATERIALNUM14_STR             ="MaterialNum14";              // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALID15                  =42;  
	var M_G_GOODS_SYNTHETIC_MATERIALID15_STR              ="MaterialId15";               // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALNUM15                 =43;  
	var M_G_GOODS_SYNTHETIC_MATERIALNUM15_STR             ="MaterialNum15";              // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALID16                  =44;  
	var M_G_GOODS_SYNTHETIC_MATERIALID16_STR              ="MaterialId16";               // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALNUM16                 =45;  
	var M_G_GOODS_SYNTHETIC_MATERIALNUM16_STR             ="MaterialNum16";              // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALID17                  =46;  
	var M_G_GOODS_SYNTHETIC_MATERIALID17_STR              ="MaterialId17";               // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALNUM17                 =47;  
	var M_G_GOODS_SYNTHETIC_MATERIALNUM17_STR             ="MaterialNum17";              // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALID18                  =48;  
	var M_G_GOODS_SYNTHETIC_MATERIALID18_STR              ="MaterialId18";               // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALNUM18                 =49;  
	var M_G_GOODS_SYNTHETIC_MATERIALNUM18_STR             ="MaterialNum18";              // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALID19                  =50;  
	var M_G_GOODS_SYNTHETIC_MATERIALID19_STR              ="MaterialId19";               // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALNUM19                 =51;  
	var M_G_GOODS_SYNTHETIC_MATERIALNUM19_STR             ="MaterialNum19";              // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALID20                  =52;  
	var M_G_GOODS_SYNTHETIC_MATERIALID20_STR              ="MaterialId20";               // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_MATERIALNUM20                 =53;  
	var M_G_GOODS_SYNTHETIC_MATERIALNUM20_STR             ="MaterialNum20";              // DBTYPE_I4           

	var M_G_GOODS_SYNTHETIC_LUCKBALL_NUM                  =54;  
	var M_G_GOODS_SYNTHETIC_LUCKBALL_NUM_STR              ="Luckball_Num";               // DBTYPE_I4           添加幸运珠数量

	var M_G_GOODS_SYNTHETIC_SPLIT_PRICE_TYPE              =55;  
	var M_G_GOODS_SYNTHETIC_SPLIT_PRICE_TYPE_STR          ="Split_price_type";           // DBTYPE_I4           拆解花费类型

	var M_G_GOODS_SYNTHETIC_SPLIT_PRICE                   =56;  
	var M_G_GOODS_SYNTHETIC_SPLIT_PRICE_STR               ="Split_price";                // DBTYPE_I4           拆解花费数量

	var M_G_GOODS_SYNTHETIC_SPLIT_TOOLID                  =57;  
	var M_G_GOODS_SYNTHETIC_SPLIT_TOOLID_STR              ="Split_ToolID";               // DBTYPE_I4           拆解工具ID

	var M_G_GOODS_SYNTHETIC_SPLIT_TOOLNUM                 =58;  
	var M_G_GOODS_SYNTHETIC_SPLIT_TOOLNUM_STR             ="Split_toolnum";              // DBTYPE_I4           拆解工具数量

}
