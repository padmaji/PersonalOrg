public class SearchAccountsController 
{
public string searchtext{get;set;}
public string cityname{get;set;}
public List<Account> lstaccount{get;set;}
public void GetDetails()
{
lstaccount =new List<Account>();
if(searchtext!='' && searchtext!=null && cityname!=''&& cityname!=null)
{
lstaccount =[Select id, name, rating, industry, annualrevenue, type, ownership, 
                                            phone, fax, customerpriority__C, active__C, BillingCity
                                                        from Account where BillingCity=:cityname and name like : searchtext+'%'];
                                                        
}
else
{
Apexpages.addmessage(new apexpages.message(apexpages.Severity.fatal,'Please Enter the Search Content.'));
}
}
}