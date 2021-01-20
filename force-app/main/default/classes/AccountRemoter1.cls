public class AccountRemoter1 {
    public String accountName { get; set; }
    public List<Account> account { get; set; }
    public boolean isValid{get;set;}
    
    public AccountRemoter1(){
       account=new List<Account>(); 
        isValid=false;
    }
     public void getAccount() {
         account=new List<Account>(); 
         account = [SELECT Id, Name, Phone, Type, NumberOfEmployees 
                   FROM Account WHERE Name = :accountName];       
        isValid=true;
    }
    
    public void clear(){
        account.clear();
    }
    
    
}