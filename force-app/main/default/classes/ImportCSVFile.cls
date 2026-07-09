public class ImportCSVFile{
	public string Filename{get;set;}
	public Blob FileContent{get;set;}
	String[] filelines = new String[]{};
	List<Account> accstoupload=  new List<Account>();

	public Pagereference ReadFile() {
        Filename=FileContent.toString();
        filelines = Filename.split('\n');
        System.debug('filelines==>'+filelines);
        List<String> listAllColumns = filelines[0].split(',');
        System.debug('All Columns==>'+listAllColumns);
        Map<String,List<String>> mapColumnToValues = new Map<String,List<String>>();
        for(Integer i=0; i<listAllColumns.size(); i++) {
            for(Integer j=1;j<filelines.size();j++) {
            	String[] inputvalues = new String[]{};
            	inputvalues = filelines[j].split(',');
                if(!mapColumnToValues.containsKey(listAllColumns[i])) {
                    mapColumnToValues.put(listAllColumns[i],new List<String>{inputvalues[i]});    
                } else {
                    mapColumnToValues.get(listAllColumns[i]).add(inputvalues[i]);    
                }
            }
        }
        System.debug('mapColumnToValues==>'+mapColumnToValues);
        /*Map<String,Account> mapEmailToAccount = new Map<String,Account>();
        for(String s : mapColumnToValues.keySet()) {
            System.debug('s--->'+s);
            for(String value : mapColumnToValues.get(s)) {
                System.debug('value--->'+value);
            	Account acc = new Account();
                acc.put(s,value);
                if(!mapEmailToAccount.containsKey(s)) {
                    mapEmailToAccount.put(s,acc);
                }else {
                   Account newAcc = mapEmailToAccount.get(s);
                   newAcc.put(s,value);
                }
            }
						            
        }*/
        for (Integer i=1;i<filelines.size();i++) {
            String[] inputvalues = new String[]{};
            inputvalues = filelines[i].split(',');
            Account acc = new Account();
            for(Integer j=0;j<listAllColumns.size();j++) {
                System.debug('listAllColumns[j]-->'+listAllColumns[j]);
                System.debug('inputvalues[j]-->'+inputvalues[j]);
                String columnName = listAllColumns[j];
                String columnvalue = inputvalues[j];
                try{
                acc.put(columnName,columnvalue);
                }catch(Exception ex){
                    System.debug('Error: '+ex.getstackTraceString());
                }
                /*a.Email__c = inputvalues[0];
                a.Name = inputvalues[1];
                a.ShippingStreet = inputvalues[2];
                a.ShippingCity = inputvalues[3];
                a.ShippingState = inputvalues[4];
                a.ShippingPostalCode = inputvalues[5];
                a.ShippingCountry = inputvalues[6];*/
                
        	}
        	accstoupload.add(acc);
        }
        System.debug('accstoupload==>'+accstoupload);
        /*for (Integer i=1;i<filelines.size();i++) {
            String[] inputvalues = new String[]{};
            inputvalues = filelines[i].split(',');
            Account a = new Account();
            a.Email__c = inputvalues[0];
            a.Name = inputvalues[1];
            a.ShippingStreet = inputvalues[2];
            a.ShippingCity = inputvalues[3];
            a.ShippingState = inputvalues[4];
            a.ShippingPostalCode = inputvalues[5];
            a.ShippingCountry = inputvalues[6];
            accstoupload.add(a);
        }*/
        try{
        	//insert accstoupload;
    	}catch (Exception e){
            ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured. Please check the template or try again later');
            ApexPages.addMessage(errormsg);
        }
        return null;
	}

	public List<Account> getuploadedAccounts() {
        if (accstoupload!= NULL)
        if (accstoupload.size() > 0)
            return accstoupload;
        else
            return null;
        else
        return null;
	}

}