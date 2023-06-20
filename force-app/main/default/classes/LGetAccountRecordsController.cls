public class LGetAccountRecordsController 
{
    @AuraEnabled
    public Static List<Account> GetAccountRecords()
    {
        List<Account> lstaccount=[select id, name, rating, industry, annualrevenue, 
                                     				phone, fax, customerpriority__c, active__C
                                    						from Account
                                    							Order by name];
        return lstaccount;
    }
}