public with sharing class caseFeedItemController {
  
    public Id caseId {get;set;}
    public List<Case_Feed_Metadata__c> getFIs(){
        List<Case_Feed_Metadata__c> fis;
        fis = [SELECT Body__c, FeedItemParentCase__c, CreatedById__r.Name, Visibility__c, CreatedById__r.Profile.UserLicense.Name, FeedItemCreatedDate__c
          FROM Case_Feed_Metadata__c
         WHERE Visibility__c =: 'AllUsers'
           AND FeedItemParentCase__c =: caseId
      ORDER BY FeedItemCreatedDate__c DESC];
        return fis;
    }

}