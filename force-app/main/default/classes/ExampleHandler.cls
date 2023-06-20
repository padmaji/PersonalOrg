public class ExampleHandler 
{
 public static List<contact> GetContacts()
 {
     List<contact> lstcontacts=[select id,lastname,phone,Email from contact order by createddate desc limit 10];
     return lstcontacts;
 }
}