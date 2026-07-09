@isTest
public class TestDuplicate{
   static testMethod void duplicate(){
   //create the record for contact object
   Contact testContact = new Contact();
   testContact.FirstName='Lebron';
   testContact.LastName='James';
   testContact.Email='LebronJames.23@gmail.com';
   
   insert testContact;
   
   //creating a lead record
   Lead testLead=new Lead();
   testLead.FirstName='Allen';
   testLead.LastName='Iverson';
   testLead.Company='7tySixers';
   testLead.Email='LebronJames.23@gmail.com';
   
   /*since we have created the trigger and validation rule so
   as per our record , email field in lead is going to get error */
   try{
   insert testLead;
   }Catch(Exception e){
   system.debug('as per expected we have got the error');
   }
   
   
   //now we are going to assert whether we are getting what we are expecting .
   List<Lead> duplicateLead =[Select id from lead where Email='LebronJames.23@gmail.com'];
   system.assertEquals(0,duplicateLead.size());
   
   //now as per best practices we are going to break our trigger 
   
   
   //create new lead records
   Lead testLead1=new Lead();
   
   testLead1.FirstName='Derrick';
   testLead1.LastName='Rose';
   testLead1.Company='ChicagoBulls';
   testLead1.Email='DerrickRose10@gmail.com';
   
   insert testLead1;
   
   //email should not match
   List<Lead>  nonduplicateLead =[select id from lead where Email='DerrickRose10@gmail.com'];
   system.assertEquals(1,nonduplicateLead.size());
   
  
   }
  }