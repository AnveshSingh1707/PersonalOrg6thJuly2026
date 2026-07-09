public class jsonToURI {
    public String contact_firstname{get;set;}
    public String contact_surname{get;set;}
    public String company_name{get;set;}
    public String prospect_type_id{get;set;}
    public String prospect_status_id{get;set;}
    public String  getEncodedURL(){
        String encodedURL = 'prospect_type_id='+((null != this.prospect_type_id)?this.prospect_type_id:'')
            +'&contact_firstname='+((null != this.contact_firstname)?this.contact_firstname:'')
            +'&contact_surname='+((null != this.contact_surname)?this.contact_surname:'')
            +'&company_name='+((null != this.company_name)?this.company_name:'')
            +'&prospect_status_id='+((null != this.prospect_status_id)?this.prospect_status_id:'');
        return encodedURL;
    }
}