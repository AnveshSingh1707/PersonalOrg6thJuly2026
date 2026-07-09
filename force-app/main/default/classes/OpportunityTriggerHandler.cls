public class OpportunityTriggerHandler {
    List<Opportunity> recordNewList  = new List<Opportunity>();
    List<Opportunity> recordOldList  = new List<Opportunity>();
    Map<Id,Opportunity> recordNewMap = new Map<Id,Opportunity>();
    Map<Id,Opportunity> recordOldMap = new Map<Id,Opportunity>();
    Boolean isInsert,isUpdate,isdelete,isUndelete = false;
    
    public OpportunityTriggerHandler(List<Opportunity> recordNewList,Map<Id,Opportunity> recordNewMap,List<Opportunity> recordOldList,Map<Id,Opportunity> recordOldMap,
                                    Boolean isInsert,Boolean isUpdate,Boolean isDelete ,Boolean isUndelete) {
        this.recordNewList = recordNewList;
        this.recordOldList = recordOldList;
        this.recordNewMap = recordNewMap;
        this.recordOldMap = recordOldMap;
        this.isInsert   =   isInsert;
        this.isUpdate = isUpdate;
        this.isdelete = isDelete;
        this.isUndelete = isUndelete;
    }
    public  void onAfterInsertEvents() {
        // oldMethod();   
        System.debug('onAfterinsertevetns');
        createOpptyTeam();
    }
    public  void onAfterUpdateEvents() {
          
    }
    public void onAfterDeleteEvents() {
        
    }
    public void onAfterUndeleteEvents() {
        
    }
    public  void onBeforeInsertEvents(){

    }
    public  void onBeforeUpdateEvents(){
        
    }
    public void onBeforeDeleteEvents() {
        
    }
    public void oldMethod(){
        //To get opportunity id 
        Set<String> productNames = new Set<String>();                 
        List<OpportunityLineItem> oliList = new List<OpportunityLineItem>();
        for(Opportunity opp : recordNewList){
            if(opp.Opportunity_Products__c != null){
                productNames.addAll(opp.Opportunity_Products__c.split(';'));
            }
        }

        Map<String,Id> pmap = new Map<String,Id>();
        Map<String,Id> prodMap1 = new Map<String,Id>();
        Map<String,Double> prodMap2 = new Map<String,Double>();
        List<PriceBook2> allPB2 = [Select id from PriceBook2]; 
        for(Product2 p : [Select id, Name from Product2 where Name IN :productNames]){
            pmap.put(p.Name,p.Id);
            for(priceBookEntry pbe : [select Id, Name,UnitPrice from priceBookEntry where PriceBook2.Id In :allPB2]){
              prodMap1.put(pbe.Name,pbe.id);
              prodMap2.put(pbe.Name,pbe.UnitPrice);  
            }
            
        }
        System.debug('prodMap1'+prodMap1);
        System.debug('prodMap2'+prodMap2);
        
        for(Opportunity opp : recordNewList){
            if(opp.Opportunity_Products__c != null){
                for(String s : opp.Opportunity_Products__c.split(';')) {
                    OpportunityLineItem oli = new OpportunityLineItem();
                    oli.Product2Id=pmap.get(s);
                    oli.PricebookEntryId = prodMap1.get(s);
                    oli.OpportunityId=opp.Id;
                    oli.Quantity=1;
                    oli.UnitPrice=prodMap2.get(s);
                    oliList.add(oli);                    
                }
            }
        }

        if(oliList.size()>0){
            insert oliList;
        }
        System.debug(oliList);
    }
    public void createOpptyTeam() {
        System.debug('start');
        List<Opportunity_Team__c> otListToUpdate = new List<Opportunity_Team__c>();
        for(Opportunity opp : recordNewList) {
            System.debug('loop');
            if(opp.AccountId != null && String.isNotBlank(opp.Account_Owner_Id__c)){
                otListToUpdate.add(new Opportunity_Team__c(Opportunity__c = opp.Id,Member__c = opp.Account_Owner_Id__c));
                otListToUpdate.add(new Opportunity_Team__c(Opportunity__c = opp.Id,Member__c = opp.OwnerId));
            }
        }
        if(!otListToUpdate.isEmpty()){
            insert otListToUpdate;
        }
    }
}