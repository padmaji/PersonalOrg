({
    ClickMe : function(component, event, helper) {
        var evt=component.getEvent("first");
        var n=component.get("v.cmpname");
        evt.setParams({"empname":n});
        evt.fire();
    },
    Handler : function(component,event,helper)
    {
        var empname=event.getParam("empname");
        alert("Hi"+empname+'i fired the event i can also listen the event');
        
    }
})