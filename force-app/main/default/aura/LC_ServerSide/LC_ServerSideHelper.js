({
    getrecordsDataHelper : function(component,event,helper) {
        var apexrecordsData=component.get("c.GetAccountRecords");
        
        apexrecordsData.setParams({});
        apexrecordsData.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS')
            {
                component.set("v.lstofAccountRecords",response.getReturnValue());
            }
        });
        component.set("v.lstofColumns",[{label:'Account Name',fieldName:'Name',type:'text'},
                                        {label:'Rating Value', fieldName:'Rating', type:'text'},
                                        {label:'Industry', fieldName:'Industry', type:'text'},
                                        {label:'Annual Revenue', fieldName:'AnnualRevenue', type:'currency'},
                                        {label:'Contact Number', fieldName:'Phone', type:'Phone'},
                                        {label:'Fax Number', fieldName:'Fax', type:'Phone'},
                                        {label:'Customer Priority', fieldName:'CustomerPriority__c', type:'text'},
                                        {label:'Active Status', fieldName:'Active__c', type:'text'}
                                       ]);
        $A.enqueueAction(apexrecordsData);
    }
    
})