public with sharing class DynamicSobjectFieldSetClass {
    @AuraEnabled
    public static List<string> getAllTheFields(String FieldSetName){
        Map<String, Schema.SObjectType> GlobalDescribeMap = Schema.getGlobalDescribe();
        Schema.SObjectType SObjectTypeObj = GlobalDescribeMap.get(FieldSetName);
        Schema.DescribeSObjectResult DescribeSObjectResultObj = SObjectTypeObj.getDescribe();
        Map<String, Schema.FieldSet> FsMap = DescribeSObjectResultObj.fieldSets.getMap();
        List<String> AllInformation = New List<string>();
            For(String s : FsMap.keySet()){
                AllInformation.add(s);
                system.debug('@@@@' + s);
            }

            List<String> ss = New List<String>();
            ss.add('s1');
        return ss;
    }
}