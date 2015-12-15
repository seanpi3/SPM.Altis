private ["_arsenalObject"];
_arsenalObject = ["Open",false] spawn BIS_fnc_arsenal; 

[_arsenalObject,[
                "srifle_DMR_01_F",
				"srifle_EBR_F",
				"arifle_Katiba_F",
				"arifle_Mk20_F",
				"arifle_Mk20_plain_F",
				"arifle_Mk20C_plain_F",
				"arifle_MXC_F",
				"arifle_MX_SW_F",
				"arifle_MXM_F",
				"arifle_MXC_Black_F",
				"arifle_MX_Black_F",
				"arifle_MX_SW_Black_F",
				"arifle_MXM_Black_F",
				"srifle_DMR_03_F",
				"srifle_DMR_03_khaki_F",
				"srifle_DMR_03_tan_F",
				"srifle_DMR_03_spotter_F",
				"srifle_DMR_03_woodland_F",
				"srifle_DMR_03_multicam_F",
				"srifle_DMR_06_camo_F",
				"srifle_DMR_06_olive_F"
				
        ],true] call BIS_fnc_addVirtualWeaponCargo;
		
[_arsenalObject, [
				"ItemWatch",
				"ItemCompass",
				"ItemGPS",
				"ItemRadio",
				"ItemMap",
				"Binocular",
				"NVGoggles",
				"FirstAidKit",
				"optic_Arco",
				"optic_Hamr",
				"optic_Aco",
				"optic_ACO_grn",
				"optic_Aco_smg",
				"optic_ACO_grn_smg",
				"optic_Holosight",
				"optic_Holosight_smg",
				"acc_flashlight",
				"optic_MRCO",
				"optic_Yorris",
				"optic_MRD",
				"U_B_CombatUniform_mcam",
				"U_O_GhillieSuit",
				"U_O_Wetsuit",
				"U_B_CombatUniform_mcam_vest",
				"U_B_CombatUniform_mcam_tshirt",
				"U_O_CombatUniform_ocamo",
				"U_O_PilotCoveralls",
				"U_B_CombatUniform_mcam_worn",
				"U_B_CombatUniform_wdl",
				"U_B_CombatUniform_wdl_tshirt",
				"U_B_CombatUniform_wdl_vest",
				"U_B_CombatUniform_sgg",
				"U_B_CombatUniform_sgg_tshirt",
				"U_B_CombatUniform_sgg_vest",
				"U_B_SpecopsUniform_sgg",
				"U_B_PilotCoveralls",
				"U_O_CombatUniform_oucamo",
				"U_O_SpecopsUniform_ocamo",
				"U_O_SpecopsUniform_blk",
				"U_O_OfficerUniform_ocamo",
				"U_I_CombatUniform",
				"U_I_CombatUniform_tshirt",
				"U_I_CombatUniform_shortsleeve",
				"U_I_pilotCoveralls",
				"U_I_HeliPilotCoveralls",
				"U_I_GhillieSuit",
				"U_I_OfficerUniform",
				"U_I_Wetsuit",
				"U_MillerBody",
				"U_KerryBody",
				"U_IG_Guerilla1_1",
				"U_IG_Guerilla2_1",
				"U_IG_Guerilla2_2",
				"U_IG_Guerilla2_3",
				"U_IG_Guerilla3_1",
				"U_IG_Guerilla3_2",
				"U_IG_leader",
				"U_BG_Guerilla1_1",
				"U_BG_Guerilla2_1",
				"U_BG_Guerilla2_2",
				"U_BG_Guerilla2_3",
				"U_BG_Guerilla3_1",
				"U_BG_Guerilla3_2",
				"U_BG_leader",
				"U_OG_Guerilla1_1",
				"U_OG_Guerilla2_1",
				"U_OG_Guerilla2_2",
				"U_OG_Guerilla2_3",
				"U_OG_Guerilla3_1",
				"U_OG_Guerilla3_2",
				"U_OG_leader",
				"U_B_CTRG_1",
				"U_B_CTRG_2",
				"U_B_CTRG_3",
				"U_B_survival_uniform",
				"U_I_G_Story_Protagonist_F",
				"U_I_G_resistanceLeader_F",
				"V_PlateCarrier1_rgr",
				"V_PlateCarrier2_rgr",
				"V_PlateCarrier3_rgr",
				"V_Chestrig_khk",
				"V_Chestrig_rgr",
				"V_Chestrig_rgr",
				"V_Chestrig_oli",
				"V_TacVest_khk",
				"V_TacVest_brn",
				"V_TacVest_oli",
				"V_TacVest_blk",
				"V_TacVest_camo",
				"V_TacVest_blk_POLICE",
				"V_TacVestIR_blk",
				"V_TacVestCamo_khk",
				"V_HarnessO_brn",
				"V_HarnessOGL_brn",
				"V_HarnessO_gry",
				"V_HarnessOGL_gry",
				"V_HarnessOSpec_brn",
				"V_HarnessOSpec_gry",
				"V_PlateCarrierIA1_dgtl",
				"V_PlateCarrierIA2_dgtl",
				"V_RebreatherB",
				"V_RebreatherIR",
				"V_RebreatherIA",
				"V_PlateCarrier_Kerry",
				"V_PlateCarrierL_CTRG",
				"V_PlateCarrierH_CTRG",
				"V_I_G_resistanceLeader_F",
				"H_HelmetB",
				"H_HelmetB_camo",
				"H_HelmetB_paint",
				"H_HelmetB_light",
				"H_Booniehat_khk",
				"H_Booniehat_oli",
				"H_Booniehat_indp",
				"H_Booniehat_mcamo",
				"H_Booniehat_grn",
				"H_Booniehat_tan",
				"H_Booniehat_dirty",
				"H_Booniehat_dgtl",
				"H_Booniehat_khk_hs",
				"H_HelmetB_plain_mcamo",
				"H_HelmetB_plain_blk",
				"H_HelmetSpecB",
				"H_HelmetSpecB_paint1",
				"H_HelmetSpecB_paint2",
				"H_HelmetSpecB_blk",
				"H_HelmetIA",
				"H_HelmetIA_net",
				"H_HelmetIA_camo",
				"H_Helmet_Kerry",
				"H_HelmetB_grass",
				"H_HelmetB_snakeskin",
				"H_HelmetB_desert",
				"H_HelmetB_black",
				"H_HelmetB_sand",
				"H_Shemag_khk",
				"H_Shemag_tan",
				"H_Shemag_olive",
				"H_Shemag_olive_hs",
				"H_ShemagOpen_khk",
				"H_ShemagOpen_tan"
], true] call BIS_fnc_addVirtualItemCargo;

[_arsenalObject, [
				"B_Kitbag_mcamo"	
], true] call BIS_fnc_addVirtualBackpackCargo;


				