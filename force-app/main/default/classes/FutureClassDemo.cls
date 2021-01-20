public class FutureClassDemo {
	
    public FutureClassDemo(){
       Student__c a = new Student__c();
        a.Name = 'Tete';
        insert a;
        system.debug('@@@ >>' + a);
            
    }
}