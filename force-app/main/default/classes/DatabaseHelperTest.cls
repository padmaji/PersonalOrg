@isTest()
private class DatabaseHelperTest 
{
    public testmethod static void DHelper()
    {
        DatabaseHelper.GetAccountCountRecords('Account');
        
        InsertCase();
        DatabaseHelper.GetCaseRecordsByPriority('High');
        
        DatabaseHelper.GetAccountBySearchText('Data');
    }
    
    public static void InsertCase()
    {
        List<Case> caseRecords = new List<Case>();
        
        for(Integer counter = 1; counter <= 20; counter++)
        {
            Case cs = new Case();
            
            cs.Status = 'Working';
            if(counter <= 20)
                cs.Priority = 'High';
            else
                cs.Priority = 'Medium';
            
            cs.Origin = 'Web';
            cs.Type = 'Mechanical';
            cs.Reason = 'Performance';
            cs.Subject = 'My Wifi Router is Not Working properly.';
            cs.Description = 'Dear Customer Support, My Newly Purchased Wifi Router '+
                'is keep on rebooting. Please have a look into the issue. Thanks.';
            
            caseRecords.Add(cs);
        }
        
        if(! caseRecords.isEmpty())
        {
            Insert caseRecords;
        }
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
    }
}