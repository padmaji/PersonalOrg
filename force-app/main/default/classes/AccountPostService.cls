@RestResource(URLMapping='/PostService/*')
global class AccountPostService {
    
    @HTTPpost()
    global static string PostAccountRecord(string pname,string pActive,string pphone)
    {
        Account acc=new Account();
        acc.Name=pname;
        acc.Active__c=pActive;
        acc.Phone=pphone;
        
        insert acc;
        
        if(acc.Id!=null)
        {
            return 'contact record created '+acc.Id;
        }
        else
        {
            return 'Record not cretaed';
        }
    }

}