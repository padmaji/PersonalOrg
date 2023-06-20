public with sharing class soslclass {
    
    @AuraEnabled(cacheable=true)
   public static List<Account> getsoslresult(string searchk)
    {
        List<Account> lstacc=(List<Account>)[Find :searchk RETURNING Account(Name,Phone,Fax)][0];
           return lstacc;
    }
}