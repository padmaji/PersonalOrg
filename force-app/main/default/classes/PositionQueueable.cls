public class PositionQueueable implements system.Queueable
{
    Hiring_Manager__c HHR;
    public PositionQueueable(Hiring_Manager__c hr)
    {
        HHR=hr;
    }
    public void Execute(system.QueueableContext Qc)
    {
        position__C pos =new Position__C();
        
        pos.Name='MainFrame Developer';
        pos.Location__c=hhr.Location__c;
        pos.HRContactNumber__c=HHR.ContactNumber__c;
        pos.Number_of_Vacancies__c=2;
        pos.PositionStatus__c='open Approved';
        pos.MinimumPay__c=900000;
        pos.MaximumSalary__c=1200000;
        pos.OpenDate__c=system.today();
        pos.MileStoneDate__c=system.today().AddMonths(1);
        pos.Travel_Required__c=false;
        pos.PassPort_Required__c=true;
        pos.Position_Description__c='Required 3+ years of experience in mainframes development';
        pos.HiringManager__c=hhr.Id;
        
        insert pos;
        
        
        
    }
        

}