public class FromJSONCompany{
	public cls_location location;
    public String lookupDomain;
	public class cls_location {
		public String locality;	//Denver
		public cls_region region;
		public cls_country country;
	}
	public class cls_region {
		public String name;	//CO
	}
	public class cls_country {
		public String name;	//USA
	}
    public static List<FromJSONCompany> parse(String json){
        //System.debug('FromjsonCompany apex'+json);
		return (List<FromJSONCompany>) System.JSON.deserialize(json, List<FromJSONCompany>.class);
	}
/*
	static testMethod void testParse() {
		String json=		'{"location" : {"locality" : "Denver","region" : {"name" : "CO"},"country" : {"name" : "USA"}}}';
		fromJSON obj = parse(json);
		System.assert(obj != null);
	}*/
}