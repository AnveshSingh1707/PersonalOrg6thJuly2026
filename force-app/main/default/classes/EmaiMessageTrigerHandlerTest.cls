@isTest
public class EmaiMessageTrigerHandlerTest {
    private static testMethod void testBody1() {	
		Account acc = new Account();
        acc.Name= 'test1';
        insert acc;      
      
        Contact con = new Contact ();
        con.FirstName = 'Test';
        con.LastName = 'Test';
        con.AccountId = acc.Id;
        con.Email = 'test@test.com';
        insert con;
        
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('EmailMsgForwardMsg');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json');        
        //Email Message Record
         EmailMessage[] newEmail1 = new EmailMessage[0];
         newEmail1.add(new EmailMessage(Subject = 'Test Subject 1',
                                        TextBody = '---------- Forwarded message ----------\nFrom: Test test <test@test.com>\nDate: Thu, Apr 19, 2018 at 8:07 PM\nSubject: test test\nTo: Test Test <test@test.com>',
                                        Contact__c = con.Id));
        // Set the mock callout mode                                        
        Test.setMock(HttpCalloutMock.class, mock);
        insert newEmail1;
    }
	
    private static testMethod void testBody2(){
        Account acc = new Account();
        acc.Name= 'test1';
        insert acc;
      
        Contact con = new Contact ();
        con.FirstName = 'Test';
        con.LastName = 'Test';
        con.AccountId = acc.Id;
        con.Email = 'test@test.com';
        insert con;
            
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('EmailMsgOutLookWithReplyMsg');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json');

        // Set the mock callout mode
        Test.setMock(HttpCalloutMock.class, mock);
             
        //Create another TextBody for same contact
        EmailMessage[] newEmail2 = new EmailMessage[0];
		newEmail2.add(new EmailMessage(Subject = 'Test Subject 2',
                                        TextBody = 'Outlook with a reply directly above line\n________________________________________\nFrom: CRM Comments [crm-comment@example.com]\nSent: Friday, 23 March 2012 5:08 p.m.\nTo: John S. Greene\nSubject: [contact:106] John Greene\nA new comment has been added to the Contact named John Greene:\nI am replying to a comment.',
                                        Contact__c = con.Id));            
        insert newEmail2;    
    }
}