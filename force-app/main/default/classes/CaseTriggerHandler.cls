public with sharing class CaseTriggerHandler {
    List<Case> recordNewList  = new List<Case>();
    List<Case> recordOldList  = new List<Case>();
    Map<Id,Case> recordNewMap = new Map<Id,Case>();
    Map<Id,Case> recordOldMap = new Map<Id,Case>();
    Boolean isInsert,isUpdate,isdelete,isUndelete = false;
    public static Boolean recrusion_flag = true;
    
    public CaseTriggerHandler(List<Case> recordNewList,Map<Id,Case> recordNewMap,List<Case> recordOldList,Map<Id,Case> recordOldMap,
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
        if(recrusion_flag){
            doRollupOfOpenCases();
            recrusion_flag = false; 
        }
        
    }
    public  void onAfterUpdateEvents() {
        if(recrusion_flag){
            doRollupOfOpenCases();
            recrusion_flag = false; 
        }      
    }
    public void onAfterDeleteEvents() {
        
    }
    public void onAfterUndeleteEvents() {
        if(recrusion_flag){
            doRollupOfOpenCases();
            recrusion_flag = false; 
        }   
    }
    public  void onBeforeInsertEvents(){

    }
    public  void onBeforeUpdateEvents(){
        
    }
    public void onBeforeDeleteEvents() {
        if(recrusion_flag){
            doRollupOfOpenCases();
            recrusion_flag = false; 
        }     
    }
    public void doRollupOfOpenCases(){
        Set<Id> setOldandNewAccountIds = new Set<id>();
        List<Case> recordList = isdelete ? recordOldList : recordNewList;
        for(Case cs : recordList){
            setOldandNewAccountIds.add(cs.AccountId);
            if(isUpdate){
                setOldandNewAccountIds.add(recordOldMap.get(cs.Id).AccountId);
            }

        }
        if(!setOldandNewAccountIds.isEmpty()){
            List<Account> listAccWithCases = [SELECT id,(SELECT id FROM Cases where Status != 'Closed') FROM Account WHERE Id IN :setOldandNewAccountIds];
            List<Account> listAccToUpdate = new List<Account>();
            for(Account acc : listAccWithCases){
                acc.Has_Case_Open__c = acc.Cases.size() > 0 ? true :false;
                listAccToUpdate.add(acc);
            }
            if(!listAccToUpdate.isEmpty()){
                update listAccToUpdate;
            }
        }
    }
}