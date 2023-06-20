@isTest
public class DatabaseHelp_Test
{
public testmethod static void TestDatabaseoperations()
{
    DatabaseHelper.GetAccountCountRecords('Account');
    inserbulkrecords();
     DatabaseHelper.GetAccountBySearchText('Test');
    
}
    
    public static void  inserbulkrecords()
    { 
        List<Account> lstAccounts = new List<Account>();
        for(Integer counter = 1; counter <= 20; counter++)
        {
        	Account acc = new Account();
		
                    acc.Name = 'Reddy Labs Inc.- '+ counter;
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
        
            	lstAccounts.Add(acc);
        }
        
        if(! lstAccounts.isEmpty())
            Insert lstAccounts;
    }
    
}