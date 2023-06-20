public class DatabaseHelper 
{
    
    public static void GetAllAccounts()
    {
        List<Account> sAccount=[select id,Name,rating,industry,annualrevenue,Active__c from Account];
        
        system.debug('Account Size is '+sAccount.size());
        if(!sAccount.isEmpty())
        {
            
            for(Account rAccount:sAccount)
            {
                system.debug('Account id is '+rAccount.id);
                system.debug('Account Name is '+rAccount.Name);
                system.debug('Account rating is '+rAccount.rating);
                system.debug('Account industry is '+rAccount.industry);
                system.debug('Account annualrevenue is '+rAccount.annualrevenue);
                system.debug('Account staus is '+rAccount.Active__c);
            }
        }
    }
    public static void GetOpportunitiesRecords()
    {
        List<Opportunity> opp=[select id,name,amount,CloseDate,StageName from Opportunity];
        system.debug('size of opportunity records '+opp.size());
        for(Opportunity lop:opp)
        {
            system.debug('Id of opportunity records '+lop.id);
            system.debug('Name of opportunity records '+lop.Name);
            system.debug('Amount of opportunity records '+lop.Amount);
            system.debug('closeDate of opportunity records '+lop.CloseDate);
            system.debug('StageName of the opprtunity record is '+lop.StageName);
            
            
        }
        system.debug('No .of records in the object are'+system.Limits.getQueryRows());
    }
    public static void GetAllHRRecords()
    {
        List<Hiring_Manager__c> Hrecords=[select id,Name,Designation__c,Email_Address__c,Location__c,ContactNumber__c from Hiring_Manager__c ];
        Map<Id,Hiring_Manager__c> mHrecords = new Map<Id,Hiring_Manager__c>();
        if(!Hrecords.isEmpty())
        {
            for(Hiring_Manager__c lHRecords:Hrecords)
            {
                mHrecords.put(lHRecords.id,lHRecords);
            }
        }
        for(Hiring_Manager__c HMR:mHrecords.values())
        {
            system.debug('Hiring_Manager record id is'+HMR.id);
            system.debug('HiringManager record value is'+HMR);
        }
        system.debug('Total records in HiringManage object'+system.Limits.getQueryRows());
        
    }
    public static void GetEmailTemplates()
    {
        List<EmailTemplate> LET=[select id,Name,FolderName,TemplateStyle,IsActive,Description,Subject from EmailTemplate ];
        if(!LET.isEmpty())
        {
            for(EmailTemplate ET:LET)
            {
                system.debug(ET);
            }
        }
        system.debug('size of the element is '+LET.size());
        
    }
    public static void GetUserRecords()
    {
        Map<id,user> Muser=new Map<id,user>([select id,IsActive,Department,Fax,MobilePhone,Name,Phone,Title,Username from User]);
        if(!Muser.IsEmpty())
        {
            for(User urecord:Muser.values())
            {
                system.debug('User ID is '+urecord.id);
                system.debug('User values are '+urecord.Name);
                system.debug('user Departent is'+urecord.Department);
            }
            system.debug('Size method array is'+Muser.size());
            system.debug('siz of system method is'+system.Limits.getQueryRows());
        }
        
        
        
    }
    public static void GetCaseRecords()
    {
        for(Case ca:[select id,Reason,ContactPhone,Description,Priority,Product__c,Status,Subject from case])
        {
            system.debug('Case record id '+ca.id);
            
            
        }
        system.debug('Size of the Case records are'+system.Limits.getQueryRows());
    }
    public static void GetAllContacts()
    {
        List<Contact> lstContacts=[select id ,firstName,LastName,title,department,phone,fax,isDeleted from contact order by firstName ALL Rows];
        for(contact con:lstContacts)
        {
            system.debug(con);
        }
    }
    public static void GetLeadRecords(Integer LimitValue,Integer OffsetValue)
    {
        List<Lead> llead=[select id,firstName,LastName,company,status,title,phone,fax from Lead order by FirstName Limit:LimitValue offset:OffsetValue];
        if(!llead.isEmpty())
        {
            for(Lead ld:llead)
            {
                system.debug(ld);
            }
        }
    }
    public static void GetAccountsByIndustry(string Industryname)
    {
        if(Industryname!=''&&Industryname!=null)
        {
            List<Account> lAccounts=[select id,name,rating,industry,AnnualRevenue,Active__C from Account where industry=:Industryname];
            if(!lAccounts.isEmpty())
            {
                for(Account Acc:lAccounts)
                {
                    system.debug(Acc);
                }
            }
        }
    }
    
    public static void GetContactsRecordsByIndustryName(string industryname)
    {
        if(industryname!=''&&industryname!=null)
        {
            Map<id,Account> mAccount=new Map<id,Account>([select id,name,rating,industry from Account where industry=:industryname]);
            List<Contact> lcontact=[select id,firstname,lastname,email,title,phone,fax,accountid from contact where accountid in :mAccount.keySet()];
            system.debug('Size of the record is '+lcontact.size());
            if(!lcontact.isEmpty())
            {
                for(contact con:lcontact)
                {
                    system.debug(con);
                }
                
            }
        }
    }
    public static void GetAccountBySearchText(string startingchars)
    {
        if(startingchars!=null&&startingchars!='')
        {
            startingchars ='%'+ startingchars;
            for(Account acc:[select id,Name,rating,industry,AnnualRevenue,Fax,Active__C from Account where name like :startingchars])
            {
                system.debug(acc);
            }
        }
        
    }
    public static void GetPositionsBySearchText(string input)
    {
        
        if(input!=''&&input!=null)
        {
            input='%'+input;
            for(Position__C pos:[select id,HRMailID__c,Location__c,Name,Number_of_Vacancies__c from Position__c where Name like:input])
            {
                system.debug(pos);
            }
        }
    }
    public static void GetCaseRecordsByPriority(string priority)
    {
        if(priority!=''&&priority!=null)
        {
            string query='select id,casenumber,status,priority,origin,reason from case';
            List<case> lcase=Database.query(query);
            if(!lcase.isEmpty())
            {
                for(case c:lcase)
                {
                    system.debug(c);
                }
            }
        }
    }
    public static void GetAccountCountRecords(string objname)
    {
        
        Integer count=[Select count() from Account];
        system.debug('No .of records are ' + count);
        
        string msg='Select count() from ' + objname;
        integer ttl=Database.countQuery(msg);
        system.debug('No .of records are ' + ttl);
        
    }
    public static void GetRecordsfromostion(date pdate)
    {
        List<position__c> lpos=[select  id,name,location__c,isDeleted,createddate from Position__C where createddate <=:pdate];
        for(Position__c pos:lpos)
        {
            system.debug(pos);
        }
    }
}