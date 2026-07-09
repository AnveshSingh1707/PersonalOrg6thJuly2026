@isTest
private class TestForTriggerOnContacts {
    @testSetup
    public static void recordsCreation() {
        
        //Create a sample Account from scratch
        List<Account> newLstAcc = new List<Account>();
        for(Integer j=0 ;j<2; j++){
            Account newAcc = new Account();
            newAcc.Name='SampleTestAccount'+j;
            newAcc.Email__c='sampletest'+j+'@testsample.com';
            newLstAcc.add(newAcc);
        }insert newLstAcc;
        
        //create bulk of Contact records assosiated with the sampleTestAccount
        List<Contact> lstContact = new List<Contact>();
        for(Integer i=0; i<200; i++){
            Contact newContacts = new Contact();
            newContacts.LastName='SampleTestContact'+i;
            lstContact.add(newContacts);
        }
        Test.startTest();
        insert lstContact;
        Test.stopTest();
        
    }
    @isTest
    public static void testTriggerOnContactForInsert(){
        RecordCreationForInsertion.recordForInsertion();
        RecordCreationForInsertion.recordWithAccEmail();
        Contact conWithEmail = [select id, LastName, AccountEmail__c from Contact where LastName= 'SampleCont1'];
        System.debug('noAccIdContact'+conWithEmail.AccountEmail__c);
        System.assertEquals('insertcontact1@test.com', conWithEmail.AccountEmail__c);
        Contact newContact = [Select id, LastName, AccountEmail__c from Contact where LastName = 'SampleCon1'];
        System.assertEquals('sample1@testsample.com', newContact.AccountEmail__c);
    }
    @isTest
    public static  void testTriggerOnContactForUpdate(){
        List<Contact> getlstContact = [select id,LastName,accountId,AccountEmail__c,Account.Email__c from Contact where LastName Like 'SampleTest%'];
        Account acc = [Select id,Name from Account where Name = 'SampleTestAccount0'];
        List<Contact> newlstCon = new List<Contact>();
        System.debug('getlstContact'+getlstContact);
        if(getlstContact.size()>0){
            For(Contact con : getlstContact){
                con.AccountId=acc.Id;
                newlstCon.add(con);
            }update newlstCon;
            for(Contact contacts : [Select AccountEmail__c from Contact where lastName='SampleTestContact1'])
                System.assertEquals('sampletest0@testsample.com', contacts.AccountEmail__c);
        }
        
    }
    
    @isTest
    public static void testTriggerOnContactForRemoval(){
        List<Contact> getlstContact = [select id,LastName,accountId,AccountEmail__c,Account.Email__c from Contact where LastName = 'SampleTest%'];
        Account acc = [Select id,Name from Account where Name = 'SampleTestAccount0'];
        List<Contact> newlstCon = new List<Contact>();
        List<Contact> newlstCont = new List<Contact>();
        System.debug('getlstContact'+getlstContact);
        if(getlstContact.size()>0){
            For(Contact con : getlstContact){
                con.AccountId=null;
                newlstCon.add(con);
            }update newlstCon;
            for(Contact contacts : [Select AccountEmail__c from Contact where lastName='SampleTestContact1'])
                System.assertEquals(null, contacts.AccountEmail__c);
        }
    }
}