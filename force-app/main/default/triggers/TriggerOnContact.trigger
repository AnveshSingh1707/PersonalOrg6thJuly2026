trigger TriggerOnContact on Contact(before insert, before update){    
    if(Trigger.isBefore){
        
       TriggerOnContactHandler.EmailAssignmentToContactsOnInsert(Trigger.new, Trigger.oldMap, Trigger.isInsert);            
    }     
    /*if(Trigger.isUpdate){
TriggerOnContactHandler.EmailAssignmentToContactsOnUpdate(Trigger.new, Trigger.oldMap);
}*/
}