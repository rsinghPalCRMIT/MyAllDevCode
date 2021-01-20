/**
 * @File Name          : lwcDataTableController.cls
 * @Description        : 
 * @Author             : Rohit Pal
 * @Group              : 
 * @Last Modified On   : 4/17/2020, 8:22:28 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    4/17/2020   Rohit Pal     Initial Version
**/
public with sharing class lwcDataTableController {
    
    @AuraEnabled
    public static List<Contact> getContactDetails(string strName){
        string key = '%'+strName+'%';
        //
        List<Contact> lstContct = new List<Contact>();
        lstContct = [SELECT Id,
                            LastName,
                            FirstName
                    FROM Contact WHERE Name Like : Key];
        return lstContct;
    }
}