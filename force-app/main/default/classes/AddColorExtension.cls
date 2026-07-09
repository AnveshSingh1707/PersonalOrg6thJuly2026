global class AddColorExtension {
    public String qw {get; set;}

    apexPages.StandardController stdc;
    public string someMethod(){    
        return null;
    }
    public AddColorExtension(ApexPages.StandardController controller){    
    }
    @RemoteAction
    global static void saveColor(id adminConsole,string code)
    {
        Contact ct = new Contact();
        ct = [SELECT Color__c, ID from Contact where ID=:adminConsole ];
        ct.Color__c = code;
        update ct;
    }
}