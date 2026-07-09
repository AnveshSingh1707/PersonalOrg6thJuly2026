@isTest
public class TestTriggerConnUSA {
    public static testMethod void onAftInst(){
        TestRecordsConUSA.RecordForConnectUSA();
        Account acc = [Select id,Name, Connect_America_Account__c from Account where Name = 'testAccount'];
        System.assertEquals(acc.Connect_America_Account__c, true);
        
    }
    public static testMethod void onAftUpd(){
        TestRecordsConUSA.RecordForConnectUSA();
        List<Contact> lstCon = [Select id, lastName,AccountId,Connect_America_Account__c from Contact where lastName Like 'testContact%' Limit 2];
        List<Contact> lstnewCon = new List<Contact>();
        for(Contact con : lstCon){
            con.Connect_America_Account__c = false;
            lstnewCon.add(con);
        }update lstnewCon;
        Account acc = [Select id,Name, Connect_America_Account__c from Account where Name = 'testAccount'];
        System.assertEquals(acc.Connect_America_Account__c,false);
    }
    public static testMethod void onAftDel(){
        TestRecordsConUSA.RecordForConnectUSA();
        List<Contact> lstContacts = new List<Contact>();
        List<Contact> lstContactsdel = [Select id, LastName,Connect_America_Account__c from Contact where LastName like '%testCon%' limit 2];
        System.debug('lstContactsdel'+lstContactsdel);
        for(Contact contacts : lstContactsdel){
            delete contacts;
        }
        Account a = [Select id, Connect_America_Account__c from Account where Name = 'testAccount'];
        System.assertEquals(a.Connect_America_Account__c,true);
        List<Contact> todel = [Select id, LastName,Connect_America_Account__c from Contact where LastName like '%testCon%'];
        for(Contact c : todel){
            lstContacts.add(c);
        }delete lstContacts;
        
    }
}