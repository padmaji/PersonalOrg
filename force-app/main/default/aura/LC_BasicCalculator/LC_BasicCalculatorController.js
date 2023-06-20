({
	Addition : function(component, event, helper) {
        var fn=component.find("fnumber").get("v.value");
        var sn=component.find("snumber").get("v.value");
        
        var routput=parseInt(fn)+parseInt(sn);
        component.find("Resultouput").set("v.value",routput);
		
	},
    Multiply : function(component, event, helper) {
        var fn=component.find("fnumber").get("v.value");
        var sn=component.find("snumber").get("v.value");
        
        var routput=parseInt(fn)*parseInt(sn);
        component.find("Resultouput").set("v.value",routput);
		
	},
    Division:function(component,event,helper){
        var fn=component.find("fnumber").get("v.value");
        var sn=component.find("snumber").get("v.value");
        
          var routput=parseInt(fn)/parseInt(sn);
        component.find("Resultouput").set("v.value",routput);
    },
     subtarct:function(component,event,helper){
        var fn=component.find("fnumber").get("v.value");
        var sn=component.find("snumber").get("v.value");
        
          var routput=parseInt(fn)-parseInt(sn);
        component.find("Resultouput").set("v.value",routput);
    },
    clear:function(component,event,helper)
    {
   component.find("fnumber").set("v.value",0);
        component.find("snumber").set("v.value",0);
    component.find("Resultouput").set("v.value",0);
        
}
})