({
	submit : function(component, event, helper) {
        
        var eventt=$A.get("e.c:LE_firstEvent");
        eventt.setParams({"EmpName":"Satish"});
        eventt.fire();
		
	}
})