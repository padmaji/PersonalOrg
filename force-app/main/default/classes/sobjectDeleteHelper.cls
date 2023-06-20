//This class is passed to batch job and  used to delete the position record if the status is closed 
global class sobjectDeleteHelper 
{
    public  void DeleteAllClosedPositionRecords()
    {
        List<Position__C> lstposition=[select id,Name,PositionStatus__c,MileStoneDate__c,Number_of_Vacancies__c,Location__c,MaximumSalary__c from Position__C where PositionStatus__c='closed'];
        List<Id> lstdeletedid= new List<id>();
        if(!lstposition.isEmpty())
        {
           Database.DeleteResult[] delres= Database.delete(lstposition,false);
            for(Database.DeleteResult eachdelres:delres)
            {
                if(!eachdelres.isSuccess())
                   {
                       lstdeletedid.add(eachdelres.getId());
                   }
            
            }
            SendDeleteNotifications(lstdeletedid,true);
                emptyingtheRecyclebin();
        }
    }
    public static void emptyingtheRecyclebin()
    {
      List<position__C> lstposiiton=[select id,name from position__c where isdeleted=true ALL Rows];
        List<Id> lstdeletedrecords=new List<Id>();
        if(!lstposiiton.isEmpty())
        {
            Database.EmptyRecycleBinResult[] emptyrecyclebin= Database.emptyRecycleBin(lstposiiton);
            for(Database.EmptyRecycleBinResult eachemptyrecyclebin:emptyrecyclebin)
            {
                if(!eachemptyrecyclebin.isSuccess())
                {
                  lstdeletedrecords.add(eachemptyrecyclebin.getId());  
                }
            
            }
            SendDeleteNotifications(lstdeletedrecords,false);
            
            
        }
    }

    public static void SendDeleteNotifications(List<id> lstid,boolean msg)
    {
          string content='';
      messaging.SingleEmailMessage email=new messaging.SingleEmailMessage();
            string[] toaddress = new string[]{'rajeshbosarp18@gmail.com'};
            email.setToAddresses(toaddress);
        email.setReplyTo('rajeshbosarp2@gmail.com');
        email.setSenderDisplayName('Salesforce Adminstartor');  
         email.setSenderDisplayName('Salesforce Adminstartor');
        string subject='As the status is closed for posiitons the records are deleted.Please find the record id';
        email.setSubject(subject);
        if(msg==true)
        {
         content='The below ids are deleted from position object';
            }
        else
        {
            content='The below ids are deleted permanently from Recyclebin'; 
        }
        for(id eachid:lstid)
        {
            content+='<br/>'+eachid;
        }
        email.setHtmlBody(content);
            messaging.SendEmailResult[] emailresult =messaging.sendEmail(new messaging.SingleEmailMessage[]{email});
    }
}