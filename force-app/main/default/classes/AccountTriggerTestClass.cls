@isTest
private class AccountTriggerTestClass {
   private static testMethod void TestAutoNumberHandler() {

      Account testObAccount = New Account(connect_america_account__c=true,Industry= 'test data');
      testObAccount.Name = 'test1';
      insert testObAccount;
      testObAccount.Industry = 'new test1';
      update testObAccount;


   }
}