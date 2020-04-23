// Here is a sample config file, the idea is we always use the same variable names
// I.E. Blufor Gear Level 2, and then replace that for vanilla, rhs or any other mod

Blufor_CV_Type = "";

BluforLightVehicleLevelOne = [
	[["rhsusf_m998_w_4dr", 300]],
	[["rhsusf_m1025_w", 300]],
	[["rshusf_m1025_w_m2", 500]],
	[["rhsusf_M1078A1P2_WD_fmtv_usarmy", 400]]
];

BluforGearLevelOne = [
	"rhs_weapon_m16a4", 
	"rhs_weapon_m4_m203", 
	"rhs_weapon_m249", 
	"rhs_weapon_m240B", 
	"rhs_weapon_m72a7", 
	"rhs_weapon_M136", 
	"rhsusf_weapon_m9", 
	"rhsusf_weapon_glock17g4", 
	"rhsusf_weapon_m1911a1", 
	"rhs_weapon_m24sws", 
	"rhs_weapon_m40a5", 
	"Item_rhsusf_acc_wmx_bk", 
	"Item_rhsusf_acc_ACOG", 
	"Item_rhsusf_acc_compm4", 
	"Item_rhsusf_acc_M8541", 
	"Item_rhsusf_acc_harris_bipod", 
	"rhs_magazine_rhs_grenade_anm8_mag", 
	"rhsusf_assault_eagleiii_ocp", 
	"rhsusf_assault_eagleiii_coy", 
	"Item_rhsusf_lwh_helmet_marpatwd", 
	"Item_rhsusf_ach_helmet_ocp", 
	"Headgear_H_Hat_Tinfoil_F", 
	"Item_rhsusf_cvc_ess", 
	"Item_rhsusf_uniform_FROG01_wd", 
	"Item_rhs_uniform_cu_ocp", 
	"Item_rhsusf_iotv_ocp_Rifleman", 
	"Item_rhsusf_iotv_ocp_Squadleader", 
	"Item_rhsusf_spc_rifleman", 
	"Item_rhsusf_spc_squadleader", 
	"rhs_magazine_rhs_mag_m67", 
	"rhs_magazine_rhs_mag_M441_HE", 
	"rhs_magazine_rhs_mag_M714_white"
];

bluforLightVehicles = bluforLightVehicles + BluforLightVehicleLevelOne;
bluforGear = bluforGear + BluforGearLevelOne;