public class HiringManagerUtility 
{

    public static void AddHiringManager(string contactnumber,string Designation,string Email,string Name,string Location)
    {
       Hiring_Manager__c HR = new Hiring_Manager__c();
HR.ContactNumber__c=contactnumber;
HR.Designation__c=Designation;
HR.Email_Address__c=Email;
HR.Name=Name;
HR.Location__c=Location;
        
Insert HR;
 if(HR.id!=null)
 {
     system.debug('HiringManager id is :'+HR.id);    
 }
}
}