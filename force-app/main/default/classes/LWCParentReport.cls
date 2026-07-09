public with sharing class LWCParentReport {
    public LWCParentReport() {

    }
    @AuraEnabled
    public static List<Account> getAccountDetails(Id accId){
        try {
            return [SELECT id,Name FROM Account WHERE ID = : accId];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}