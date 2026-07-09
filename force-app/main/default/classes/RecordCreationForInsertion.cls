@isTest
public class RecordCreationForInsertion { 
    @isTest
    public static void recordForInsertion(){
        Account newAccount = new Account();
        newAccount.Name='SampleAcc1';
        newAccount.Email__c='sample1@testsample.com';
        insert newAccount;
        
        
        List<Contact> newlstCon  = new List<Contact>();
        for(Integer i=0;i<200; i++){
            Contact con = new Contact();
            con.AccountId=newAccount.id;
            con.LastName='SampleCon'+i;
            newlstCon.add(con);
        }
        
        insert newlstCon;
        
    }
  @isTest
  public static void recordWithAccEmail(){
      List<Contact> lstCon = new List<Contact>();
      for(Integer i=0; i<200 ; i++){
          Contact con = new Contact();
          con.LastName= 'SampleCont'+i;
          con.AccountEmail__c= 'insertcontact'+i+'@test.com';
          lstCon.add(con);
      }
      
      insert lstCon;
      
  }
}