public with sharing class rp_session6_ex_3 {

    @AuraEnabled(cacheable=true)
    public static List<contact> getcontacts(string st)
    {
        List<contact> lstcontact=[select id,firstName,LastName,Email from contact where FirstName like :st];
        system.debug('lstcontcat is'+lstcontact);
return lstcontact;
    }
}