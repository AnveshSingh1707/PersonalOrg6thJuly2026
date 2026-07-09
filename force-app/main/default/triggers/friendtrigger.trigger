trigger friendtrigger on Contact(before insert){
    List<Contact> friendList =[select id from contact];
    for(Contact c : Trigger.new){
        system.debug('anvesh has a new friend name:-'+c.FirstName+' '+c.LastName);
        
          
    }
      system.debug('anvesh has total'+' '+friendList.size()+' '+'friends');
    
}