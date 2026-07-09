public with sharing class MaintenanceRequestHelper {
    
    public static void updateWorkOrders(Map<Id, Case> applicable_cases){ 
        
        Map <Id, Integer> mapProduct = new Map<Id, Integer>();
        List<Case> newCases = new List<Case>();
        for(Product2 prod : [select Id, Maintenance_Cycle__c from Product2]){
            if (prod != null) {
                if(prod.Maintenance_Cycle__c != null){
                    mapProduct.put(prod.Id, Integer.valueOf(prod.Maintenance_Cycle__c));
                }               
            }
        }
        
        for(Case a : applicable_cases.values() ){
            Case newCase 				= new Case();
            newCase.Vehicle__c 			= a.Vehicle__c;
            newCase.Equipment__c 		= a.Equipment__c;
            newCase.Type 				= 'Routine Maintenance';
            newCase.Subject 			= String.isBlank(a.Subject) ? 'Routine Maintenance Request' : a.Subject;
            newCase.Date_Reported__c 	= Date.today();
            newCase.Status 				= 'New';
            newCase.Product__c 			= a.Product__c;
            newCase.AccountId 			= a.AccountId;
            newCase.ContactId 			= a.ContactId;
            newCase.AssetId 			= a.AssetId;
            newCase.Origin 				= a.Origin;
            newCase.Reason 				= a.Reason;
            newCase.Date_Due__c 		= (mapProduct.get(a.Id) != null) ? (Date.today().addDays(Integer.valueOf(mapProduct.get(a.Id)))) : (Date.today());
            newCases.add(newCase);
        }
        if(newCases.size() > 0){
            insert newCases;
        }
    }        
    
}