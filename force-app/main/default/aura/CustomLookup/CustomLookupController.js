({
	doHandleSearchEvent : function(component, event, helper) {
		var searchParam = event.getParam('searchText');
        var action = component.get('c.getFieldsList');//var action = component.get('c.getRecordList');
        var repId = component.get('v.reportId');
        console.log('action--'+action);
        console.log('searchParam--'+searchParam);
        console.log('rep--'+repId);
        action.setParams({
            searchText : searchParam,
            reportId : repId
        });
        if(!searchParam){
            component.set('v.recordList', null);
            return;
        }
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log(state);
            if(state === 'SUCCESS' || state ==='DRAFT'){
                var responseValue = response.getReturnValue();
                // for(let i=0; i<responseValue.length; i++){
                //     responseValue[i].Name = responseValue[i][component.get('v.fieldName')]
                // }
                console.log('responseValue ', responseValue);
                component.set('v.recordList', responseValue);
            }
        });
        $A.enqueueAction(action);
	},
    doHandleSelectEvent : function(component, event, helper) {
        var record = event.getParam('record');
        console.log('record ', record);
        component.set('v.selectedRecordList', record);
        
        var fieldAPIName = component.get('v.fieldName');
        var columnHeaderEvent = component.getEvent("columnHeaders");
        console.log('columnHeaderEvent--',columnHeaderEvent);
        columnHeaderEvent.setParams({"columnheaders":record});
        columnHeaderEvent.fire();
        //alert(record[fieldAPIName]);
        //component.set('v.recordValue', record[fieldAPIName]);
        //component.set('v.recordList', null);
    },
    handleRemove: function(component, event, helper){
        event.preventDefault();
        component.set('v.selecteRecord', null);
        component.set('v.recordValue', null);
    }
})