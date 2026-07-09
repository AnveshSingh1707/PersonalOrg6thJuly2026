public with sharing class TestLWCParent1Ctrl {
    public TestLWCParent1Ctrl() {

    }
    @AuraEnabled
    public static string callApexMethod(){
        try {
            List<Contact> listCon = [SELECT id FROM Contact WHERE id = '0037F00000SbPDcQAN'];
            return listCon[0].Id;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}