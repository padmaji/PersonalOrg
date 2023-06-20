public class MathOperationsHelper 
{
public static void Addition(integer x,integer y)
{
    system.debug('Result of addition is '+(x+y));
}
    public static void Multiply(integer x,integer y,integer z)
    {
        system.debug('Result of Multiply is '+(x*y*z));
    }
    public  void Division(integer x,integer y)
    {
        if(y>0)
        {
        system.debug('result of division is '+(x/y));
            
        }
        else
        {
            system.debug('Not Operatable with Zero');
        }
    }
    public  void Concatenate(string s1,string s2)
    {
        system.debug('Result of concatenation is '+(s1+S2));
    }
}