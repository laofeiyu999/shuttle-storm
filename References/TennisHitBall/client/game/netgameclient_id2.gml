var ip="socket:://192.168.0.63:2008";
var mapid=0;
var userid=2;
var SingleMode = 0;
wndsize = "400, 300";

import("$./GameClient.gml")
import("$./scoreUI.gml");
new ConnectList{};

load("$./../interface/index.gml"); // add by yxf
window.find("GAME_LOGIC").Init(2,1); //Test;