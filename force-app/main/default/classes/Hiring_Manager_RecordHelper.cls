public class Hiring_Manager_RecordHelper 
{
    public  static void CreateHiringManagerRecord()
    {
    Hiring_Manager__c HM = new Hiring_Manager__c();
HM.ContactNumber__c='8902345678';
HM.Designation__c='HR Executive';
HM.Email_Address__c='HR_C@gmail.com';
HM.Name='Prabhas';
HM.Location__c='Bangalore';
Insert HM;
 if(HM.id!=null)
 {
     system.debug('HiringManager id is :'+HM.id);
 }
    }

}