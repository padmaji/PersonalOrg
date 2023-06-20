({
    Check : function(component, event, helper) {
        var n1=parseInt(component.get("v.fnumber"));
        var n2=parseInt(component.get("v.snumber"));
        var n3=parseInt(component.get("v.tnumber"));
        
        if(n1>n2 && n1>n3)
        {
            component.set("v.res",n1);
            
        }
        else if(n2>n1 && n2>n3)
        {
            component.set("v.res",n2);
        }
            else
            {
                component.set("v.res",n3);
            }
        
        
    },
    Cancel :function(component,event,helper)
    {
        component.set("v.fnumber",null);
        component.set("v.snumber",null);
        component.set("v.tnumber",null);
    }
})