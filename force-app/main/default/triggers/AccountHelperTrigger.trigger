trigger AccountHelperTrigger on Account (before insert,before update,before delete) 
{
    if(trigger.isbefore && (trigger.isupdate||trigger.isinsert))
        {
            for(Account acc:trigger.new)
            {
                Switch on acc.industry
                {
                    when 'Finance'
                    {
                        acc.AnnualRevenue=68900000;
                    }
                    when 'Banking'
                    {
                        acc.AnnualRevenue=45700000;
                    }
                    when 'Insurance'
                    {
                        acc.AnnualRevenue=90000000;
                    }
                    when 'Manfacturing'
                    {
                        acc.AnnualRevenue=35000000;
                    }
                    when 'Technology'
                    {
                        acc.AnnualRevenue=54500000;
                    }
                }
            }
        
    }
    if(trigger.isbefore && trigger.isdelete)
    {
       for(Account acc:trigger.old) 
       {
           if(acc.Active__c=='yes')
           {
               acc.ADDError('You are not authorized to delete ');
           }
       }
    }

}