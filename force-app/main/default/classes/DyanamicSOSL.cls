public class DyanamicSOSL 
{
    public static void searchrecords()
    {
        List<List<sobject>> lstobj=[Find 'Test*' in ALL Fields Returning
                                        Account(id,Name,Rating,Industry,AnnualRevenue),
                                        Contact(id,FirstName,LastName,Email,title),
                                        Lead(Id,FirstName,LastName,Company,status,Email),
                                        Case(Id,Casenumber,status,priority,origin),
                                        Position__c(id,Name,PositionStatus__c,MaximumSalary__c),
                                        Hiring_Manager__C(Id,Name,Location__c,ContactNumber__c,Email_Address__c)];
        
if(!lstobj.isEmpty())
{
   List<Account> lstacc=(List<Account>)lstobj.get(0);
    List<Contact> lstcontact=(List<Contact>)lstobj.get(1);
     List<Lead> lstLead=(List<Lead>)lstobj.get(2);
   List<Case> lstCase=(List<Case>)lstobj.get(3);
    List<Position__c> lstPosition=(List<Position__c>)lstobj.get(4);
      List<Hiring_Manager__C> lstHiringManager=(List<Hiring_Manager__C>)lstobj.get(5);
    
    system.debug('Matching accounts found :'+lstacc.size());
    for(Account acc:lstacc)
    {
        system.debug('Account Record'+acc);
    }
    system.debug('=============================================');
    
   
    system.debug('Matching contacts found :'+ lstcontact.size());
    for(Contact con:lstcontact)
    {
        system.debug('contacts Record'+con);
    }
    system.debug('=============================================');
    
    
         system.debug('Matching Lead found :'+lstLead.size());
    for(Lead ld:lstLead)
    {
        system.debug('Lead Record'+ld);
    }
    system.debug('=============================================');
    
            system.debug('Matching Case found :'+lstCase.size());
    for(Case cs:lstCase)
    {
        system.debug('Case Record'+cs);
    }
    system.debug('=============================================');

                system.debug('Matching Position__c found :'+lstPosition.size());
    for(Position__c pos:lstPosition)
    {
        system.debug('Position__c Record'+pos);
    }
    system.debug('=============================================');
        
                system.debug('Matching Hiring_Manager__C found :'+lstCase.size());
    for(Hiring_Manager__C hr:lstHiringManager)
    {
        system.debug('Case Record'+hr);
    }
    system.debug('=============================================');
    }
}
    public static void dynamicsearch(string keyword,String objectdetails)
    {
        if(keyword!=null && keyword!='')
        {
           string query='Find ' + '\''+keyword+'*'+'\' '+'in  All Fields Returning '+  
               				'Account(id,Name,Rating,Industry,AnnualRevenue),'+
                                        'Contact(id,FirstName,LastName,Email,title),'+
                                        'Lead(Id,FirstName,LastName,Company,status,Email),'+
                                        'Case(Id,Casenumber,status,priority,origin),'+
                                        'Position__c(id,Name,PositionStatus__c,MaximumSalary__c)';
                                        
            if(objectdetails!=null && objectdetails!='')
            {
                query+=','+objectdetails;
            }
           List<List<sobject>> lstobj= search.query(query);
            
            if(!lstobj.isEmpty())
{
  
   List<Account> lstacc=(List<Account>)lstobj.get(0);
    List<Contact> lstcontact=(List<Contact>)lstobj.get(1);
     List<Lead> lstLead=(List<Lead>)lstobj.get(2);
   List<Case> lstCase=(List<Case>)lstobj.get(3);
    List<Position__c> lstPosition=(List<Position__c>)lstobj.get(4);
      List<Hiring_Manager__C> lstHiringManager=(List<Hiring_Manager__C>)lstobj.get(5);
    
    system.debug('Matching accounts found :'+lstacc.size());
    for(Account acc:lstacc)
    {
        system.debug('Account Record'+acc);
    }
    system.debug('=============================================');
    
   
    system.debug('Matching contacts found :'+ lstcontact.size());
    for(Contact con:lstcontact)
    {
        system.debug('contacts Record'+con);
    }
    system.debug('=============================================');
    
    
         system.debug('Matching Lead found :'+lstLead.size());
    for(Lead ld:lstLead)
    {
        system.debug('Lead Record'+ld);
    }
    system.debug('=============================================');
    
            system.debug('Matching Case found :'+lstCase.size());
    for(Case cs:lstCase)
    {
        system.debug('Case Record'+cs);
    }
    system.debug('=============================================');

                system.debug('Matching Position__c found :'+lstPosition.size());
    for(Position__c pos:lstPosition)
    {
        system.debug('Position__c Record'+pos);
    }
    system.debug('=============================================');
        
                system.debug('Matching Hiring_Manager__C found :'+lstCase.size());
    for(Hiring_Manager__C hr:lstHiringManager)
    {
        system.debug('Hiring_Manager__C Record'+hr);
    }
    system.debug('=============================================');
    }

            
            
        }
    }
    
 }