public class DemoReportCtrl {
	@AuraEnabled
    public static string Getreportplanned(String AccId,String reportId){
        string reportPlannedId=reportId;
        string filterId=String.valueOf(AccId).substring(0, 15);
        // Retrieves report metadata
        Reports.ReportDescribeResult describe = Reports.ReportManager.describeReport(reportPlannedId);
        Reports.ReportMetadata reportMd = describe.getReportMetadata();
        // Add/Override filters
        Reports.ReportFilter filterlist = reportMd.getReportFilters()[0];
        filterlist .setValue(filterId);
        //and Run report
        Reports.ReportResults reportResult = Reports.ReportManager.runReport(reportPlannedId,reportMd);
        system.debug('ReportResultsJSON'+JSON.serialize(reportResult));
        return JSON.serialize(reportResult);
    }
}