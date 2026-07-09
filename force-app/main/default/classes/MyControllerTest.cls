public class MyControllerTest {
    public string myString{
        get{
            if(myString == null){
                myString = 'a';
            }
            return myString;
        }private set;
    }
    public String getmyString(){
     return 'getMyString';   
    }
    public String getStringMethod(){
        if(myString == null){
            myString = 'b';
        }
        return myString;
    }
}