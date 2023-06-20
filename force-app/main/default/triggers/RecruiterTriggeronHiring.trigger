trigger RecruiterTriggeronHiring on Recruiter__c (After update) 
{
 if(Trigger.isAfter && Trigger.isUpdate)
 {
      Recruiter.Afterupdate(Trigger.new,Trigger.oldmap);
     /*List<id> lstid=new List<id>();
     for(Recruiter__c rec :Trigger.new)
     {
         if((trigger.oldmap.get(rec.id).name!=rec.name) || (Trigger.oldmap.get(rec.id).Email_Address__c!=rec.Email_Address__c) ||
           (trigger.oldmap.get(rec.id).ContactNumber__c!=rec.ContactNumber__c) || (trigger.oldmap.get(rec.id).Location__c!=rec.Location__c)
           || (trigger.oldmap.get(rec.id).Designation__c!=rec.Designation__c))
            
            lstid.add(rec.Hiring_Manager__c);
     }
            if(!lstid.isEmpty())
            {
                Map<Id,Hiring_Manager__c> lsthrrecords= new map<Id,Hiring_Manager__c>([select id, name,Designation__c,Email_Address__c,Location__C from Hiring_Manager__c
                                                        where id in : lstid]);
                if(!lsthrrecords.isEmpty())
                {
                    List<Hiring_Manager__c> recforupdating = new List<Hiring_Manager__c>();
                for( Recruiter__c recruiterrecords : Trigger.new)
                {
                   
                  Hiring_Manager__c hc=lsthrrecords.get(recruiterrecords.Hiring_Manager__c);
                    hc.name=recruiterrecords.name;
                    hc.Designation__c=recruiterrecords.Designation__c;
                    hc.Email_Address__c=recruiterrecords.Email_Address__c;
                    hc.Location__c=recruiterrecords.Location__c;
				recforupdating.add(hc);
                    
                    
                }
                    if(!recforupdating.isEmpty())
                    {
                        update recforupdating;
                    }
                }
                
            }*/
 }
    
}