({
	CalculateBmi : function(component, event, helper) {
        var height=component.get("v.height");
        var weight=component.get("v.weight");
        var heightsquare=height*height;
        var resultant=(weight/heightsquare).toFixed(2);
        
        component.set("v.result",resultant);
        
        if(resultant < 18.5){
           var body ="Dangerous!  Please! Increase your weight or you will vanish in the thin air";
            component.set("v.consideration",body);
        }if(resultant >= 18.5 && resultant < 25){
           var body1 = " healthy! A healthy mind resides in a healthy body ";
            component.set("v.consideration",body1);
        }if(resultant > 25){
           var body2="Only God can save you! Reduce it soon before its too late";
            component.set("v.consideration",body2);
        }
	}
})