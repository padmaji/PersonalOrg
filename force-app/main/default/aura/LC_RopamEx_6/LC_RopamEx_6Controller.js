({
    CallMe : function(component, event, helper) 
    {
        var a=parseInt(component.find("Fn").get("v.value"));
        var b=parseInt(component.find("Ln").get("v.value"));
        var re=a*b;
        
        
        if(re>100)
        {
            component.set("v.Rsult",re);
            component.set("v.flag",true);
        }
        
    },
    ClearMe :function(component,event,helper)
    {
        component.set("v.flag",false);
        component.find("Fn").set("v.value",null);
        component.find("Ln").set("v.value",null);
        
    }
})