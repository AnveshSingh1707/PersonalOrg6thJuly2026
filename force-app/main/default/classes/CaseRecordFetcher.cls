public with sharing class CaseRecordFetcher {
    private final Case cs;
    public Id custNo{set;get;}
    public List<Case> lstCaseRecords{set;get;}
    public Boolean getIsClassic() {
        return (UserInfo.getUiThemeDisplayed() == 'Theme3');
    }

    public CaseRecordFetcher (ApexPages.StandardController stdController) {
        this.cs = (Case)stdController.getRecord();
        Id custNo = cs.Id; 
          lstCaseRecords = [Select ID,CaseNumber FROM Case Where Id = :custNo];
        
    }
}