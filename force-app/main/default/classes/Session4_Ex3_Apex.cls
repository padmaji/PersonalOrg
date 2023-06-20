public with sharing class Session4_Ex3_Apex {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> myaccList()
    {
    List<Account> lstacc= [select Id,Name,Fax,Industry,Rating from Account limit 10];
    System.debug(lstacc);
    return lstacc;

    }
}