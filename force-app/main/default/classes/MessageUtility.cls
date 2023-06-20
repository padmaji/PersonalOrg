public class MessageUtility {
    
    public  static void CreateLeadRecord()
    {
      Lead lstinsertedrecords=LeadRecordHelper.CreateLeadRecord();
        system.debug('inserted record is'+lstinsertedrecords.id);
        SendNotificationEmailToLead(lstinsertedrecords);
    }
    
    public static void SendNotificationEmailToLead(Lead lead)
    {
        if(lead.id!=null)
        {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            
            string[] toAddress=new string[]{lead.Email,'peddireddypadmaji@gmail.com'};
                email.setToAddresses(toAddress);
            string[] ccAddress=new string[]{'rajeshbosarp15@gmail.com'};
                email.setCcAddresses(ccAddress);
            email.setReplyTo('sharma.pujyam@gmail.com');
            email.setSenderDisplayName('Capital info Bank solutions');
            string subject='Congratulations....!!'+ ' '+'Mr.'+lead.FirstName +''+lead.LastName+'.'+'Your Credit card Application'+
                			'has been ssubmitted successfully';
            email.setSubject(subject);
            string emailcontent='Dear'+lead.FirstName+''+lead.LastName+'<br/><br/>'+'Thanks for showing interest in our bank <br/><br/>'+
                'Your credit card application has been submitted successfully.Please find the below Lead Records<br/><br/>'+
                'Application id is........'+lead.Id+'<br/>'+
                'Application Name is .......'+lead.FirstName+''+lead.LastName+'<br/><br/>'+
                'Current EmployerName is ....'+lead.Company+'<br/>'+
                'current Role is ........'+lead.Title+'br/>'+
                'Lead Employe Rating is ......'+lead.Rating+'<br/>'+
                'Lead Industry Name is ......'+lead.Industry+'<br/>'+
                'Applicant\'s AnnualRevene is........'+lead.AnnualRevenue+'<br/>'+
                'Applicant\'s phone number is ......'+lead.Phone+'<br/>'+
                'Applicant\'s Fax number is ......'+lead.Fax+'<br/>'+
                'Applicant\'s EmailId is ......'+lead.Email+'<br/>'+
                'Applicant\'s status is ......'+lead.Status+'<br/>'+
                'Applicant\'s Website is ......'+lead.Website+'<br/>'+
                'Applicant\'s  source is  ......'+lead.LeadSource+'<br/>'+
                'Applicant\'s Address is ......'+lead.Street+','+lead.State+','+lead.City+','+lead.PostalCode+'<br/><br/>'+
				'Your application is under progress.One of our relationship managger will contact you shortly<br/><br/>'+
				'**<i>This is system generated email.Please do nnot reply to this email</i><br/><br/>'+
				'Thanks&Regards<br/>'+'Credit Card Team';
            email.setHtmlBody(emailcontent);
            
            List<Messaging.EmailFileAttachment> lstfileattachement = new List<Messaging.EmailFileAttachment>();
            
            messaging.EmailFileAttachment fileattachement=new messaging.EmailFileAttachment();
            fileattachement.setFileName(lead.FirstName+''+lead.LastName+'.pdf');
            fileattachement.setContentType('Application/pdf');
            fileattachement.body=Blob.toPdf(emailcontent);
            
          lstfileattachement.add(fileattachement);
            email.setFileAttachments(lstfileattachement);
            
         messaging.SendEmailResult[] emailresult=messaging.sendEmail(new messaging.SingleEmailMessage[]{email});
            //List<messaging.SendEmailResult> emailresult=messaging.sendEmail(new List<messaging.SingleEmailMessage>{email});
             
            
        }
    }
    public static void CreateLeadRecordsPractise(string AdminName)
    {
       string FirstName,LastName,username,Errordescription,ContentHead,stringerrorvalue,casecontactname,fieldmessage='',errorms='';
       boolean failedrecordstatus,successrecordsstatus;
        system.StatusCode  statcode;
         
        Map<string,string> lsterrror=new Map<string,string>();
        Map<string,string> lstcase=new Map<string,string>();
       List<profile> lstusername=[select id,name,(select FirstName,LastName,userName,Email from users where isActive=true)
                                   from profile where name like:AdminName+'%'];
        if(!lstusername.isEmpty())
        {
       for(profile p:lstusername)
        {
            for(user u:p.users)
            {
                FirstName=string.valueOf(u.FirstName);
                LastName=string.valueOf(u.LastName);
                username=string.valueOf(u.Email);
            }
        }
     }                  
      List<Lead> lstlead=new List<Lead>();
       
        for(integer counter=1;counter<5;counter++)
        {
            Lead ld = new Lead();
            if(counter!=2)
            {
                ld.LastName='Delivery'+counter;
          }
             ld.FirstName='Flipkart';
            ld.Title='Delivery';
            ld.Rating='Hot';
            ld.Industry='Manufacturing';
            ld.AnnualRevenue=1200000;
            ld.Status='Open-NotContacted';
            ld.Phone='8789345112';
            ld.Fax='8789345112';
            if(counter!=3)
            {
            ld.Email=ld.FirstName+ld.LastName+'_'+counter+'@gmail.com';
            }
            ld.City='Hyderabad';
            ld.LeadSource='Phone';
            ld.Country='India';
           if(counter!=3)
            {
                ld.Company='Flipkart';
            }
            lstlead.Add(ld);
            }
        string bodyContent='Dear'+FirstName+''+LastName+'<br/><br/>'+
            				'The following id are inserted succesfully<br/><br/>';
        //system.debug('The body conect is'+bodycontent);
        if(!lstlead.isEmpty())
        {
         Database.SaveResult[] savedResult= Database.insert(lstlead,false);
            //integer Counter=0;
            for(Database.SaveResult EachSavedResult:savedResult)
            {
             if(EachSavedResult.isSuccess())
                {
                bodyContent +=EachSavedResult.id+'<br/><br/>';
                    //system.debug('Enhanced for loop body content'+bodyContent);
                    successrecordsstatus=true;
                  }
               
               //SendEmailOnSuccessfulInsertion(bodyContent,FirstName,LastName,successrecordsstatus,username);//uncomment
            //Map<string,string> lsterrror=new Map<string,string>();
                //Map<string,string> lstcase=new Map<string,string>();--------------
             //string fieldmessage;
                //string casecontactname;
                if(!EachSavedResult.isSuccess())
                    
                {
                    string recorderrormessage;
                    system.debug('size of leads'+lstlead.Size());
                       for(Lead leds:lstlead)
                       {
                          if(leds.LastName==''||leds.LastName==null||leds.FirstName==''||leds.FirstName==null||leds.company==''||leds.company==null||leds.phone==''||leds.phone==null||leds.fax==''||leds.fax==null||leds.Email==''||leds.Email==null)
                          {
                              if(leds.LastName!=''||leds.FirstName!='')
                              {
                                  recorderrormessage='LastName:'+leds.lastName+'FirstName:'+leds.FirstName;
                                  //casecontactname=recorderrormessage;
                                  //system.debug('Last and first name of lead'+recorderrormessage);
                                  
                              }
                              else if(leds.Email!=''||leds.Email!=null)
                              {
                                 recorderrormessage +='Email:'+leds.Email; 
                                  system.debug('Email of lead'+recorderrormessage);
                              }
                              else if(leds.Company!=''||leds.Company!=null)
                              {
                                 recorderrormessage+= 'company:'+leds.Company;
                                  system.debug('Company of lead'+recorderrormessage);
                              }
                              else
                              {
                                recorderrormessage+='phone:'+leds.Phone;
                              }
                              //recorderrormessage='LastName:'+leds.lastName+'FirstName:'+leds.FirstName+'company:'+leds.company+
                                  							//'phone:'+leds.phone+'fax:'+leds.fax+'Email:'+leds.Email;
                                  							//system.debug('Leads lst message'+recorderrormessage);
                          }
                       }
                 //counter++;--------------
                   Database.Error[] errorresult= EachSavedResult.getErrors();
                    for(Database.Error error:errorresult)
                    {
                        //system.debug('Get fileds message is above list'+error.getFields());//--commeented
                     List<string> field=error.getFields();
                        for(string s:field)
                        {
                        //system.debug('Field message error is'+s);//--commented
                           fieldmessage=s;
                            errorms=error.getMessage();
                            //system.debug('Error message is '+errorms);
                            //system.debug(fieldmessage);
                              statcode=error.getStatusCode();
                            //system.debug('sttaus code is '+statcode);
                             Errordescription='The error message is:..'+'fileds are'+fieldmessage+' '+'error message'+''+errorms+' '+'status code'+''+statcode;
                            //system.debug(Errordescription);
                          //lsterrror.put(recorderrormessage, Errordescription);
                            lstcase.put(fieldmessage, 'The Errors are...'+errorms+'  ,'+statcode);
                            // system.debug('getfields looping error'+fieldmessage);//fieldmessage--commented
                        }
                       // system.debug('size of lstcase is'+lsterrror.size());
                        //system.debug(lsterrror);
                     //system.debug('The error message is '+Errordescription);//commented
                                                    
                             //lstcase.put(recorderrormessage, Errordescription);
                              
                       }
                 
                    set<string> setkeysset=lstcase.keySet();
                    List<string> lstvalues=lstcase.values();
                      failedrecordstatus=false;
                         ContentHead='Dear'+FirstName+''+LastName+'<br/><br/>Please find the fialed records details<br/><br/><br/><br/><body><table border="1"><tr><th>RecordDetails</th><th>RecordErrorDetails</th</tr>';
                    for(string vl:lstvalues)
                             {
                                 stringerrorvalue=vl;
                                 
                              }
                            for(string st:setkeysset)//string st:setkeysset
                            {
                               // system.debug(st);
                           ContentHead+='<tr><th>' + st + '</th><th>'+ stringerrorvalue + '</th></tr>';
                            }
                            contentHead+='</table></body></html>';
                                 }
           }
            CaseCreationforFailedRecords(lstcase);//--uncomment
            //system.debug(Errordescription);
            SendEmailOnSuccessfulInsertion(bodyContent,FirstName,LastName,successrecordsstatus,username);//--uncomment
            //CaseCreationforFailedRecords(Errordescription);
            SendEmailOnSuccessfulInsertion(ContentHead,FirstName,LastName,failedrecordstatus,username);
           }
    }
  public static void SendEmailOnSuccessfulInsertion(string bodycontent,string FirstName,string LastName,boolean recordsResultstatus,string username)
    {
       Messaging.SingleEmailMessage email= new Messaging.SingleEmailMessage();
        string[] toaddress= new string[]{username};//'naninarasimhareddy@gmail.com'
        email.setToAddresses(toaddress);
        //string [] ccAddress=new string []{'rajeshbosarp18@gmail.com'};
          //email.setCcAddresses(ccAddress);
        email.setReplyTo('sharma.pujyam@gmail.com');
        email.setSenderDisplayName('Capital softwware solutions');
       List<messaging.EmailFileAttachment> lstfileattachement= new List<messaging.EmailFileAttachment>();
        messaging.EmailFileAttachment fileattachement=new messaging.EmailFileAttachment();
        email.setHtmlBody(bodycontent);
      if(recordsResultstatus==true)
        {
        fileattachement.setFileName('List of Inserted Lead Records'+'.pdf');
        email.setSubject('List of Successfully inserted records');
        }
        else
        {
        fileattachement.setFileName('List of failed records'+'.pdf');
            email.setSubject('List failed records');
        }
        fileattachement.setContentType('Application/pdf');
        fileattachement.body=blob.toPdf(bodycontent);
        lstfileattachement.add(fileattachement);
        email.setFileAttachments(lstfileattachement);
       messaging.SendEmailResult[] sentemailresult=  messaging.sendEmail(new messaging.SingleEmailMessage[]{email});
    }
   public static void CaseCreationforFailedRecords(Map<string,string> lastcases)
    {
        system.debug('size of the listcas ie'+lastcases.size());
        
    Set<string> setcases=lastcases.keySet();
        List<string> lstcasevalues=lastcases.values();
        List<case> lstcase=new List<case>();
        string comments;
        for(string eachcasevalue:lstcasevalues)
        {
            
            comments=eachcasevalue;
            system.debug('caseDescription key  value'+comments);
        }
        
        for(string eachkeysetvalue:setcases)
        {
            case cs=new case();
        {
            
           cs.Description=eachkeysetvalue; 
            system.debug('case commentss '+cs.Description);
               cs.Status='new';
        cs.Origin='Email';
        cs.Priority='high';
        cs.Subject='Filure Records processing';
            cs.Description=comments;
            lstcase.add(cs);
        }
    }
    if(!lstcase.isempty())
        {
            insert lstcase;
        }
        
  
    }
    public static void SendMassEmailtoContacts()
    {
        Map<id,contact> mapcontacts=new map<id,contact>([select id,name,email,phone from contact where phone=null and email!=null]);
        if(!mapcontacts.isEmpty())
        {
            List<id> lstcontactids= new List<id>();
            lstcontactids.addAll(mapcontacts.keyset());
            if(!lstcontactids.isEmpty())
            {
                EmailTemplate template=[select id,name from EmailTemplate where 
                                       name='Update contact number notification'];
                if(template.Id!=null)
                {
                    messaging.MassEmailMessage massemail=new messaging.MassEmailMessage();
                    massemail.setTargetObjectIds(lstcontactids);
                    massemail.setTemplateId(template.Id);
                    messaging.SendEmailResult[] emailresult = messaging.sendEmail(new messaging.MassEmailMessage[]{massemail});
               
                    
                   
                    
                }
            }
        }
       }
}