public class HiringManagerQueueable implements system.Queueable

{
    public void Execute(system.QueueableContext QC)
    {
        Hiring_Manager__c hr = new Hiring_Manager__c();
        hr.name='ParentHrRecord';
        hr.ContactNumber__c='97897805647';
        hr.Email_Address__c='ParentHrRecord@gmail.com';
        hr.Location__c='Banglore';
        hr.Designation__c='HRManager';
        
        insert hr;
        
        if(hr.id!=null)
        {
           id hrid=system.enqueueJob(new PositionQueueable(hr)); 
            
            AsyncApexjob hrstatus=[select id,status,totaljobitems,jobitemsprocessed,numberOfErrors,createdby.email from
                               AsyncApexjob where id=:hrid];
        }
    }

}