trigger ContactTrigger on Contact (before insert,before update) 
{
if(trigger.isbefore && trigger.isinsert ||Trigger.isbefore && trigger.isupdate)
{
    for(contact con:trigger.new)
    {
       if(con.Phone==''||con.Phone==null)
       {
           con.Phone.addError('please enter the phone number');
       }
        else if(con.Email==''||con.Email==null)
        {
            con.Email.AddError('Please enter the email address');
        }
        else if(con.Title==''||con.Title==null)
        {
            con.Title.AddError('Please eneter the title');
        }
    }
    
}
    

}