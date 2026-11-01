//体力回复脚本
//老虎
//2009-9-30
/*
与数据库的道具相互搭配，提供比赛中体力的回复机制
*/

class MatchState UserLogic
{
	var tstatic = new T_ScriptFun{};
	var roleStamina = 0;//体力属性值
	var recoverValue = 1;//默认回复量
	var matchBegin = 0;//比赛是否开始的标识
	
	//自动回复
	void CheckSelf()//检查是不是自己，比赛开始后调用
	{
		var temp = IsSelf();
		printf("6# ==MatchState== CheckSelf " + temp + "  matchBegin " + matchBegin);
		if( temp != 0)//如果是自己才会触发回复机制
		{
			RecoverByTime();
		}
	}
	void RecoverByTime()//循环检查，回复体力的主函数
	{
		if (matchBegin == 0) return;//如果比赛结束就中止循环回复机制
		printf("6# ==MatchState== RecoverByTime 体力属性值: " + roleStamina + ", 当前属性值: " + GetStamina());
		if ( GetStamina() != roleStamina)
		{
			printf("6# ==MatchState==  RecoverByTime 回复量: " + recoverValue);
			AddStamina_Tennis( recoverValue);
		}
		timer(10000,"RecoverByTime");
	}
	
	//设置回复参数 最好用函数来做 扩展性强 安全
	void SetRecoverParam( itemOrActID)
	{
		switch ( itemOrActID)
		{
			case 1: recoverValue += 2;break;
			case 2: recoverValue += 3;break;
			case 3: recoverValue += 4;break;
			default:
			{
				alert("MatchState:ERR! 体力恢复参数传递出错");
				break;
			}
		}
	}

	Load("$./../../game/MyCoreLogic.gml");
}
