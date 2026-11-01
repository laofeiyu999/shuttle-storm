// 标准内容iframe类
// 陈晓聪 2009年10月25日

class VContentIframe_UI iframe
{
	size = "400,200";
	scroll = window.SCROLL_NOTENNIS;
	src = "$./content.htm";

	//_text：内容,
	//_ItemStr：物品参数的字符串；
	//_gold：金币；
	//_money：点券；
	//_itemTextState:""或0 显示 其他 不显示；
	void SetData(_text,_ItemStr,_gold,_money,_itemTextState)
	{
		//printf("LOOKOVER:_text:"+_text+",_ItemStr:"+_ItemStr+",_gold:"+_gold+",_money:"+_money+",_itemTextState:"+_itemTextState);
		//alert("_text="+_text+",_ItemStr="+_ItemStr+",_gold="+_gold+",_money="+_money+",_itemTextState="+_itemTextState);
		BODY.delallchild();
		if(_text!="")
		{
//			_text = window.TransHtmlform(_text);
			BODY.appendHtml("<font class=SMALL><br>"+window.TransHtmlform(_text)+"</font><br>");
		}
		if(toint(_ItemStr)>0 && _ItemStr != "")
		{
			var _itemStrNum = window.GetSplitCount(_ItemStr,";");
			if(_itemStrNum>0)
			{
				if(toint(_itemTextState)==0)
				{
					//alert(_itemStrNum);
					BODY.appendHtml("<br><VPrizeItem_UI></VPrizeItem_UI><br>");
				}
			}//如果需要写字 先写字
			var _itemArr = window.SplitStr2(_ItemStr,";",_itemStrNum);//获得物品数据字符串数组

			var _index = 0;
			while(_index<_itemStrNum)
			{
				var _tempArr = window.SplitStr2(_itemArr[_index],",");

//				alert("_itemArr[_index]="+_itemArr[_index]);
				BODY.appendHtml("<VIconMgr_Logic FrameSetId("+toint(_tempArr[0])+") FrameSetLvl("+toint(_tempArr[1])+") FrameSetNum("+toint(_tempArr[2])+")></VIconMgr_Logic>&nbsp;");
				_index += 1;
			}
		}
		if(toint(_gold)>0)
		{
			BODY.appendHtml("<br><VPrizeMoney_UI SetData("+_gold+")></VPrizeMoney_UI>");
		}
		if(toint(_money)>0)
		{
			BODY.appendHtml("<br><VPrizeExp_UI SetData("+_money+")></VPrizeExp_UI>");
		}
	}
};

//奖励金币
class VPrizeMoney_UI item
{
	size = "140,20";
	new img{src = "$./imgs"+window.g_Sex+"/ContentIframe/p_money.tga";}
	var _text = new BaseText
	{
		pos = "79,0";size = "60,15";ycenter = true;
		void SetData(data)
		{
			src = data;
		}
	}
	void SetData(data)
	{
		_text.SetData(data);
	}
};
//奖励经验
class VPrizeExp_UI item
{
	size = "140,20";
	new img{src = "$./imgs"+window.g_Sex+"/ContentIframe/p_exp.tga";}
	var _text = new BaseText
	{
		pos = "79,0";size = "60,15";ycenter = true;
		void SetData(data)
		{
			src = data;
		}
	}
	void SetData(data)
	{
		_text.SetData(data);
	}
};
//奖励物品
class VPrizeItem_UI img
{
	src = "$./imgs"+window.g_Sex+"/ContentIframe/p_item.tga";
};