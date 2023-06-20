trigger RelatedAccountTrigger on Account (before delete) 
{
   if(trigger.isbefore || trigger.isdelete)
   {
    List<contact> lstcontact =[select id,Accountid,name from Contact where Accountid in : trigger.oldmap.keyset()];  
       
       if(!lstcontact.isEmpty())
       {
           for(contact con:lstcontact)
               
           {
               con.Accountid=null;
           }
           
           update lstcontact;
           }
   }
}