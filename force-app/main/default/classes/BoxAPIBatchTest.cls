global class BoxAPIBatchTest implements Database.Batchable<sObject> , Database.AllowsCallouts{
   global final String Query;
   global final String Entity;
   global final String Field;
   global final String Value;

   global BoxAPIBatchTest(){
            
   }

   global List<Attachment> start(Database.BatchableContext BC){
       List<Attachment> doc = [SELECT id,Body,ContentType,Name FROM Attachment WHERE Id  = '00P7F00000Lejt3'];
      return doc;
   }

   global void execute(Database.BatchableContext BC, List<Attachment> scope){
      
    // Delete [SELECT id FROM ContentDocumentLink];
    for(Attachment attch : scope){
        BoxApiConnection api = new BoxApiConnection('1xJsWdtbrWf12ZwkLU8MLs5lAZyWzaB9');
        BoxFolder folder = new BoxFolder(api, '96543258609');
        BoxFile.Info fileInfo = folder.uploadFile(attch, attch.Name);
    }
   }

   global void finish(Database.BatchableContext BC){

   }

}