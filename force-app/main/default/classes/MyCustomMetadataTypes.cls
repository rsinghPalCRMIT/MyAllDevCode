/**
 * Wrapper for My_Custom_Metadata_Type__mdt to ease access and testing
 */
public with sharing class MyCustomMetadataTypes
{
    // Cached Map of metadata
  
 
    // Public getter
    public static Metadata getMyCustomMetadataType(String developerName)
    {
        // Check the cache

 
        // Not found, so query the metadata
            My_Custom_Metadata_Type__mdt myCustomMetadataType;
 //, ts1_My_Checkbox__c, ts1_My_Text__c
            try
            {
                myCustomMetadataType = [Select DeveloperName
                                        From My_Custom_Metadata_Type__mdt
                                        Where DeveloperName = :developerName];
            }
            catch(System.QueryException sqe)
            {
                throw new MyCustomMetadataTypeException('Could not find My Custom Metadata Type with DeveloperName: ' + developerName);
            }
 
            // Wrap the metadata using the inner class
          Metadata  myMetadata = new Metadata(myCustomMetadataType);
 
            // Add it to the cache
           // s_myCustomMetadataTypeMap.put(myCustomMetadataType.DeveloperName, myMetadata);

 
        // Return the wrapped metadata
        return myMetadata;
    }
 
    // Inner class to wrap the metadata
    public class Metadata
    {
        // Properties represent the Fields in the Metadata
        public Boolean My_Checkbox {get; set;}
        public String My_Text {get; set;}
 
        // Constructor used when creating test values
        public Metadata()
        {
        }
 
        // Construct from a concrete metadata instance
        private Metadata(My_Custom_Metadata_Type__mdt metadata)
        {
            //this.My_Checkbox = metadata.ts1_My_Checkbox__c;
            //this.My_Text = metadata.ts1_My_Text__c;
        }
    }
 
    public class MyCustomMetadataTypeException extends Exception {}
}