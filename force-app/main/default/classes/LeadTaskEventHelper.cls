public class LeadTaskEventHelper 
{
    public static void CreateLeadAndRelatedRecords()
    {
        Lead ldRecord =new Lead();
        ldRecord.LastName='Second';
        ldRecord.Street='Yerramsetti Vari Palem';
        ldRecord.City='P.Gannavaram';
        ldRecord.Country='India';
        ldRecord.PostalCode='533240';
        ldRecord.AnnualRevenue=2090980;
        ldRecord.Email='Second@gmail.com';
        ldRecord.Fax='8989099098';
        ldRecord.Phone='8989099098';
        ldRecord.Industry='chemicals';
        ldRecord.LeadSource='Web';
        ldRecord.Status='Open-NotConnected';
        ldRecord.Rating='Hot';
        ldRecord.Company='TCS';
        
        Insert ldRecord;
        
        if(ldRecord.Id!=null)
        {
            system.debug('Lead record is'+ldRecord.Id);
            Task Ts = new Task();
            //Ts.Email='Tri@gmail.com';
            //Ts.Phone='8989099098';
            Ts.Status='Not Started';
            Ts.Priority='Normal';
            Ts.Subject='Issue while generating the Leadid';
            
            Ts.WhoId=ldRecord.Id;
            
            Insert Ts;
            system.debug('Lead record is'+Ts.Id);
            
            
            Event Ev=  new Event();
            Ev.IsAllDayEvent=false;
            Ev.Description='New Event is raised.Please check';
            //Ev.Email='Tri@gmail.com';
            Ev.Location='P.Gannavaram';
            Ev.Subject='New Event is raised';
            Ev.StartDateTime=system.today();
            Ev.EndDateTime=system.today().AddDays(7);
            
            Ev.WhoId=ldRecord.Id;
            
            Insert Ev;
            system.debug('Lead record is'+Ev.Id);
        }
        
        
    }
  
}