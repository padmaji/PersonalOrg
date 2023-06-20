public class HiringManagerHelper 
{
    public static void BulkInsertaion()
    {
        List<Hiring_Manager__c> lstHR= new List<Hiring_Manager__c>();
        
        for(integer counter=1;counter<=3;counter++)
        {
             Hiring_Manager__c HM = new Hiring_Manager__c();
                HM.ContactNumber__c='8902345678';
                HM.Designation__c='HR Executive';
                HM.Email_Address__c='HR_C'+counter+'@gmail.com';
                HM.Name='Anil'+counter;
                HM.Location__c='Bangalore';
            
            lstHR.Add(HM);
        }
        if(!lstHR.IsEmpty())
        {
           Insert lstHR;
        }
        
        List<Position__c> lstpos = new List<Position__c>();
       //for(Hiring_Manager__c MH:lstHR)
       for(Integer secCounter=0;secCounter<lstHR.Size();secCounter++)
                 {
                     system.debug('HiringManager id is :'+lstHR.Get(secCounter).Id);
                     //for(integer counter=1;counter<=1;counter++)
                     //{
                     Position__c pos = new Position__c();
     pos.HRContactNumber__c=lstHR.Get(secCounter).ContactNumber__c;
     pos.HRMailID__c=lstHR.Get(secCounter).Email_Address__c;
     pos.Location__c='Bangalore';
     pos.MaximumSalary__c=2343429;
     pos.MileStoneDate__c=system.today().AddMonths(3);
     pos.MinimumPay__c=400000;
     pos.Number_of_Vacancies__c=4;
     pos.OpenDate__c=system.today().AddDays(5);
     pos.PassPort_Required__c=true;
     pos.Position_Description__c='Required an developer with 2+ years experience on LWC,Aura components and Administration';
     pos.Name='Lead'+(secCounter+1);
     pos.PositionStatus__c='NewPosition';
     pos.Skills_Required__c='Apex,Javascript,LWC,Aura';
     pos.Travel_Required__c=false;
     
     pos.HiringManager__c=lstHR.Get(secCounter).id;
                     
                     
                  
                        lstpos.Add(pos); 
                     //}  
    }
        if(!lstpos.isEmpty())
        {
        Insert lstpos;
        }
        for(Position__c cpos:lstpos)
        {
            system.debug('Position id is :'+cpos.Id);
        }
        
                 
       
    }
}