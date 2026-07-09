trigger ContactTrigger on Contact (after insert, after update) {
	
    ContactTriggerHandler cth = new ContactTriggerHandler(Trigger.new,Trigger.old,Trigger.newMap,Trigger.oldMap);
    
    if(Trigger.isBefore){
        
    }else if(Trigger.isAfter){
        if(Trigger.isInsert){
            cth.onAfterInsertEvents();
        }else if(Trigger.isUpdate){
            cth.onAfterUpdateEvents();
        }
        
    }   
}