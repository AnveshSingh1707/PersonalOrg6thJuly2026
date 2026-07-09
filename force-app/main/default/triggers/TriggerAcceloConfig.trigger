trigger TriggerAcceloConfig on Opportunity (after insert) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            AcceloConfigHandler.testSalesConfig();
        }
    }

}