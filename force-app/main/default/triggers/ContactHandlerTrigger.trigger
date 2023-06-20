trigger ContactHandlerTrigger on Contact (before insert,before update) 
{
    
if(trigger.isbefore && (trigger.isinsert || trigger.isupdate))
{
    set<id> sid = new set<id>();
  for(contact con:trigger.new)
  {
      sid.add(con.AccountId);
  }
    sid.Remove(null);
    if(!sid.isEmpty())
    {
    
    set<Id> contactsmorethantwo = new map<Id,AggregateResult>([select Accountid Id from contact where Accountid in : sid  group by accountid
                                                                    having count(Accountid)>2]).keyset();
    contactsmorethantwo.Remove(null);
    for(contact cont:trigger.new)
    {
     if(contactsmorethantwo.contains(cont.Accountid))
     {
         cont.addError('cant create more than two contacts');
     }         
         
    }
    }
}
}