_chair = _this select 0;
_unit = _this select 1;

standup = _unit addAction ["<t color='#0099FF'>Stand Up</t>", {
					player switchMove "";  
					player removeAction standup;
					sitting = false;
		}
];
_player = _chair getVariable "player";
waitUntil {! _player getVariable "sitting"};
_chair setVariable ["sitting", false, true];
_chair setVariable ["player", ObjNull, true];