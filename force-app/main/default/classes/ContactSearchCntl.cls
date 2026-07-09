public class ContactSearchCntl {

    public List < SelectOption > radiusSelectOptionList {get;set;}
    public String selectedRadius {get;set;}
    public String enteredData {get;set;}
    public List < SearchResultWrapper > searchResultList {get;set;}
    
    public Boolean contactResultList_Flag {get;set;}
    public Boolean showSavedRecords_Flag {set;get;}
    public Boolean ResultsPanel_Flag {set;get;}
    
    
    
    
    public List < Contact > contactResultList {get;set;} //To be replaced by searchResultList
    
    public Contact tempContact {get;set;} //To sho
    
    

    public List < Saved_Searches__c > lstShowSavedRecords {get;set;}
    public Saved_Searches__c saved;
    // public String searchId;
    
    String key = Label.Address_API_Key;

    public String endPointURL = 'https://maps.googleapis.com/maps/api/geocode/json?address=';


    public ContactSearchCntl() {
        radiusSelectOptionList = new List < SelectOption > ();
        radiusSelectOptionList.add(new SelectOption('1.5', '1 mile (1.5 km)'));
        radiusSelectOptionList.add(new SelectOption('3', '2 mile (3 km)'));
        radiusSelectOptionList.add(new SelectOption('8', '5 mile (8 km)'));
        radiusSelectOptionList.add(new SelectOption('15', '10 mile (15 km)'));
        radiusSelectOptionList.add(new SelectOption('30', '15 mile (30 km)'));
        radiusSelectOptionList.add(new SelectOption('40', '25 mile (40 km)'));
        radiusSelectOptionList.add(new SelectOption('55', '35 mile (55 km)'));
        radiusSelectOptionList.add(new SelectOption('80', '50 mile (80 km)'));
        radiusSelectOptionList.add(new SelectOption('120', '75 mile (120 km)'));
        radiusSelectOptionList.add(new SelectOption('160', '100 mile (160 km)'));
        radiusSelectOptionList.add(new SelectOption('320', '200 mile (320 km)'));

        selectedRadius = '1.5';
        contactResultList_Flag = false;
        ResultsPanel_Flag = false;
        showSavedRecords_Flag = false;
        // searchId = null;
        contactResultList = new List < Contact > ();
        lstShowSavedRecords = new List < Saved_Searches__c > ();
        tempContact = new Contact(FirstName = 'Test First',LastName = 'Test Last',AccountId = '0017F000006Q4Pn',Phone = '123456789', Email = 'hardik@satrangtech.com');
    }

    public void searchContacts() {
        try {
            Decimal latitude = null;
            Decimal longitude = null;

            Http http = new Http();
            HttpRequest request = new HttpRequest();

            request.setEndpoint(endPointURL + enteredData+',USA&key='+key); //,USA&key=AIzaSyB8I5kKWt3hHEFuNNJZfLsqqkh7R7n0NQk
            
            request.setMethod('GET');
            
            // HttpResponse response = http.send(request);

            // // If the request is successful, parse the JSON response.
            // if (response.getStatusCode() == 200) {
            //     // ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'Response: '+response.getBody()));
            //     GoogleGeoCodeAPIResponseWrapper googleResultList = (GoogleGeoCodeAPIResponseWrapper) JSON.deserialize(response.getBody(), GoogleGeoCodeAPIResponseWrapper.class);
            //     if (googleResultList != null && !googleResultList.results.isEmpty() && googleResultList.results[0].geometry != null && googleResultList.results[0].geometry.location != null) {
            //         latitude = googleResultList.results[0].geometry.location.lat;
            //         longitude = googleResultList.results[0].geometry.location.lng;
            //     } else {
            //         ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Couldn\'t locate co-ordinates of entered City/ZipCode'));
            //     }
            // } else {
            //     ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Unable to call Google API'));
            //     ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Response: ' + response.getBody()));
            // }

            // if (String.isNotBlank(selectedRadius) && latitude != null && longitude != null) {
            //     contactResultList = [SELECT Id, FirstName, LastName, Phone, Location__c FROM Contact WHERE DISTANCE(Location__c, GEOLOCATION(: latitude,: longitude), 'km') <: Decimal.valueOf(selectedRadius)];
            //     //We can use Location Class to show distance in results (Ref: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_class_system_Location.htm)
            //     contactResultList_Flag = true;
            //     ResultsPanel_Flag = true;
            // }
            
            contactResultList = [SELECT Id, FirstName, LastName, Phone, Location__c FROM Contact LIMIT 5];
            contactResultList_Flag = true;
            ResultsPanel_Flag = true;
        } catch (exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, e.getMessage() + ' ' + e.getLineNumber()));

        }

    }
    public void saveSearchedRecords() {
        try {
            if (String.isNotBlank(selectedRadius)  && String.isNotBlank(enteredData)) {
                Saved_Searches__c savedSearch = new Saved_Searches__c();
                savedSearch.ZipCodeOrCity__c = enteredData;
                savedSearch.Under_Radius__c = selectedRadius;
                searchContacts();
                ResultsPanel_Flag = true;
                insert savedSearch;

            }
        } catch (Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'NO Record Found'));
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, e.getMessage() + ' ' + e.getLineNumber()));
        }

    }
    public void showSavedRecords() {

        lstShowSavedRecords = [SELECT Name, Under_Radius__c, ZipCodeOrCity__c FROM Saved_Searches__c];
        showSavedRecords_Flag = true;
        ResultsPanel_Flag = false;
    }
    public void redirectToSearchFilters() {
        String searchId = System.currentPageReference().getParameters().get('searchId');
        saved = [SELECT id, Under_Radius__c, ZipCodeOrCity__c FROM Saved_Searches__c WHERE id =: searchId];
        selectedRadius = saved.Under_Radius__c;
        enteredData = saved.ZipCodeOrCity__c;
        if(!Test.isRunningTest()){
            searchContacts();
        }
        showSavedRecords_Flag = false;

    }
    
    public class GoogleGeoCodeAPIResponseWrapper {
        public List < ResultWrapper > results;
    }

    public class ResultWrapper {
        public GeometryWrapper geometry;
    }

    public class GeometryWrapper {
        public LocationWrapper location;
    }

    public class LocationWrapper {
        public Double lat;
        public Double lng;
    }
    
    public class SearchResultWrapper{
        public String id {get;set;}
        public Boolean isSelected {get;set;}
        public String name {get;set;}
        
        public SearchResultWrapper(String id, String name){
            this.id = id;
            this.name = name;
            this.isSelected = false;
        }
    }
}