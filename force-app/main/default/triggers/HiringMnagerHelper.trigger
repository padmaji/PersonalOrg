trigger HiringMnagerHelper on Hiring_Manager__c (before insert,before update) 
{
    if(trigger.isbefore && (trigger.isinsert||trigger.isupdate))
    {
        for(Hiring_Manager__c hr:trigger.new)
        {
            integer count=[select count() from Hiring_Manager__c where Email_Address__c =:hr.Email_Address__c and Name=:hr.Name
                            and ContactNumber__c=:hr.ContactNumber__c];
            if(count>0)
            {
                hr.AddError('Duplicate records found.So unable to insert Records');
            }
        }
    }

}