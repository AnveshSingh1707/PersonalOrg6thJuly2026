public class listViewTestPage {
    private ApexPages.StandardController con;
    public string sObjectTypeValue {set;get;}
    public List<SelectOption> listViewData{set;get;}
    public String selectedValue {set;get;}
    public listViewTestPage(ApexPages.StandardController stdCon) {
        con = stdCon;
        listViewData = new List<SelectOption>();
        sObjectTypeValue = '';
    }

    public void go() {
        // Invoke the standard controller's list method to get a reference 
        // to the most recently viewed list view for the provided standard
        // controller's object (I tested with case standard controller)
        listOfSobjects();
        PageReference lastPage = new ApexPages.action('{!list}').invoke();
        system.debug(string.valueOf(lastPage));

        // Unfortunately this URL doesn't contain the ID of the list view.
        // In testing with case the url is always "/500" which than triggers
        // the server to determine the proper list view.
        system.debug(lastPage.getUrl());

        // Returns an empty map
        system.debug(lastPage.getParameters());
        system.debug(lastPage.getHeaders());

        // More page reference methods for experimenting
        // https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_System_PageReference_methods.htm
    }
    public void listOfSobjects(){
        System.debug('sObjectTypeValue'+sObjectTypeValue);
        List<ListView> listView = [SELECT id, Name From ListView Where sObjectType = :sObjectTypeValue];
        System.debug(''+listView);
        for(ListView lv :listView){
            listViewData.add(new SelectOption(lv.Id,lv.Name));
            System.debug('Object msg'+lv);
        }
    }
}