({
	onSelection : function(component, event, helper) {
        var selectedMenu=event.detail.menuItem.get("v.value");
       var f= parseInt(component.get("v.firstNumer"));
         var s= parseInt(component.get("v.SecondNumer"));
        
        component.set("v.Selmenuitem",selectedMenu)
        if(selectedMenu=='Add')
        {
           
            //var rs=f+s;
           component.set("v.res",f+s);
            
        }
        else if(selectedMenu=='sub')
        {
            component.set("v.res",f-s);
        }
        else if(selectedMenu=='Mul')
        {
            component.set("v.res",f*s);
        }
        else if(selectedMenu=='Div')
        {
            component.set("v.res",f/s);
        }
        else
        {
          component.set("v.res",null);  
        }
		
	}
})