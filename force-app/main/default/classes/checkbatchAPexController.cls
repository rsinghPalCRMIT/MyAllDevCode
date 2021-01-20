public class checkbatchAPexController{

    
    public static void afterOpration( Map<Id, Account> mapAccount){
        for(account a : [SELECT Id,name,industry from account where ID IN : mapAccount.keySet()]){
      
      if(a.industry == 'Energy'){
          a.industry = 'hot';
      }
      
  }
        
    }
    
    public static void afterOpration1(Map<Id, Account> mapAccount){
        
        
    }
}