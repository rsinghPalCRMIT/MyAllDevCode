public class QuickQuote {
    @AuraEnabled
    public static boolean saveQuote(Contact newQuote, Id oppId) {
        //system.debug('newQuote'+newQuote);
        newQuote.AccountId = oppId;
        try{
            insert newQuote ; 
            return true ;
        }catch(Exception e){
            throw new AuraHandledException(e.getMessage());
           // return false ;
        }
        
    }
    
}