trigger TriggerOnContactConnectUSA on Contact (after insert,after update,after delete) {
    TriggerHandlerConnectUSA thcu = new TriggerHandlerConnectUSA();
    if(Trigger.isAfter){
        if(Trigger.isInsert||Trigger.isUpdate){
            thcu.onAfterInsertUpdateEvents(Trigger.new);
        }
        if(Trigger.isDelete){
            thcu.onAfterDeleteEvents(Trigger.old);
        }
    }
    
}