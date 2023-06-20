trigger AutoLeadConversionTrigger on Lead (After update) 
{
   if(Trigger.isUpdate && Trigger.isAfter)
   {
       LeadStatus lStatus = [Select id, MasterLabel, isConverted
													from LeadStatus
															Where isConverted = true];
       List<Database.LeadConvert> lstrec=new List<Database.LeadConvert>();
       //List<Database.LeadConvert> leadRecordsToConvert = new List<Database.LeadConvert>();
       
       for(Lead ldrecord:Trigger.new)
           //for(Lead ldRecord : Trigger.New)
       {
           //if(ldRecord.Status == 'Closed - Converted' && ldRecord.IsConverted == False)
           if(ldrecord.Status=='Closed - Converted' && ldrecord.isconverted == false)
           {
               Database.LeadConvert lconvert=new Database.LeadConvert();
               lconvert.setLeadId(ldrecord.Id);
               lconvert.setSendNotificationEmail(true);
               lconvert.setDoNotCreateOpportunity(false);
               lconvert.setConvertedStatus(lStatus.MasterLabel);
               
               lstrec.Add(lconvert);
           }
       }
       if(!lstrec.isEmpty())
       {
         Database.LeadConvertResult[] leadresult= Database.convertLead(lstrec);
       }
       	
   }
    

}