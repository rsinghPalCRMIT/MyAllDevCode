public class SK_AccListViewController {
    
    @auraEnabled
    public static List<Account> findRecords(){
        List<Account> returnList=new List<Account>();
        returnList=[select id,name,type,industry from Account order by LastModifiedDate DESC Limit 10];
      return returnList;
    }

}