public class ApexSharing 
{
    @InvocableMethod(Label='sharing' Description='This Method is used to Share Account Records to Required Users.')
    public static void sharingRecords(List<Account> lstaccount)
    {
        if(!lstaccount.isEmpty())
        {
            List<AccountShare> lstaccshare=new List<AccountShare>(); 
            for(Account acc:lstaccount)
            {
                if(acc.Rating =='Hot' && acc.Active__c =='Yes' && acc.User__c!=null) //acc.Share_To__c != Null)
                {
               AccountShare accsh = new AccountShare();
                accsh.AccountId=acc.Id;
                accsh.CaseAccessLevel= 'READ';
                accsh.OpportunityAccessLevel= 'READ';
                accsh.UserOrGroupId=acc.User__c;
                    
                if(acc.AnnualRevenue>=5000000)
                    accsh.AccountAccessLevel= 'EDIT';
                else
                    accsh.AccountAccessLevel= 'READ';
                    
                 accsh.RowCause='Manual';
                
                lstaccshare.Add(accsh);
                }
                
            }
            if(!lstaccshare.isEmpty())
        
     insert lstaccshare;
        }
        
        }
    }