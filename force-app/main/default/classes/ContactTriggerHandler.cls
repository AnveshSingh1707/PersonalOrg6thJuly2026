public class ContactTriggerHandler{
    
    public static Boolean populateLocationCordinates_Flag = false;
    
	List<Contact> recordNewList = new List<Contact>();
    List<Contact> recordOldList = new List<Contact>();
    Map<Id,Contact> recordNewMap = new Map<Id,Contact>();
    Map<Id,Contact> recordOldMap = new Map<Id,Contact>();
    
    public ContactTriggerHandler(List<Contact> recordNewList,List<Contact> recordOldList,Map<Id,Contact> recordNewMap,Map<Id,Contact> recordOldMap){
        this.recordNewList = recordNewList;
        this.recordOldList = recordOldList;
        this.recordNewMap = recordNewMap;
        this.recordOldMap = recordOldMap;
    }
    
    public void onAfterInsertEvents(){
        if(!populateLocationCordinates_Flag){
			populateLocationCordinates_Flag = true;
            populateLocationCordinates();  
        }
    }
    
    public void onAfterUpdateEvents(){
        if(!populateLocationCordinates_Flag){
			populateLocationCordinates_Flag = true;
            populateLocationCordinates();  
        }
    }
    
    public void populateLocationCordinates(){
		Set<Id> contactIdSet = new Set<Id>();
        for(Contact con : recordNewList){
            if(String.isNotBlank(con.MailingCity) || String.isNotBlank(con.MailingPostalCode)) {
                contactIdSet.add(con.Id);
            }
        }
        if(!contactIdSet.isEmpty()){
            ContactLocationFinder.populateLocationCordinates(contactIdSet);
        }
    }
    
}