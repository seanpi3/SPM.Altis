#define true 1
#define false 0

class vs_dialog{
	movingEnable = false;
	enableSimulation = false;
	controlsBackground[] = { };    // no background controls needed
	objects[] = { };               // no objects needed
	controls[] = { RscPicture_1200, RscText_1000, RscText_1001 };
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Ozadu, v1.063, #Jisyqi)
////////////////////////////////////////////////////////

class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "Resources\vs.png";
	x = 18 * GUI_GRID_W + GUI_GRID_X;
	y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
class RscText_1000: RscText
{
	idc = 1000;
	text = "Team 1"; //--- ToDo: Localize;
	x = 11.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
class RscText_1001: RscText
{
	idc = 1001;
	text = "Team 2"; //--- ToDo: Localize;
	x = 24.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

};