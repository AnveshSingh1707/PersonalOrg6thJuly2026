({
    getReport : function(component, event, helper) {
        //hide report and show spinner while we process
        var loadingSpinner = component.find('loading');
        $A.util.removeClass(loadingSpinner, 'slds-hide');
        var reportContainer = component.find('report');
        $A.util.addClass(reportContainer, 'slds-hide');
        var reportError = component.find('report-error');
        $A.util.addClass(reportError, 'slds-hide');

        //get report data from Apex controller using report ID provided
        var action = component.get('c.getReportMetadata');
        action.setParams({ 
            reportId: component.get("v.reportIdAttribute")
        });

        //handle response from Apex controller
        action.setCallback(this, function(response){
            // transform into JSON object
            var returnValue = JSON.parse(response.getReturnValue());
            console.log('return--',returnValue);
            var groupingLabels = {};
            
            if( returnValue && returnValue.reportExtendedMetadata ){
                // categorize groupings into levels so we can access them as we go down grouping level
                var columnInfo = returnValue.reportExtendedMetadata.groupingColumnInfo;
                for( var property in columnInfo ){
                    if( columnInfo.hasOwnProperty(property) ){
                        var level = columnInfo[property].groupingLevel;
                        var label = columnInfo[property].label;
                        groupingLabels[level] = label;
                    }
                }
                // set lightning attributes so we have access to variables in the view
                component.set("v.groupingLevelToLabel", groupingLabels)
                component.set("v.reportData", returnValue);
                component.set("v.factMap", returnValue.factMap);
                
                //set column headers, this assumes that they are returned in order
                var tableHeaders = [];
                var tableHeaders_API = [];
                for( var i = 0; i < returnValue.reportMetadata.detailColumns.length; i++ ){
                    var fieldAPIName = returnValue.reportMetadata.detailColumns[i];
                    var fieldLabel = returnValue.reportExtendedMetadata.detailColumnInfo[fieldAPIName].label;
                    tableHeaders.push(fieldLabel);
                    tableHeaders_API.push(fieldAPIName);
                }
                component.set("v.columnAPINames",tableHeaders_API);
                component.set("v.columnLabels", tableHeaders);
                
                //hide spinner, reveal data
                $A.util.addClass(loadingSpinner, 'slds-hide');
                $A.util.removeClass(reportContainer, 'slds-hide');
            }
            else {
                $A.util.addClass(loadingSpinner, 'slds-hide');
                $A.util.removeClass(reportError, 'slds-hide');
            }
        })
        $A.enqueueAction(action);
    },
    addNewColumnHeader: function(component, event, helper) {
        var oldHeaders = component.get("v.columnAPINames");
        var newHeaders = event.getParam("columnheaders");
        var finalHeaders = oldHeaders.concat(newHeaders);
        component.set("v.columnLabels",finalHeaders);
        console.log('oldHeaders',oldHeaders);
        console.log('newHeaders',newHeaders);

        var loadingSpinner = component.find('loading');
        $A.util.removeClass(loadingSpinner, 'slds-hide');
        var reportContainer = component.find('report');
        $A.util.addClass(reportContainer, 'slds-hide');
        var reportError = component.find('report-error');
        $A.util.addClass(reportError, 'slds-hide');

        //get report data from Apex controller using report ID provided
        var action = component.get('c.getReportDataWithMetadata');
        action.setParams({ 
            reportId: component.get("v.reportIdAttribute"),
            fieldAPINames: finalHeaders
        });

        //handle response from Apex controller
        action.setCallback(this, function(response){
            // transform into JSON object
            var returnValue = JSON.parse(response.getReturnValue());
            console.log('return--',returnValue);
            var groupingLabels = {};
            
            if( returnValue && returnValue.reportExtendedMetadata ){
                // categorize groupings into levels so we can access them as we go down grouping level
                var columnInfo = returnValue.reportExtendedMetadata.groupingColumnInfo;
                for( var property in columnInfo ){
                    if( columnInfo.hasOwnProperty(property) ){
                        var level = columnInfo[property].groupingLevel;
                        var label = columnInfo[property].label;
                        groupingLabels[level] = label;
                    }
                }
                // set lightning attributes so we have access to variables in the view
                component.set("v.groupingLevelToLabel", groupingLabels)
                component.set("v.reportData", returnValue);
                component.set("v.factMap", returnValue.factMap);
                
                //set column headers, this assumes that they are returned in order
                var tableHeaders = [];
                for( var i = 0; i < returnValue.reportMetadata.detailColumns.length; i++ ){
                    var fieldAPIName = returnValue.reportMetadata.detailColumns[i];
                    var fieldLabel = returnValue.reportExtendedMetadata.detailColumnInfo[fieldAPIName].label;
                    tableHeaders.push(fieldLabel)
                }
                component.set("v.columnLabels", tableHeaders);
                
                //hide spinner, reveal data
                $A.util.addClass(loadingSpinner, 'slds-hide');
                $A.util.removeClass(reportContainer, 'slds-hide');
            }
            else {
                $A.util.addClass(loadingSpinner, 'slds-hide');
                $A.util.removeClass(reportError, 'slds-hide');
            }
        })
        $A.enqueueAction(action);

    },
    handleDownload: function(component,event,helper) {
        var reportId = component.get("v.reportIdAttribute");
        var reportURL =  reportId+'?csv=1&exp=1&enc=UTF-8&isdtp=p1';
        window.open('/'+reportURL,'_blank');    
    }
})