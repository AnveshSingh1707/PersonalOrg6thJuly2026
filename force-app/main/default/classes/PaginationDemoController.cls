/**This is a sample controller with sample data of how to use the Paginate class*/
public with sharing class PaginationDemoController {
     public Paginate paginater {
      get;
      set;
     }
     public List < WrapperPagination > genericList {
      get;
      set;
     }
     public List < List < WrapperPagination >> fullGenericList {
      get;
      set;
     }
     public PaginationDemoController() { 
         //Get the data we need to paginate 
         List<WrapperPagination> resultsList = populateData(); 
         //Set the page size 
         Integer pageSize = 10; 
         //Create a new instance of Paginate passing in the overall size of 
         //the list of data and the page size you want 
         this.paginater = new Paginate(resultsList.size(), pageSize); 
         //These lists hold the data 
         this.fullGenericList = new List<List<WrapperPagination>>(); 
         this.genericList = new List<WrapperPagination>(); 
         //Break out the full list into a list of lists 
         if(resultsList.size() > 0){ 
             List<WrapperPagination> tempCC = new List<WrapperPagination>(); 
             Integer i = 0; 
             for(WrapperPagination cc : resultsList){ 
                 tempCC.add(cc); i++; 
                 if(i == pageSize){ 
                     this.fullGenericList.add(tempCC); 
                     tempCC = new List<WrapperPagination>();
                     i = 0; 
                     
                 } 
             } 
             if(!tempCC.isEmpty()){ 
                 this.fullGenericList.add(tempCC); 
                 
             } 
             //Gets the correct list of data to show on the page 
             this.genericList = this.fullGenericList.get(this.paginater.index); 
         } 
         
     } 
     public PageReference previousPage(){ 
         this.paginater.decrement(); 
         return changeData(); 
         
     } 
     public PageReference nextPage(){ 
         this.paginater.increment(); 
         return changeData(); 
         
     } 
     public PageReference updatePage(){ 
         this.paginater.updateNumbers(); 
         return changeData(); 
         
     } 
     public PageReference changeData(){ 
         this.genericList = this.fullGenericList.get(this.paginater.index);
         return null; 
         
     } 
     public List<WrapperPagination> populateData(){ 
         List<WrapperPagination> WrapperPaginationList = new List<WrapperPagination>(); 
         for(Integer i = 1; i < 50; i++){ 
             WrapperPaginationList.add(new WrapperPagination(i, 'Name: ' + String.valueOf(i)));
         } 
         return WrapperPaginationList; 
     } 
     public class WrapperPagination{ 
         public Integer num{get;set;} 
         public String name{get;set;} 
         public WrapperPagination(Integer num, String name){ 
             this.num = num; 
             this.name = name; 
         } 
    } 
}