({
    onClick : function(component, event, helper) 
    {	
        $A.createComponents(
            [
                ["lightning:input",
                 {
                     "label":"Enter name",
                     "aura:id":"EN",
                     "type":"text"
                 }
                ],
                [
                    "lightning:input",
                    {
                        "label":"Enter dob",
                        "aura:id":"SIN",
                        "type":"Date"
                    }
                ],
                [
                    "lightning:button",
                    {
                        "label":"Submit",
                        "onclick":component.getReference("c.onsubmit")
                    }
                ]
                
            ],
            function(mycomps,success,Error){
                if(success=='SUCCESS')
                {
                    var bd=component.get("v.body");
                    mycomps.forEach(function(item){
                        bd.push(item);
                        
                    });
                    component.set("v.body",bd);
                }
            }			
        );
    },
        onsubmit : function(component, event, helper)
    {
        alert("Clicked on submit");
        var iname=component.find("EN").get("v.value");
       alert(iname);
    },
    KillMe : function(component,event,helper)
    {
        var sin=component.find("EN");
        sin.destroy();
        var sn=component.find("SIN");
        sn.destroy();
    }
})