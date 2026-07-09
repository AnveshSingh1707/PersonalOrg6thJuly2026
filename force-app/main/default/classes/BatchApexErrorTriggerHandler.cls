public class BatchApexErrorTriggerHandler {
 public List<BatchApexErrorEvent> recordNewList;
    public Map<Id,BatchApexErrorEvent> recordOldMap;
    public BatchApexErrorTriggerHandler(List<BatchApexErrorEvent> recordNewList,Map<Id,BatchApexErrorEvent> recordOldMap){
        this.recordNewList = recordNewList;
        this.recordOldMap = recordOldMap;
    }
    public void onAfterInsertEvents(){
        trailhead();    
    }
    public void trailhead(){
        List<BatchLeadConvertErrors__c> listToInsert = new List<BatchLeadConvertErrors__c>();
        for(BatchApexErrorEvent record : recordNewList){
            BatchLeadConvertErrors__c convertError = new BatchLeadConvertErrors__c ();
            convertError.AsyncApexJobId__c = record.AsyncApexJobId;
            convertError.Records__c = record.JobScope;
            convertError.StackTrace__c = record.StackTrace;
            listToInsert.add(convertError);
        }
        if(!listToInsert.isEmpty()){
            insert listToInsert ;    
        }
    }
}