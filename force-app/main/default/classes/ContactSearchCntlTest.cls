@isTest
private class ContactSearchCntlTest {

	private static testMethod void contactSearchTest() {
	     test.startTest();
	     test.setCurrentPage(page.ContactSearch);
	     ContactSearchCntl controller = new ContactSearchCntl();
	    
	    
	    //define the variables
	     controller.selectedRadius = '15';
	     controller.enteredData = 'Boston';

         StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
         mock.setStaticResource('ContactSearchResponse');
         mock.setStatusCode(200);
         mock.setHeader('Content-Type', 'application/json');
        
        // Set the mock callout mode
         Test.setMock(HttpCalloutMock.class, mock);
        
        // Call the method that performs the callout
         ContactSearchCntl searchCntrl = new ContactSearchCntl();
         searchCntrl.searchContacts();
         
        //  assert the inserted record
         controller.saveSearchedRecords();
         List<Saved_Searches__c> lstSavedSearches = [SELECT id, Under_Radius__c, ZipCodeOrCity__c FROM Saved_Searches__c WHERE ZipCodeOrCity__c = 'Boston'];
         System.assertEquals(1, lstSavedSearches.size());
         
         controller.showSavedRecords();
        
         
         controller.selectedRadius = '';
         controller.enteredData = '';
         controller.saveSearchedRecords();
         
         
         //  test Saved_Searches__c record
    	 Saved_Searches__c testRecord = new Saved_Searches__c();
    	 testRecord.Under_Radius__c = '15';
    	 testRecord.ZipCodeOrCity__c = 'Boston';
    	 insert testRecord;
    	 String searchTestId = testRecord.Id;
             
    
         
         controller.searchId = ApexPages.currentPage().getParameters().put('searchId', testRecord.id);
         controller.redirectToSearchFilters();
         test.stopTest();
         
         

    }
}