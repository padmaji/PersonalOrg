/*({
	onclick : function(component, event, helper) {
        alert("Helllo message is primnted");
        component.set("v.firstName","Padmaji");
        component.set("v.Age","25");
		
	}
})
*/
({
    Callme: function(component,event,helper)
    {
        var a=parseInt(component.find("FN").get("v.value"));
        var b=parseInt(component.find("SN").get("v.value"));
        
       
        var ge=event.getSource();
        var gb=ge.getLocalId();
        if(gb=='add')
        {
             var result=a+b;
            component.set("v.result",result);
        }
        else if(gb=='sub')
        {
             var result=a-b;
            component.set("v.result",result);
        }
        else if(gb=='mul')
        {
             var result=a*b;
            component.set("v.result",result);
        }
        else if(gb=='div')
        {
             var result=a/b;
           component.set("v.result",result);
            
        }
    }
    
})