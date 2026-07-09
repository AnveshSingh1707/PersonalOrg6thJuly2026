public class UtilForContactTrigger {
    public static void assigningEmailOfAccountOnItsContacts(String AccountIds){
        String eml;
        List<Account> lstAccount = [select id,email__c from Account where id = :AccountIds];
        if(lstAccount.size()>0){
            for(Account acc : lstAccount){
                eml=acc.email__c;
            }
        }
        List<Contact> newlstContact = new List<Contact>();
        List<Contact> getlstContact = [select id,AccountEmail__c from Contact where accountId = :AccountIds];
        system.debug('@@'+getlstContact);
        if(getlstContact.size()>0){
            for(Contact c: getlstContact){
                c.AccountEmail__c=eml;
                newlstContact.add(c);
            }update newlstContact;
        }
        
    }
    //this method will remove the  accountEmail when no parent account is selected
    public static void removeAccountEmail(List<Contact> lstCon){
        List<Contact> newContacts = new List<Contact>();
        List<Contact> lstagainContact = [select id,AccountEmail__c from Contact where id in : lstCon];
        if(lstagainContact.size()>0){
            for(Contact c : lstagainContact){
                c.AccountEmail__c='';
                newContacts.add(c);
            }update newContacts;
        }
    }
}