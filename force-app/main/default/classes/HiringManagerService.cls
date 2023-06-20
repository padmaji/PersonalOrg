@RestResource(URLMapping='/HiringManagerservice/*')
global class HiringManagerService 
{
    @HttpGet()
    global static List<Hiring_Manager__C> GetALLHiringManagerRecords()
    {
        List<Hiring_Manager__C> lsthiring=[select id,name,location__C,Email_Address__c,Designation__c from Hiring_Manager__C];
        
        return lsthiring;
    }

}