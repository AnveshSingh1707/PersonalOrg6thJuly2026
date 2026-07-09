trigger StartEndLeadDates on Lead (before insert,before update) {
    StartEndLeadDateHandler seldh = new StartEndLeadDateHandler();
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            seldh.onBeforeInsertEvent(Trigger.new);
            
        }
        if(Trigger.isUpdate){
            
        }
    }

}