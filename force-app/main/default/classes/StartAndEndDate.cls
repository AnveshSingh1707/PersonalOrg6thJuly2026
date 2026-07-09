public class StartAndEndDate {
    public static void populateDateStartAndEnd(Set<Id> LeadId){
        List<Lead> lstLead = [SELECT id, Year__c, Quarter__c fROM Lead WHERE Id IN :LeadId AND Year__c !=null ];
        List<Lead> newLead = new List<Lead>();
        for(Lead leads : lstLead){
            if(leads.Quarter__c =='Q1'){
                Date myStartDate = date.newInstance(Integer.valueOf(leads.Year__c),01,01);
                leads.Quarter_Start_Date__c = myStartDate;
                Date myEndDate = date.newInstance(Integer.valueOf(leads.Year__c),03,31);
                leads.Quarter_End_Date__c = myEndDate;
                newLead.add(leads);
                
                
            }else if(leads.Quarter__c =='Q2'){
                Date myStartDate = date.newInstance(Integer.valueOf(leads.Year__c),04,01);
                leads.Quarter_Start_Date__c = myStartDate;
                Date myEndDate = date.newInstance(Integer.valueOf(leads.Year__c),06,30);
                leads.Quarter_End_Date__c = myEndDate;
                newLead.add(leads);
               
           }else if(leads.Quarter__c =='Q3'){
               Date myStartDate = date.newInstance(Integer.valueOf(leads.Year__c),07,01);
                leads.Quarter_Start_Date__c = myStartDate;
                Date myEndDate = date.newInstance(Integer.valueOf(leads.Year__c),09,30);
                leads.Quarter_End_Date__c = myEndDate;
                newLead.add(leads);
               
           }else if(leads.Quarter__c =='Q4'){
               Date myStartDate = date.newInstance(Integer.valueOf(leads.Year__c),10,01);
                leads.Quarter_Start_Date__c = myStartDate;
                Date myEndDate = date.newInstance(Integer.valueOf(leads.Year__c),12,31);
                leads.Quarter_End_Date__c = myEndDate;
                newLead.add(leads);
               
           }
        }
        LeadTriggerHandler.update_Flag = true;
        update newLead;
        
    }

}