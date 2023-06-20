({
	fetchAllAccounts : function(component, event, helper) {
		helper.getrecordsDataHelper (component,event,helper);
	},
    CountofselectedRecords:function(component,event,helper)
    {
        var recordcount=event.getParam('selectedRows');
        component.set("v.countpfselectedrecords",recordcount.length);
    }
    
})