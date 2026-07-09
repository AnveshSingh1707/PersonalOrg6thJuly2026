public class ContactsNearByRadius {
    public  Decimal latitude;
    public  Decimal longitude;
    public string name{get; set;}
    public String zipCodeOrCity{get; set;}
    public Decimal radius{get; set;}
    public List<Contact> lstContact1{get; set;}
    
    public  void searchAccordingTOZipCode(){
        String endPoint ='https://maps.googleapis.com/maps/api/geocode/json?address=';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
       	request.setEndpoint(endPoint+zipCodeOrCity+',USA'+'&key=AIzaSyB8I5kKWt3hHEFuNNJZfLsqqkh7R7n0NQk');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
           JsonZipCode jsonlocation = JsonZipCode.parse(response.getBody());
            
            if(jsonlocation.results != null){
                if(jsonlocation.results[0].geometry != null){
                    if(jsonlocation.results[0].geometry.location.lat!=null||jsonlocation.results[0].geometry.location.lng!=null){
                        latitude=jsonlocation.results[0].geometry.location.lat;
                        longitude=jsonlocation.results[0].geometry.location.lng;
                    }
                }
            }
        }
        //Send the latitude and longitude with radius to get the list of neary by contacts to that zipcode
        ContactsNearByRadius cnbr = new ContactsNearByRadius();
        lstContact1 = cnbr.searchContact(latitude, Longitude, radius, name);
        
    }
    public List<Contact> searchContact(Decimal latitude,Decimal Longitude,Decimal radius, String name){
        if(name != ''){
            name = '%'+name+'%';
            List<Contact>  lstContact = [SELECT FirstName,LastName,Phone , Location__c FROM Contact WHERE
                                         DISTANCE(Location__c, GEOLOCATION(:latitude,:longitude), 'km') < :radius
                                         AND FirstName LIKE :name ]; 
            return lstContact;
        }else{
            List<Contact>  lstContact = [SELECT FirstName,LastName,Phone , Location__c FROM Contact WHERE 
                                         DISTANCE(Location__c, GEOLOCATION(:latitude,:longitude), 'km') < :radius ];
            return lstContact;
        }
     }
}