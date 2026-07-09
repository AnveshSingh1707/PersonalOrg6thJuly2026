trigger triggerOnLead on Lead (before insert, before update) {
    
    for(Lead l:Trigger.new){
        if(System.isFuture()){
            return;
        }
        if(l.Company!=null){
            Util.callWebSercvice1(l.Id,l.Company);
        }
        if(l.email!=null||l.Twitter__c!=null||l.Phone!=null){
            Util.callWebSercvice2(l.Id,l.email,l.Phone,l.Twitter__c);
        } 
    }
}