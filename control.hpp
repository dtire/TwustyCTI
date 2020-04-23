class vehicleDialog
{
	idd = "1";
	class controls
	{
		class baseFrame: RscFrame
		{
			idc = 1800;
			x = 0.299427 * safezoneW + safezoneX;
			y = 0.236926 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.528 * safezoneH;
		};
		class vehicleListBox: RscListbox
		{
			idc = 1500;
			text = "List for Vehicle Info"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.495 * safezoneH;
		};
		class vehicleButtonBuy: RscButton
		{
			idc = 1600;
			text = "BUY"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.121 * safezoneH;
		};
		class RscText_1000: RscText
		{
			idc = 1000;
			x = 0.732323;
			y = 0.00841752;
			w = 0.1;
			h = 0.1;
		};
		class vehicleInfoSection: RscFrame
		{
			idc = 1801;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.352 * safezoneH;
		};
	}
}


class commanderDialog 
{
	idd = "2"
	class controls 
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Twusty, v1.063, #Sixavy)
		////////////////////////////////////////////////////////

		class baseCommanderFrame: RscFrame
		{
			idc = 1800;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.528 * safezoneH;
		};
		class barracksButton: RscButton
		{
			idc = 1600;
			text = "Barracks"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.099 * safezoneH;
			action = "[([""Barracks""] call GetBuildingType), 1000, ""Barracks""] spawn PrePlace; closeDialog 0;";
		};
		class lightVehicleButton: RscButton
		{
			idc = 1601;
			text = "Light Vehicle Factory"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.099 * safezoneH;
			action = "[([""Light Vehicle Factory""] call GetBuildingType), 5000, ""Light Vehicle Factory""] spawn PrePlace; closeDialog 0;";
		};
		class heavyVehicleButton: RscButton
		{
			idc = 1602;
			text = "Heavy Vehicle Factory"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.099 * safezoneH;
			action = "[([""Heavy Vehicle Factory""] call GetBuildingType), 10000, ""Heavy Vehicle Factory""] spawn PrePlace; closeDialog 0;";
		};
		class aircraftFactoryButton: RscButton
		{
			idc = 1603;
			text = "Aircraft Factory"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.11 * safezoneH;
			action = "[([""Aircraft Factory""] call GetBuildingType), 10000, ""Aircraft Factory""] spawn PrePlace; closeDialog 0;";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	}
}