public class FromJSON{
	public cls_contactInfo contactInfo;
   public cls_organizations[] organizations;
   public class cls_organizations {
		public String name;	//Microsoft
		public String startDate;	//1975
		public String title;	//Co-founder
		public boolean current;
	}
    public cls_socialProfiles[] socialProfiles;
	public class cls_socialProfiles {
		public String typeId;	//twitter
		public String url;	//https://twitter.com/BillGates
	}
    public cls_Demographics Demographics;
	public class cls_contactInfo {
		public String familyName;	//Lorang
		public String givenName;	//Bart
		public String fullName;	//Bart Lorang
		public String Gender;//male
        
	}
    
  
   public class cls_Demographics {
		public String gender;
        public String age;//62//male
	}
	public static FromJSON parse(String json){
        System.debug('fromJSON'+json);
        System.debug('FromJSON apex'+json);
		return (FromJSON) System.JSON.deserialize(json, FromJSON.class);
	}
}