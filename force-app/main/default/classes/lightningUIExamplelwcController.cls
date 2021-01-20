/*************************************************************************************************************
 * @name			lightningUIExamplelwcController
 * @author			Rohit <email@email.com>
 * @created			27 / 06 / 2020
 * @description		Description of your code
 *
 * Changes (version)
 * -----------------------------------------------------------------------------------------------------------
 * 				No.		Date			Author					Description
 * 				----	------------	--------------------	----------------------------------------------
 * @version		1.0		2020-06-27		Rohit			Changes desription
 *
**************************************************************************************************************/
public with sharing class lightningUIExamplelwcController {
    
    @AuraEnabled
    public static void createNewContact( contact objContact){       
        insert objContact;
    }
}