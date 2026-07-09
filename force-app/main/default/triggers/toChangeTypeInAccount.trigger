trigger toChangeTypeInAccount on Account(before update){
    
    //check the old values first
    for(Account acc : Trigger.new){
        
        Account oldAccount = Trigger.oldMap.get(acc.Id);
    
    if(oldAccount.AccountNumber!=acc.AccountNumber){

    acc.Type='Prospect';
    }else{
        acc.Type='Other';
    }
    }
}