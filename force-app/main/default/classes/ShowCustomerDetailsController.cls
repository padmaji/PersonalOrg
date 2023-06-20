public class ShowCustomerDetailsController 
{
Public Integer customerCode{get;set;}
Public String customerName{get;set;}
Public String contactNumber{get;set;}
Public String emailAddress{get;set;}
Public String contactAddress{get;set;}
Public Decimal balanceAmount{get;set;}
Public Date birthDate{get;set;}
Public Boolean isActive{get;set;}
public  void ShowValues()
{
customerCode = 4590023;
    customerName = 'Reddy Labs Inc.';
    contactNumber = '040-77887766';
    emailAddress = 'ram.kumar@reddylabs.com';
    contactAddress = '#34, Software Units Layout, Madhapur, Hyderabad - 81';
    isActive = true;
    birthDate = Date.NewInstance(1990, 02,12);
    balanceAmount = 450000000;
}
}