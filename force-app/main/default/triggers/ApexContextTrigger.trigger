trigger ApexContextTrigger on Account (before insert)
{
if(trigger.isinsert && trigger.isBefore)
{
    for(Account acc:Trigger.new)
    {
        if(acc.Industry==''||acc.Industry==null)
            
        {
            acc.Industry.AddError('Please enter the industry details');
        }
        if(acc.CustomerPriority__c==''||acc.CustomerPriority__c==null)
        {
            acc.CustomerPriority__c.AddError('Enter the priority details');
        }
        if( acc.AnnualRevenue==null)
        {
            acc.AnnualRevenue.AddError('Enter the AnnualReveue details');
        }
    }
}
}