public class RP_Integ_14_10_v1 {
    
    public static void createJSON() //string nname,string nrating,string nindustry
    {
        string psuccess;
        string pcode;
        /*System.JSONGenerator js= JSON.createGenerator(true);

JS.writeStartObject();
try
{
Account acc=new account();
acc.name=nname;
acc.Rating=nrating;
acc.Industry=nindustry;
insert acc;

js.writeStringField('Id', acc.id);
js.writeStringField('Status', 'Success');
js.writeStringField('Message', 'Message created successfully');

}
catch(exception e)
{
js.writeStringField('Id', null);
js.writeStringField('Status', 'Failed');
js.writeStringField('Message', 'Failed to create the account');

}
JS.writeEndObject();
String sjs=JS.getAsString();
system.debug('sjs is'+sjs);
}*/
        string ds='{"status":"Success","code":"200","Account":[{"Name":"pad1","Rating":"Hot","Industry":"Education","Fax":"9999999999"},{"Name":"pad2","Rating":"cold","Industry":"Energy","Fax":"9999999999"}]}';
        
        system.JSONParser sjp= JSON.createParser(ds);
        
        while(sjp.nextToken()!=null)
        {
            if(sjp.getText()=='status')
            {
                sjp.nextToken();
                psuccess=sjp.getText();
            }
            if(sjp.getText()=='code')
            {
                sjp.nextToken();
                pcode= sjp.getText();
            }
            if(sjp.getText()=='Account')
            {
                sjp.nextToken();
                List<Account> lstacc=(List<Account>)sjp.readValueAs(List<account>.class);
                insert lstacc;
                
            }
        }
        
    }
    
    public static void work()
    {
        string work='{"Message":"Number of pincode(s) found:2","Status":"Success","PostOffice":[{"Name":"Mathrusri Nagar","Description":null,"BranchType":"Sub Post Office","DeliveryStatus":"Non-Delivery","Circle":"Andhra Pradesh","District":"K.V.Rangareddy","Division":"Secunderabad","Region":"Hyderabad City","Block":"Serilingampally","State":"Telangana","Country":"India","Pincode":"500049"},{"Name":"Miyapur","Description":null,"BranchType":"Sub Post Office","DeliveryStatus":"Delivery","Circle":"Andhra Pradesh","District":"Hyderabad","Division":"Secunderabad","Region":"Hyderabad City","Block":"Tirumalagiri","State":"Telangana","Country":"India","Pincode":"500049"}]}';
        System.JSONParser wjsp= JSON.createParser(work);
        while(wjsp.nextToken()!=null)
        {
            if(wjsp.getText()=='Name')
            {
                wjsp.nextToken();
                system.debug('Next text is'+wjsp.getText());
            }
        }
    }
}