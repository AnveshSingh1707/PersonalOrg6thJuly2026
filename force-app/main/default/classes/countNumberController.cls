public class countNumberController {
    public Integer countNumber{set;get;}
    public List<Integer> countList{set;get;}
      public void count(){
          for(Integer i=0; i<9000000; i++){
          countNumber = i;
          }
     }
}