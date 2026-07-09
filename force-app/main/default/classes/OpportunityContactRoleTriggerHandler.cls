public with sharing class OpportunityContactRoleTriggerHandler {
    List<OpportunityContactRole> recordNewList  = new List<OpportunityContactRole>();
    List<OpportunityContactRole> recordOldList  = new List<OpportunityContactRole>();
    Map<Id,OpportunityContactRole> recordNewMap = new Map<Id,OpportunityContactRole>();
    Map<Id,OpportunityContactRole> recordOldMap = new Map<Id,OpportunityContactRole>();
    Boolean isInsert,isUpdate,isdelete,isUndelete = false;
    
    public OpportunityContactRoleTriggerHandler(List<OpportunityContactRole> recordNewList,Map<Id,OpportunityContactRole> recordNewMap,List<OpportunityContactRole> recordOldList,Map<Id,OpportunityContactRole> recordOldMap,
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
        stampPrimaryContactOnOppty();
        
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
    public void stampPrimaryContactOnOppty(){
        Map<Id,Id> opptyIdToContactId = new Map<Id,Id>();
        for (OpportunityContactRole ocr : recordNewList) {
            if (String.isNotBlank(ocr.Role) && ocr.Role.equalsIgnoreCase('Primary')) {
                opptyIdToContactId.put(ocr.OpportunityId,ocr.ContactId);
            }
        }
        if(!opptyIdToContactId.isEmpty()){
            Map<Id,Contact> mapContactToUpdate  =   new Map<Id,Contact>();
            List<Opportunity> listOpptyToUpdate =   new List<Opportunity>();
            for(Id oppId : opptyIdToContactId.keySet()){
                listOpptyToUpdate.add( new Opportunity(Id=oppId,Primary_Contact__c = opptyIdToContactId.containsKey(oppId) ? opptyIdToContactId.get(oppId) : null));
                if(opptyIdToContactId.containsKey(oppId)){
                    mapContactToUpdate.put(opptyIdToContactId.get(oppId),new Contact(id=opptyIdToContactId.get(oppId),Primary__c = true));    
                }
            }
            if(!listOpptyToUpdate.isEmpty()){
                update listOpptyToUpdate;
            }
            if(!mapContactToUpdate.isEmpty()){
                update mapContactToUpdate.values();
            }
        }
    }
}