public class Recruiter 
{
 public static void  Afterupdate(List<Recruiter__c> lstrecruiter,Map<Id,Recruiter__c> mapoldrecords)
 {
     if(!lstrecruiter.isEmpty() && !mapoldrecords.isEmpty())
     {
         List<id> updatingid=new List<id>();
         for(Recruiter__c rec :lstrecruiter)
         {
             if((mapoldrecords.get(rec.id).name!=rec.name) || (mapoldrecords.get(rec.id).Email_Address__c!=rec.Email_Address__c) ||
           (mapoldrecords.get(rec.id).ContactNumber__c!=rec.ContactNumber__c) || (mapoldrecords.get(rec.id).Location__c!=rec.Location__c)
           || (mapoldrecords.get(rec.id).Designation__c!=rec.Designation__c))
             
             {
                 updatingid.add(rec.Hiring_Manager__c);
             }
         }
         Map<id,Hiring_Manager__c> mapHrRecords= new  Map<id,Hiring_Manager__c>([select id, name,Designation__c,Email_Address__c,Location__C from Hiring_Manager__c
                                                        where id in : updatingid]);
         
         if(!mapHrRecords.isEmpty())
         {
             List<Hiring_Manager__c> updatedHr=new List<Hiring_Manager__c>();
             for(Recruiter__c rec :lstrecruiter)
             {
               Hiring_Manager__c hr=  mapHrRecords.get(rec.Hiring_Manager__c);
                 
                 hr.Name=rec.Name;
                   hr.Designation__c=rec.Designation__c;
                    hr.Email_Address__c=rec.Email_Address__c;
                    hr.Location__c=rec.Location__c;
                 
                 updatedHr.Add(hr);
             }
              if(!updatedHr.isEmpty())
         {
             update updatedHr;
         }
         }
        
         
     }
 }
}