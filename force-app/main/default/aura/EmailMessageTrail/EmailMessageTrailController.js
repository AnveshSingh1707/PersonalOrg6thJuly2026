({
    doInit : function(component, event, helper) {
        var action = component.get("c.getInteractions");
        action.setParams({
            recordId: component.get("v.recordId")

        });
        action.setCallback(this, function(response){
            console.log(response, response.getReturnValue());
            var wrappers = response.getReturnValue();
            component.set("v.wrappers", wrappers);
        });

        $A.enqueueAction(action);
    }
})