trigger HiringManagerHelperTrigger on Hiring_Manager__c (Before Delete) 

{
    if(trigger.isBefore && trigger.isDelete)
    {
        List<position__C> lstpos=[select id,HiringManager__c from position__C where HiringManager__c in : trigger.oldmap.keyset()];
        
        if(!lstpos.isEmpty())
        {
            delete lstpos;
        }
    }

}