@isTest
public class TestCtA{
     static testMethod void newContactInsert(){
        Contact newContact = new Contact();
        newContact.FirstName='allen';
        newContact.LastName='donald';
        insert newContact;
    }
}