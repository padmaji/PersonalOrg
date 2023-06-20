public class ContactsCountAccounHelper 
{
    
    public static void countofContactsforinsert(List<contact> mcontacts)
    {
        Map<id,AggregateResult> aggrecontact;
        List<Account> updatedlstaccounts=new List<Account>();
        set<id> saccid=new set<id>();
        
        if(!mcontacts.isEmpty())
        {
            for(contact con:mcontacts)
            {
                saccid.add(con.AccountId);
                system.debug(con.AccountId);
            }
            
            
        }
        if(!saccid.isEmpty())
        {
            /*aggrecontact.clear();
aggrecontact=new Map<id,AggregateResult>([select accountid,count(id) contactcount from contact where accountid in : saccid  group by accountid]);
system.debug(aggrecontact.size());
Map<id,Account> maccid=new Map<id,Account>([select id,count_of_contact_records__c from account where id in :saccid]);

for(id sa:saccid)
{
decimal d=(decimal)aggrecontact.get(sa).get('contactcount');
system.debug(d);
Account acc=maccid.get(sa);
acc.count_of_contact_records__c=(decimal)aggrecontact.get(sa).get('contactcount');
updatedlstaccounts.add(acc);
}
update updatedlstaccounts;*/
            List<account> updatedlstacc=new List<account>();
            List<account> lstaccount=[select id,count_of_contact_records__c,(select id,accountid from contacts) from account where id in :saccid];
            if(!lstaccount.isEmpty())
            {
                for(Account acc:lstaccount)
                { integer count=0;
                 for(contact con:acc.contacts)
                 {
                     
                     if(acc.id==con.AccountId)
                     {
                         count++;
                         acc.count_of_contact_records__c=count;  
                         
                     }
                 }
                 updatedlstacc.add(acc);
                }
                update updatedlstacc;
                
            }
            
        }
    }
    public static void countofContactsforupdate(List<contact> mcontacts,List<contact> oldlstcontacts)
    {
        Map<id,AggregateResult> aggrecontact;
        List<Account> updatedlstaccounts=new List<Account>();
        set<id> saccid=new set<id>();
        if(!mcontacts.isEmpty())
        {
            for(contact con:mcontacts)
            {
                saccid.add(con.AccountId);
                //system.debug(con.AccountId);
            }
            for(contact con:oldlstcontacts)
            {
                if(!saccid.contains(con.accountid))
                {
                    saccid.add(con.accountid); 
                }
                //system.debug(con.AccountId);
            }
            
        }
        if(!saccid.isEmpty())
        {
            /*aggrecontact.clear();
             aggrecontact=new Map<id,AggregateResult>([select accountid,count(id) contactcount from contact where accountid in : saccid  group by accountid]);
system.debug(aggrecontact.size());
Map<id,Account> maccid=new Map<id,Account>([select id,count_of_contact_records__c from account where id in :saccid]);

for(id sa:saccid)
{
decimal d=(decimal)aggrecontact.get(sa).get('contactcount');
system.debug(d);
Account acc=maccid.get(sa);
acc.count_of_contact_records__c=(decimal)aggrecontact.get(sa).get('contactcount');
updatedlstaccounts.add(acc);
}
update updatedlstaccounts;*/
            List<account> updatedlstacc=new List<account>();
            List<account> lstaccount=[select id,count_of_contact_records__c,(select id,accountid from contacts) from account where id in :saccid];
            if(!lstaccount.isEmpty())
            {
                for(Account acc:lstaccount)
                { integer count=0;
                 for(contact con:acc.contacts)
                 {
                     
                     if(acc.id==con.AccountId)
                     {
                         count++;
                         acc.count_of_contact_records__c=count;  
                         
                     }
                 }
                 updatedlstacc.add(acc);
                }
                update updatedlstacc;
            }
            
        }
    }
}