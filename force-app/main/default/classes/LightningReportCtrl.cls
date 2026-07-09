public with sharing class LightningReportCtrl {
    public LightningReportCtrl() {

    }
    public static reportResponse getReportResponse(Id reportId) {
        //get the report result
        Reports.ReportResults results = Reports.ReportManager.runReport(reportId, true);
     
        //get the metadata
        Reports.ReportMetadata reportMetadata = results.getReportMetadata();
     
        //find out what type of report it is by looking at the groupings down and groupings across
        Integer groupingsDown = 0;
        Integer groupingsAcross = 0;
     
        List<Reports.GroupingInfo> groupingDownList = reportMetadata.getGroupingsDown();
        List<Reports.GroupingInfo> groupingAcrossList = reportMetadata.getGroupingsAcross();
     
        if (groupingDownList != null) {
            groupingsDown = groupingDownList.size();
        }
     
        if (groupingDownList != null) {
            groupingsAcross = groupingAcrossList.size();
        }       
     
        String reportType = 'tabular';
        if ( (groupingsDown > 0) && (groupingsAcross == 0) ) {
            reportType = 'summary'; 
        }
     
        if ( (groupingsDown > 0) && (groupingsAcross > 0) ) {
            reportType = 'matrix';  
        }       
     
        reportResponse rr = new reportResponse();
        rr.reportType = reportType; 
     
        if (reportType == 'summary') {
            rr.sumResp = getSummaryReportResponse(results);
        }
     
        return rr;
    }
    public static summaryReportResponse getSummaryReportResponse(Reports.ReportResults results) {
        summaryReportResponse srr = new summaryReportResponse();
        List<fieldDef> reportFields = new List<fieldDef>(); 
     
        //get the metadata
        Reports.ReportMetadata reportMetadata = results.getReportMetadata();
     
        //get a string array of the field names
        List<String> fieldNames = reportMetadata.getDetailColumns();        
     
        //get the extended metadata
        Reports.ReportExtendedMetadata reportExtendedMetadata = results.getReportExtendedMetadata();
     
        //get the map of the column names to their name and label
        Map<String, Reports.DetailColumn> detailColumnMap = reportExtendedMetadata.getDetailColumnInfo();
     
        //get the map of the grouping column names to their name and label
        Map<String, Reports.GroupingColumn> groupingColumnMap = reportExtendedMetadata.getGroupingColumnInfo();       
     
        //get the grouping column info
        Reports.GroupingInfo groupingInfo = reportMetadata.getGroupingsDown()[0]; //only supports one grouping level
        Reports.GroupingColumn groupingColumnDetail = groupingColumnMap.get(groupingInfo.getName());                
     
        //loop over the detailColumnMap and get the name, label, and data type
        for (String fieldName: fieldNames) {
            Reports.DetailColumn detailColumn = detailColumnMap.get(fieldName);
            fieldDef fd = new fieldDef();
            fd.fieldName = detailColumn.getName(); 
            fd.fieldLabel = detailColumn.getLabel();
            fd.dataType = detailColumn.getDataType().name();
            reportFields.add(fd);
        }
        srr.reportFields = reportFields;
     
        //get the summary grouping down dimension grouping values.  only going 1 level deep
        List<summaryReportGroup> groupList = new List<summaryReportGroup>();
        for (Reports.GroupingValue groupingValue: results.getGroupingsDown().getGroupings()) {
            summaryReportGroup srg = new summaryReportGroup();
            srg.fieldName = groupingColumnDetail.getLabel();            
            srg.fieldValue = (String)groupingValue.getValue();
            srg.fieldLabel = groupingValue.getLabel();
            srg.groupKey = groupingValue.getKey();
            // srg.isHyperLink = isHyperlink(srg.fieldValue);
     
            //use our group key to get the group rows from the fact map
            Reports.ReportFactWithDetails factDetails = (Reports.ReportFactWithDetails)results.getFactMap().get(srg.groupKey+'!T'); 
            List<Reports.ReportDetailRow> reportDetailRowList = factDetails.getRows();           
     
            List<List<fieldData>> fieldDataList = new List<List<fieldData>>();
     
            //loop over the rows
            for (Reports.ReportDetailRow reportDetailRow: reportDetailRowList) {
                Integer cellCounter = 0;
                List<fieldData> fieldDataRow = new List<fieldData>();
                //loop over the cells in the row
                for (Reports.ReportDataCell reportDataCell: reportDetailRow.getDataCells()) {
                    fieldData fd = new fieldData();
                    fd.fieldValue = (String)reportDataCell.getValue();
                    fd.fieldLabel = (String)reportDataCell.getLabel();
                    fd.dataType = reportFields[cellCounter].dataType;
                    // fd.isHyperLink = isHyperlink(fd.fieldValue);
                    cellCounter++;
                    fieldDataRow.add(fd);
                }
     
                //add the row to the list
                fieldDataList.add(fieldDataRow);
            }           
            srg.fieldsInGroup = srr.reportFields.size();            
            srg.fieldDataList = fieldDataList;
            groupList.add(srg);
        }
        srr.groupList = groupList;
     
        return srr;
    }
    public class reportResponse {
        public String reportType {get; set;}
        public summaryReportResponse sumResp {get; set;}        
        public reportResponse(){}
    }
    public class summaryReportResponse {
        public List<fieldDef> reportFields {get; set;}
        public List<summaryReportGroup> groupList {get; set;}
        public summaryReportResponse(){}
    }   
     
    public class summaryReportGroup {
        public String fieldName {get; set;}
        public String fieldValue {get; set;}
        public String fieldLabel {get; set;}
        public String groupKey {get; set;}
        public Boolean isHyperLink {get; set;}  
        public Integer fieldsInGroup {get; set;}                    
        public List<List<fieldData>> fieldDataList {get; set;}
        public summaryReportGroup(){}
    }
    public class fieldDef {
        public String fieldName {get;set;}
        public String fieldLabel {get;set;}
        public String dataType {get;set;}
    }
    public class fieldData {
        public String fieldName {get; set;}
        public String fieldValue {get; set;}
        public String fieldLabel {get; set;}
        public String groupKey {get; set;}
        public Boolean isHyperLink {get; set;}
        public String dataType {get;set;}      
    }
}