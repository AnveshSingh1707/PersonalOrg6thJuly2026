@isTest
public class TestContactsNearByRadius {
    public static testMethod void  getLatLangFromZipCode(){
        
        RecordsContactsNearByRadius.recordsCreation();
        ContactsNearByRadius cnvr = new ContactsNearByRadius();
        list<Contact> newlstContact = cnvr.searchAccordingTOZipCode('84230',5.0 );
        
    
        System.debug('newlstContact---'+newlstContact);
                            
        
    }
}