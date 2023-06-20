trigger RecruiterTrigger on Hiring_Manager__c (After insert,After update) 
{
if(Trigger.isAfter && Trigger.isInsert)
    {
        List<Recruiter__c> lstrecrecords=new List<Recruiter__c>();
     for( Hiring_Manager__c hrrecords:Trigger.New)
     {
         Recruiter__c recrecords=new Recruiter__c();
      recrecords.Name= hrrecords.Name;
         recrecords.Designation__c=hrrecords.Designation__c;
         recrecords.Email_Address__c=hrrecords.Email_Address__c;
         recrecords.ContactNumber__c=hrrecords.ContactNumber__c;
         recrecords.Location__c=hrrecords.Location__c;
         recrecords.Hiring_Manager__c=hrrecords.Id;
         lstrecrecords.add(recrecords);
     }
        if(!lstrecrecords.isEmpty())
        {
            insert lstrecrecords;
        }
    }
    if(Trigger.isAfter && Trigger.isUpdate)
    {
        List<id> updatingrecordsid=new list<id>();
        for(Hiring_Manager__c updatehr: Trigger.new)
        {
            if((Trigger.oldmap.get(updatehr.id).name!=updatehr.Name) || (Trigger.oldmap.get(updatehr.id).Email_Address__c!=updatehr.Email_Address__c) ||
               (Trigger.oldmap.get(updatehr.id).Designation__c!=updatehr.Designation__c) || (Trigger.oldmap.get(updatehr.id).Location__c!=updatehr.Location__c ))
            {
               updatingrecordsid.add(updatehr.id); 
            }
        }
        if(!updatingrecordsid.isEmpty())
        {
            List<Recruiter__c> recrecordsforupdating =[select id,name,Designation__c,Email_Address__c,Hiring_Manager__c,Location__c from 
                                                       Recruiter__c where Hiring_Manager__c in : updatingrecordsid];
            if(!recrecordsforupdating.isEmpty())
            {
                List<Recruiter__c> lstrecruiter =new List<Recruiter__c>();
                for( Recruiter__c rec: recrecordsforupdating)
                {
                    Hiring_Manager__c hr= trigger.newmap.get(rec.Hiring_Manager__c);
                    
                    rec.ContactNumber__c=hr.ContactNumber__c;
                    rec.Designation__c=hr.Designation__c;
                    rec.Email_Address__c=hr.Email_Address__c;
                    rec.Location__c=hr.Location__c;
                    rec.Name=hr.Name;
                    
                    lstrecruiter.Add(rec);
                    
                }
                 if(!lstrecruiter.isEmpty())
            {
                update lstrecruiter;
            }
            }
           
            
        }
            
    }
}