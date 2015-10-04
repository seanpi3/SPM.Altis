private ["_player","_title", "_message"];
_player = _this select 0;
_title = _this select 1;
_message = _this select 2;
if(_player != player) exitWith {};
[_title, [_message]] call bis_fnc_showNotification;