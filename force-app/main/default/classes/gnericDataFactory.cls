public class gnericDataFactory {
    //https://code.google.com/archive/p/apex-lang/downloads
    //http://eltoro.force.com/DynamicApexSampleUsingSchemaDescribeDynamicSoqlAndDynamicDml
    //http://sfdcsrini.blogspot.com/2014/11/dynamic-apex-in-salesforce.html
    
    public static sobject getSobjectData(string sObjectName){
        
        SObjectType objToken = Schema.getGlobalDescribe().get('Account');
        DescribeSObjectResult objDef = objToken.getDescribe();
        Map<String, SObjectField> fields = objDef.fields.getMap(); 
        
        Set<String> fieldSet = fields.keySet();
        for(String s:fieldSet)
        {
            SObjectField fieldToken = fields.get(s);
            DescribeFieldResult selectedField = fieldToken.getDescribe();
            System.debug(selectedField.getName());
        }
        return null;
    }

}