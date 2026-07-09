public class ContactLocationFinder {
    
    @future(callout=true)
    public static void populateLocationCordinates(Set<Id> contactIdSet){
        
        List<Contact> contactList = [SELECT Id,MailingCity,MailingPostalCode FROM Contact WHERE Id IN :contactIdSet];
        
        for(Contact con : contactList){
          
            String endPoint ='https://maps.googleapis.com/maps/api/geocode/json?address=';
            
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint(endPoint+con.MailingCity+',USA'+'&key=AIzaSyB8I5kKWt3hHEFuNNJZfLsqqkh7R7n0NQk');
            request.setMethod('GET');
            
            HttpResponse response = http.send(request);
            
            if (response.getStatusCode() == 200) {
                System.debug('what is the json body---'+response.getBody());
                JsonZipCode jsonlocation = JsonZipCode.parse(response.getBody());
                
                if(jsonlocation.results != null){
                    if(jsonlocation.results[0].geometry != null){
                        if(jsonlocation.results[0].geometry.location.lat!=null||jsonlocation.results[0].geometry.location.lng!=null){
                            con.Location__Latitude__s = jsonlocation.results[0].geometry.location.lat;
                            con.Location__Longitude__s = jsonlocation.results[0].geometry.location.lng;
                        }
                    }
                }
            }
        }
        
        if(!contactList.isEmpty()){
            ContactTriggerHandler.populateLocationCordinates_Flag = true;
            update contactList;
        }
    }
}