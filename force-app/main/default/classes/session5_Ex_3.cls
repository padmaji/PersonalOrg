public with sharing class session5_Ex_3 {
    
   @AuraEnabled(cacheable=true)
   public static List<contact> getcontacts(string searchkey)
    {
        string search ='%'+searchkey+'%';
        return [select Id,FirstName,LastName,Phone,Email from contact where FirstName like : search];
    }
}