trigger LeadTrigger on Lead (before insert) 
{
if(Trigger.isInsert &&Trigger.isBefore)
{
    for(Lead ld:trigger.new)
    {
        if(ld.fax==''||ld.fax==null)
        {
            ld.fax.AddError('please eneter the fax number');
            
        }
        else if(ld.phone==''||ld.phone==null)
        {
            ld.phone.AddError('please enter the phone number');
        }
        else if(ld.email==''||ld.phone==null)
        {
            ld.email.AddError('please enter the email id');
        }
    }
}
}