trigger ContactContextTrigger on Contact (before insert) 
{
  if(trigger.isinsert && trigger.isbefore)
  {
      for(contact con: trigger.new)
      {
          if(con.AccountId==null || con.AccountId=='')
          {
              con.AccountId.AddError('Please map the contact to account');
          }
      }
  }
}