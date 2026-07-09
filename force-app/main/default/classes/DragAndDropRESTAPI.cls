@RestResource(urlMapping='/DragAndDrop/v1/*')
global with sharing class DragAndDropRESTAPI
{
    @HttpPost
    global static String attachDoc(){
        RestRequest req = RestContext.request;
        RestResponse res = Restcontext.response;
        
        String fName = req.params.get('FileName');
        Id parId = req.params.get('parId');
        Blob postContent = req.requestBody; 
        System.debug('###'+fName);
        System.debug('@@@'+parId);
        ContentVersion v = new ContentVersion();
        v.versionData = postContent;
        v.title = fName;
        v.pathOnClient = fName;
        
        If(ParId.getSObjectType() == Account.sObjectType){
            v.Account__c = ParId;
        }
        try{
            insert v;
            postContent = null;
            fName = null;
        }
        catch(Exception ex){
            System.debug('Could not complete the action,Exception Raised '+ex);
            return null;
        }
        //ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'File uploaded successfully '));
        return null;
    }
    
}