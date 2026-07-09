trigger produceUserId on Case(before insert,before update){
    
    Set<String> setOfEmails = new Set<String>();
    
    for(Case newCase : Trigger.new){
    system.debug('from 1st for loop');
        if(newCase.SuppliedEmail!=null){
        system.debug('from 1st if');
            setOfEmails.add(newCase.SuppliedEmail);
        }
    }
    
    //get the emails of those users
    List<User> userEmails =[select Id,Email from User where Email IN :setOfEmails];
    system.debug('from 1st list');
    //now search the correct matching user
    Map<String,User> actualUser = new Map<String,User>();
    for(User u: userEmails){
    system.debug('from 2ndt for loop after map');
        actualUser.put(u.Email,u);
        system.debug('from put method');
    }
    
    
    //asign the user id to the description in case
    for(Case newCase : Trigger.new){
    system.debug('from 3rd for loop');
        if(newCase.SuppliedEmail!=null){
            User newActualUser=actualUser.get(newCase.SuppliedEmail);
            system.debug('from  newActualuser');
            if(newActualUser!=null){
            system.debug('last if');
                newCase.Subject = newActualUser.id;
            }
        }
    }
}