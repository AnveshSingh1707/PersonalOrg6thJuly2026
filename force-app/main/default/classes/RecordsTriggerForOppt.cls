@isTest
public class RecordsTriggerForOppt {
    public static testMethod void recordCreationOppt() {
        Id pricebookId = Test.getStandardPricebookId();
        PriceBook2 pb2 = new PriceBook2 (Name='Standard priceBook',Description = 'test');
        insert pb2;
        //Create your product
        Product2 prod = new Product2(
            Name = 'Product X',
            ProductCode = 'Pro-X',
            isActive = true
        );
        insert prod;
        //Create your pricebook entry
        PricebookEntry pbEntry2 = new PricebookEntry(
            Pricebook2Id = pricebookId,
            Product2Id = prod.Id,
            UnitPrice = 100.00,
            IsActive = true,
            UseStandardPrice = false
        );
        insert pbEntry2;
        PricebookEntry pbEntry = new PricebookEntry(
            Pricebook2Id = pb2.id,
            Product2Id = prod.Id,
            UnitPrice = 100.00,
            IsActive = true,
            UseStandardPrice = false
        );
        insert pbEntry;
        //String values= 'Design;SEO;'; 
        String values = 'Product X';
        Lead lead = new Lead(LastName='testo',FirstName='so',Company='Test',Opportunity_Products__c=values);
        insert lead;
        List<Lead> LeadsToConvert = new List<Lead>();
        for(Integer i=0; i<100; i++){
            Lead newLead = new Lead();
            newLead.LastName='test'+i;
            newLead.Company='Test';
            newLead.Opportunity_Products__c=values;
            LeadsToConvert.add(newLead);
        }
        insert LeadsToConvert;
        
        list<Database.LeadConvert> leadConverts = new list<Database.LeadConvert>();
        for(Lead myLead : LeadsToConvert){
            Database.LeadConvert lc = new database.LeadConvert();
            lc.setLeadId(myLead.Id);
            lc.convertedStatus = 'Closed - Converted';
            //Database.ConvertLead(lc,true);
            lc.setDoNotCreateOpportunity(false);
            leadConverts.add(lc);
        }
        
        if(!leadConverts.isEmpty()){
            for(Integer i = 0; i <= leadConverts.size() ; i++){
                list<Database.LeadConvert> tempList = new list<Database.LeadConvert>();
                Integer startIndex = i*100;
                Integer endIndex = ((startIndex+100) < leadConverts.size()) ? startIndex+100: leadConverts.size();
                for(Integer j=startIndex;j<endIndex;j++){
                    tempList.add(leadConverts[j]);
                }
                Database.LeadConvertResult[] lcrList = Database.convertLead(tempList, false);
                for(Database.LeadConvertResult lcr : lcrList)
                    System.assert(lcr.isSuccess());
            }
        }
    }
}