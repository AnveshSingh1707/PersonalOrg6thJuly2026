global class CreateEmailMsgBasedOnLastEmailResponse implements Messaging.InboundEmailHandler {    
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email,Messaging.InboundEnvelope env) {
        String newBody;
        // Create an InboundEmailResult object for returning the result of the 
        // Apex Email Service
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();

        String myPlainText = '';
        // Add the email plain text into the local variable 
        myPlainText = email.plainTextBody;
        
        //Create HTTP Request
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Last_Email_Response');
        req.setMethod('POST');
        Map<String,String> mapBody = new Map<String,String>();
        mapBody.put('email_message',myPlainText);
        req.setBody(JSON.serialize(mapBody));

		//Send HTTP Request        	
        Http http = new Http();
        HTTPResponse res = http.send(req);        
        if(res.getStatusCode() == 200){
            JSONForLastReply fjson = new JSONForLastReply();
            fjson.parse(res.getBody());
            fjson = fjson.parse(res.getBody());
            if(fjson.last_reply!=null){
                newBody = fjson.last_reply;
                System.debug('newBody'+newBody);                
            }
            else 
                newBody = stripResponse(myPlainText); // fallback
        }else{
            newBody = stripResponse(myPlainText); // fallback
        }

        // Try to look up any contacts based on the email from address
        // If there is more than one contact with the same email address,
        // an exception will be thrown and the catch statement will be called.
        try {
            Contact vCon = [SELECT Id, Name, Email
                FROM Contact
                WHERE Email =: email.fromAddress
                LIMIT 1
            ];

            //create EmailMessage Record
            EmailMessage[] newEmail = new EmailMessage[0];
 
            newEmail.add(new EmailMessage(FromAddress = email.fromAddress,
                                            FromName = email.fromName,
                                            ToAddress = email.toAddresses[0],
                                            Subject = email.subject,
                                            TextBody = newBody,
                                            HtmlBody = newBody,
                                            Contact__c = vCon.Id));              
            insert newEmail;
        }
        // If an exception occurs when the query accesses 
        // the contact record, a QueryException is called.
        // The exception is written to the Apex debug log.
        catch (QueryException e) {
            System.debug('Query Issue: ' + e);
        }

        // Set the result to true. No need to send an email back to the user 
        // with an error message
        result.success = true;

        // Return the result for the Apex Email Service
        return result;
    }
    
    String stripResponse(String email) {    	
    	// Normalize line breaks
    	email.replaceAll('\r\n', '\n');
    	
    	// Check for On ... wrote: that break to multiple lines and force to one line for filtering
    	Pattern p = Pattern.compile('(?m)^On .+<[^>]+> wrote:$');
    	Matcher m = p.matcher(email);
    	if (m.find()) {
    		email = email.substring(0,m.start()-1) + email.substring(m.start(), m.end()).replaceAll('\n', '') + email.substring(m.end()+1);
    	}
    	
    	String[] lines = email.split('\n');
    	String out = '';
    	
    	Boolean firstLine = true;
    	for (String line : lines) {
    		
    		// Make sure the reply is not the first line of the message (workaround for Cirrus Insight in particular which starts with From:)
    		if (!firstLine) { 
    			if (line.equals('--') || line.equals('-- ') || 
    				line.startsWith('-----Original Message-----') || 
    				line.startsWith('--------------- Original Message ---------------') ||
    				line.startsWith('________________________________') || 
    				(line.startsWith('On ') && line.endsWith(' wrote:')) ||
    				line.startsWith('From: ') ||
    				line.startsWith('Sent from my iPhone')) {
    					break;
    			}
    		}
    		firstLine = false;
    		out += line + '\n';
    	}
    	return out;
    }    
    
	public class JSONForLastReply {
		public String last_reply;
		public  JSONForLastReply parse(String json) {
			return (JSONForLastReply) System.JSON.deserialize(json,JSONForLastReply.class);
		}
    }
}