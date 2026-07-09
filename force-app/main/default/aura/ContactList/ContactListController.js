({
    doInit : function(component, event) {
        var accId = component.get("v.recordId");
        var action = component.get("c.findAll");
        action.setParams({
            "accId" : accId
        });
        action.setCallback(this, function(response) {
            component.set("v.contacts", response.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    
    searchKeyChange: function(component, event) {
        console.log("which component is it---"+component);
        var searchKey = event.getParam("searchKey");
        console.log("what is the value of searchKey--"+searchKey);
        var acctId =component.get("v.recordId");
        console.log("What is the value of acctId---"+acctId);
        var action = component.get("c.findByName");
        action.setParams({"searchKey": searchKey, 
                           "acctId" : acctId
        });
        action.setCallback(this, function(response) {
            component.set("v.contacts", response.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})