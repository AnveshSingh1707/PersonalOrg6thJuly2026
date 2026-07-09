public class LeadTriggerHandler {
    
    public static Boolean update_Flag = false; 
    
    List<Lead> recordNewList = new List<Lead>();
    List<Lead> recordOldList = new List<Lead>();
    Map<Id,Lead> recordNewMap = new Map<Id,Lead>();
    Map<Id,Lead> recordOldMap = new Map<Id,Lead>();
    
    public LeadTriggerHandler(List<Lead> recordNewList,List<Lead> recordOldList,Map<Id,Lead> recordNewMap,Map<Id,Lead> recordOldMap){
        this.recordNewList = recordNewList;
        this.recordOldList = recordOldList;
        this.recordNewMap = recordNewMap;
        this.recordOldMap = recordOldMap;
    }
    
    public  void isAfterInsertEvents(){
        onconvert();
        
        
    }
    public  void isAfterUpdateEvents(){
        system.debug('afterupdathandler');
        onconvert();
    }
    public  void isBeforeInsertEvents(){
       populateDateStartAndEnd(); 
    }
    public  void isBeforeUpdateEvents(){
        if(!update_Flag){
        update_Flag =true;
        populateDateStartAndEnd();
        }
        
    }
    public void onconvert(){
        system.debug('afterupdathandler2');
        for(Lead l : recordNewList) {
            if(l.IsConverted) {
                System.debug('l--Acc--'+l.ConvertedAccountId);
            }
        }
    }
    public  void populateDateStartAndEnd(){
        
        for(Lead leads : recordNewList){
            if(leads.Quarter__c =='Q1'){
                Date myStartDate = date.newInstance(Integer.valueOf(leads.Year__c),01,01);
                leads.Quarter_Start_Date__c = myStartDate;
                Date myEndDate = date.newInstance(Integer.valueOf(leads.Year__c),03,31);
                leads.Quarter_End_Date__c = myEndDate;
                
                
                
            }else if(leads.Quarter__c =='Q2'){
                Date myStartDate = date.newInstance(Integer.valueOf(leads.Year__c),04,01);
                leads.Quarter_Start_Date__c = myStartDate;
                Date myEndDate = date.newInstance(Integer.valueOf(leads.Year__c),06,30);
                leads.Quarter_End_Date__c = myEndDate;
                
               
           }else if(leads.Quarter__c =='Q3'){
               Date myStartDate = date.newInstance(Integer.valueOf(leads.Year__c),07,01);
                leads.Quarter_Start_Date__c = myStartDate;
                Date myEndDate = date.newInstance(Integer.valueOf(leads.Year__c),09,30);
                leads.Quarter_End_Date__c = myEndDate;
                
               
           }else if(leads.Quarter__c =='Q4'){
               Date myStartDate = date.newInstance(Integer.valueOf(leads.Year__c),10,01);
                leads.Quarter_Start_Date__c = myStartDate;
                Date myEndDate = date.newInstance(Integer.valueOf(leads.Year__c),12,31);
                leads.Quarter_End_Date__c = myEndDate;
                
               
           }
        }
    }
}