public class LeadRecordHelper 
{
    public static Lead CreateLeadRecord()
    {
        
        Lead ldRecord =new Lead();
        ldRecord.FirstName='Ravi';
        ldRecord.LastName='Teja';
        ldrecord.Title='Supervisior';
        ldRecord.Rating='Hot';
        ldRecord.Industry='chemicals';
        ldRecord.AnnualRevenue=2090980;
        ldRecord.Fax='8989099098';
        ldRecord.Phone='8989099098';
        ldRecord.Company='Prestige group';
        ldRecord.Email='p.anjaneyulu123@gmail.com';
         ldRecord.Status='Open-NotConnected';
        ldrecord.Website='WWW.facebook.com';
        ldrecord.LeadSource='web';
        ldRecord.Street='SR Nagar';
        ldRecord.City='Hyderabad';
        ldRecord.Country='India';
        ldRecord.PostalCode='600223';
        
        
        
        
       if(ldRecord!=null)
       {
        Insert ldRecord;   
       }

        
        
            
        return ldRecord; 
        
    }
}
    /*public static void CreateLeadRecord()
    {
        List<lead> lstlead=new List<lead>();
        for(integer counter=1;counter<=5;counter++)
        {
            
        
        Lead ldRecord =new Lead();
            if(counter!=3)
            {
        ldRecord.FirstName='Ravi'+counter;
            }
        ldRecord.LastName='Teja';
        ldrecord.Title='Supervisior';
        ldRecord.Rating='Hot';
        ldRecord.Industry='chemicals';
        ldRecord.AnnualRevenue=2090980;
        ldRecord.Fax='8989099098';
        ldRecord.Phone='8989099098';
        ldRecord.Company='Prestige group';
        ldRecord.Email='p.anjaneyulu123@gmail.com';
         ldRecord.Status='Open-NotConnected';
        ldrecord.Website='WWW.facebook.com';
        ldrecord.LeadSource='web';
        ldRecord.Street='SR Nagar';
        ldRecord.City='Hyderabad';
        ldRecord.Country='India';
        ldRecord.PostalCode='600223';
            
            lstlead.add(ldRecord);
        }

for(lead l :lstlead)
{
    system.debug(l);
}    
    }*/