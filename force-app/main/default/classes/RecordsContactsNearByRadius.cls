@isTest
public class RecordsContactsNearByRadius {
    public static testMethod void recordsCreation(){
        List<Contact> lstContact = new List<Contact>();
        Decimal count =0.00001;
        for(Integer i=0; i<1; i++){
            Contact cont = new Contact();
            cont.LastName = 'Test'+i;
            cont.Location__Latitude__s = 49.9970054+count;
            cont.Location__Longitude__s = 20.0514926+count;
            lstContact.add(cont);
            count=count+0.00001;
        }
    }
}