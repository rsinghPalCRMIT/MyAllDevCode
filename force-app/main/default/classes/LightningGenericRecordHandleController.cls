public with sharing class LightningGenericRecordHandleController {

    @AuraEnabled
    public static List<objectWrapperInformation> sobjectTypeInfo(string strObjectType){

        List<objectWrapperInformation> lstWrapperobjectWrapperInformation = new List<objectWrapperInformation>();
        for ( Schema.SObjectType obj : Schema.getGlobalDescribe().values()){
            Schema.DescribeSObjectResult objResult = obj.getDescribe();
            if(strObjectType == 'CustomObject' && objResult.isCustom()){
                lstWrapperobjectWrapperInformation.add(new objectWrapperInformation(objResult.getName() , objResult.getLabel() ,objResult.isCustom()));
            }   
            if(strObjectType == 'StandardObject' && !objResult.isCustom()){
                lstWrapperobjectWrapperInformation.add(new objectWrapperInformation(objResult.getName() , objResult.getLabel() ,objResult.isCustom()));
            }
            if(strObjectType == 'All' && objResult.isCustom()){
                lstWrapperobjectWrapperInformation.add(new objectWrapperInformation(objResult.getName() , objResult.getLabel() ,objResult.isCustom()));
            }
        }
        return lstWrapperobjectWrapperInformation;
    }

    @AuraEnabled
    public static List<sObject> getRecords(String objectName){
		return Database.query('SELECT Id, Name FROM '+objectName+' LIMIT 200');
    }

    //creating a wrapper to get the Sobject info
    public class objectWrapperInformation{
        @AuraEnabled
        public String objectAPIName;
        @AuraEnabled
        public String objectLabelName;
        @AuraEnabled
        public Boolean objectIsCustom;

        public objectWrapperInformation(String objectAPIName ,String objectLabelName ,Boolean objectIsCustom){
            this.objectAPIName =objectAPIName;
            this.objectLabelName = objectLabelName;
            this.objectIsCustom = objectIsCustom;
        }
    }
}