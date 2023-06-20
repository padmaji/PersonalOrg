public class DMLHelper {
    
    Public static void RemoveRecords(string startingname)
    {
        startingname +='%';
        List<Hiring_Manager__C> lhr=[select id,Name from Hiring_Manager__C where name like :startingname limit 30 ];
        
        if(!lhr.isEmpty())
        {
            delete lhr;
        }
    }
    public static void RestoreLead(string statrting)
    {
        statrting +='%';
        List<Hiring_Manager__C> lhr=[select id,name from Hiring_Manager__C where name like:statrting and isdeleted=true ALL Rows];
       if(!lhr.isEmpty())
       {
           undelete lhr;
       }
    }
    
    public static void UpdateRecords(string HmName)
        
    {
        HmName+='%';
        Map<id,Hiring_Manager__C> mhr=new Map<id,Hiring_Manager__C>(
            [select id from Hiring_Manager__c where name like: HmName  order by id asc]);
       
        List<Position__C> lhr=[select id,
                               Name,MinimumPay__c,MaximumSalary__c,HiringManager__c
                               from Position__C  where  HiringManager__c in : mhr.keySet()];
                              
        for(position__C pos :lhr)
        {
            system.debug(pos);
        }
        if(!lhr.isEmpty())
        {
            for(Position__c pos:lhr)
            {
                pos.MinimumPay__c =450000;
                
            }
            update lhr;
        }
        for(position__C pos :lhr)
        {
            system.debug('After update'+pos);
        }
    }
    public static void DeactivateUSer(string userName)
    {
        if(userName!=''&&userName!=null)
        {
            user Deactivate=[select id,firstName,LastName,username from user where username=:userName and isActive=false];
            if(Deactivate.id!=null)
            {
                Deactivate.IsActive=true;
            }
            update Deactivate;
        }
    }
    public static void TransferAccounRelatedRecords(string startingchars,string uname)
    {
        if(startingchars!=null&&startingchars!=''&&uname!=''&&uname!=null)
        {
        startingchars+='%';
        List<Account> lacc=[select id,name,rating,industry,annualRevenue,OwnerId from Account where name like : startingchars];
             
            if(!lacc.isEmpty())
            {
                user userToTransfer=[select id,firstName,lastName,userName,isActive from user where userName=:uname and isActive=true];
                if(userToTransfer!=null)
                {
                    for(Account acc:lacc)
                    {
                        acc.ownerId=userToTransfer.Id;
                    }
                    update lacc;
                }
            }
        }
    }
    public static void SyncAccountToContactRecords(string AccRecName)
    {
        if(AccRecName!=''&&AccRecName!=null)
        {
            List<Account> lacc=[select id,Name,rating,industry,phone,fax,billingStreet,billingCity,billingPostalCode,billingCountry,billingState,
                               (select id,firstName,LastName,phone,fax,MailingStreet,MailingCity,MailingState,MailingPostalCode,MailingCountry from contacts)
                               from Account where Name=:AccRecName];
            
           if(!lacc.isEmpty())
           {
               for(Account acc:lacc)
               {
                   if(!acc.contacts.isEmpty())
                   {
                       List<contact> lcon=new List<contact>();
                      for(contact con:acc.contacts)
                      {
                          con.phone=acc.phone;
                          con.fax=acc.Fax;
                          con.MailingStreet=acc.BillingStreet;
                          con.MailingState=acc.BillingState;
                          con.MailingPostalCode=acc.BillingPostalCode;
                          con.MailingCountry=acc.BillingCountry;
                          lcon.add(con);
                      }
                       if(!lcon.isEmpty())
                       {
                           update lcon;
                       }
                       
                   }
               }
           }
        }
    }
   
public static void UpsertCaseRecords()
{
    List<Case> lcase=[select id,casenumber,status,priority,origin,reason from case where status='New'];
    List<case> casesToUpsert =new List<case>(); 
    if(!lcase.isEmpty())
    {
        
        for(case cs :lcase)
        {
            cs.priority='High';
            casesToUpsert.add(cs);
        }
        
    }
    case NewCase=new case();
    NewCase.Status='working';
    NewCase.Priority='High';
    NewCase.Origin='Web';
    NewCase.Type='Mechnical';
    NewCase.Reason='Performance';
    NewCase.Subject='My wifi router is nt working propery';
    NewCase.Description='My wifi router is always'+'rebooting so it is caausing issue';
    casesToUpsert.add(NewCase);
    if(!casesToUpsert.isEmpty())
    {
        upsert casesToUpsert;
    }
    system.debug('Get DMl statements '+system.Limits.getDmlStatements());
    system.debug('Get DML rows'+system.Limits.getDmlRows());
}
    public static void MergerDuplicateAccountRecords(string AccountName)
    {
        if(AccountName!=null&&AccountName!='')
        {
        AccountName +='%';
       Account sourceAccount=[select id,Name,rating,industry,phone,fax
                               from Account where Name like:AccountName order by id asc limit 1];
            if(sourceAccount.id!=null)
            {
        
      Account targetAccount=[select id,Name,rating,industry,phone,fax
                             from Account where Name like :AccountName order by id asc limit 1  offset 1];
        
        
            Merge targetAccount  sourceAccount;
            }
            
        }
        
    }
    public static void MergeDuplicateAccountRecordswithList(string TargetAccountName,string SourceAccountName )
    {
        if(TargetAccountName!=''&&TargetAccountName!=null)
        {
        Account TargetAccountRecords=[select id,Name,rating,industry,phone,fax
                               from Account where Name=:TargetAccountName order by id asc limit 1];
            if(TargetAccountRecords.id!=null)
            {
            if(SourceAccountName!=''&&SourceAccountName!=null)
            {
                SourceAccountName +='%';
            List<Account> lsourceAccountRecords=[select id,Name,rating,industry,phone,fax
                             from Account where Name like : SourceAccountName order by id asc limit 2];
                
                if(!lsourceAccountRecords.isEmpty())
                {
                  merge  TargetAccountRecords  lsourceAccountRecords;
                }
            }
                }
        }
    }
    public static void CreateLeadRecordUsingDataClass()
    {
        List<Lead> llead=new List<Lead>();
        for(integer counter=1;counter<5;counter++)
        {
            Lead ld = new Lead();
            if(counter!=1)
            {
                ld.LastName='Marketer'+counter;
           
            }
             ld.FirstName='Myntra';
            ld.Title='Sales Marketing';
            ld.Rating='Hot';
            ld.Industry='Manufacturing';
            ld.AnnualRevenue=1200000;
            ld.Status='Open-NotContacted';
            ld.Phone='7856430989';
            
            ld.Fax='7856430989';
            ld.Email=ld.FirstName+ld.LastName+'_'+counter+'@gmail.com';
            ld.City='Hyderabad';
            ld.LeadSource='Phone';
            ld.Country='India';
            if(counter!=3)
            {
                ld.Company='Myntra';
            }
               llead.Add(ld); 
                
         }
        if(!llead.isEmpty())
        {
            Database.SaveResult[] SavedRecords= Database.insert(llead,false);
            
            for(Database.SaveResult DBSaved:SavedRecords)
            {
                if(DBSaved.isSuccess())
                {
                    system.debug('The system record id is '+DBSaved.getId());
                }
                if(!DBSaved.isSuccess())
                {
                    Database.Error[] errors=DBSaved.getErrors();
                    for(Database.Error errorrecords:errors)
                    {
                        system.debug('error message is'+errorrecords.getMessage());
                        system.debug('Status code is '+errorrecords.getStatusCode());
                        system.debug('Affected Fields are' +errorrecords.getFields());
                    }
                }
                system.debug('-------------------------------------------------------');
            }
        }
        
        
    }
    public static void UpdateHRRecordsUsingDataclass(string ReqName)
    {
        ReqName +='%';
        List<Hiring_Manager__C> lstHRRecords=[select id,ContactNumber__c,Designation__c,Email_Address__c,Name,Location__c from Hiring_Manager__c 
                                      where Name like:ReqName order by id asc];
       
        if(!lstHRRecords.isEmpty())
        {
            String subnname;
             integer counter=0;
         for(Hiring_Manager__C hm:lstHRRecords) 
         {
          counter++;
             if(counter>=50)
             {
                 hm.Location__c='Hyderabad';
                 hm.Designation__c='ReceuitmentSpecialist';
             }
         }
             
             Database.SaveResult[] DBSave=  Database.update(lstHRRecords,false);
             for(Database.SaveResult result:DBSave)
             {
              if(result.isSuccess())
              {
                  system.debug('updated id record ids are'+ result.id);
                  system.debug('Checking getid updated record ins '+result.getId());
              }
                 else
                 {
                    Database.Error[] errors= result.getErrors();
                 for(Database.Error er:errors)
                 {
                     system.debug('Error message '+ er.getMessage());
                     system.debug('Error Status code  is'+er.getStatusCode());
                     system.debug('Affected get fields are '+er.getFields());
                     system.debug('Affected  field fields are '+ er.fields);
                     
                 }
                 }
                 system.debug('----------------------------------------------------');
             }
         
        }
        
    }
    public static void deletePositionRecordsUsingDatabse(string ReqName)
    {
        if(ReqName!=null&&ReqName!='')
        {
            ReqName +='%';
        List<Position__C> lpos=[select id,Name,HiringManager__c from Position__C  where Name like: ReqName and HiringManager__c=''];
            if(!lpos.isEmpty())
            {
               Database.DeleteResult[] deleteResult=Database.delete(lpos,false);
                for(Database.DeleteResult de:deleteResult)
                {
                    if(de.isSuccess())
                    {
                        system.debug('Deleted record id is'+de.id);
                    }
                    else
                    {
                         Database.Error[] error= de.getErrors();
                        for( Database.Error errorresult:error)
                        {
                            system.debug('Message of the error is'+errorresult.getMessage());
                            system.debug('Error status code is'+errorresult.getStatusCode());
                            system.debug('Affected fields are '+ errorresult.getStatusCode());
                        }
                            
                    }
                }
               
            }
        }
        
    }
    public static void undeletePositionRecordsUsingDatabse(string ReqName)
    {
        if(ReqName!=null&&ReqName!='')
        {
            ReqName +='%';
            List<position__C> lpos=[select id,name from position__C where name like:ReqName and isDeleted=true ALL ROWS];
            if(!lpos.isEmpty())
            {
             
               Database.UndeleteResult[] undelRes= Database.undelete(lpos, true);
                for(Database.UndeleteResult de:undelRes)
                {
                    if(de.isSuccess())
                    {
                        system.debug('Deleted record id is'+de.id);
                    }
                    else
                    {
                         Database.Error[] error= de.getErrors();
                        for( Database.Error errorresult:error)
                        {
                            system.debug('Message of the error is'+errorresult.getMessage());
                            system.debug('Error status code is'+errorresult.getStatusCode());
                            system.debug('Affected fields are '+ errorresult.getStatusCode());
                        }
                            
                    }
                }
               
            }
        
            }
    }
}