trigger TriggerOnOpportunity on Opportunity (after insert,after update,after delete,after undelete,before update, before insert, before delete) {
    // OpportunityTriggerHandler oth = new OpportunityTriggerHandler();
    OpportunityTriggerHandler handler = new OpportunityTriggerHandler(trigger.new,trigger.newMap,trigger.old,trigger.oldMap,trigger.isInsert,trigger.isUpdate,trigger.isDelete,trigger.isUndelete);
    if(Trigger.isAfter){
        if(trigger.isInsert){
            handler.onAfterInsertEvents();    
        }else if(trigger.isUpdate){
            handler.onAfterUpdateEvents();
        }else if (trigger.isDelete) {
            handler.onAfterDeleteEvents();
        }else if (trigger.isUndelete) {
            handler.onAfterUndeleteEvents();
        }
    }else if(Trigger.isBefore){
        if (trigger.isInsert) {
            
        }else if (trigger.isUpdate) {
            
        }else if (trigger.isDelete) {
            handler.onBeforeDeleteEvents();
        }else if (trigger.isUndelete) {
            
        }
    }

}