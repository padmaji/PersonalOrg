public class RP_Integration_S3_11_10 {
    
    public void createJson(string nn,string pn,string ind)
    {
        system.JSONGenerator js=  JSON.createGenerator(true);
            js.writeStartObject();
        try{
            Account acc=new account();
            acc.name=nn;
            acc.Phone=pn;
            acc.Industry=ind;
            
            insert acc;
            
            js.writeStringField('Status', 'Success');
            js.writeStringField('AccountId', acc.id);
            js.writeStringField('msg','Account created Successfully');
            js.writeNumberField('code',200);
            }
        catch(exception e)
        {
            js.writeStringField('Status', 'Failed');
           // js.writeStringField('AccountId',acc.id);
            js.writeStringField('Error',e.getMessage());
            js.writeNumberField('code', 400);
        }
        	js.writeEndObject();
        string res=js.getAsString();
        system.debug('Result is '+res); 
        
    }

}