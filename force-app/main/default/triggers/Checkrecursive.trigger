trigger Checkrecursive on Account (before update) 
{
    integer counter=0;
   List<account> lstacc=trigger.new;
    for(account acc:lstacc)
    {  
        counter++;
       
            
            acc.AnnualRevenue=90;
         
     system.debug('counter value is'+counter);
        update acc;
    }
        
}