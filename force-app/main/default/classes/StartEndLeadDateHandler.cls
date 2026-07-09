public class StartEndLeadDateHandler {
    public void onBeforeInsertEvent(List<Lead> lstLeads){
        Set<Id> leadId = new Set<Id>();
        for(Lead leads : lstLeads){
            leadId.add(leads.Id);
        }
        Map<Id,String> mapLeadYear = new Map<Id,String>();
        Map<Id,String> mapLeadQtr = new Map<Id,String>();
        List<Lead> allLeads = [Select id, Name, Year__c, Quarter__c from Lead where Id In :leadId];
        if(allLeads.size()>0){
        for(Lead allLead : allLeads){
            if(allLead.Year__c!=null){
                mapLeadYear.put(allLead.Id,allLead.Year__c);
                mapLeadQtr.put(alLLead.Id,allLead.Quarter__c);
                
            }
           
        }
            }
        
    }

}