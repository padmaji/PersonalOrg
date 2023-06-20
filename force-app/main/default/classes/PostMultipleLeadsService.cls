@RestResource(URLMapping='/postmultipleleadsservice/*')
global class PostMultipleLeadsService {
    @HTTPpost()
     global static string postleads()
     {
         string leadrecordDetails=restcontext.request.requestbody.tostring();
         List<Lead> insertleadrec=(List<Lead>)system.JSON.deserialize(leadrecordDetails, List<lead>.class);
         if(!insertleadrec.isEmpty())
         {
             insert insertleadrec;
             
             return 'LeadRecordsInserted';
         }
         else
         {
             return 'LeadRecords not found';
         }
         
         
         
     }

}