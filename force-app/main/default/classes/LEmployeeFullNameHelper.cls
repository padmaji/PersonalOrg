public class LEmployeeFullNameHelper {
    @AuraEnabled
    public static  string  apexFullName(string FirstName,String LastName)
    {
        return FirstName+ ' '+LastName;
    }

}