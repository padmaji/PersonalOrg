global  class UpdateLeadRecordsBatch implements Database.Batchable<sobject> 
{
  global database.QueryLocator Start(Database.BatchableContext bcontext)
  {
      string SQL='select id,firstName,LastName,rating,annualrevenue,leadsource,status from lead';
      
     return  database.getQueryLocator(SQL);
  }
    global void Execute(Database.BatchableContext bcontext,List<sobject> recordsToprocess)
    {
        if(!recordsToprocess.isEmpty())
        {
            List<Lead> lstforinsertngrecords = new List<Lead>();
            for(sobject ledrecords:recordsToprocess )
            {
                Lead ldrecords= (lead)ledrecords;
                ldrecords.Rating='Hot';
                ldrecords.AnnualRevenue=7200000;
                ldrecords.Status='Working-contacted';
                
                lstforinsertngrecords.Add(ldrecords);
                
                }
           
             if(!lstforinsertngrecords.isEmpty())
            update lstforinsertngrecords;
        }
       
    }
    
    global void Finish(Database.BatchableContext bcontext)
         {
        system.debug('Batch job id is'+ bcontext.getJobId());
        
        AsyncApexjob Jobdetails=[select id,status,totaljobitems,jobitemsprocessed,numberoferrors,createdby.email from AsyncApexjob where id=:bcontext.getJobId()];
 
        messaging.SingleEmailMessage email=new messaging.SingleEmailMessage();
        string[] toaddress = new string[]{Jobdetails.createdby.email,'rajeshbosarp18@gmail.com'};
            email.setToAddresses(toaddress);
        email.setReplyTo('rajeshbosarp2@gmail.com');
        email.setSenderDisplayName('Salesforce Adminstartor');
        string subject='weekly lead records status update job notification:UpdateLeadRecordsBatch('+bcontext.getJobId()+')';
        email.setSubject(subject);
        string bodycontent='Dear SalesTeam,<br/><br/> we are pleased to inform you that we have processed the weekly lead records updated job successfullt Bbr/><br/>'+
            				'Please find the details below.... <br/><br/> '+'Please find the batch job detsila below :<br/><br/>'+
            				'Batch job id is.........:'+bcontext.getJobId()+'<br/>'+
            				'<br/>Batch Job Name is..........:updatedLeadRecordsBatch'+
            				'<br/>total number of batches available is.....'+jobdetails.TotalJobItems+
            				'<br/>Total number of job items processed is ......'+jobdetails.JobItemsProcessed+
            				'<br/>TotalRecords Failed are.........'+jobdetails.NumberOfErrors+
            				'<br/>Batch owner Email Address is ......'+jobdetails.createdby.Email+
            				'<br/> Batch Job Status is.........'+jobdetails.Status+
            				'<br/> <br/> Pleas contact on the below address if any queries'+
            				'<br/><br/>**<i>This is system generated email.Please do nnot reply to this email</i><br/><br/>'+
				'Thanks&Regards<br/>'+'Support Team';
        email.setHtmlBody(bodycontent);
       //messaging.SendEmailResult[] emailresult =messaging.sendEmail(new messaging.SingleEmailMessage[]{email});
            
    }
    

}