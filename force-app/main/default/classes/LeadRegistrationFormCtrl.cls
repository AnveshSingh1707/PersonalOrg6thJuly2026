public class LeadRegistrationFormCtrl {
    public ContentVersion   cv              {get;set;}
    public Lead             leadRecord      {get;set;}
    public String           fileExtension   {get;set;}
    public LeadRegistrationFormCtrl(){
        cv              =   new ContentVersion();
        leadRecord      =   new Lead();
        fileExtension   =   '';
        
    }
    public List<Schema.FieldSetMember> getChildDetails() {
        return SObjectType.Lead.FieldSets.Child_Details.getFields();
    }
    public void submit(){
        System.debug('fileExtension--'+fileExtension);
        System.debug('cv.title--'+cv.title);
        if(leadRecord != null){
            insert leadRecord;
            if(String.isNotBlank(leadRecord.Id) && cv.VersionData != null){
                cv.FirstPublishLocationId   =   leadRecord.Id;
                cv.Title                    =   cv.Title + fileExtension;
                insert cv;
            }
            cv = new ContentVersion();
        }
    }
}