public class DealPaginationController {

    public PageReference Save() {
       setCon.save();
       setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                      [select Name,Valid_Through__c,Deal_Icon__c,Status__c,Available_Deals__c from Deal__c]));
                      getDeals();
       //Deals = [select Name,Valid_Through__c,Deal_Icon__c,Status__c,Available_Deals__c from Deal__c];
        return null;
    }


    


    public Integer getRoundedNo() {
        return (Integer)Math.ceil(noOfRecords/size)+1;
    }

    
    Public Integer size{get;set;} 
    Public Integer noOfRecords{get; set;} 
   
         
    public DealPaginationController(){
        size=Integer.valueOf(label.Deal_Page_Size);
        //String query='[select Name,Valid_Through__c,Deal_Icon__c,Status__c,Available_Deals__c from Deal__c]';
        
    }
     
    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {                
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                      [select Name,Valid_Through__c,Deal_Icon__c,Status__c,Available_Deals__c from Deal__c]));
                setCon.setPageSize(size);  
                noOfRecords = setCon.getResultSize();
               
            }            
            return setCon;
        }
        set;
    }
     
    //Changes the size of pagination
   public PageReference refreshPageSize() {
         setCon.setPageSize(size);
         return null;
    }
 
    // Initialize setCon and return a list of record    
     
    public List<Deal__c> getDeals() {
    //setCon.save();
           
         return (List<Deal__c>) setCon.getRecords();
    }
    
   
}