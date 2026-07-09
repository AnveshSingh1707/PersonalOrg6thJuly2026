trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {
//BatchApexErrorTriggerHandler handler = new BatchApexErrorTriggerHandler(trigger.new, trigger.oldMap);
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            List<BatchLeadConvertErrors__c> listToInsert = new List<BatchLeadConvertErrors__c>();
            for(BatchApexErrorEvent record : Trigger.new){
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
}