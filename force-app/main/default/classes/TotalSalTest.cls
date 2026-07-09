@isTest
public class TotalSalTest {
    
    @isTest static void addContacts() {
        Decimal totalsal = 0;
        //create a test account from scratch
        Account acnt = new Account(Name = 'Accounttest1');
        insert acnt;
        //create 200 test contacts associated with the test account
        List < Contact > lstContact = new List < Contact > ();
        for (Integer i = 0; i < 200; i++) {
            Contact c = new Contact();
            c.LastName = 'Test' + i;
            c.AccountId = acnt.Id;
            c.Salary__c = 1 + i;
            lstContact.add(c);
        }
        insert lstContact;
        
        List < Contact > newLstContact = [Select id, Name, Salary__c, Account.Name, account.Total_Salary__c
                                          from Contact Where LastName = 'Test1'];
        
        for (Contact ct: newLstContact) {
            totalsal = ct.account.Total_Salary__c;
        }
        System.assertEquals(20100, totalsal);
        
        //on deleting a contact
        
        if (newLstContact.size() > 0)
            delete newLstContact;
        for(Contact ct : [select id, Name, Salary__c, Account.name, account.Total_Salary__c
                          from Contact where LastName = 'Test2']){
                              totalsal = ct.account.Total_Salary__c;
                          }
        System.assertEquals(20098, totalsal);
        
    }
    
}