public class TstHandler{


    public static void executeTest(){
    
    batchAccountUpdate b = new batchAccountUpdate();
    database.executeBatch(b);
        system.debug('This is test');
        system.debug('This is test 1');
        system.debug('This is test 2');
        
    }
}