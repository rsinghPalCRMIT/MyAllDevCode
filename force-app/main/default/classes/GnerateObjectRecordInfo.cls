public class GnerateObjectRecordInfo {
    
    Public static void GetData(){
         string finalstr;
   	    List<EntityDefinition> objEntity=  [SELECT  QualifiedApiName, DeveloperName  FROM EntityDefinition where IsQueryable =true and IsRetrieveable =true];
        for(integer i=0; i<objEntity.size(); i++){
            
		//List<object > acclist = [Select id,name , CreatedDate , lastModifiedDate from objEntity[i].DeveloperName limit 1];
		string s = 'Select id from ' +objEntity[i].DeveloperName;
       List<sobject > acclist = Database.query(s);
        string header = 'Record Id, Name , Created Date, Modified Date \n';
         finalstr = header ;
            for(sobject  a: acclist){
                string recordString = acclist.size()+','+objEntity[i].DeveloperName+'\n';
                finalstr = finalstr +recordString; 
            }
        }
        Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
        blob csvBlob = Blob.valueOf(finalstr);
        string csvname= 'Account.csv';
        csvAttc.setFileName(csvname);
        csvAttc.setBody(csvBlob);
        Messaging.SingleEmailMessage email =new Messaging.SingleEmailMessage();
        String[] toAddresses = new list<string> {'rohit2.pal@gmail.com'};
        String subject ='Account CSV';
        email.setSubject(subject);
        email.setToAddresses( toAddresses );
        email.setPlainTextBody('Account CSV ');
        email.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttc});
        Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
    }

}