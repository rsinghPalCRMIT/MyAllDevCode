public class FirstWrapperContactController {
	
    @AuraEnabled
    public static wrapperClasss initMethod(){
    	wrapperClasss objwrapperClass = new wrapperClasss();
        objwrapperClass.lstcontact = [SELECT ID,
                                     		 Name,
                                             Email
                                      FROM Contact limit 10];
        objwrapperClass.TotalCount = objwrapperClass.lstcontact.size();
        objwrapperClass.headermEssage = 'This is to Show Contact Information';
        return objwrapperClass;
    }
    
    public class wrapperClasss{
        @AuraEnabled public List<Contact> lstcontact{get;set;}
        @AuraEnabled public Integer TotalCount{get;set;}
        @AuraEnabled public String headermEssage{get;set;}
        
    } 
}