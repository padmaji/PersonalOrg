public class RelatedRecordsHelper 
{
public static void GetAccountRelatedRecords(string AccoundRecordName)
	{
     	
        if(AccoundRecordName!=''&&AccoundRecordName!=null)
            {
              List<Account> laccount=[select id,Name,rating,industry,annualrevenue,phone,Active__c,
                                     (select id,FirstName,LastName,Email,Phone,Title,Fax from Contacts),
                                     (select id,Name,Amount,CloseDate,StageName from Opportunities),
                                     (select id,CaseNumber,Origin,Reason,Type,Status,Priority from Cases)
                                     from Account where name=:AccoundRecordName];  
                
                if(!laccount.isEmpty())
                {
                    System.debug('Size of the record is:'+laccount.size());
                    
                    for(Account acc:laccount)
                    {
                        system.debug('Account id is:'+acc.Id);
                        system.debug('Account Name is:'+acc.Name);
                        system.debug('Account rating is:'+acc.Rating);
                        system.debug('Account Industry is'+ acc.Industry);
                        system.debug('Account AnnualRevenue is '+acc.AnnualRevenue);
                        system.debug('Account phone is:'+acc.Phone);
                        system.debug('Account status  is:'+acc.Active__c);
                        
                        system.debug('----------------------------------------------------------');
                        
                        if(!acc.Contacts.isEmpty())
                        {
                            system.debug('Size of the Account Record'+ acc.Contacts.size());
                            
                            for(contact con : acc.Contacts)
                            {
                                system.debug(con);
                            }
                        }
                        if(!acc.Opportunities.isEmpty())
                        {
                            system.debug('Size of the opportunity record is'+ acc.opportunities.size());
                            for(opportunity opp:acc.opportunities)
                            {
                                system.debug(opp);
                            }
                        }
                       if(!acc.cases.isEmpty())
                       {
                           system.debug('size of the case object is'+ acc.cases.size());
                           
                           for(case cs:acc.cases)
                           {
                               system.debug(cs);
                           }
                       }
                    }
                }
            }
	}
    
    Public static void GetHRRelatedReccords(string HRRecordEmail)
    {
        if(HRRecordEmail!=null&&HRRecordEmail!='')
        {
            List<Hiring_Manager__C> lHr=[select id,Name,ContactNumber__c,Email_Address__c,Location__c, 
                                        (select id,Name,PositionStatus__c,Number_of_Vacancies__c,Location__c from Positions__r)
                                        
                                        from Hiring_Manager__C where Email_Address__c=:HRRecordEmail];
            
            if(!lHr.isEmpty())
            {
                
                system.debug('Size of the HiringManger record is '+lHr.size());
                for(Hiring_Manager__C hr:lHr)
                {
                    
                    system.debug('HiringManager id is '+ hr.id);
                    system.debug('HriringManager Name is '+hr.Name);
                    system.debug('ContactNumber is'+hr.ContactNumber__c);
                    system.debug('EmailAddress is '+hr.Email_Address__c);
                    system.debug('Loction is '+hr.Location__c);
                    
                    system.debug('Size of the Postion record is'+hr.Positions__r.size());
                    if(!hr.positions__r.isEmpty())
                    {
                        
                        for(Position__C pos:hr.Positions__r)
                        {
                         system.debug(pos);   
                        }
                    }
                    
                }
            }
        }
    }
    
    public static void GetCaseRelatedRecords(string casenumber)
    {
        if(casenumber!=null&&casenumber!='')
        {
            List<Case> lcase=[select id,caseNumber,priority,status,Type,Subject,Origin,contact.id,contact.FirstName,contact.lastName
                             ,Contact.Email,contact.Account.id,contact.Account.Name,contact.Account.Rating,contact.Account.Industry,
                              contact.Account.Owner.Firstname,Contact.Account.Owner.LastName,Contact.Account.owner.profile.Name,
                              contact.Account.owner.profile.userlicense.Name
                              from case where casenumber=:casenumber];
            
            if(!lcase.isEmpty())
            {
                for(case cs:lcase)
                {
                    system.debug('case id is'+ cs.id);
                    system.debug('case number is '+cs.CaseNumber);
                    system.debug('case priority is '+cs.Priority);
                    system.debug('case status is'+cs.Status);
                    system.debug('case type is'+ cs.Type);
                    system.debug('subject is '+cs.Subject);
                    system.debug('origin is '+cs.Origin);
                    system.debug('Contact id is'+ cs.Contact.id);
                    system.debug('contact name is '+cs.contact.FirstName+''+cs.contact.LastName);
                    system.debug('contact email is'+cs.contact.email);
                    system.debug('Account id is '+cs.contact.Account.id);
                    system.debug('Account rating is '+cs.contact.Account.rating);
                    system.debug('Account industry is '+cs.contact.account.industry);
                    system.debug('Owner name is'+cs.Contact.Account.owner.firstName+''+cs.contact.account.owner.Lastname);
                    system.debug('ProfileName is'+cs.contact.Account.owner.profile.name);
                    system.debug('userlicense is '+cs.contact.account.owner.profile.userlicense.name);
                    
                   
                }
            }
            
        }
    }
    public static void GetCandidateRelatedRecords(string candidateName)
    {
        if(candidateName!=''&&candidateName!='')
        {
            List<Candidate__c> lcand=[select id,Name,ContactNumber__c,Email_ID__c,Location__c,Position__c,Position__r.id,Position__r.Name,
                                     Position__r.HRMailID__c,Position__r.Location__c,Position__r.PositionStatus__c,Position__r.HiringManager__c,
                                      Position__r.HiringManager__r.Id,Position__r.HiringManager__r.Name,Position__r.HiringManager__r.Email_Address__c,
                                     Position__r.HiringManager__r.Designation__C,Position__r.HiringManager__r.Location__C from Candidate__C where Name=:candidateName];
            system.debug('size of the candidate record'+lcand.size());
            
            if(!lcand.isEmpty())
            {
                
                
                for(Candidate__C c:lcand)
                {
                    system.debug('candiadte id '+c.id);
                    system.debug('candidate name is '+c.name);
                    system.debug('contact number is'+c.ContactNumber__c);
                    system.debug('EmailID is'+c.Email_ID__c);
                    system.debug('Location is '+c.Location__c);
                    system.debug('Position is '+c.Position__c);
                    system.debug('position id is '+c.Position__r.id);
                    system.debug('position name is '+c.Position__r.Name);
                    system.debug(''+c.Position__r.HiringManager__c);
                    system.debug('HiringManager Email'+c.Position__r.HiringManager__r.Email_Address__c);
                    
                }
            }
            
        }
    }
}