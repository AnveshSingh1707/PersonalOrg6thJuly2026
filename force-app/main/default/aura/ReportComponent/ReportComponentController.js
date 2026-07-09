({
    doInit : function(component, event, helper) {
        // Retrieve reports for search autocomplete during component initialization
        helper.getReportsForSearch(component);  
        helper.loadResources();
    },
    loadReport : function(component, event, helper) {
        helper.getReportResponse(component, event, helper);   
    },
    showSpinner : function (component, event, helper) {
        var spinner = component.find('spinner');
        var evt = spinner.get("e.toggle");
        evt.setParams({ isVisible : true });
        evt.fire();
    },
    hideSpinner : function (component, event, helper) {
        var spinner = component.find('spinner');
        var evt = spinner.get("e.toggle");
        evt.setParams({ isVisible : false });
        evt.fire();
    },
    showReport : function(component, event, helper) {
        var report = component.get("v.report");        
        var rLoadEvent = $A.get("e.c:reportLoadEvent");
        rLoadEvent.setParams({"report": report});
        rLoadEvent.fire();
   } 
})