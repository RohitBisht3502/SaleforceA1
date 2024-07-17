public with sharing class AccuWeatherData {
    public AccuWeatherData() {

    }
	
	public class cls_0 {
		public Integer Version;	//1
		public String Key;	//188411
		public String Type;	//City
		public Integer Rank;	//45
		public String LocalizedName;	//Jind
		public String EnglishName;	//Jind
		public String PrimaryPostalCode;	//

		public cls_Country Country;
		public cls_AdministrativeArea AdministrativeArea;
		public cls_TimeZone TimeZone;
		public cls_SupplementalAdminAreas[] SupplementalAdminAreas;
		
	}
	public class cls_1 {
		public Integer Version;	//1
		public String Key;	//3043667
		public String Type;	//City
		public Integer Rank;	//85
		public String LocalizedName;	//Jind
		public String EnglishName;	//Jind
		public String PrimaryPostalCode;	//
		
		public cls_Country Country;
		public cls_AdministrativeArea AdministrativeArea;
		public cls_TimeZone TimeZone;
		public cls_SupplementalAdminAreas[] SupplementalAdminAreas;
	}

	public class cls_Country {
		public String ID;	//IN
		public String LocalizedName;	//India
		public String EnglishName;	//India
	}
	public class cls_AdministrativeArea {
		public String ID;	//HR
		public String LocalizedName;	//Haryana
	
	}
	public class cls_TimeZone {
		public String Code;	//IST
		public String Name;	//Asia/Kolkata
	}


	public class cls_Metric {
		public Integer Value;	//228
		public String Unit;	//m
		public Integer UnitType;	//5
	}
	public class cls_Imperial {
		public Integer Value;	//747
		public String Unit;	//ft
		public Integer UnitType;	//0
	}
	public class cls_SupplementalAdminAreas {
		public Integer Level;	//2
		public String LocalizedName;	//Jind
		public String EnglishName;	//Jind
	}

    public static AccuWeatherData parse(String json){
		return (AccuWeatherData) System.JSON.deserialize(json, AccuWeatherData.class);
	}
	
	

	
}