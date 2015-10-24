_chair = _this select 0;
_unit = _this select 1;
_chair setVariable ["sitting", false, true];
standup = _unit addAction ["<t color='#0099FF'>Stand Up</t>",{
					player switchMove "";  
					player removeAction standup;
					sitting = false;
					}
];