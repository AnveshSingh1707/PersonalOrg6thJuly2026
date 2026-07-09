({
	handleSearchInput : function(component, event, helper) {
	    var searchTerm = component.find('enter-search').get('v.value');
	    console.log('action--',searchTerm);
	    var action = component.get("c.getSearchedAccount");
	    action.setParams({
            'accountName': searchTerm
          });
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log('state--',state);
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                component.set("v.accountList",storeResponse);
                console.log('storeResponse--',storeResponse);
            }else {console.log('There was a problem : '+response.getError());}
        });
        $A.enqueueAction(action);
	}
})