/*({
	initila : function(component, event, helper) 
    {
	component.find("md").getNewRecord(
								"Account",
        							null,
        							false,
        $A.getCallback(function(){
            alert('Account Initilization is completed');
        })
    );	
	},
    Clikme :function(component, event, helper) 
    {
        component.find("md").saveRecord(function(){
            alert('Account created succesfully');
        });
    }
})*/

({
    clickme : function(component, event, helper) 
    {
      $A.createComponent(
            "lightning:button",
          {
              "label":"Pressme",
              "onclick":component.getReference("c.click")
          },
          function(btn,status,errormessage)
          {
              if(status==="SUCCESS")
              {
                  var bd=component.get("v.body");
                  bd.push(btn);
                  component.set("v.body",bd);
              }
          }
          
      ); 
    },
    click:function(component, event, helper) 
    {
        alert("Hi Gud mrng guys");
    }
    
})