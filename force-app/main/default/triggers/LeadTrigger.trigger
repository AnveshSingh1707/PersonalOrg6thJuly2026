trigger LeadTrigger on Lead (Before insert, Before update,after update) {
    LeadTriggerHandler lth = new LeadTriggerHandler(Trigger.new,Trigger.old,Trigger.newMap,Trigger.oldMap);
    if(Trigger.isAfter){
        if(Trigger.isUpdate){
            system.debug('afterupdate');
      		lth.isAfterUpdateEvents();
        }
    }else if(Trigger.isBefore){
        if(Trigger.isInsert){
          lth.isBeforeInsertEvents();
            
        }else if(Trigger.isUpdate){
            lth.isBeforeUpdateEvents();
        }
    }

}