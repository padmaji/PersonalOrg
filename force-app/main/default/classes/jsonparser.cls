public class jsonparser {
    public static void parser()
    {
        string dist='{"Name":"D.Gannavaram","Description":null,"BranchType":"Sub Post Office","DeliveryStatus":"Delivery","Circle":"Andhra Pradesh","District":"East Godavari","Division":"Amalapuram","Region":"Visakhapatnam"}';

       
           system.JSONParser pparser= system.json.createParser(dist); 
        
        while(pparser.nextToken()!=null)
        {
            if(pparser.getCurrentToken()==jsontoken.FIELD_NAME && pparser.getText()=='Name')
            {
                pparser.nextToken();
                system.debug('Name is :'+pparser.getText());
            }
            else if(pparser.getCurrentToken()==jsontoken.FIELD_NAME && pparser.getText()=='Description')
            {
                pparser.nextToken();
                system.debug('Description is:'+pparser.getText());
            }
            else if(pparser.getCurrentToken()==jsontoken.FIELD_NAME && pparser.getText()=='BranchType')
            {
                pparser.nextToken();
                system.debug('Branchtype :'+pparser.getText());
            }
             else if(pparser.getCurrentToken()==jsontoken.FIELD_NAME && pparser.getText()=='DeliveryStatus')
            {
                pparser.nextToken();
                system.debug('DeliveryStatus :'+pparser.getText());
            }
        }
        
      
        }
}