public class AccountTriggerHandler {
    public List<Account> recordsNewList;
    public List<Account> recordsOldList;
    public Map<Id,Account> recordsNewMap;
    public Map<Id,Account> recordsOldMap;
    public Boolean isInsert;
    public Boolean isUpdate;
    public AccountTriggerHandler(List<Account> recordsNewList, List<Account> recordsOldList,Map<id,Account> recordsNewMap,Map<Id,Account> recordsOldMap,Boolean isInsert,Boolean isUPdate){
        this.recordsNewList = recordsNewList;
        this.recordsOldList = recordsOldList;
        this.recordsNewMap = recordsNewMap;
        this.recordsOldMap = recordsOldMap;
        this.isInsert = IsInsert;
        this.isUpdate = isUpdate;    
    }
    public void onAfterInsertEvents() {
        onLeadConvert();
    }
    public void onLeadConvert(){
        Set<Id> accIdSets = new Set<Id>();
        for(Account acc : recordsNewList){
            System.debug('acc--'+acc.Id);
            accIdSets.add(acc.Id);
        }
        if(!accIdSets.isEmpty()) {
        	List<Lead> leadStatusList = [SELECT id,(SELECT id,Lead__c,Account__c FROM Best_Friends__r),ConvertedAccountId FROM Lead WHERE ConvertedAccountId IN :accIdSets AND IsConverted = true];
			List<Best_Friend__c> listBfToUpdate = new List<Best_Friend__c>();
            for(Lead lid : leadStatusList) {
                for(Best_Friend__c bf : lid.Best_friends__r) {
                    listBfToUpdate.add(new Best_Friend__c(Id = bf.Id,Lead__c = lid.Id,Account__c = lid.ConvertedAccountId));
                }
            }
            update listBfToUpdate;
        }
    }
    
}