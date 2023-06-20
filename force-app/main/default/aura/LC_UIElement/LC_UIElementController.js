({
	FullName : function(component, event, helper) {
        var FFN=component.find("FN").get("v.value");
        var LLN=component.find("LN").get("v.value");
         var FllName=component.get("c.apexFullName");
        FllName.setParams({"FirstName":FFN,"LastName":LLN});
        FllName.setCallback(this,function(response){
            
            var state=response.getState();
            if(state==='SUCCESS')
            {
                var result=response.getReturnValue();
                component.set("v.completename",result);
            }
        });
        $A.enqueueAction(FllName);
		
	}
})