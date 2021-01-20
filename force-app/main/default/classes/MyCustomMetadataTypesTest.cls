@isTest
private class MyCustomMetadataTypesTest
{
    @isTest static void thisWontWork()
    {
        // You can't do this as the metadata fields are not writeable!
        // Result: [OPERATION FAILED]: classes/MyCustomMetadataTypesTest.cls: Field is not writeable: My_Custom_Metadata_Type__mdt.DeveloperName
 
        /*
        My_Custom_Metadata_Type__mdt metadata = new My_Custom_Metadata_Type__mdt(
            DeveloperName = 'test',
            My_Checkbox__c = true,
            My_Text__c = 'some text'
        );
 
        insert metadata;
        */
    }
 
    @isTest static void thisWorks()
    {
        // Create our test metadata
        {
            MyCustomMetadataTypes.Metadata metadata = new MyCustomMetadataTypes.Metadata();
            metadata.My_Checkbox = true;
            metadata.My_Text = 'some text';
 
            MyCustomMetadataTypes.getMyCustomMetadataType('text');
        }
        {
            MyCustomMetadataTypes.Metadata metadata = new MyCustomMetadataTypes.Metadata();
            metadata.My_Checkbox = false;
            metadata.My_Text = 'some more text';
 
         //  MyCustomMetadataTypes.s_myCustomMetadataTypeMap.put('test2', metadata);
        }
 
        // Use the wrapper to access the metadata
        MyCustomMetadataTypes.Metadata metadata = MyCustomMetadataTypes.getMyCustomMetadataType('test');
 
        // Assert the results
       // System.assertEquals(true, metadata.My_Checkbox);
        //System.assertEquals('some text', metadata.My_Text);
 
        // Use the wrapper to access the metadata
        MyCustomMetadataTypes.Metadata metadata2 = MyCustomMetadataTypes.getMyCustomMetadataType('test2');
 
        // Assert the results
        
 
        // This demonstrates the exception thrown when the metadata developer name can't be found
        try
        {
            MyCustomMetadataTypes.Metadata metadata3 = MyCustomMetadataTypes.getMyCustomMetadataType('test3');
        //    System.assert(false, 'Expected an Exception.');
        }
        catch(Exception e)
        {
          //  System.assert(e instanceof MyCustomMetadataTypes.MyCustomMetadataTypeException);
        }
    }
 
    @isTest static void thisAlsoWorks()
    {
        // Using some Custom Metadata already defined in my org. Look, no SeeAllData=true!
 
        // Use the wrapper to access the metadata
        MyCustomMetadataTypes.Metadata metadata = MyCustomMetadataTypes.getMyCustomMetadataType('indierock');
 
        // Assert the results
        
    }
}