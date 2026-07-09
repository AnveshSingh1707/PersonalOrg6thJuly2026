public class SFMetadataService {
    public static String SOAP_M_URI = 'http://soap.sforce.com/2006/04/metadata';
    public virtual class Metadata {
        public String fullName;
    }
    public virtual class Folder extends Metadata {
        public String accessType;
        public SFMetadataService.FolderShare[] folderShares;
        public String name;
        public String publicFolderAccess;
        public SFMetadataService.SharedTo sharedTo;
    }
    public class SharedTo {
        public String allCustomerPortalUsers;
        public String allInternalUsers;
        public String allPartnerUsers;
        public String[] channelProgramGroup;
        public String[] channelProgramGroups;
        public String[] group_x;
        public String[] groups;
        public String[] managerSubordinates;
        public String[] managers;
        public String[] portalRole;
        public String[] portalRoleAndSubordinates;
        public String[] queue;
        public String[] role;
        public String[] roleAndSubordinates;
        public String[] roleAndSubordinatesInternal;
        public String[] roles;
        public String[] rolesAndSubordinates;
        public String[] territories;
        public String[] territoriesAndSubordinates;
        public String[] territory;
        public String[] territoryAndSubordinates;
        private String[] allCustomerPortalUsers_type_info = new String[]{'allCustomerPortalUsers',SOAP_M_URI,null,'0','1','false'};
        private String[] allInternalUsers_type_info = new String[]{'allInternalUsers',SOAP_M_URI,null,'0','1','false'};
        private String[] allPartnerUsers_type_info = new String[]{'allPartnerUsers',SOAP_M_URI,null,'0','1','false'};
        private String[] channelProgramGroup_type_info = new String[]{'channelProgramGroup',SOAP_M_URI,null,'0','-1','false'};
        private String[] channelProgramGroups_type_info = new String[]{'channelProgramGroups',SOAP_M_URI,null,'0','-1','false'};
        private String[] group_x_type_info = new String[]{'group',SOAP_M_URI,null,'0','-1','false'};
        private String[] groups_type_info = new String[]{'groups',SOAP_M_URI,null,'0','-1','false'};
        private String[] managerSubordinates_type_info = new String[]{'managerSubordinates',SOAP_M_URI,null,'0','-1','false'};
        private String[] managers_type_info = new String[]{'managers',SOAP_M_URI,null,'0','-1','false'};
        private String[] portalRole_type_info = new String[]{'portalRole',SOAP_M_URI,null,'0','-1','false'};
        private String[] portalRoleAndSubordinates_type_info = new String[]{'portalRoleAndSubordinates',SOAP_M_URI,null,'0','-1','false'};
        private String[] queue_type_info = new String[]{'queue',SOAP_M_URI,null,'0','-1','false'};
        private String[] role_type_info = new String[]{'role',SOAP_M_URI,null,'0','-1','false'};
        private String[] roleAndSubordinates_type_info = new String[]{'roleAndSubordinates',SOAP_M_URI,null,'0','-1','false'};
        private String[] roleAndSubordinatesInternal_type_info = new String[]{'roleAndSubordinatesInternal',SOAP_M_URI,null,'0','-1','false'};
        private String[] roles_type_info = new String[]{'roles',SOAP_M_URI,null,'0','-1','false'};
        private String[] rolesAndSubordinates_type_info = new String[]{'rolesAndSubordinates',SOAP_M_URI,null,'0','-1','false'};
        private String[] territories_type_info = new String[]{'territories',SOAP_M_URI,null,'0','-1','false'};
        private String[] territoriesAndSubordinates_type_info = new String[]{'territoriesAndSubordinates',SOAP_M_URI,null,'0','-1','false'};
        private String[] territory_type_info = new String[]{'territory',SOAP_M_URI,null,'0','-1','false'};
        private String[] territoryAndSubordinates_type_info = new String[]{'territoryAndSubordinates',SOAP_M_URI,null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'allCustomerPortalUsers','allInternalUsers','allPartnerUsers','channelProgramGroup','channelProgramGroups','group_x','groups','managerSubordinates','managers','portalRole','portalRoleAndSubordinates','queue','role','roleAndSubordinates','roleAndSubordinatesInternal','roles','rolesAndSubordinates','territories','territoriesAndSubordinates','territory','territoryAndSubordinates'};
    }
    public interface IReadResult {
        SFMetadataService.Metadata[] getRecords();
    }
    public interface IReadResponseElement {
        IReadResult getResult();
    }
    public class FolderShare {
        public String accessLevel;
        public String sharedTo;
        public String sharedToType;
        private String[] accessLevel_type_info = new String[]{'accessLevel',SOAP_M_URI,null,'1','1','false'};
        private String[] sharedTo_type_info = new String[]{'sharedTo',SOAP_M_URI,null,'1','1','false'};
        private String[] sharedToType_type_info = new String[]{'sharedToType',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'accessLevel','sharedTo','sharedToType'};
    }
    public class ReportTypeColumnTranslation {
        public String label;
        public String name;
        private String[] label_type_info = new String[]{'label',SOAP_M_URI,null,'1','1','false'};
        private String[] name_type_info = new String[]{'name',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'label','name'};
    }
    public class ReportFilterItem {
        public String column;
        public Boolean columnToColumn;
        public Boolean isUnlocked;
        public String operator;
        public String snapshot;
        public String value;
        private String[] column_type_info = new String[]{'column',SOAP_M_URI,null,'1','1','false'};
        private String[] columnToColumn_type_info = new String[]{'columnToColumn',SOAP_M_URI,null,'0','1','false'};
        private String[] isUnlocked_type_info = new String[]{'isUnlocked',SOAP_M_URI,null,'0','1','false'};
        private String[] operator_type_info = new String[]{'operator',SOAP_M_URI,null,'1','1','false'};
        private String[] snapshot_type_info = new String[]{'snapshot',SOAP_M_URI,null,'0','1','false'};
        private String[] value_type_info = new String[]{'value',SOAP_M_URI,null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'column','columnToColumn','isUnlocked','operator','snapshot','value'};
    }
    public class ReportParam {
        public String name;
        public String value;
        private String[] name_type_info = new String[]{'name',SOAP_M_URI,null,'1','1','false'};
        private String[] value_type_info = new String[]{'value',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'name','value'};
    }
    public class ReportTimeFrameFilter {
        public String dateColumn;
        public Date endDate;
        public String interval;
        public Date startDate;
        private String[] dateColumn_type_info = new String[]{'dateColumn',SOAP_M_URI,null,'1','1','false'};
        private String[] endDate_type_info = new String[]{'endDate',SOAP_M_URI,null,'0','1','false'};
        private String[] interval_type_info = new String[]{'interval',SOAP_M_URI,null,'1','1','false'};
        private String[] startDate_type_info = new String[]{'startDate',SOAP_M_URI,null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'dateColumn','endDate','interval','startDate'};
    }
    public class Report extends Metadata {
        public String type = 'Report';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName',SOAP_M_URI,null,'0','1','false'};
        public SFMetadataService.ReportAggregate[] aggregates;
        public SFMetadataService.Report[] block;
        public SFMetadataService.ReportBlockInfo blockInfo;
        public SFMetadataService.ReportBucketField[] buckets;
        public SFMetadataService.ReportChart chart;
        public SFMetadataService.ReportColorRange[] colorRanges;
        public SFMetadataService.ReportColumn[] columns;
        public SFMetadataService.ReportCrossFilter[] crossFilters;
        public String currency_x;
        public SFMetadataService.ReportDataCategoryFilter[] dataCategoryFilters;
        public String description;
        public String division;
        public SFMetadataService.ReportFilter filter;
        public String folderName;
        public String format;
        public SFMetadataService.ReportGrouping[] groupingsAcross;
        public SFMetadataService.ReportGrouping[] groupingsDown;
        public SFMetadataService.ReportHistoricalSelector historicalSelector;
        public String name;
        public Integer numSubscriptions;
        public SFMetadataService.ReportParam[] params;
        public String reportType;
        public String roleHierarchyFilter;
        public Integer rowLimit;
        public String scope;
        public Boolean showCurrentDate;
        public Boolean showDetails;
        public String sortColumn;
        public String sortOrder;
        public String territoryHierarchyFilter;
        public SFMetadataService.ReportTimeFrameFilter timeFrameFilter;
        public String userFilter;
        private String[] aggregates_type_info = new String[]{'aggregates',SOAP_M_URI,null,'0','-1','false'};
        private String[] block_type_info = new String[]{'block',SOAP_M_URI,null,'0','-1','false'};
        private String[] blockInfo_type_info = new String[]{'blockInfo',SOAP_M_URI,null,'0','1','false'};
        private String[] buckets_type_info = new String[]{'buckets',SOAP_M_URI,null,'0','-1','false'};
        private String[] chart_type_info = new String[]{'chart',SOAP_M_URI,null,'0','1','false'};
        private String[] colorRanges_type_info = new String[]{'colorRanges',SOAP_M_URI,null,'0','-1','false'};
        private String[] columns_type_info = new String[]{'columns',SOAP_M_URI,null,'0','-1','false'};
        private String[] crossFilters_type_info = new String[]{'crossFilters',SOAP_M_URI,null,'0','-1','false'};
        private String[] currency_x_type_info = new String[]{'currency',SOAP_M_URI,null,'0','1','false'};
        private String[] dataCategoryFilters_type_info = new String[]{'dataCategoryFilters',SOAP_M_URI,null,'0','-1','false'};
        private String[] description_type_info = new String[]{'description',SOAP_M_URI,null,'0','1','false'};
        private String[] division_type_info = new String[]{'division',SOAP_M_URI,null,'0','1','false'};
        private String[] filter_type_info = new String[]{'filter',SOAP_M_URI,null,'0','1','false'};
        private String[] folderName_type_info = new String[]{'folderName',SOAP_M_URI,null,'0','1','false'};
        private String[] format_type_info = new String[]{'format',SOAP_M_URI,null,'1','1','false'};
        private String[] groupingsAcross_type_info = new String[]{'groupingsAcross',SOAP_M_URI,null,'0','-1','false'};
        private String[] groupingsDown_type_info = new String[]{'groupingsDown',SOAP_M_URI,null,'0','-1','false'};
        private String[] historicalSelector_type_info = new String[]{'historicalSelector',SOAP_M_URI,null,'0','1','false'};
        private String[] name_type_info = new String[]{'name',SOAP_M_URI,null,'1','1','false'};
        private String[] numSubscriptions_type_info = new String[]{'numSubscriptions',SOAP_M_URI,null,'0','1','false'};
        private String[] params_type_info = new String[]{'params',SOAP_M_URI,null,'0','-1','false'};
        private String[] reportType_type_info = new String[]{'reportType',SOAP_M_URI,null,'1','1','false'};
        private String[] roleHierarchyFilter_type_info = new String[]{'roleHierarchyFilter',SOAP_M_URI,null,'0','1','false'};
        private String[] rowLimit_type_info = new String[]{'rowLimit',SOAP_M_URI,null,'0','1','false'};
        private String[] scope_type_info = new String[]{'scope',SOAP_M_URI,null,'0','1','false'};
        private String[] showCurrentDate_type_info = new String[]{'showCurrentDate',SOAP_M_URI,null,'0','1','false'};
        private String[] showDetails_type_info = new String[]{'showDetails',SOAP_M_URI,null,'0','1','false'};
        private String[] sortColumn_type_info = new String[]{'sortColumn',SOAP_M_URI,null,'0','1','false'};
        private String[] sortOrder_type_info = new String[]{'sortOrder',SOAP_M_URI,null,'0','1','false'};
        private String[] territoryHierarchyFilter_type_info = new String[]{'territoryHierarchyFilter',SOAP_M_URI,null,'0','1','false'};
        private String[] timeFrameFilter_type_info = new String[]{'timeFrameFilter',SOAP_M_URI,null,'0','1','false'};
        private String[] userFilter_type_info = new String[]{'userFilter',SOAP_M_URI,null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'aggregates','block','blockInfo','buckets','chart','colorRanges','columns','crossFilters','currency_x','dataCategoryFilters','description','division','filter','folderName','format','groupingsAcross','groupingsDown','historicalSelector','name','numSubscriptions','params','reportType','roleHierarchyFilter','rowLimit','scope','showCurrentDate','showDetails','sortColumn','sortOrder','territoryHierarchyFilter','timeFrameFilter','userFilter'};
    }
    public class ReportTypeColumn {
        public Boolean checkedByDefault;
        public String displayNameOverride;
        public String field;
        public String table;
        private String[] checkedByDefault_type_info = new String[]{'checkedByDefault',SOAP_M_URI,null,'1','1','false'};
        private String[] displayNameOverride_type_info = new String[]{'displayNameOverride',SOAP_M_URI,null,'0','1','false'};
        private String[] field_type_info = new String[]{'field',SOAP_M_URI,null,'1','1','false'};
        private String[] table_type_info = new String[]{'table',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'checkedByDefault','displayNameOverride','field','table'};
    }
    public class ReportChartComponentLayoutItem {
        public Boolean cacheData;
        public String contextFilterableField;
        public String error;
        public Boolean hideOnError;
        public Boolean includeContext;
        public String reportName;
        public Boolean showTitle;
        public String size;
        private String[] cacheData_type_info = new String[]{'cacheData',SOAP_M_URI,null,'0','1','false'};
        private String[] contextFilterableField_type_info = new String[]{'contextFilterableField',SOAP_M_URI,null,'0','1','false'};
        private String[] error_type_info = new String[]{'error',SOAP_M_URI,null,'0','1','false'};
        private String[] hideOnError_type_info = new String[]{'hideOnError',SOAP_M_URI,null,'0','1','false'};
        private String[] includeContext_type_info = new String[]{'includeContext',SOAP_M_URI,null,'0','1','false'};
        private String[] reportName_type_info = new String[]{'reportName',SOAP_M_URI,null,'1','1','false'};
        private String[] showTitle_type_info = new String[]{'showTitle',SOAP_M_URI,null,'0','1','false'};
        private String[] size_type_info = new String[]{'size',SOAP_M_URI,null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'cacheData','contextFilterableField','error','hideOnError','includeContext','reportName','showTitle','size'};
    }
    public class ReportHistoricalSelector {
        public String[] snapshot;
        private String[] snapshot_type_info = new String[]{'snapshot',SOAP_M_URI,null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'snapshot'};
    }
    public class ReportBlockInfo {
        public SFMetadataService.ReportAggregateReference[] aggregateReferences;
        public String blockId;
        public String joinTable;
        private String[] aggregateReferences_type_info = new String[]{'aggregateReferences',SOAP_M_URI,null,'0','-1','false'};
        private String[] blockId_type_info = new String[]{'blockId',SOAP_M_URI,null,'1','1','false'};
        private String[] joinTable_type_info = new String[]{'joinTable',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'aggregateReferences','blockId','joinTable'};
    }
    public class ReportLayoutSection {
        public SFMetadataService.ReportTypeColumn[] columns;
        public String masterLabel;
        private String[] columns_type_info = new String[]{'columns',SOAP_M_URI,null,'0','-1','false'};
        private String[] masterLabel_type_info = new String[]{'masterLabel',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'columns','masterLabel'};
    }
    public class ReportFolder extends Folder {
        public String type = 'ReportFolder';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName',SOAP_M_URI,null,'0','1','false'};
        public String accessType;
        public SFMetadataService.FolderShare[] folderShares;
        public String name;
        public String publicFolderAccess;
        public SFMetadataService.SharedTo sharedTo;
        private String[] accessType_type_info = new String[]{'accessType',SOAP_M_URI,null,'0','1','false'};
        private String[] folderShares_type_info = new String[]{'folderShares',SOAP_M_URI,null,'0','-1','false'};
        private String[] name_type_info = new String[]{'name',SOAP_M_URI,null,'1','1','false'};
        private String[] publicFolderAccess_type_info = new String[]{'publicFolderAccess',SOAP_M_URI,null,'0','1','false'};
        private String[] sharedTo_type_info = new String[]{'sharedTo',SOAP_M_URI,null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName','accessType','folderShares','name','publicFolderAccess','sharedTo'};
    }
    public class ChartSummary {
        public String aggregate;
        public String axisBinding;
        public String column;
        private String[] aggregate_type_info = new String[]{'aggregate',SOAP_M_URI,null,'0','1','false'};
        private String[] axisBinding_type_info = new String[]{'axisBinding',SOAP_M_URI,null,'0','1','false'};
        private String[] column_type_info = new String[]{'column',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'aggregate','axisBinding','column'};
    }
    public class ReportChart {
        public String backgroundColor1;
        public String backgroundColor2;
        public String backgroundFadeDir;
        public SFMetadataService.ChartSummary[] chartSummaries;
        public String chartType;
        public Boolean enableHoverLabels;
        public Boolean expandOthers;
        public String groupingColumn;
        public String legendPosition;
        public String location;
        public String secondaryGroupingColumn;
        public Boolean showAxisLabels;
        public Boolean showPercentage;
        public Boolean showTotal;
        public Boolean showValues;
        public String size;
        public Double summaryAxisManualRangeEnd;
        public Double summaryAxisManualRangeStart;
        public String summaryAxisRange;
        public String textColor;
        public Integer textSize;
        public String title;
        public String titleColor;
        public Integer titleSize;
        private String[] backgroundColor1_type_info = new String[]{'backgroundColor1',SOAP_M_URI,null,'0','1','false'};
        private String[] backgroundColor2_type_info = new String[]{'backgroundColor2',SOAP_M_URI,null,'0','1','false'};
        private String[] backgroundFadeDir_type_info = new String[]{'backgroundFadeDir',SOAP_M_URI,null,'0','1','false'};
        private String[] chartSummaries_type_info = new String[]{'chartSummaries',SOAP_M_URI,null,'0','-1','false'};
        private String[] chartType_type_info = new String[]{'chartType',SOAP_M_URI,null,'1','1','false'};
        private String[] enableHoverLabels_type_info = new String[]{'enableHoverLabels',SOAP_M_URI,null,'0','1','false'};
        private String[] expandOthers_type_info = new String[]{'expandOthers',SOAP_M_URI,null,'0','1','false'};
        private String[] groupingColumn_type_info = new String[]{'groupingColumn',SOAP_M_URI,null,'0','1','false'};
        private String[] legendPosition_type_info = new String[]{'legendPosition',SOAP_M_URI,null,'0','1','false'};
        private String[] location_type_info = new String[]{'location',SOAP_M_URI,null,'0','1','false'};
        private String[] secondaryGroupingColumn_type_info = new String[]{'secondaryGroupingColumn',SOAP_M_URI,null,'0','1','false'};
        private String[] showAxisLabels_type_info = new String[]{'showAxisLabels',SOAP_M_URI,null,'0','1','false'};
        private String[] showPercentage_type_info = new String[]{'showPercentage',SOAP_M_URI,null,'0','1','false'};
        private String[] showTotal_type_info = new String[]{'showTotal',SOAP_M_URI,null,'0','1','false'};
        private String[] showValues_type_info = new String[]{'showValues',SOAP_M_URI,null,'0','1','false'};
        private String[] size_type_info = new String[]{'size',SOAP_M_URI,null,'0','1','false'};
        private String[] summaryAxisManualRangeEnd_type_info = new String[]{'summaryAxisManualRangeEnd',SOAP_M_URI,null,'0','1','false'};
        private String[] summaryAxisManualRangeStart_type_info = new String[]{'summaryAxisManualRangeStart',SOAP_M_URI,null,'0','1','false'};
        private String[] summaryAxisRange_type_info = new String[]{'summaryAxisRange',SOAP_M_URI,null,'0','1','false'};
        private String[] textColor_type_info = new String[]{'textColor',SOAP_M_URI,null,'0','1','false'};
        private String[] textSize_type_info = new String[]{'textSize',SOAP_M_URI,null,'0','1','false'};
        private String[] title_type_info = new String[]{'title',SOAP_M_URI,null,'0','1','false'};
        private String[] titleColor_type_info = new String[]{'titleColor',SOAP_M_URI,null,'0','1','false'};
        private String[] titleSize_type_info = new String[]{'titleSize',SOAP_M_URI,null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'backgroundColor1','backgroundColor2','backgroundFadeDir','chartSummaries','chartType','enableHoverLabels','expandOthers','groupingColumn','legendPosition','location','secondaryGroupingColumn','showAxisLabels','showPercentage','showTotal','showValues','size','summaryAxisManualRangeEnd','summaryAxisManualRangeStart','summaryAxisRange','textColor','textSize','title','titleColor','titleSize'};
    }
    public class ReportCrossFilter {
        public SFMetadataService.ReportFilterItem[] criteriaItems;
        public String operation;
        public String primaryTableColumn;
        public String relatedTable;
        public String relatedTableJoinColumn;
        private String[] criteriaItems_type_info = new String[]{'criteriaItems',SOAP_M_URI,null,'0','-1','false'};
        private String[] operation_type_info = new String[]{'operation',SOAP_M_URI,null,'1','1','false'};
        private String[] primaryTableColumn_type_info = new String[]{'primaryTableColumn',SOAP_M_URI,null,'1','1','false'};
        private String[] relatedTable_type_info = new String[]{'relatedTable',SOAP_M_URI,null,'1','1','false'};
        private String[] relatedTableJoinColumn_type_info = new String[]{'relatedTableJoinColumn',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'criteriaItems','operation','primaryTableColumn','relatedTable','relatedTableJoinColumn'};
    }
    public class ReportTypeTranslation {
        public String description;
        public String label;
        public String name;
        public SFMetadataService.ReportTypeSectionTranslation[] sections;
        private String[] description_type_info = new String[]{'description',SOAP_M_URI,null,'0','1','false'};
        private String[] label_type_info = new String[]{'label',SOAP_M_URI,null,'0','1','false'};
        private String[] name_type_info = new String[]{'name',SOAP_M_URI,null,'1','1','false'};
        private String[] sections_type_info = new String[]{'sections',SOAP_M_URI,null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'description','label','name','sections'};
    }
    public class ReportDataCategoryFilter {
        public String dataCategory;
        public String dataCategoryGroup;
        public String operator;
        private String[] dataCategory_type_info = new String[]{'dataCategory',SOAP_M_URI,null,'1','1','false'};
        private String[] dataCategoryGroup_type_info = new String[]{'dataCategoryGroup',SOAP_M_URI,null,'1','1','false'};
        private String[] operator_type_info = new String[]{'operator',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'dataCategory','dataCategoryGroup','operator'};
    }
    public class ReportBucketFieldSourceValue {
        public String from_x;
        public String sourceValue;
        public String to;
        private String[] from_x_type_info = new String[]{'from',SOAP_M_URI,null,'0','1','false'};
        private String[] sourceValue_type_info = new String[]{'sourceValue',SOAP_M_URI,null,'0','1','false'};
        private String[] to_type_info = new String[]{'to',SOAP_M_URI,null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'from_x','sourceValue','to'};
    }
    public class ReportBucketField {
        public String bucketType;
        public String developerName;
        public String masterLabel;
        public String nullTreatment;
        public String otherBucketLabel;
        public String sourceColumnName;
        public Boolean useOther;
        public SFMetadataService.ReportBucketFieldValue[] values;
        private String[] bucketType_type_info = new String[]{'bucketType',SOAP_M_URI,null,'1','1','false'};
        private String[] developerName_type_info = new String[]{'developerName',SOAP_M_URI,null,'1','1','false'};
        private String[] masterLabel_type_info = new String[]{'masterLabel',SOAP_M_URI,null,'1','1','false'};
        private String[] nullTreatment_type_info = new String[]{'nullTreatment',SOAP_M_URI,null,'0','1','false'};
        private String[] otherBucketLabel_type_info = new String[]{'otherBucketLabel',SOAP_M_URI,null,'0','1','false'};
        private String[] sourceColumnName_type_info = new String[]{'sourceColumnName',SOAP_M_URI,null,'1','1','false'};
        private String[] useOther_type_info = new String[]{'useOther',SOAP_M_URI,null,'0','1','false'};
        private String[] values_type_info = new String[]{'values',SOAP_M_URI,null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'bucketType','developerName','masterLabel','nullTreatment','otherBucketLabel','sourceColumnName','useOther','values'};
    }
    public class ReadReportTypeResult implements IReadResult {
        public SFMetadataService.ReportType[] records;
        public SFMetadataService.Metadata[] getRecords() { return records; }
        private String[] records_type_info = new String[]{'records',SOAP_M_URI,null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'records'};
    }
    public class readReportTypeResponse_element implements IReadResponseElement {
        public SFMetadataService.ReadReportTypeResult result;
        public IReadResult getResult() { return result; }
        private String[] result_type_info = new String[]{'result',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class ReadReportResult implements IReadResult {
        public SFMetadataService.Report[] records;
        public SFMetadataService.Metadata[] getRecords() { return records; }
        private String[] records_type_info = new String[]{'records',SOAP_M_URI,null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'records'};
    }
    public class readReportResponse_element implements IReadResponseElement {
        public SFMetadataService.ReadReportResult result;
        public IReadResult getResult() { return result; }
        private String[] result_type_info = new String[]{'result',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class ReadReportFolderResult implements IReadResult {
        public SFMetadataService.ReportFolder[] records;
        public SFMetadataService.Metadata[] getRecords() { return records; }
        private String[] records_type_info = new String[]{'records',SOAP_M_URI,null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'records'};
    }
    public class readReportFolderResponse_element implements IReadResponseElement {
        public SFMetadataService.ReadReportFolderResult result;
        public IReadResult getResult() { return result; }
        private String[] result_type_info = new String[]{'result',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class ReportBucketFieldValue {
        public SFMetadataService.ReportBucketFieldSourceValue[] sourceValues;
        public String value;
        private String[] sourceValues_type_info = new String[]{'sourceValues',SOAP_M_URI,null,'0','-1','false'};
        private String[] value_type_info = new String[]{'value',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'sourceValues','value'};
    }
    public class ReportFilter {
        public String booleanFilter;
        public SFMetadataService.ReportFilterItem[] criteriaItems;
        public String language;
        private String[] booleanFilter_type_info = new String[]{'booleanFilter',SOAP_M_URI,null,'0','1','false'};
        private String[] criteriaItems_type_info = new String[]{'criteriaItems',SOAP_M_URI,null,'0','-1','false'};
        private String[] language_type_info = new String[]{'language',SOAP_M_URI,null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'booleanFilter','criteriaItems','language'};
    }
    public class ReportGrouping {
        public String aggregateType;
        public String dateGranularity;
        public String field;
        public String sortByName;
        public String sortOrder;
        public String sortType;
        private String[] aggregateType_type_info = new String[]{'aggregateType',SOAP_M_URI,null,'0','1','false'};
        private String[] dateGranularity_type_info = new String[]{'dateGranularity',SOAP_M_URI,null,'0','1','false'};
        private String[] field_type_info = new String[]{'field',SOAP_M_URI,null,'1','1','false'};
        private String[] sortByName_type_info = new String[]{'sortByName',SOAP_M_URI,null,'0','1','false'};
        private String[] sortOrder_type_info = new String[]{'sortOrder',SOAP_M_URI,null,'1','1','false'};
        private String[] sortType_type_info = new String[]{'sortType',SOAP_M_URI,null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'aggregateType','dateGranularity','field','sortByName','sortOrder','sortType'};
    }
    public class ObjectRelationship {
        public SFMetadataService.ObjectRelationship join_x;
        public Boolean outerJoin;
        public String relationship;
        private String[] join_x_type_info = new String[]{'join',SOAP_M_URI,null,'0','1','false'};
        private String[] outerJoin_type_info = new String[]{'outerJoin',SOAP_M_URI,null,'1','1','false'};
        private String[] relationship_type_info = new String[]{'relationship',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'join_x','outerJoin','relationship'};
    }
    public class ReportType extends Metadata {
        public String type = 'ReportType';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName',SOAP_M_URI,null,'0','1','false'};
        public Boolean autogenerated;
        public String baseObject;
        public String category;
        public Boolean deployed;
        public String description;
        public SFMetadataService.ObjectRelationship join_x;
        public String label;
        public SFMetadataService.ReportLayoutSection[] sections;
        private String[] autogenerated_type_info = new String[]{'autogenerated',SOAP_M_URI,null,'0','1','false'};
        private String[] baseObject_type_info = new String[]{'baseObject',SOAP_M_URI,null,'1','1','false'};
        private String[] category_type_info = new String[]{'category',SOAP_M_URI,null,'1','1','false'};
        private String[] deployed_type_info = new String[]{'deployed',SOAP_M_URI,null,'1','1','false'};
        private String[] description_type_info = new String[]{'description',SOAP_M_URI,null,'0','1','false'};
        private String[] join_x_type_info = new String[]{'join',SOAP_M_URI,null,'0','1','false'};
        private String[] label_type_info = new String[]{'label',SOAP_M_URI,null,'1','1','false'};
        private String[] sections_type_info = new String[]{'sections',SOAP_M_URI,null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'autogenerated','baseObject','category','deployed','description','join_x','label','sections'};
    }
    public class ReportTypeSectionTranslation {
        public SFMetadataService.ReportTypeColumnTranslation[] columns;
        public String label;
        public String name;
        private String[] columns_type_info = new String[]{'columns',SOAP_M_URI,null,'0','-1','false'};
        private String[] label_type_info = new String[]{'label',SOAP_M_URI,null,'0','1','false'};
        private String[] name_type_info = new String[]{'name',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'columns','label','name'};
    }
    public class ReportAggregateReference {
        public String aggregate;
        private String[] aggregate_type_info = new String[]{'aggregate',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'aggregate'};
    }
    public class ReportColorRange {
        public String aggregate;
        public String columnName;
        public Double highBreakpoint;
        public String highColor;
        public Double lowBreakpoint;
        public String lowColor;
        public String midColor;
        private String[] aggregate_type_info = new String[]{'aggregate',SOAP_M_URI,null,'0','1','false'};
        private String[] columnName_type_info = new String[]{'columnName',SOAP_M_URI,null,'1','1','false'};
        private String[] highBreakpoint_type_info = new String[]{'highBreakpoint',SOAP_M_URI,null,'0','1','false'};
        private String[] highColor_type_info = new String[]{'highColor',SOAP_M_URI,null,'1','1','false'};
        private String[] lowBreakpoint_type_info = new String[]{'lowBreakpoint',SOAP_M_URI,null,'0','1','false'};
        private String[] lowColor_type_info = new String[]{'lowColor',SOAP_M_URI,null,'1','1','false'};
        private String[] midColor_type_info = new String[]{'midColor',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'aggregate','columnName','highBreakpoint','highColor','lowBreakpoint','lowColor','midColor'};
    }
    public class ReportColumn {
        public String[] aggregateTypes;
        public String field;
        public Boolean reverseColors;
        public Boolean showChanges;
        private String[] aggregateTypes_type_info = new String[]{'aggregateTypes',SOAP_M_URI,null,'0','-1','false'};
        private String[] field_type_info = new String[]{'field',SOAP_M_URI,null,'1','1','false'};
        private String[] reverseColors_type_info = new String[]{'reverseColors',SOAP_M_URI,null,'0','1','false'};
        private String[] showChanges_type_info = new String[]{'showChanges',SOAP_M_URI,null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'aggregateTypes','field','reverseColors','showChanges'};
    }
    public class ReportAggregate {
        public String acrossGroupingContext;
        public String calculatedFormula;
        public String datatype;
        public String description;
        public String developerName;
        public String downGroupingContext;
        public Boolean isActive;
        public Boolean isCrossBlock;
        public String masterLabel;
        public String reportType;
        public Integer scale;
        private String[] acrossGroupingContext_type_info = new String[]{'acrossGroupingContext',SOAP_M_URI,null,'0','1','false'};
        private String[] calculatedFormula_type_info = new String[]{'calculatedFormula',SOAP_M_URI,null,'1','1','false'};
        private String[] datatype_type_info = new String[]{'datatype',SOAP_M_URI,null,'1','1','false'};
        private String[] description_type_info = new String[]{'description',SOAP_M_URI,null,'0','1','false'};
        private String[] developerName_type_info = new String[]{'developerName',SOAP_M_URI,null,'1','1','false'};
        private String[] downGroupingContext_type_info = new String[]{'downGroupingContext',SOAP_M_URI,null,'0','1','false'};
        private String[] isActive_type_info = new String[]{'isActive',SOAP_M_URI,null,'1','1','false'};
        private String[] isCrossBlock_type_info = new String[]{'isCrossBlock',SOAP_M_URI,null,'0','1','false'};
        private String[] masterLabel_type_info = new String[]{'masterLabel',SOAP_M_URI,null,'1','1','false'};
        private String[] reportType_type_info = new String[]{'reportType',SOAP_M_URI,null,'0','1','false'};
        private String[] scale_type_info = new String[]{'scale',SOAP_M_URI,null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'acrossGroupingContext','calculatedFormula','datatype','description','developerName','downGroupingContext','isActive','isCrossBlock','masterLabel','reportType','scale'};
    }
    public class DescribeMetadataObject {
        public String[] childXmlNames;
        public String directoryName;
        public Boolean inFolder;
        public Boolean metaFile;
        public String suffix;
        public String xmlName;
        private String[] childXmlNames_type_info = new String[]{'childXmlNames',SOAP_M_URI,null,'0','-1','false'};
        private String[] directoryName_type_info = new String[]{'directoryName',SOAP_M_URI,null,'1','1','false'};
        private String[] inFolder_type_info = new String[]{'inFolder',SOAP_M_URI,null,'1','1','false'};
        private String[] metaFile_type_info = new String[]{'metaFile',SOAP_M_URI,null,'1','1','false'};
        private String[] suffix_type_info = new String[]{'suffix',SOAP_M_URI,null,'0','1','false'};
        private String[] xmlName_type_info = new String[]{'xmlName',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'childXmlNames','directoryName','inFolder','metaFile','suffix','xmlName'};
    }
    public class ExtendedErrorDetails {
        public String extendedErrorCode;
        private String[] extendedErrorCode_type_info = new String[]{'extendedErrorCode',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'extendedErrorCode'};
    }
    public class Error {
        public SFMetadataService.ExtendedErrorDetails[] extendedErrorDetails;
        public String[] fields;
        public String message;
        public String statusCode;
        private String[] extendedErrorDetails_type_info = new String[]{'extendedErrorDetails',SOAP_M_URI,null,'0','-1','false'};
        private String[] fields_type_info = new String[]{'fields',SOAP_M_URI,null,'0','-1','false'};
        private String[] message_type_info = new String[]{'message',SOAP_M_URI,null,'1','1','false'};
        private String[] statusCode_type_info = new String[]{'statusCode',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'extendedErrorDetails','fields','message','statusCode'};
    }
    public class LogInfo {
        public String category;
        public String level;
        private String[] category_type_info = new String[]{'category',SOAP_M_URI,null,'1','1','false'};
        private String[] level_type_info = new String[]{'level',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'category','level'};
    }
    public class SaveResult {
        public SFMetadataService.Error[] errors;
        public String fullName;
        public Boolean success;
        private String[] errors_type_info = new String[]{'errors',SOAP_M_URI,null,'0','-1','false'};
        private String[] fullName_type_info = new String[]{'fullName',SOAP_M_URI,null,'1','1','false'};
        private String[] success_type_info = new String[]{'success',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'errors','fullName','success'};
    }
    public class DeleteResult {
        public SFMetadataService.Error[] errors;
        public String fullName;
        public Boolean success;
        private String[] errors_type_info = new String[]{'errors',SOAP_M_URI,null,'0','-1','false'};
        private String[] fullName_type_info = new String[]{'fullName',SOAP_M_URI,null,'1','1','false'};
        private String[] success_type_info = new String[]{'success',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'errors','fullName','success'};
    }
    public class DescribeMetadataResult {
        public SFMetadataService.DescribeMetadataObject[] metadataObjects;
        public String organizationNamespace;
        public Boolean partialSaveAllowed;
        public Boolean testRequired;
        private String[] metadataObjects_type_info = new String[]{'metadataObjects',SOAP_M_URI,null,'0','-1','false'};
        private String[] organizationNamespace_type_info = new String[]{'organizationNamespace',SOAP_M_URI,null,'1','1','false'};
        private String[] partialSaveAllowed_type_info = new String[]{'partialSaveAllowed',SOAP_M_URI,null,'1','1','false'};
        private String[] testRequired_type_info = new String[]{'testRequired',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'metadataObjects','organizationNamespace','partialSaveAllowed','testRequired'};
    }
    public class SessionHeader_element {
        public String sessionId;
        private String[] sessionId_type_info = new String[]{'sessionId',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'sessionId'};
    }
    public class DebuggingInfo_element {
        public String debugLog;
        private String[] debugLog_type_info = new String[]{'debugLog',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'debugLog'};
    }
    public class CallOptions_element {
        public String client;
        private String[] client_type_info = new String[]{'client',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'client'};
    }
    public class AllOrNoneHeader_element {
        public Boolean allOrNone;
        private String[] allOrNone_type_info = new String[]{'allOrNone',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'allOrNone'};
    }
    public class DebuggingHeader_element {
        public SFMetadataService.LogInfo[] categories;
        public String debugLevel;
        private String[] categories_type_info = new String[]{'categories',SOAP_M_URI,null,'0','-1','false'};
        private String[] debugLevel_type_info = new String[]{'debugLevel',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'categories','debugLevel'};
    }
    public class deleteMetadata_element {
        public String type_x;
        public String[] fullNames;
        private String[] type_x_type_info = new String[]{'type',SOAP_M_URI,null,'1','1','false'};
        private String[] fullNames_type_info = new String[]{'fullNames',SOAP_M_URI,null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'type_x','fullNames'};
    }
    public class deleteMetadataResponse_element {
        public SFMetadataService.DeleteResult[] result;
        private String[] result_type_info = new String[]{'result',SOAP_M_URI,null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class renameMetadata_element {
        public String type_x;
        public String oldFullName;
        public String newFullName;
        private String[] type_x_type_info = new String[]{'type',SOAP_M_URI,null,'1','1','false'};
        private String[] oldFullName_type_info = new String[]{'oldFullName',SOAP_M_URI,null,'1','1','false'};
        private String[] newFullName_type_info = new String[]{'newFullName',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'type_x','oldFullName','newFullName'};
    }
    public class renameMetadataResponse_element {
        public SFMetadataService.SaveResult result;
        private String[] result_type_info = new String[]{'result',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class updateMetadata_element {
        public SFMetadataService.Metadata[] metadata;
        private String[] metadata_type_info = new String[]{'metadata',SOAP_M_URI,null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'metadata'};
    }
    public class updateMetadataResponse_element {
        public SFMetadataService.SaveResult[] result;
        private String[] result_type_info = new String[]{'result',SOAP_M_URI,null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class describeMetadata_element {
        public Double asOfVersion;
        private String[] asOfVersion_type_info = new String[]{'asOfVersion',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'asOfVersion'};
    }
    public class describeMetadataResponse_element {
        public SFMetadataService.DescribeMetadataResult result;
        private String[] result_type_info = new String[]{'result',SOAP_M_URI,null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class createMetadata_element {
        public SFMetadataService.Metadata[] metadata;
        private String[] metadata_type_info = new String[]{'metadata',SOAP_M_URI,null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'metadata'};
    }
    public class createMetadataResponse_element {
        public SFMetadataService.SaveResult[] result;
        private String[] result_type_info = new String[]{'result',SOAP_M_URI,null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class readMetadata_element {
        public String type_x;
        public String[] fullNames;
        private String[] type_x_type_info = new String[]{'type',SOAP_M_URI,null,'1','1','false'};
        private String[] fullNames_type_info = new String[]{'fullNames',SOAP_M_URI,null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
        private String[] field_order_type_info = new String[]{'type_x','fullNames'};
    }
    public class MetadataPort {
        public String endpoint_x = URL.getSalesforceBaseUrl().toExternalForm() + '/services/Soap/m/42.0';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        public SFMetadataService.SessionHeader_element SessionHeader;
        public SFMetadataService.DebuggingInfo_element DebuggingInfo;
        public SFMetadataService.DebuggingHeader_element DebuggingHeader;
        public SFMetadataService.CallOptions_element CallOptions;
        public SFMetadataService.AllOrNoneHeader_element AllOrNoneHeader;
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/2006/04/metadata';
        private String DebuggingInfo_hns = 'DebuggingInfo=http://soap.sforce.com/2006/04/metadata';
        private String DebuggingHeader_hns = 'DebuggingHeader=http://soap.sforce.com/2006/04/metadata';
        private String CallOptions_hns = 'CallOptions=http://soap.sforce.com/2006/04/metadata';
        private String AllOrNoneHeader_hns = 'AllOrNoneHeader=http://soap.sforce.com/2006/04/metadata';
        private String[] ns_map_type_info = new String[]{SOAP_M_URI, 'SFMetadataService'};
        public SFMetadataService.DeleteResult[] deleteMetadata(String type_x,String[] fullNames) {
            SFMetadataService.deleteMetadata_element request_x = new SFMetadataService.deleteMetadata_element();
            request_x.type_x = type_x;
            request_x.fullNames = fullNames;
            SFMetadataService.deleteMetadataResponse_element response_x;
            Map<String, SFMetadataService.deleteMetadataResponse_element> response_map_x = new Map<String, SFMetadataService.deleteMetadataResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              SOAP_M_URI,
              'deleteMetadata',
              SOAP_M_URI,
              'deleteMetadataResponse',
              'SFMetadataService.deleteMetadataResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public SFMetadataService.SaveResult[] updateMetadata(SFMetadataService.Metadata[] metadata) {
            SFMetadataService.updateMetadata_element request_x = new SFMetadataService.updateMetadata_element();
            request_x.metadata = metadata;
            SFMetadataService.updateMetadataResponse_element response_x;
            Map<String, SFMetadataService.updateMetadataResponse_element> response_map_x = new Map<String, SFMetadataService.updateMetadataResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              SOAP_M_URI,
              'updateMetadata',
              SOAP_M_URI,
              'updateMetadataResponse',
              'SFMetadataService.updateMetadataResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public SFMetadataService.SaveResult[] createMetadata(SFMetadataService.Metadata[] metadata) {
            SFMetadataService.createMetadata_element request_x = new SFMetadataService.createMetadata_element();
            request_x.metadata = metadata;
            SFMetadataService.createMetadataResponse_element response_x;
            Map<String, SFMetadataService.createMetadataResponse_element> response_map_x = new Map<String, SFMetadataService.createMetadataResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              SOAP_M_URI,
              'createMetadata',
              SOAP_M_URI,
              'createMetadataResponse',
              'SFMetadataService.createMetadataResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public SFMetadataService.IReadResult readMetadata(String type_x,String[] fullNames) {
            SFMetadataService.readMetadata_element request_x = new SFMetadataService.readMetadata_element();
            request_x.type_x = type_x;
            request_x.fullNames = fullNames;
            SFMetadataService.IReadResponseElement response_x;
            Map<String, SFMetadataService.IReadResponseElement> response_map_x = new Map<String, SFMetadataService.IReadResponseElement>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              SOAP_M_URI,
              'readMetadata',
              SOAP_M_URI,
              'readMetadataResponse',
              'SFMetadataService.read' + type_x + 'Response_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.getResult();
        }
    }
}