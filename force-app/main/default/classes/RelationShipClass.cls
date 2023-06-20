public class RelationShipClass 
{
	public static void ParenttochildStandard(string pname)
    {
       List<Account> lstaccount=[select id,name,rating,industry,annualrevenue,phone,fax,Active__c,
                                (select id,firstname,lastname,email,title,phone,fax from contacts ),
                                (select id,name,closedate,stageName from opportunities),
                                (select id,status,priority,casenumber,origin,reason,subject from cases) from Account where name=:pname]; 
        
        
        if(!lstaccount.isempty())
        {
            for(Account acc:lstaccount)
            {
                system.debug(acc.name);
                system.debug('-----------------------------------');
                for(Contact con:acc.contacts)
                {
                    system.debug(con.Name);
                    system.debug('----------------------');
                    for(opportunity opp:acc.opportunities)
                    {
                         system.debug(opp.Name);
                    system.debug('----------------------');

for(case cs:acc.cases)
{
    system.debug(cs.id);
    system.debug('-----------------------');
}
    }
                }
            }
        }
           
    }
    
    
    public static void Parenttochildcustom(string pname)
    {
        List<Hiring_Manager__C> lstHr=[select id,name,ContactNumber__c,Designation__c,Email_Address__c,
            (select id,PositionStatus__c,Position_Description__c,MinimumPay__c,MileStoneDate__c from positions__r) from 
            Hiring_Manager__C where name=:pname];
        if(!lstHr.isEmpty())
        {
            for(Hiring_Manager__C hr:lsthr)
            {
                system.debug(hr.name);
                system.debug('-----------------');
                for(Position__C pos:hr.positions__r)
                {
                    system.debug(pos.name);
                    system.debug('-----------------------');
                }
            }
        }
    }
        
}