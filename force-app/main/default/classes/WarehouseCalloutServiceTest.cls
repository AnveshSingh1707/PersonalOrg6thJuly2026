@isTest
private class WarehouseCalloutServiceTest {
  // implement your mock callout test here
	@isTest
    static void WarehouseEquipmentSync(){
        
        Test.startTest();
       
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock()); 
         
        WarehouseCalloutService.runWarehouseEquipmentSync();
        Test.stopTest();        
        System.assertEquals(22, [SELECT count() FROM Product2]);        
    }   
}