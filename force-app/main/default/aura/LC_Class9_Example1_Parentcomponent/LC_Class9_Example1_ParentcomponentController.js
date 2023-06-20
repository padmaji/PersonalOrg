({
	Handle : function(component, event, helper) {
        
        var ceacc=event.getParam("eacc");
        var cpacc=component.get("v.pacc");
        
        //cpacc.push(ceacc);
        
        component.set("v.pacc",ceacc);
        
		
	},
    OnInit: function(component, event, helper)
    {
        //var col=
             component.set("v.cols",[
            {label:'AccountName',fieldName:'Name',type:'text'},
            {label:'AccountPhone',fieldName:'Phone',type:'Phone'},
            {label:'AccountIndustry',fieldName:'Industry',type:'text'},
            {label:'Account Rating',fieldName:'Rating',type:'text'}
             
        ]);
             
}
})