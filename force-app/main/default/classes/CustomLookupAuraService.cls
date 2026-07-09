public class CustomLookupAuraService {
	@AuraEnabled
    public static List<sObject> getRecordList(String ObjectName, String sreachText,String fieldInSearch){
        String searchKey = '%' + sreachText + '%';
        String Query = 'SELECT Id, '+fieldInSearch;
        Query+=' FROM '+ObjectName;
        Query+=' WHERE '+fieldInSearch+' LIKE : searchKey';
        List<sObject> sObjectList = Database.query(Query);
        System.debug(' #### sObjectList '+sObjectList);
        return sObjectList;
    }
    @AuraEnabled
    public static List<String> getFieldsList( String searchText,String reportId){
        List<String> fieldList = new List<String>();
        Reports.ReportDescribeResult describe =  Reports.ReportManager.describeReport(reportId);
        Reports.ReportTypeMetadata reportMd = describe.getReportTypeMetadata();
        List<Reports.ReportTypeColumnCategory> fieldslist = reportMd.getCategories();

        // for(Reports.ReportTypeColumnCategory cat : fieldslist) {
            
        //     // for(Reports.ReportTypeColumn fd : cat.getColumns().values()){
        //     //     String apiName = fd.getLabel();
        //     //     System.debug(apiName);
        //     //     System.debug('searchText--'+searchText);
        //     //     if(String.isNotBlank(apiName) && String.isNotBlank(searchText) && apiName.containsIgnoreCase(searchText)) {
        //     //         fieldList.add(apiName);
        //     //     }
        //     // }
        // }
        for(Reports.ReportTypeColumnCategory cat : fieldslist) {
            //System.debug('Columns Get--'+cat.getColumns());
            for(String fd : cat.getColumns().keyset()){
                if(String.isNotBlank(fd) && String.isNotBlank(searchText) && fd.containsIgnoreCase(searchText)) {
                    fieldList.add(fd);
                }
            }
        }
        System.debug('fieldList--'+fieldList.size());
        return fieldList;
    }
}