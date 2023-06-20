public class MessageHandler
{
   /* public static void SendBatchJobStatusNotificationEmail(AsyncApexjob jobdeatils,string JobName,decimal totalanuualrevenue)
        
    {
        
        if(jobdeatils.Id!=null)
        {
            messaging.SingleEmailMessage email=new messaging.SingleEmailMessage();
            string[] toaddress = new string[]{jobdeatils.createdby.email,'rajeshbosarp18@gmail.com'};
            email.setToAddresses(toaddress);
        email.setReplyTo('rajeshbosarp2@gmail.com');
        email.setSenderDisplayName('Salesforce Adminstartor');
        string subject='weekly Account records status update job notification:UpdateLeadRecordsBatch('+jobdeatils.Id+')';
        email.setSubject(subject);
             string bodycontent='Dear SalesTeam,<br/><br/> we are pleased to inform you that we have processed the weekly lead records updated job successfullt Bbr/><br/>'+
            				'Please find the details below.... <br/><br/> '+'Please find the batch job detsila below :<br/><br/>'+
            				'Batch job id is.........:'+jobdeatils.Id+'<br/>'+
            				'<br/>Batch Job Name is..........:'+JobName+'<br/>'+
            				'<br/>total number of batches available is.....'+jobdeatils.TotalJobItems+
            				'<br/>Total number of job items processed is ......'+jobdeatils.JobItemsProcessed+
            				'<br/>TotalRecords Failed are.........'+jobdeatils.NumberOfErrors+
            				'<br/>Batch owner Email Address is ......'+jobdeatils.createdby.Email+
            				'<br/> Batch Job Status is.........'+jobdeatils.Status+
                 '<br/>Total Account Records Revenus is...: '+totalanuualrevenue + 
            				'<br/> <br/> Pleas contact on the below address if any queries'+
            				'<br/><br/>**<i>This is system generated email.Please do nnot reply to this email</i><br/><br/>'+
				'Thanks&Regards<br/>'+'Support Team';
        email.setHtmlBody(bodycontent);
            messaging.SendEmailResult[] emailresult =messaging.sendEmail(new messaging.SingleEmailMessage[]{email});
            
            
        }
    }*/
 public static void SendScheduleJobStatusNotificationEmail(CronTrigger TriggerDetails,decimal totalanuualrevenue)
        
    {
        if(TriggerDetails.Id!=null)
        {
            messaging.SingleEmailMessage email=new messaging.SingleEmailMessage();
            string[] toaddress = new string[]{TriggerDetails.createdby.email,'rajeshbosarp18@gmail.com'};
            email.setToAddresses(toaddress);
        email.setReplyTo('rajeshbosarp2@gmail.com');
        email.setSenderDisplayName('Salesforce Adminstartor');
        string subject='Update on schedule jobs.Schedule job id is...'+TriggerDetails.Id;
        email.setSubject(subject);
             string bodycontent='Dear SalesTeam,<br/><br/> we are pleased to inform you that the sheculed batch processed the weekly amount updated job successfullt <br/><br/>'+
            				'Please find the details below.... <br/><br/> '+'Please find the Schedule job detsila below :<br/><br/>'+
            				'Schedule job id is.........:'+TriggerDetails.Id+'<br/>'+
            				'<br/>Schedule Job Name is..........:'+TriggerDetails.CronjobDetail.Name+'<br/>'+
            				'<br/>Job type that ran.....'+TriggerDetails.CronjobDetail.Jobtype +
            				'<br/>Scheduling Start time ......'+TriggerDetails.StartTime+
            				'<br/>Scheduling State is .........'+TriggerDetails.State+
            				'<br/>Scheduling Endtime is ......'+TriggerDetails.EndTime+
            				'<br/> Scheduling previous time is.........'+TriggerDetails.PreviousFireTime+
                 '<br/>Total Account Records Revenus is...: '+totalanuualrevenue +
                 '<br/> scheduling next time is'+TriggerDetails.NextFireTime+
            				'<br/> <br/> Pleas contact on the below address if any queries'+
            				'<br/><br/>**<i>This is system generated email.Please do nnot reply to this email</i><br/><br/>'+
				'Thanks&Regards<br/>'+'Support Team';
        email.setHtmlBody(bodycontent);
            messaging.SendEmailResult[] emailresult =messaging.sendEmail(new messaging.SingleEmailMessage[]{email});
            
            
        }
    }
}