public with sharing class Dropdownmenucontroller {
 
    

@AuraEnabled 
public static List <State__mdt> fetchMetaListLwc(String cities) {
    
    
    List <State__mdt> fetchMeta = [ SELECT Id, MasterLabel, cities__c, Url__c,Area__c FROM State__mdt where cities__c =:cities];
    
    return fetchMeta;
}
@AuraEnabled 
public static string historytracking(string lvalue,string llabel)
{
    
    string nnurl;
    string nnlabel;
    system.debug('getuser'+UserInfo.getUserId());
    user uname=[select Id, username from User where Id = :UserInfo.getUserId()];
   // string uname=String.valueOf(uname.username);
   
    //system.debug('string converted'+unameusername);

    //string previousvalue=  URL.getSalesforceBaseUrl().toExternalForm();
   /*System.debug('the url is'+ Baseurl);*/

   List<HistoryTracking__c> lstloggedusernames=[select Logged_In_user__c from HistoryTracking__c ];
   //lstloggedusernames.remove(null);
   system.debug('Size of the list is'+lstloggedusernames.size());


   set<string> setloggedusernames =new set<string>();
   //setloggedusernames.remove(null);
   for(HistoryTracking__c hst:lstloggedusernames)
{
    if(hst.Logged_In_user__c!=null)
    {
        setloggedusernames.add(hst.Logged_In_user__c);
    }

    
}
   //setloggedusernames.addall(lstloggedusernames.Logged_In_user__c);

   //system.debug('Size of the set is'+setloggedusernames.Size());
   //system.debug('set values is'+setloggedusernames);

   for(string  his:setloggedusernames)
{
    if(his==uname.username && his!=null)
    {


        HistoryTracking__c sht=[SELECT id,Newurl__c,Newvalue__c,Logged_In_user__c  from HistoryTracking__c where Logged_In_user__c =:uname.username order by LastModifiedDate desc nulls last limit 1];
        //List<HistoryTracking__c>  shttt=[SELECT id,Newurl__c,Newvalue__c,Logged_In_user__c  from HistoryTracking__c where Logged_In_user__c =:unameusername order by LastModifiedDate desc ];
        /*system.debug( 'sht:'+sht.id);
        system.debug( 'sht:'+sht.Newurl__c);
        system.debug('sht:'+sht.Newvalue__c);
        system.debug('sht:'+sht);*/
         nnurl=sht.Newurl__c;
        nnlabel=sht.Newvalue__c;

        //system.debug('assigning old url'+nnurl);
        //system.debug('assigning old label'+nnlabel);
    
    }
    if(nnurl!=null &&  nnlabel!=null && nnlabel=='' && nnurl=='')
    {

        nnurl='' ;
        nnlabel='';
        //system.debug('user id is not found assigning old url'+nnurl);
        //system.debug('id user id is not found assigning old label'+nnlabel);
    }
}

  
   
if(lvalue!=null && lvalue!='' && llabel!=null && llabel!='')
    {
        //system.debug('Passing old url and label:'+nnurl+' '+ nnlabel);
    HistoryTracking__c ht=new  HistoryTracking__c(Newurl__c=lvalue,Newvalue__c=llabel,oldURL__c=nnurl,oldvalue__c=nnlabel,Logged_In_user__c=uname.username);
//system.debug('before inserting into databse ::New url is'+lvalue+'new value is '+llabel+'old url is'+nnurl+'old value is'+nnlabel);
       insert ht;
       //system.debug('New url is'+lvalue+'new value is '+llabel+'old url is'+nnurl+'old value is'+nnlabel);
    }
    
    lstloggedusernames.clear();
    setloggedusernames.clear();
    
   
    return 'successfull';
}


}