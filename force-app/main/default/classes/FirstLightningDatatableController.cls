public class FirstLightningDatatableController {
    @AuraEnabled
    public static List<WrapperClassAccountContact> allRelatedAccountContact(){
        List<WrapperClassAccountContact> lstwrap = new List<WrapperClassAccountContact>();
        for(Contact a : [Select Id,Name,Phone,Account.Name from Contact limit 10]){
           
             WrapperClassAccountContact objwrp = new WrapperClassAccountContact(a);
            objwrp.TotalRecordCount = lstwrap.size();
            objwrp.headerMessg = 'Test';
             lstwrap.add(objwrp);
        }
        system.debug('@@@ lstwrap' + lstwrap);
       
        return lstwrap;
    }
    public class WrapperClassAccountContact{
        @AuraEnabled public Contact cons{get;set;}
        @AuraEnabled public Integer TotalRecordCount{get;set;}
        @AuraEnabled public String headerMessg{get;set;}
        public WrapperClassAccountContact(Contact c){
            cons = c;
        }
    }
}