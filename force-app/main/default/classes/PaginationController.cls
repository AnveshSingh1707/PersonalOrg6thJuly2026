public class PaginationController {
    public ApexPages.StandardSetController standardSetCtrl {
     get{
         if(standardSetCtrl == null){
            Integer size = 5;
            string queryString = 'SELECT Name,Valid_Through__c,Status__c,Available_Deals__c from Deal__c';
            standardSetCtrl = new ApexPages.StandardSetController(Database.getQueryLocator(queryString));
            standardSetCtrl.setPageSize(size);
            Integer noOfRecords = standardSetCtrl.getResultSize();
    }
    return standardSetCtrl;
    }set;
}

}