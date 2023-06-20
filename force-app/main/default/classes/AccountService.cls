@RestResource(URLMapping='/GetALLAccountService/*')
global class AccountService 
{
    @HttpGet()
    global static List<Account> GetAccountDetails()
    {
        Map<string,string> minput=RestContext.request.params;
        List<Account> lstaccount=[select id,name,rating,industry,annualrevenue,phone,fax,type,CustomerPriority__C 
                                  from Account where industry=:minput.get('indname')];
        
        return lstaccount;
    }
}