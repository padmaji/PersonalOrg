@RestResource(URLMapping='/CaseManagerServices/*')
global class CaseManagerHelper 
{
    
/*global static case GetCaseManagerDetails()
{
    Map<string,string> mcaserecords=RestContext.request.params;
    
    Case caserecords=[select id,casenumber,status,type,priority,origin,reason,subject,description from case where casenumber=:mcaserecords.get('cnumber')];
    
    return caserecords;
}*/
    @HttpGet()
    global static List<case> GetALLCaseRecordOnPriority()
    {
       Map<string,string> mcasepriority=RestContext.request.params;
        List<case> lstcases=[select id,CaseNumber,Origin,Reason,Subject,type,Status,Priority,ContactMobile,ContactPhone from case where status='New' and  priority=:mcasepriority.get('p')];
        
        return lstcases;
    }
    
}