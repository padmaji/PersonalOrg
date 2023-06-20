trigger AccTrigger on Account (after insert) 
{
    
for(account acc:trigger.new)
{
    system.debug(acc.id);
}
  /*for(account acc:trigger.new)
  {
      if(acc.Industry=='Agriculture')
      {
       system.debug(acc.AnnualRevenue);
          acc.AnnualRevenue=10000;
      system.debug(acc.AnnualRevenue);

         
      }
      else if(acc.Industry=='Education')
      {
          acc.AnnualRevenue=20000;
      }
      
     
  }	
    
    for(account acc:trigger.new)
    {
        contact con=new contact();
        con.AccountId=acc.id;
    }
    */
}