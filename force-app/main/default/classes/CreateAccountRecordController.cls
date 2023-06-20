public class CreateAccountRecordController 
{
Public string AccountResult {get;set;}
public void CreateAccount()
{
Account acc=new Account();

acc.Name = 'Aurobindo Labs Inc.';
            acc.Rating = 'Hot';
            acc.Industry = 'Chemicals';
            acc.AnnualRevenue = 250000000;
            acc.Phone = '9900334466';
            acc.Fax = '8899445566';
            acc.Type = 'Customer - Direct';
            acc.Ownership = 'Public';
            acc.Website = 'www.reddylabs.com';
            acc.AccountNumber = 'C700900';
           
           
            acc.BillingStreet = '#41, Software Units Layout, Madhapur';
            acc.BillingCity = 'Hyderabad';
            acc.BillingState = 'Telangana';
            acc.BillingCountry = 'India';
            acc.BillingPostalCode = '500031';
            
            insert acc;
           
            if(acc.id!=null)
            {
            AccountResult='ACcountRecord Inserted Successfully'+acc.id;
            }
}
}