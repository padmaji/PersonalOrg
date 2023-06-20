({
	Clickme : function(component, event, helper) {
        
        var a=parseInt(component.find("fN").get("v.value"));
         var b=parseInt(component.find("sN").get("v.value"));
        
        var wt=event.getSource();
        var wtd=wt.getLocalId();
        
        if(wtd=='add')
        {
            var r=a+b;
            alert('The result is '+r);
        }
        else if(wtd=='sub')
        {
            var r=a-b;
            alert('The result is '+r);
        }
         else if(wtd=='Mul')
        {
            var r=a*b;
            alert('The result is '+r);
        }
          else if(wtd=='div')
        {
            var r=a/b;
            alert('The result is '+r);
        }
        else
        {
            alert('Thank you');
        }
        
		
	}
})