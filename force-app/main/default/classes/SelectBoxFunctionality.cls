public class SelectBoxFunctionality {
    public Contact contacts{set;get;}
    public List<Contact> lstContact{set;get;}
    public Boolean selected{set;get;}
    
    public SelectBoxFunctionality(){
        contacts = new Contact();
        lstContact = [Select id,LastName,Phone from Contact];
        
    }
    public void getContacts(){
        lstContact = [Select id,LastName,Phone from Contact];
    }
    public void getSelected(){
        
    }
    public void deleteSelectedRecords(){
        
    }
    public void cancel(){
        
    }

}