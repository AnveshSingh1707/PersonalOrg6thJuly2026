@isTest
private class TestForMavensMate {
	
	@isTest static void test_method_one() {
		Account acc = new Account();
		acc.Active__c = 'true';
		acc.Account_Number__c = '12323435asdb';

		insert acc;
	}
	
	@isTest static void test_method_two() {
		// Implement test code
	}
	
}