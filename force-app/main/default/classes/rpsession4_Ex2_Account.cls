public class rpsession4_Ex2_Account {
    @AuraEnabled(cacheable=true)
    public static List<Account> account_rpsession4_Ex2_Account() {

        List<Account> lstaccount=[select id,Name,phone,fax,Industry from Account limit 5];
        return lstaccount;
    }
}