//trigger on Contact for sending email to all contacts for new business proposal
trigger emailToContacts on Contact(before insert){
    
    //master list
    List<Messaging.SingleEmailMessage> emailsSend =new List<Messaging.SingleEmailMessage>();
    
    for(Contact c : Trigger.new){
        if(c.FirstName!=null && c.Email!=null){
            //creating instance of Messaging.SingleEmailMessage
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            
            //list of contact emails
            List<string> contactEmail = new List<String>();
            contactEmail.add(c.Email);
            mail.setToAddresses(contactEmail);
            
            
            //sender address
            mail.setReplyTo('Rashford.417@gmail.com');
            mail.setSenderDisplayName('Rashford');
            
            //email body
            mail.setSubject('business proposal');
            String body ='dear'+c.FirstName;
            body +='there is an urgent business proposal';
            body +='there is an urgent business proposal';
            body +='there is an urgent business proposal';
            body +='there is an urgent business proposal';
            
            mail.setHtmlBody(body);
            
            emailsSend.add(mail);
            
            
        }
        
    }
    Messaging.sendEmail(emailsSend);
}