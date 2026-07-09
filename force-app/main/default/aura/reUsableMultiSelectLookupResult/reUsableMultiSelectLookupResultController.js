({
    selectRecord : function(component, event, helper){      
        // get the selected record from list  
        var getSelectRecord = component.get("v.oRecord");
        var getRecordsIds = component.get("v.listOfSelectedRecordIds");
        console.log('getRecordsIds-Before->',getRecordsIds);
        getRecordsIds.push(getSelectRecord.Id);
        component.set("v.listOfSelectedRecordIds",getRecordsIds);
        console.log('getSelectRecord-->',getSelectRecord.Id);
        console.log('getRecordsIds-After->',getRecordsIds);
        // call the event   
        var compEvent = component.getEvent("oSelectedRecordEvent");
        // set the Selected sObject Record to the event attribute.  
        compEvent.setParams({"recordByEvent" : getSelectRecord });  
        // fire the event  
        compEvent.fire();
    },
})