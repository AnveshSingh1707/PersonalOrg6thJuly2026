trigger TransferContactToAccount1 on Contact (before insert) {
    Account accid=[select id from Account where name='sfdc99'];
    for(Contact c:Trigger.new){
        c.AccountId=accid.id;
    }

}