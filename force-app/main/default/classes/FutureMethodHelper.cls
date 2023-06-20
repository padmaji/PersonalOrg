public class FutureMethodHelper 
{
    public static void dodmloperations()
    {
        user userDeactivate=[select id,name,firstname,lastname,username,isActive from user where username='usercustomer1@cis.com' and isActive=true];
        if(userDeactivate.id!=null)
        {
            userDeactivate.IsActive=false;
        }
        
        update userDeactivate;
        InsertLeadRecord();
            
    }
      @future()
    public static void InsertLeadRecord()
    {
        Lead ld=new Lead();
        ld.FirstName='Hai';
        ld.LastName='Engineer';
        ld.Company='Hello';
        ld.Status='Working-Contacted';
        ld.Title='salesManager';
        ld.Rating='Hot';
        ld.Industry='finance';
        ld.AnnualRevenue=309090;
        ld.Phone='9080989089';
        ld.Fax='9080989089';
        ld.Email='Hai@gmail.com';
        ld.city='Hyderabad';
        ld.state='Telanaga';
        ld.Country='India';
        
        insert ld;
    }

}