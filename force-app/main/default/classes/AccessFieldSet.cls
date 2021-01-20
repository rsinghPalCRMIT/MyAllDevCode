public class AccessFieldSet {
     
    public static List<Schema.FieldSetMember> getFields() {
        List<Schema.FieldSetMember> fs = SObjectType.Account.FieldSets.Dimensions.getFields();
        system.debug('The value of Field Set is ' + fs);
        return fs;
    }
	@AuraEnabled
    public static List<String> getCheckFieldPath(){
        List<Schema.FieldSetMember> fs = SObjectType.Account.FieldSets.Dimensions.getFields();
        List<String> ss = New List<String>();
        for(Schema.FieldSetMember f : fs) {
            system.debug('What is the Field Path' + f);
            ss.add(f.getLabel());
        } 
        system.debug('Hello from ANT');
        return ss;
    }
    
    public void checkfields(){
        List<Schema.FieldSetMember> fs = SObjectType.Account.FieldSets.Dimensions.getFields();
        for(Schema.FieldSetMember f : fs) {
            system.debug('What is the Field Path' + f);
                }
    }
    public class testmecontroller5 {
        @AuraEnabled
        public String contact;
        @AuraEnabled
        public String postalcode;
        @AuraEnabled
        public String contactnumber;
    }

    @AuraEnabled
    public static List<testmecontroller5> getInterlocuteurs(){
        List<testmecontroller5> Interlocuteurs = new List<testmecontroller5>();
        testmecontroller5 tst = new testmecontroller5();
        tst.contact = 'contact 1';
        Interlocuteurs.add(tst);
        return Interlocuteurs;
    }
}