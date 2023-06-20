@isTest()
Private class MathOperationsHelperTest 
{

    public Testmethod static void MathOperations()
    {
        MathOperationsHelper.Addition(10,20);
        MathOperationsHelper.Multiply(5, 10, 10);
        
        MathOperationsHelper mh = new MathOperationsHelper();
        mh.Division(10, 5);
        
    }
}