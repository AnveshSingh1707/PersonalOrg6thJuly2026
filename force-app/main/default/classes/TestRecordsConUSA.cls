@isTest
public class TestRecordsConUSA {
 public static testMethod void RecordForConnectUSA(){
        //New Account 
        Account newAcc = new Account();
        newAcc.Name='testAccount';
        insert newAcc;
        //Bulk Contacts associated with the same account 'testAccount'
        List<Contact> lstContacts = new List<Contact>();
        for(Integer i=0; i<200; i++){
            Contact newCon = new Contact();
            newCon.AccountId=newAcc.id;
            newCon.LastName='testContact'+i;
            newCon.Connect_America_Account__c=true;
            lstContacts.add(newCon);
        }
        Test.startTest();
        insert lstContacts;
        Test.stopTest();
    }

}