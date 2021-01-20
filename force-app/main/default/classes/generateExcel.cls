public class generateExcel{

        public static void sendExcel(){
        
           //List<Schema.FieldSetMember> fieldsInfo = readFieldSet('TestFieldSet','Student__c');
           List<Schema.FieldSetMember> fieldSetMemberList =  readFieldSet('TestFieldSet','Student__c');

string header = 'Field Label, Field API \t';
string finalstr = header ;
for(Schema.FieldSetMember fieldSetMemberObj : fieldSetMemberList)
{
       string recordString = '\n'+String.valueof(fieldSetMemberObj.getLabel())+'\t'+String.valueof(fieldSetMemberObj.getFieldPath())+'\n';
       finalstr = finalstr +recordString;
}
Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
blob xlsxBlob = Blob.valueOf(finalstr);
string xlsxname = 'Absence_Request.csv';
csvAttc.setFileName(xlsxname);
csvAttc.setContentType('text/csv');
csvAttc.setBody(xlsxBlob);
Messaging.SingleEmailMessage email =new Messaging.SingleEmailMessage();
String[] toAddresses = new list<string> {'rohit2.pal@gmail.com'};
String subject ='Field Label';
email.setSubject(subject);
email.setToAddresses( toAddresses );
email.setPlainTextBody('Absence_Request XLSX ');
email.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttc});
Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
    }    
        
 public static List<Schema.FieldSetMember > readFieldSet(String fieldSetName, String ObjectName)
{
    Map<String, Schema.SObjectType> GlobalDescribeMap = Schema.getGlobalDescribe();
    Schema.SObjectType SObjectTypeObj = GlobalDescribeMap.get(ObjectName);
    Schema.DescribeSObjectResult DescribeSObjectResultObj = SObjectTypeObj.getDescribe();
system.debug('@@@ DescribeSObjectResultObj' + DescribeSObjectResultObj);
    Schema.FieldSet fieldSetObj = DescribeSObjectResultObj.FieldSets.getMap().get(fieldSetName);

    return fieldSetObj.getFields();
}
}