@RestResource(URLMapping='/patchhiringmangerservice/*')
global class PatchHiringManagerSerice {
    @httppatch()
    global static string patchHMServie(string recordid,string hrphone,string hrcity)
    {
        if(recordid!=null && recordid!='')
        {
            List<Hiring_Manager__c> lsthm=new List<Hiring_Manager__c>();
            Hiring_Manager__c hr=[select id,name,Location__c,Email_Address__c,Designation__c,ContactNumber__c from Hiring_Manager__c
                                  where id=:recordid];
            
            if(hr.id!=null)
            {
                hr.ContactNumber__c=hrphone;
                hr.Location__c=hrcity;
                lsthm.Add(hr);
            }
            Hiring_Manager__c hmr=new Hiring_Manager__c();
            hmr.Name='delhi';
            hmr.Location__c='Hyderabad';
            hmr.ContactNumber__c='7896578909';
            hmr.Email_Address__c='peddireddypadmaji@gmail.com';
            lsthm.Add(hmr);
            
            if(!lsthm.isEmpty())
            {
                upsert lsthm;
                return 'Upserted successfully';
            }
            else
            {
                return 'Upsert failed';
            }
            
        }
        else
            {
                return 'Please provide the recordid';
            }
    }

}