@isTest
public class RecordUtilForOppTrigger {
    public static testMethod void recordCreation(){
        List<Lead> lstLeads = new List<Lead>();
        String values='SEO;Design;Content';
        for(Integer i=0; i<100; i++){
            Lead newLead = new Lead();
            newLead.LastName = 'Test'+i;
            newLead.Company = 'testab'+i;
            newLead.Opportunity_Products__c = values;
            lstLeads.add(newLead);
        }
        if(lstLeads.size()>0){
            Test.startTest();
            insert lstLeads;
            Test.stopTest();
        }
    }
}