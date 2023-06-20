@RestResource(URLMapping='/putcaseService/*')
global class CasePutService {
    @HTTPPUT()
    global static string  updateCaseRecord(string cnumber,string cstatuss,string creason,string cprioirty)
    {
        case csrecord=[select id,casenumber,status,priority,reason from case where casenumber=:cnumber];
        if(csrecord.id!=null)
        {
           csrecord.Reason=creason;
            csrecord.Priority=cprioirty;
            csrecord.Status=cstatuss;
            
            return 'Case record updated successfully';
            
        }
        else
        {
            return 'Case record not found';
        }
    }

}