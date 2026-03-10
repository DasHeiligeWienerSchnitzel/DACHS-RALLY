class DACHS_RALLY
{
	idd = 4300001;
	movingEnabled = 0;
	
	class controls
	{
		class Healthbar: RscProgress
		{
			idc = 1000;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBar[] = {1,0,0,0.8};
		};
	};
};