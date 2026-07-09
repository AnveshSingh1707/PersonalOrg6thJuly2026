public class AcceloConfigHandler {
    jsonToURI jstu = new jsonToURI();
   // public String body = jstu.getEncodedURL();
    @future(callout=true)
    public static void testSalesConfig(){
        string body = '%7B%0D%0A%22contact_firstname%22%3A%22san%22%2C%0D%0A%22contact_surname%22%3A%22ran%22%2C%0D%0A%22prospect_type_id%22%3A%222%22%2C%0D%0A%22prospect_status_id%22%3A14%22%0D%0A%7D';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://satrang-technologies1.accelo.com/forms/public/prospect');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        request.setHeader('Authorization','Bearer x.HSJ749n~YjwIuxOU1nVfGOnbgsjTWUuVhSqkLocYJd_ofJP2t8uzRQvTtxH.jL');
        request.setBody(body);
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode() != 200) {
            System.debug('The status code returned was not expected: ' +
                         response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
        
        
    }
    
}