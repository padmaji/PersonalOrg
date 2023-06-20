global  class CalCulateTotalAccountRevenue Implements Database.Batchable<sobject>,Database.stateful
{ 
    global decimal totalanuualrevenue=0.0;
   global Database.QueryLocator start(Database.BatchableContext dbcontext)
   {
     string sqlquery='select id,name,rating,AnnualRevenue,industry from Account where annualrevenue!=null';
       return database.getQueryLocator(sqlquery);
   }
    global void Execute(Database.BatchableContext dbcontext,List<Sobject> lstsobjectrecords)
    {
        
        
        if(!lstsobjectrecords.isEmpty())
        {
            for(sobject eachlstsobjectrecords:lstsobjectrecords )
            {
                Account Accrecord=(Account)eachlstsobjectrecords;
                //Accrecord.Rating='cold';
                //lstaccount.add(Accrecord);
                totalanuualrevenue+=Accrecord.AnnualRevenue;
                
            }
            
         
        }
       
        
        
    }
    global void finish(Database.BatchableContext dbcontext)
    {
        //AsyncApexjob jobdetails=[select id,status,totaljobitems,jobitemsprocessed,numberoferrors,createdby.email from AsyncApexjob where id=:dbcontext.getJobId()];
        
//MessageHandler.SendBatchJobStatusNotificationEmail(jobdetails,'CalCulateTotalAccountRevenue',totalanuualrevenue); 
       
      CronTrigger ct=[SELECT Id, CronJobDetail.Name, NextFireTime, PreviousFireTime, State, StartTime, EndTime, CronExpression, 
           TimeZoneSidKey, OwnerId, LastModifiedById, CreatedBy.email, CreatedDate, TimesTriggered FROM CronTrigger where id=:dbcontext.getJobId()];
        
        MessageHandler.SendScheduleJobStatusNotificationEmail(ct,totalanuualrevenue);
    }

}