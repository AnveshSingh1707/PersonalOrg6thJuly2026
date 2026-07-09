@isTest
private class VoteTriggerTestClass {
   private static testMethod void TestAutoNumberHandler() {

      Vote__c testObVote = New Vote__c(Test_Picklist2__c= 'test data');
      insert testObVote;
      testObVote.Test_Picklist2__c = 'new test1';
      update testObVote;

   }
}