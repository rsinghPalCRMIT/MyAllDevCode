public class EncryptedFieldExtension {

    public String decryptedDataString {get;set;}
    public Student__c acc {get;set;}
    public EncryptedFieldExtension(ApexPages.StandardController controller) {
        acc = (Student__c)controller.getRecord();
        Blob cryptoKey = Crypto.generateAesKey(256);        
        Blob data = Blob.valueOf(acc.Credit_Card__c);
        Blob encryptedData = Crypto.encryptWithManagedIV('AES256', cryptoKey, data);        
        Blob decryptedData = Crypto.decryptWithManagedIV('AES256', cryptoKey, encryptedData);
        decryptedDataString = decryptedData.toString();
    }
    
    public void getshowRow(){
        
    }

}