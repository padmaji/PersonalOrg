public  with sharing class GetHiringManagerrecords {
    @AuraEnabled(cacheable=true)
    public static List<Hiring_Manager__c> gethmrecords()
    {
        system.debug('-----------------------');
       List<Hiring_Manager__c> lsthr= [select id,name,Email_Address__c from Hiring_Manager__c limit 10];
       system.debug('lst is'+lsthr);
       return lsthr;
    }
}