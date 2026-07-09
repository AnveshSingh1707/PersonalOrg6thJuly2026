public with sharing class ReportComponentController {
    public ReportComponentController() {

    }
    @AuraEnabled
    public static String getReportMetadata ( Id reportId ){
       return JSON.serializePretty(Reports.ReportManager.runReport( reportId, true ) );
    }
    @AuraEnabled
    public static String getReportDataWithMetadata ( Id reportId,List<String> fieldAPINames ){
        
        Reports.ReportResults results = Reports.ReportManager.runReport( reportId, true );
        Reports.ReportMetadata repo = results.getReportMetadata();
        repo.setDetailColumns(fieldAPINames);
        return JSON.serializePretty(Reports.ReportManager.runReport( reportId,repo ,true ) ); 
    }
    @AuraEnabled
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
     
        ReportResponse rr = new ReportResponse();
        rr.reportType = reportType; 
     
        if (reportType == 'matrix') {
            rr.tabResp = getMatrixReportResponse(results);
        }
     
        return rr;
    }
    public class reportResponse {
        public String reportType {get; set;}
        public tabularReportResponse tabResp {get; set;}
    }
    public class FieldDef {
        public String fieldName {get;set;}
        public String fieldLabel {get;set;}
        public String dataType {get;set;}
    }
    public class FieldData {
        public String fieldName {get; set;}
        public String fieldValue {get; set;}
        public String fieldLabel {get; set;}
        public String groupKey {get; set;}
        public Boolean isHyperLink {get; set;}
        public String dataType {get;set;}      
    }
    public class SummaryReportResponse {
        public List<fieldDef> reportFields {get; set;}
        public List<SummaryReportGroup> groupList {get; set;}
        public summaryReportResponse(){}
    }   
     
    public class SummaryReportGroup {
        public String fieldName {get; set;}
        public String fieldValue {get; set;}
        public String fieldLabel {get; set;}
        public String groupKey {get; set;}
        public Boolean isHyperLink {get; set;}  
        public Integer fieldsInGroup {get; set;}                    
        public List<List<fieldData>> fieldDataList {get; set;}
        public summaryReportGroup(){}
    }
    public class TabularReportResponse {
        public List<fieldDef> reportFields {get; set;}
        public List<List<FieldData>> fieldDataList {get; set;}
        public TabularReportResponse(){}
    }
    public static TabularReportResponse getMatrixReportResponse(Reports.ReportResults results) {
        TabularReportResponse trr = new TabularReportResponse();
        List<FieldDef> reportFields = new List<FieldDef>();
        List<List<FieldData>> fieldDataList = new List<List<FieldData>>();      
     
        //get the metadata
        Reports.ReportMetadata reportMetadata = results.getReportMetadata();
     
        //get a string array of the field names
        List<String> fieldNames = reportMetadata.getDetailColumns();      
     
        //get the extended metadata
        Reports.ReportExtendedMetadata reportExtendedMetadata = results.getReportExtendedMetadata();
     
        //get the map of the grouping column names to their name and label
        Map<String, Reports.GroupingColumn> detailColumnMap = reportExtendedMetadata.getGroupingColumnInfo();
     
        //create the reportFields header row from the grouping fields
     
        //first add the grouping down field info
        Reports.GroupingInfo groupingInfoDown = reportMetadata.getGroupingsDown()[0]; //only supports one grouping level
        Reports.GroupingColumn groupingColumnDown = detailColumnMap.get(groupingInfoDown.getName());
        FieldDef fdGroupDown = new FieldDef();
        fdGroupDown.fieldName = groupingColumnDown.getName(); 
        fdGroupDown.fieldLabel = groupingColumnDown.getLabel();
        fdGroupDown.dataType = groupingColumnDown.getDataType().name();
        reportFields.add(fdGroupDown);
     
        //now add all the groupings across
        for (Reports.GroupingValue groupingValue: results.getGroupingsAcross().getGroupings()) {
            fieldDef fd = new fieldDef();
            fd.fieldName = (String)groupingValue.getValue(); 
            fd.fieldLabel = groupingValue.getLabel();
            fd.dataType = 'DOUBLE_DATA';
            reportFields.add(fd);           
        }               
     
        //get the matrix grouping down dimension grouping values.  only going 1 level deep
        List<summaryReportGroup> groupListDown = new List<summaryReportGroup>();
        for (Reports.GroupingValue groupingValue: results.getGroupingsDown().getGroupings()) {
            summaryReportGroup srg = new summaryReportGroup();
            srg.fieldValue = (String)groupingValue.getValue();
            srg.fieldLabel = groupingValue.getLabel();
            srg.groupKey = groupingValue.getKey();
            groupListDown.add(srg);
        }
     
        //get the matrix grouping across dimension grouping values.  only going 1 level deep
        List<summaryReportGroup> groupListAcross = new List<summaryReportGroup>();
        for (Reports.GroupingValue groupingValue: results.getGroupingsAcross().getGroupings()) {
            summaryReportGroup srg = new summaryReportGroup();
            srg.fieldValue = (String)groupingValue.getValue();
            srg.fieldLabel = groupingValue.getLabel();
            srg.groupKey = groupingValue.getKey();
            groupListAcross.add(srg);
        }       
     
        //now we need to do a nested loop of the groupings down and across to get all the data from the fact map
        for (summaryReportGroup down: groupListDown) {
            List<fieldData> fieldDataRow = new List<fieldData>();
     
            //first cell is the grouping down
            fieldData fd = new fieldData();
            fd.fieldValue = down.fieldValue;
            fd.fieldLabel = down.fieldLabel;
            fd.dataType = 'STRING_DATA';
            fd.isHyperLink = down.isHyperLink;
            fieldDataRow.add(fd);                   
     
            for (summaryReportGroup across: groupListAcross) {
                //use our composite down!across key to get values from the fact map
                Reports.ReportFactWithDetails factDetails = (Reports.ReportFactWithDetails)results.getFactMap().get(down.groupKey+'!'+across.groupKey); 
                Reports.SummaryValue summaryValue = factDetails.getAggregates()[0]; //only support 1 set of aggregates
     
                fd = new fieldData();
                fd.fieldValue = (String)(summaryValue.getValue()+'');
                fd.fieldLabel = (String)(summaryValue.getLabel()+'');
                fd.dataType = 'DOUBLE_DATA';
                fieldDataRow.add(fd);                       
     
            }
            //add the row to the list
            fieldDataList.add(fieldDataRow);
        }
     
        trr.reportFields = reportFields;
        trr.fieldDataList = fieldDataList;
     
        return trr;
    }
}