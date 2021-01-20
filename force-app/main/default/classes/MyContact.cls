public with sharing class MyContact {
 
    public Contact singleCon{get; set;}
    
     public MyContact(){
     singleCon = New Contact();
    
     }
     
     public void addContact(){
    
     system.debug('@@@@@' + singleCon);
      insert singleCon;
       singleCon = new Contact();
     }
}