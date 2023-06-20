({
    
    handleChange : function(component, event, helper) {
        var inp=component.get("v.inpval");
        console.log('inpvalue is-->',inp);
        const inval={
            recordId:inp,
            name:"From Aura component"
};
console.log('Input val is-->',inval);
component.set("v.jsoninp",inval);
console.log('typeof  inval',typeof(inval));
//console.log('json value is',v.jsoninp);

        },
        handleClick:function(component, event, helper)
    {
        console.log('handle click send payload is clicked');
        var js=component.get("v.jsoninp");
        const objUncovered = JSON.parse(JSON.stringify(js));
        console.log('send payload js value is',objUncovered);
        component.find("ACCOUNT_CHANNEL").publish(objUncovered);

    },
    radiohandle:function(component, event, helper)
    {
        var rs=component.get("v.value");
        console.log(rs);
    },
    messagechannelchanged:function(component,event,helper)
    {
        console.log("messagechannelchanged methdod is fired");

        if (event != null) {
            console.log('destimation',event.getParam("Destination"));
            if(event.getParam("Destination")=='A')
            {
                console.log("destination a is passed");
            

                component.set("v.recordValue", JSON.stringify(event.getParam("recordId")+'  '+event.getParam("name")));
            
            }
            else if(event.getParam("Destination")=='AL')
            {
                component.set("v.recordValue", event.getParam("recordId")+'  '+event.getParam("name")); 
            }
            else{
                component.set("v.recordValue",null);
            }
    }
}
})