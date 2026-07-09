public class TriggerOnContactHandler { 
    public static void EmailAssignmentToContactsOnInsert(List<Contact> lstContact ,Map<Id,Contact> oldMapContact, Boolean isInsert){ 
        System.debug('isInsert'+isInsert);
        set<Id> setAccIds = new Set<Id>();
        for(Contact con : lstContact){
            if(con.AccountId != null){
                setAccIds.add(con.AccountId);
            }
        }
        Map<Id,Account> newaccMap = new Map<Id,Account>([Select id, Email__c From Account where ID IN: setAccIds and Email__c!=null]);
        for(Contact con : lstContact){
           //con.AccountEmail__c=null;
            if(isInsert) {            
                if(con.AccountId != null && newaccMap.get(con.AccountId)!=null){
                    con.AccountEmail__c = newaccMap.get(con.AccountId).Email__c;
                }if(con.AccountEmail__c!=null){
                    con.AccountEmail__c=con.AccountEmail__c;
                }
            }
            else if(con.AccountId != null && con.AccountId!= oldMapContact.get(con.Id).AccountId && newaccMap.get(con.AccountId)!=null) {
                con.AccountEmail__c = newaccMap.get(con.AccountId).Email__c;
            }else {
                con.AccountEmail__c=null;
            }
            
        }
    }
    /**
public static void EmailAssignmentToContactsOnUpdate(List<Contact> lstContacts ,Map<Id,Contact> oldMapContact){

set<Id> setAccIds = new Set<Id>();
for(Contact con : lstContacts){
if(con.AccountId!= null && (con.AccountId!= oldMapContact.get(Con.Id).AccountId)){
setAccIds.add(con.AccountId);
} if(con.AccountId==null){
con.AccountEmail__c = '';
}
}
Map<Id,Account> accMap= new Map<Id,Account>([Select id, Email__c From Account where ID IN: setAccIds]);
for(Contact con : lstContacts){
if(con.AccountId != null){
con.AccountEmail__c= accMap.get(con.AccountId).Email__c;
}
}
}
**/
}