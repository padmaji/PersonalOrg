trigger CaseHandlerTrigger on Case (before insert,before update ) 
{
    if(trigger.isbefore && (trigger.isinsert || trigger.isupdate))
    {
        set<id> sid = new set<id>();
        for(case cs:trigger.new)
        {
            sid.Add(cs.Accountid);
        }
        
        sid.remove(null);
        
        set<id> Casesmorethanten = new map<id,AggregateResult>([select Accountid id from case where Accountid in :sid
                                                               and status!='closed'  group by Accountid having count(Accountid)>=2]).keyset();
        
        for(case cs:trigger.new)
        {
            if(Casesmorethanten.contains(cs.AccountId))
            {
                cs.AddError('Account id can not have morethan 10 open  cases');
            }
        }
    }

}