@RestResource(Urlmapping='/ServiceAccounts/*')
Global class AccountRecordsService 
{
    @Httpget()
	Global static List<Account> GetAllAccounts()
    {
        List<Account> lstAccounts = [Select id, name, rating, annualrevenue, phone, fax,
                                    				type, ownership, customerpriority__C, active__c
                                    						from Account
                                    							Order by name];
        
        return lstAccounts;
    }
}