public with sharing class session6_Ex_1_Apex {
    
    @AuraEnabled(cacheable=true)
    public static List<contact> getcontacts(string searchkey)
    {
        List<contact> lstcon=(List<contact>)[Find :searchkey Returning Contact(FirstName,LastName,Phone,Email)][0];

        return lstcon;
    }
}