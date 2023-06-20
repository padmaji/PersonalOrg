public class PC_GetSegment {

    @AuraEnabled(cacheable=true)
    public static List<Segment__c> getALLSegmentData()
    {
        List<Segment__c> mcs = [select Name,Metric__c from Segment__c];
        System.debug('lst mcs>>'+mcs);
        return mcs;
    }
     @AuraEnabled(cacheable=true)
    public static List<PC_Currency__mdt> getALLcurrencyData()
    {
        List<PC_Currency__mdt> mcurrency= [select label from PC_Currency__mdt];
        System.debug('lst mcs>>'+mcurrency);
        return mcurrency;
    }
     @AuraEnabled(cacheable=true)
    public static List<Plexo__mdt> getALLPlexos()
    {
        List<Plexo__mdt> mcurrency= [select label from Plexo__mdt];
        System.debug('lst mcs>>'+mcurrency);
        return mcurrency;
    }
 @AuraEnabled(cacheable=true)
    public static List<Segment_Size_Details__c> getallSegmentSizeDetailsc(string segmentid)
    {
        System.debug('segmentid>>>'+segmentid);
        List<Segment_Size_Details__c> segmentsizedetails=[select Segment__c,Size__c,Size_Value__c from Segment_Size_Details__c where Segment__c=:segmentid order by Size_Value__c asc];

        return segmentsizedetails;
    }


}