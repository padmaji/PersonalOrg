@isTest()
private class CalCulateTotalAccountRevenueTest 
{
    
    public testmethod static void CalculateTotal()
    {
        insertAcc();
        CalCulateTotalAccountRevenue CTAR=new CalCulateTotalAccountRevenue();
        Database.executeBatch(CTAR);
    }
    public static void insertAcc()
    {
        List<Account> lstacc= new List<Account>();
        for(integer i=1;i<=20;i++)
        {
            Account acc= new Account();
            acc.Name = 'Reddy Labs Inc.- '+ i;
            acc.Rating = 'Hot';
            acc.Industry = 'Chemicals';
            acc.AnnualRevenue = 2500;
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
    }
    
}