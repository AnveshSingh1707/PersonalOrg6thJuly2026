public  class AttachmentTriggerHandler {

    List<Attachment> recordNewList  = new List<Attachment>();
    List<Attachment> recordOldList  = new List<Attachment>();
    Map<Id,Attachment> recordNewMap = new Map<Id,Attachment>();
    Map<Id,Attachment> recordOldMap = new Map<Id,Attachment>();
    Boolean isInsert,isUpdate,isdelete,isUndelete = false;
    
    public AttachmentTriggerHandler(List<Attachment> recordNewList,Map<Id,Attachment> recordNewMap,List<Attachment> recordOldList,Map<Id,Attachment> recordOldMap,
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
        doAttachmentRollup();   
    }
    public  void onAfterUpdateEvents() {
        doAttachmentRollup();    
    }
    public void onAfterDeleteEvents() {
        doAttachmentRollup();
    }
    public void onAfterUndeleteEvents() {
        doAttachmentRollup();
    }
    public  void onBeforeInsertEvents(){

    }
    public  void onBeforeUpdateEvents(){
        
    }
    public void onBeforeDeleteEvents() {
        
    }
    public void doAttachmentRollup() {
        List<Attachment> recordList = isdelete ?  recordOldList : recordNewList;
        Set<Id> setAccountIds = new Set<Id>();
        for(Attachment attch : recordList) {
            if(String.isNotBlank(attch.ParentId) && String.valueof(attch.ParentId).startsWith('001')
                 && (!isUpdate || attch.ParentId != recordOldMap.get(attch.Id).ParentId)) {
                    setAccountIds.add(attch.ParentId);
            }
        }
        if(!setAccountIds.isEmpty()){
            List<Account> accListToUpdate = new List<Account>();
            List<Account> allAccList = [SELECT id,Name,(SELECT id FROM Attachments) FROM Account WHERE Id IN :setAccountIds];
            for(Account acc : allAccList){
                acc.Number_of_Attachments__c = acc.Attachments.size();
                accListToUpdate.add(acc);
            }
            if(!accListToUpdate.isEmpty()) {
                update accListToUpdate;
            }
        }   
    }
}