trigger cont on Contact (before insert) {
    
    List<id> lstaccid=new List<id>();
    if(trigger.isinsert && trigger.isbefore)
    {
        for(Contact con:trigger.new)
        {
            lstaccid.add(con.accountid);    
        }
        system.debug('list of id is '+lstaccid.size());
        if(!lstaccid.isEmpty())
        {
            Map<id,Account> mapacc=new Map<id,Account>([select id,phone from account where id in:lstaccid]);
            system.debug('size of map is '+mapacc.size());
            if(!mapacc.isEmpty())
            {
                for(contact con:trigger.new)
                {
                    if(mapacc.get(con.accountId).phone==con.phone)
                    {
                        con.AddError('Can not be added with the phone number');
                    }
                }
            }
        }
        
    }   
    
}