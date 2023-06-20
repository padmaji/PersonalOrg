({
	ClickMe : function(component, event, helper) {
        var et=component.getEvent("firsty");
        et.fire();
		
	},
    HadnleMe : function(component,event,helper)
    {
        alert("I am c11 blue i fired the event and also i can also listen the event");
    }
})