@isTest
public class TestForConnectUSA {
    
    public static testMethod void onAfterInsert(){
        //TestRecordsConUSA.RecordForConnectUSAId();
        //List<Contact> lstCon = [(Select id, lastName,AccountId from Contacts where lastName ='testContact11')]
        Account newAcc = new Account();
        newAcc.Name='testAcc';
        insert newAcc;
        List<Contact> lstCon = new List<Contact>();
        For(Integer i=0; i<200;i++){
            Contact newCon = new Contact();
            newCon.LastName='testCon'+i;
            newCon.AccountId=newAcc.id;
            newCon.Connect_America_Account__c=true;
            lstCon.add(newCon);   
        }
        Test.startTest();
        insert lstCon;
        Test.stopTest();
        Account acc = [Select id,Name ,Connect_America_Account__c from Account where Name = 'testAcc'];
        System.debug('acc'+acc);
        System.assertEquals(acc.Connect_America_Account__c,true);
        
        //for update
        List<Contact> lstnewContact = new List<Contact>([Select id,AccountId,Connect_America_Account__c from Contact where Account.Name = 'testAcc']);
        List<Contact> lstContact = new List<Contact>();
        System.debug('lstCon'+lstCon);
        for(Contact con : lstnewContact){
            con.Connect_America_Account__c= false;
            lstContact.add(con);
        }update lstContact;
        Account acct = [Select id,Connect_America_Account__c from Account where Name='testAcc'];
        System.assertEquals(acct.Connect_America_Account__c, false);
        //for deleted records
        List<Contact> lstContactsdel = [Select id, LastName,Connect_America_Account__c from Contact where LastName like '%testCon%' limit 2];
        System.debug('lstContactsdel'+lstContactsdel);
        for(Contact contacts : lstContactsdel){
            delete contacts;
        }
        
        Account a = [Select id, Connect_America_Account__c from Account where Name = 'testAcc'];
        System.assertEquals(a.Connect_America_Account__c,false);
    }
    
}