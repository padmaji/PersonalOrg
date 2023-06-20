@istest()
public class DMLHelperTest 
{
    public testmethod static void UpdateRecordsTest()
    {
        List<Hiring_Manager__C> lstHR=new List<Hiring_Manager__C>();
        List<Position__C> lstpos=new List<Position__C>();
        for(integer counter=1;counter<=20;counter++)
        {
            Hiring_Manager__c HM = new Hiring_Manager__c();
            HM.ContactNumber__c='8902345678';
            HM.Designation__c='HR Executive';
            HM.Email_Address__c='HR_C'+counter+'@gmail.com';
            HM.Name='Test'+counter;
            HM.Location__c='Bangalore';
            
            lstHR.Add(HM);
        }
        if(!lstHR.IsEmpty())
        {
            Insert lstHR;
        }
        
        
        //for(Hiring_Manager__c MH:lstHR)
        for(Integer secCounter=0;secCounter<lstHR.Size();secCounter++)
        {
            //system.debug('HiringManager id is :'+lstHR.Get(secCounter).Id);
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
        DMLHelper.UpdateRecords('Test');
    }
    public testmethod static void RemoveRecords()
    {
        List<Hiring_Manager__C> lstHR=new List<Hiring_Manager__C>();
        
        for(integer counter=1;counter<=20;counter++)
        {
            Hiring_Manager__c HM = new Hiring_Manager__c();
            HM.ContactNumber__c='8902345678';
            HM.Designation__c='HR Executive';
            HM.Email_Address__c='HR_C'+counter+'@gmail.com';
            HM.Name='Test'+counter;
            HM.Location__c='Bangalore';
            
            lstHR.Add(HM);
        }
        if(!lstHR.IsEmpty())
        {
            Insert lstHR;
        }
        DmlHelper.RemoveRecords('Test');
    }
    public testmethod static void MergerDuplicateAccountRecordsTest()
    {
        List<Account> lstacc= new List<Account>();
        for(integer i=1;i<=20;i++)
        {
            Account acc= new Account();
            acc.Name = 'Reddy Labs In.- '+ i;
            acc.Rating = 'Hot';
            acc.Industry = 'Chemicals';
            acc.AnnualRevenue = 250000000;
            acc.Phone = '9900446677';
            acc.Fax = '7788998888';
            acc.Type = 'Customer - Direct';
            acc.Ownership = 'Public';
            acc.Website = 'www.reddylabs.com';
            acc.AccountNumber = 'C700900';
            acc.CustomerPriority__c = 'High';
            acc.Active__c = 'Yes';
            acc.BillingStreet = '#41, Software Units Layout, Madhapur';
            acc.BillingCity = 'Hyderabad';
            acc.BillingState = 'Telangana';
            acc.BillingCountry = 'India';
            acc.BillingPostalCode = '500031';
            
            lstacc.Add(acc);
        }
        
        if(! lstacc.isEmpty())
            Insert lstacc;
        
        DMLHelper.MergerDuplicateAccountRecords('Reddy');
    }
    
    public testmethod static void CreateLeadRecordUsingDataClassTest()
    {
        List<Lead> llead=new List<Lead>();
        for(integer counter=1;counter<5;counter++)
        {
            Lead ld = new Lead();
            if(counter!=1)
            {
                ld.LastName='Marketer'+counter;
                
            }
            ld.FirstName='Myntra';
            ld.Title='Sales Marketing';
            ld.Rating='Hot';
            ld.Industry='Manufacturing';
            ld.AnnualRevenue=1200000;
            ld.Status='Open-NotContacted';
            ld.Phone='7856430989';
            
            ld.Fax='7856430989';
            ld.Email=ld.FirstName+ld.LastName+'_'+counter+'@gmail.com';
            ld.City='Hyderabad';
            ld.LeadSource='Phone';
            ld.Country='India';
            if(counter!=3)
            {
                ld.Company='Myntra';
            }
            llead.Add(ld); 
            
        }
        DMLHelper.CreateLeadRecordUsingDataClass();
    }
    
}