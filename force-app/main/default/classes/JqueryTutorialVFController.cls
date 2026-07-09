public class JqueryTutorialVFController {
    public List<Account> lstALLAccounts{set;get;}
    public String selectedValue{set;get;}
    public List<SelectOption> searchMethods{set;get;}
    public String searchKeyString{set;get;}
    
    public JqueryTutorialVFController(ApexPages.standardController stdController){
        searchKeyString = '';
        lstALLAccounts = new List<Account>();
        searchMethods = new List<SelectOption>();
        searchMethods.add(new SelectOption('None','CommonSearch'));
        searchMethods.add(new SelectOption('Name','Name'));
        searchMethods.add(new SelectOption('Email','Email'));
        searchMethods.add(new SelectOption('Phone','Phone'));
        selectedValue = '';
        lstALLAccounts = [SELECT Name,Email__c,phone FROM Account WHERE Name != null AND Email__c != null AND Phone != null];
    }
    public void searchByDiffMethod(){
        if(selectedValue != 'None'){
            if(selectedValue == 'Name')
            lstALLAccounts = [SELECT Name,Email__c,phone FROM Account WHERE Name LIKE :('%'+searchKeyString+'%')]; 
            if(selectedValue == 'Email')
            lstALLAccounts = [SELECT Name,Email__c,phone FROM Account WHERE Email__c LIKE :('%'+searchKeyString+'%')];
            if(selectedValue == 'Phone')
            lstALLAccounts = [SELECT Name,Email__c,phone FROM Account WHERE Phone LIKE :('%'+searchKeyString+'%')];
        }
    }
}