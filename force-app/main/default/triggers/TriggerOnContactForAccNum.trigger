trigger TriggerOnContactForAccNum on Contact (before insert,before update) {
    TriggerHandlerForAccNum thfan = new TriggerHandlerForAccNum();
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            thfan.onBeforeInsertEvents(Trigger.new);
        }
        if(Trigger.isUpdate){
            thfan.onBeforeUpdateEvents(Trigger.new , Trigger.oldMap);
        }
    }
    
}