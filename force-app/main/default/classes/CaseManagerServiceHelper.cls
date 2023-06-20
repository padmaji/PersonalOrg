@RestResource(URLMapping='/CaseServices/*')
global class CaseManagerServiceHelper {
    @HttpDelete()
    global static string DeleteCaseRecords()
    {
        Map<string,string> input=RestContext.request.params;
        List<case> lstcases=new List<case>();
        
        List<Account> lstaccount=[select id,name,(select id,Accountid,casenumber from cases) from Account where Name=:input.get('AccNAme')];
        
        for(Account acc:lstaccount)
        {
            for(Case cs:acc.Cases )
            {
               
                lstcases.add(cs);
            }
        }
        
        if(!lstcases.isEmpty())
        {
            delete lstcases;
            return 'deleted';
        }
        else
        {
            return 'Not found';
        }
        
    }
        

}