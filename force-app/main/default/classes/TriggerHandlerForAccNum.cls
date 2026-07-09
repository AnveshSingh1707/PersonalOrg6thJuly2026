public class TriggerHandlerForAccNum {
    public void onBeforeInsertEvents(List<Contact> lstContact){
        Set<Id> accId = new Set<Id>(); 
        for(Contact con : lstContact){
            if(con.AccountId!=null && con.Final_Number__c==true){
                accId.add(con.AccountId);
                System.debug('accId'+accId);
            }
            for(Account acc : [Select id,Name,Account_Number__c from Account where id In :accId]){
                if(acc.id!= null && acc.Account_Number__c!= null){
                    con.Account_Number__c = acc.Account_Number__c;
                }
            }
        }
    }
    public void onBeforeUpdateEvents(List<Contact> lstContact, Map<Id,Contact> oldlstContact){
        Set<Id> accId = new Set<Id>();
        //at the time of update we must take care, that we are updating that paticular checkbox only 
        for(Contact cont : lstContact){
            if(cont.AccountId!=null && (cont.Final_Number__c!= oldlstContact.get(cont.id).Final_Number__c) && cont.Final_Number__c==true){
                accId.add(cont.AccountId);
            }else if(cont.AccountId == null){
                cont.Account_Number__c='';
                cont.Final_Number__c=false;
            }
            for(Account acc : [Select id,Account_Number__c,Name from Account where Id In :accId]){
                if(acc.id!=null && acc.Account_Number__c!=null){
                    cont.Account_Number__c = acc.Account_Number__c;
                }
            }
        }
    }
}