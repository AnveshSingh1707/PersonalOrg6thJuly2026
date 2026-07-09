trigger AccountTrigger on Account (after insert) {
    AccountTriggerHandler accHandler = new AccountTriggerHandler(trigger.new,trigger.old,trigger.newMap,trigger.oldMap,trigger.isInsert,trigger.isUpdate);
    if(trigger.isInsert){
        accHandler.onAfterInsertEvents();    
    }
}