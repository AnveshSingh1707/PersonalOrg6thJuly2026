public class TriggerHandlerConnectUSA {
    public void onAfterInsertUpdateEvents(List<Contact> lstContact){
        Integer i=0;
        Set<Id> accId = new Set<Id>();
        List<Account> lstupdatedAcc = new List<Account>();
        
        for(Contact cont : lstContact){
            if(cont.AccountId!=null){
                accId.add(cont.AccountId);
            }
        }
        Map<Id,Contact> mapoldContact = new Map<Id,Contact>([Select id,LastName, Connect_America_Account__c,AccountId from Contact where AccountId In :accId]);
        System.debug('mapoldContact'+mapoldContact);
        List<Contact> lstco = [Select id,LastName, Connect_America_Account__c,AccountId from Contact where AccountId In :accId];
        for(Contact cont : lstco){
            if(mapoldContact.get(cont.Id).Connect_America_Account__c==true){
                i = ++i;
                System.debug('i values:'+i);
            }
        }
        List<Account> lstnewAcc = [Select id,Name,Connect_America_Account__c from Account where id In :accId];
        //converting double for to a map and for
        Map<Id,Contact> mapCon = new Map<Id,Contact>();
        mapCon.putAll(lstContact);
        for(Account acc : lstnewAcc){
            if(i==mapoldContact.size() && acc.Id!=null){
                acc.Connect_America_Account__c = true;
                lstupdatedAcc.add(acc);
            }else{
                acc.Connect_America_Account__c=false;
                lstupdatedAcc.add(acc);
            }
        }
        
        update lstupdatedAcc;
    }
    public void onAfterDeleteEvents(List<Contact> lstdelContact){
        System.debug('lstdelContact'+lstdelContact);
        Set<Id> accId = new Set<Id>();
        List<Account> newlstAcc = new List<Account>();
        for(Contact cont : lstdelContact){
            if(cont.AccountId!=null){
                accId.add(cont.AccountId);
            }  
        }
        List<Account> lstAcc = new List<Account>([Select id, Name, Connect_America_Account__c from Account where Id In :accId]);
        Map<Id,Contact> mapCont = new Map<Id,Contact>([Select id,LastName,AccountId, Connect_America_Account__c from Contact where AccountId In :lstAcc and Connect_America_Account__c=true]);
        System.debug('mapCont'+mapCont);
        for(Account acc : lstAcc){
            if(mapCont.size()>0){
                acc.Connect_America_Account__c=true;
                newlstAcc.add(acc);
            }else{
                acc.Connect_America_Account__c=false;
                newlstAcc.add(acc);
            }update newlstAcc;
        }
    }
}