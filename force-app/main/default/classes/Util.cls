public with sharing class Util {
    @future(callout = true)
    public static void callWebSercvice1(String lId, String company){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        if(company!=null){
            String endpt='https://api.fullcontact.com/v2/company/search.json?companyName=';
            request.setEndpoint(endpt+company);
            system.debug('endpt+company'+endpt+company);
        }
        request.setMethod('GET');
        request.setHeader('X-FullContact-APIKey', 'ipXRSrbO7FWvOaU1EkuPHhL6QkmeX4Oc');
        HttpResponse response = http.send(request);
        system.debug('statuscode'+response.getStatusCode());
        if (response.getStatusCode() == 200) {
            List<FromJSONCompany> fjc =FromJSONCompany.parse(response.getBody());
            String countryName;
            String locality;
            if(!fjc.isEmpty()){
                for(FromJSONCompany fjsc : fjc){
                    if(fjsc!=null){
                        if(fjsc.location!=null){
                            if(fjsc.location.country!=null){
                                if(fjsc.location.country.name!=null||fjsc.location.locality!=null){
                                    if(fjsc.lookupDomain==company+'.com'){
                                        countryName=fjsc.location.country.name;  
                                        System.debug('countryName'+countryName); 
                                        locality=fjsc.location.locality;
                                        System.debug('locality'+locality);
                                    }
                                    
                                }
                            }
                        }
                    }
                }
                
            }
            
            List < Lead > leadwithCompany = [Select id, FirstName, Email, company from Lead where company = :company];
            List<Lead> newList = new List<lead>();
            for(Lead leads : leadwithCompany){
                leads.country=countryName;
                leads.City=locality;
                newList.add(leads);
            } update newList;
            
            
        }
        
    }
    
    
    @future(callout=true)    
    public static void callWebSercvice2(String lId , String eml, String phn,String Twitter) {
        System.debug(lId+' '+eml+' '+phn+' '+Twitter);
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        if(eml!=null){
            String endpnt='https://api.fullcontact.com/v2/person.json?email=';
            System.debug('fromeml'+endpnt+eml);
            request.setEndpoint(endpnt+eml);
            
        }else if(phn!=null){
            String endpnt='https://api.fullcontact.com/v2/person.json?phone=';
            request.setEndpoint(endpnt+phn);
        }else if(Twitter!=null){
            String endpnt='https://api.fullcontact.com/v2/person.json?twitter=';
            request.setEndpoint(endpnt+Twitter);
        }
        request.setMethod('GET');
        request.setHeader('X-FullContact-APIKey', 'ipXRSrbO7FWvOaU1EkuPHhL6QkmeX4Oc');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response
        System.debug('Before StatusCode');
        if (response.getStatusCode() == 200) {
            System.debug('After statusCode'); 
            System.debug('fromJSON.parse'+ FromJSON.parse(response.getBody()));
            FromJSON fj = FromJSON.parse(response.getBody());
            List < lead > newlstLead = new List < lead > ();
            List < Lead > leadwithThatEmail = [Select id, FirstName,Twitter__c,Phone, company,Email from Lead where Email = :eml or Phone=:phn or Twitter__c=:Twitter];
            System.debug('Twitter'+leadwithThatEmail);
            for (lead l: leadwithThatEmail) {
                l.FirstName = fj.contactInfo.familyName;
                l.LastName = fj.contactInfo.givenName;
                l.Gender__c = fj.Demographics.Gender;
                l.company=fj.organizations[0].name;
                l.Title=fj.organizations[0].title;
                l.Age__c=fj.Demographics.age;
                l.Twitter__c=fj.socialProfiles[0].url;
                newlstLead.add(l);
            }
            update newlstLead;
            System.debug('org'+fj.organizations[0].name);
        }
    }
    
}