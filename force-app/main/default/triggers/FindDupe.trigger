trigger FindDupe on Lead(before insert,before update){
    for (Lead newLead:Trigger.new){
        if(newLead.Email!=null){
        List<Contact> dupes =[select id  from contact where Email=:newLead.Email];  
            if(dupes.size()>0){
                newLead.Contact__c=dupes[0].Id;
            }
            else{
                newLead.Contact__c=null;
            }
        }
    } 
}