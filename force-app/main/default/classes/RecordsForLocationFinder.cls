@isTest
public class RecordsForLocationFinder {

	public static testMethod void testRecords() {
	    List<Contact> lstContact = new List<Contact>();
	    for(Integer i =0;i<200;i++){
	        Contact con = new Contact();
	        con.LastName = 'Test'+i;
	        con.MailingCity = 'Miami';
	        
	        lstContact.add(con);
	        
	    }
	    insert lstContact;

	}

}