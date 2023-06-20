public class ShowAllAccountsController 
{
public List<Account> lstaccounts {get;set;}

public void AllAccounts()
{
lstaccounts=[Select id, name, rating, industry, annualrevenue, type, ownership,
                                    phone, fax, customerpriority__c, active__C
                                            from Account
                                                    Order by name];
                                                    
}
}