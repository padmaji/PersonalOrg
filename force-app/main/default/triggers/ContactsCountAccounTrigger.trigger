trigger ContactsCountAccounTrigger on Contact (After insert,after update,after delete) 
{
    if(trigger.isAfter){
        if(trigger.isinsert)
        {
            ContactsCountAccounHelper.countofContactsforinsert(trigger.new);
        }
        if(trigger.isupdate)
        {
            ContactsCountAccounHelper.countofContactsforupdate(trigger.new,trigger.old);
        }
        if(trigger.isdelete)
        {
            ContactsCountAccounHelper.countofContactsforinsert(trigger.old);
        }
    }
    
}