({
	CalculateBMI : function(component, event, helper) {
        var height=componet.get("v.height");
        var weight=component.get("v.weight");
        var heightsquare=height*height;
        var result=weight/heightsquare;
        
        component.set("v.result",result);
        
        
		
	}
})