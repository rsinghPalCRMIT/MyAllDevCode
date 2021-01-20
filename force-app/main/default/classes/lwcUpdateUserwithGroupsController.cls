/**
 * @File Name          : lwcUpdateUserwithGroupsController.cls
 * @Description        : 
 * @Author             : Rohit
 * @Group              : 
 * @Last Modified On   : 4/23/2020, 6:04:49 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    4/23/2020   Rohit     Initial Version
**/
public with sharing class lwcUpdateUserwithGroupsController {

    @AuraEnabled(Cacheable = true)
    public static List<userGroupWrapper> getAllUserGroupValues(){
        List<userGroupWrapper> lstuserGroupWrapper = new List<userGroupWrapper>();
        List<User> lstUser = [SELECT Id,Name FROM User];
        List<Group> lstGroup = [SELECT Id,DeveloperName FROM Group ];
        userGroupWrapper objuserGroupWrapper;
        //
        for(Integer i=0; i< 1; i++){
            //
            objuserGroupWrapper = new userGroupWrapper(false , lstUser ,lstGroup);
            lstuserGroupWrapper.add(objuserGroupWrapper);
        }
        return lstuserGroupWrapper;
    }
    @AuraEnabled(Cacheable = true)
    public static List<userGroupWrapper> getAllUserGroupValues1( string strName){
        List<userGroupWrapper> lstuserGroupWrapper = new List<userGroupWrapper>();

        lstuserGroupWrapper =getAllUserGroupValues();

        return lstuserGroupWrapper;
    }

    public class userGroupWrapper{
        @AuraEnabled
        public boolean isSelect {get;set;}
        @AuraEnabled
        public List<user> objUser {get;set;}
        @AuraEnabled
        public List<group> objGroup {get;set;}
        //
        userGroupWrapper(boolean isSelect ,List<user> objUser , List<group> objGroup){
            this.isSelect = isSelect;
            this.objUser = objUser;
            this.objGroup = objGroup;
        }
    }
}