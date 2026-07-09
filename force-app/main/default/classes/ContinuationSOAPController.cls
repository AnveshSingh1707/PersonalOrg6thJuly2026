public class ContinuationSOAPController {
 
    public AsyncFieldvalueService.getLoanFileDataResponseFuture stockQuoteFuture;
    public  FieldvalueService.loanFileResults  result {get;set;}

    // Action method
    public Continuation startRequest() {  
       Integer TIMEOUT_INT_SECS = 60;  
       Continuation cont = new Continuation(TIMEOUT_INT_SECS);
       cont.continuationMethod = 'processResponse';
       
       AsyncFieldvalueService.AsyncPCLenderFieldValuesAPIPort stockQuoteService = new AsyncFieldvalueService.AsyncPCLenderFieldValuesAPIPort();
           stockQuoteFuture = stockQuoteService.beginGetLoanFileData(cont,12345678);     
       return cont;   
    }    
    
    // Callback method
    public Object processResponse() {    
       result = stockQuoteFuture.getValue();
       System.debug('Result'+result);
       // Return null to re-render the original Visualforce page
       return null; 
    }
}