@RestResource(URLMapping='/OpportunitiesServiice/*')
global  class OpportunitiesServiceHelper 
{
    @HttpGet()
 global static List<Account> GetOpportunities()
 {
     Map<string,string> input=RestContext.request.params;
     
     List<Account> lstaccount=[select id,name,Active__c,Industry,(select id,name,Amount,Description,StageName,Type from Opportunities) from Account where
                               Name=:input.get('AccNAme')];
     
     return lstaccount;
 }
}