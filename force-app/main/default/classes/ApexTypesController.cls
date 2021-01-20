/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-27-2020
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   07-27-2020   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public with sharing class ApexTypesController {
    @AuraEnabled(cacheable=true)
    public static String checkApexTypes(CustomWrapper wrapper) {
        

        System.debug(wrapper);
        // The values are based on the data that is defined in the
        // apexImperativeMethodWithComplexParams Lightning web component.
        String response =
            'You entered "' +
            wrapper.someString +
            '" as String, and "' +
            wrapper.someInteger +
            '" as Integer value. The list contained ' +
            wrapper.someList.size() +
            ' items.';
        return response;
        
    }

    public class CustomWrapper{
    @AuraEnabled
    public Integer someInteger { get; set; }
    @AuraEnabled
    public String someString { get; set; }
    @AuraEnabled
    public List<InnerWrapper> someList { get; set; }
    }

    public class InnerWrapper {
        @AuraEnabled
        public Integer someInnerInteger { get; set; }
        @AuraEnabled
        public String someInnerString { get; set; }
    }

    
}