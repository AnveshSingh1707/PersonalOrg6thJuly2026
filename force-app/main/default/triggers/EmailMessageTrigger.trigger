trigger EmailMessageTrigger on EmailMessage (after insert) {
    EmailMessageTriggerHandler emailMsg = new EmailMessageTriggerHandler(Trigger.new,Trigger.old,Trigger.newMap,Trigger.oldMap);
    If(Trigger.isAfter){
        If(Trigger.isInsert){
           emailMsg.onAfterInsertEvent();   
        }
    }
}