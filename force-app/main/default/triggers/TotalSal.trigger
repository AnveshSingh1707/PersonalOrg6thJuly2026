trigger TotalSal on Contact (after delete, after insert, after update, after undelete) {
    Set<id> accIds = new Set<id>();
    List<Account> accsToUpdate = new List<Account>();
    
    for(Contact ct:Trigger.isDelete ? Trigger.old : Trigger.new) {
        if(ct.AccountId!=null && (!Trigger.isUpdate || (Trigger.isUpdate && ct.Salary__c != Trigger.oldMap.get(ct.Id).Salary__c) ) ) 
            //system.debug('Hello');
            accIds.add(ct.AccountId);
    }
    
    
    for (Account acc: [select Id, Name, Total_Salary__c,(select id,salary__c from contacts where Salary__c!=null) from Account where Id IN :accIds]) {
        Decimal subtotal=0;           
        for(Contact c : acc.contacts){
            subtotal=subtotal+ c.salary__c;
        }  
        Account a = new Account(Id=acc.Id,Total_Salary__c=subtotal);
        accsToUpdate.add(a);   
    } 
    
    if(accsToUpdate.size()>0)
        update accsToUpdate;  
}