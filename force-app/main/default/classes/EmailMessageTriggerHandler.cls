public class EmailMessageTriggerHandler {
    List<EmailMessage> recordNewList = new List<EmailMessage>();
    List<EmailMessage> recordOldList = new List<EmailMessage>();
    Map<Id,EmailMessage> recordNewMap = new Map<Id,EmailMessage>();
    Map<Id,EmailMessage> recordOldMap = new Map<Id,EmailMessage>();
    
    public EmailMessageTriggerHandler(List<EmailMessage> recordNewList,List<EmailMessage> recordOldList,Map<Id,EmailMessage> recordNewMap,Map<Id,EmailMessage> recordOldMap){
        this.recordNewList = recordNewList;
        this.recordOldList = recordOldList;
        this.recordNewMap = recordNewMap;
        this.recordOldMap = recordOldMap;
    }

    public void onAfterInsertEvent(){
        parseLastEmailResponse(JSON.serialize(recordNewList));
    }
    
    @future(callout=true)
    static void parseLastEmailResponse(String recordNewListStr) {
        List<EmailMessage> emToUpdate = new List<EmailMessage>();
        List<EmailMessage> recordNewList = (List<EmailMessage>)JSON.deserialize(recordNewListStr,List<EmailMessage>.class);
        for(EmailMessage emailMsg : recordNewList){
            if(String.isBlank(emailMsg.TextBody)) continue;            
            String myPlainText = emailMsg.TextBody;
        
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
                if(String.isNotBlank(fjson.last_reply)){
                    emailMsg.Last_Reply__c = fjson.last_reply.abbreviate(130003);
                }
                else 
                    emailMsg.Last_Reply__c = stripResponse(myPlainText).abbreviate(130003); // fallback
            }else{
                emailMsg.Last_Reply__c = stripResponse(myPlainText).abbreviate(130003); // fallback
            }
            if(String.isNotBlank(emailMsg.Last_Reply__c))
                emToUpdate.add(emailMsg);
        }
        if(emToUpdate.size()>0)
            Database.update(emToUpdate,false);
    }
    
    static String stripResponse(String email) {    	
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
                Boolean isFound = false;
                for(String epr : Email_Parse_Fallback__c.getAll().keySet()) {
                    if(String.isNotBlank(epr) && line.startsWith(epr)) {
                        isFound = true;
                        break;
                    }
                }
                if(isFound) break;
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