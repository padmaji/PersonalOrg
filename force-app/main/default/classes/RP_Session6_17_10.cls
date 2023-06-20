public class RP_Session6_17_10 {
    public blob cnextbody;
    public void Attachemnetdeseer()
    {
        document doc=[select id,name,body from document where name='Integration_pic'];
        
       string js= JSON.serialize(doc);
        system.debug('Serialize json is'+js);
        
        system.JSONGenerator cjs= JSON.createGenerator(true);
        cjs.writeStartObject();
        cjs.writeBlobField('Attachemnet', doc.Body);
        cjs.writeEndObject();
        string scjs=cjs.getAsString();
        system.debug('scjss>>>>>'+scjs);
        
        
        /*Blob dblob=(Blob)JSON.deserialize(js, Blob.class);
        document d=new document();
        d.Name='Intergation_dup';
        d.Body=dblob;
        insert d;
        system.debug('simple deserilaiztaion id is'+d.Id);*/
        
        
        System.JSONParser cjps= JSON.createParser(scjs);
        while(cjps.nextToken()!=null)
        {
            if(cjps.getText()=='Attachemnet')
            {
                cjps.nextToken();
                 cnextbody=(blob)cjps.getBlobValue();
            }
        }
        document d2=new document();
        d2.name='Integration_complex_dup';
        d2.body=cnextbody;
        d2.ContentType='image/jpeg';
        d2.FolderId='0055j000001fJOP';
        insert d2;
        system.debug('d2 is???????'+d2.id);
        
    }

}