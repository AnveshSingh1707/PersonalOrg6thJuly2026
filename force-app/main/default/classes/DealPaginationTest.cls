@isTest
public class DealPaginationTest{
    
    
    public static testMethod void DealTest(){
    //creating records from scratch
        List<Deal__c> lstDeal= new List<Deal__c>();
       
        for(Integer i=0;i<100;i++){
        Deal__c newDeal= new Deal__c();
        newDeal.Status__c='Available';
        newDeal.Name='Beach Rose'+i;
        newDeal.Available_Deals__c=30;
        newDeal.Valid_Through__c=Date.newInstance(2018, 01, 22);
        lstDeal.add(newDeal);
    
    }
    
    insert lstDeal;
       ApexPages.currentPage().getParameters().put('DealPagtinationController','?');
       ApexPages.StandardSetController stdDeal = new   ApexPages.StandardSetController(lstDeal);
       DealPaginationController dealController = new DealPaginationController();
       dealController.Save();
       dealController.refreshPageSize();
       dealController.getDeals();
       dealController.getRoundedNo();
       List<Deal__c> lstdl=[select Name from Deal__c where Name='Beach Rose1'];
       System.assertEquals(1, lstdl.size());
         
}
}