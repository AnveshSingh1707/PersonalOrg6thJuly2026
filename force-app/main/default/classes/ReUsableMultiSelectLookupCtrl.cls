public class ReUsableMultiSelectLookupCtrl {
    @AuraEnabled
    public static List < sObject > fetchLookUpValues(String searchKeyWord, String ObjectName, List<sObject> ExcludeitemsList) {
        String searchKey = '%' + searchKeyWord + '%';
        List < sObject > returnList = new List < sObject > ();
 
        List<string> lstExcludeitems = new List<string>();
        for(sObject item : ExcludeitemsList ){
            lstExcludeitems.add(item.id);
        }
        
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 5 and exclude already selected records  
        String sQuery =  'select id, Name,Email__c,Quantity__c,Cost_Price__c,Final_Amount__c,Industry,Phone from ' +ObjectName + ' where Name LIKE: searchKey AND Id NOT IN : lstExcludeitems order by createdDate DESC limit 5';
        List < sObject > lstOfRecords = Database.query(sQuery);
        
        for (sObject obj: lstOfRecords) {
            returnList.add(obj);
        }
        return returnList;
    }
    @AuraEnabled
    public static List < ProductWrapper > fetchProductValues(String searchKeyWord,List<sObject> ExcludeitemsList) {
        String searchKey = '%' + searchKeyWord + '%';
        List < ProductWrapper > returnList = new List < ProductWrapper > ();
        
        List<string> lstExcludeitems = new List<string>();
        for(sObject item : ExcludeitemsList ){
            lstExcludeitems.add(item.id);
        }
        
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 5 and exclude already selected records  
        String sQuery =  'select id, Name,Cost__c,Current_Inventory__c FROM Product2 WHERE Name LIKE: searchKey AND Id NOT IN : lstExcludeitems order by createdDate DESC LIMIT 5';
        List < Product2 > lstOfRecords = Database.query(sQuery);
        
        for (Product2 obj: lstOfRecords) {
            ProductWrapper wrap     =   new ProductWrapper();
            wrap.prodRecord         =   obj;
            if(obj.Cost__c != null && obj.Current_Inventory__c != null) {
                wrap.finalAmount        =   obj.Cost__c * obj.Current_Inventory__c;
            }else {
                wrap.finalAmount = null;
            }
            returnList.add(wrap);
        }
        return returnList;
    }
    // wrapper class with @AuraEnabled and {get;set;} properties 
    public class ProductWrapper{
        @AuraEnabled
        public Product2 prodRecord   {get;set;}
        @AuraEnabled
        public Decimal finalAmount {get;set;}
    }
}