public class countIncDecController {
    public Integer count{set; get;}
    
    public countIncDecController(){
        count = 0;
        
    }
    public void IncrementCounter(){
        count++;
    }
    public void DecrementCounter(){
        count--;
    }
    public Integer counter(){
        return count;
    }

}