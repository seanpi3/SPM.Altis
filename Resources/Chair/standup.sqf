_chair = _this select 0;
_unit = _this select 1;

standup = _unit addAction ["<t color='#0099FF'>Stand Up</t>", {
					_chair setVariable ["sitting", false, true];
					_chair setVariable ["player", ObjNull, true];
					player switchMove "";  
					player removeAction standup;
					sitting = false;
		}
];