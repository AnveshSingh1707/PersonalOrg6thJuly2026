public with sharing class ContactController {

    @AuraEnabled
    public static List<Contact> findAll(String accId) {
        return [SELECT id, name,Account.Name, phone FROM Contact Where AccountId = :accId ];
    }

    @AuraEnabled
    public static List<Contact> findByName(String searchKey , String acctId) {
        String name = '%' + searchKey + '%';
        System.debug('acctId'+acctId);
        return [SELECT id, name, phone FROM Contact WHERE name LIKE :name And AccountId = :acctId ];
    }

    @AuraEnabled
    public static Contact findById(String contactId) {
        return [SELECT id, name, title, phone, mobilephone, Account.Name
                    FROM Contact WHERE Id = :contactId];
    }

}