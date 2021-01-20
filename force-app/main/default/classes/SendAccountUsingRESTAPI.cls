public class SendAccountUsingRESTAPI {
  private final String clientId = '3MVG9d8..z.hDcPJE3KqeKj0prFSTxGZ4X1HuF4Ufba71OGkCY86UqfFn1zHRJeyGXUrfGREKHJ8ONT7D_5R.';
   private final String clientSecret = '1B770E0B7B4BF50C0F3D00CC0E173AFEE38E9EA1BBB6176A7EECA01B04D239EB';
   private final String username = 'swati@outlook.com';
   private final String password = 'Rohit@#123';
  public class deserializeResponse
   {
      public String id;
      public String access_token;
   }
  public String ReturnAccessToken (SendAccountUsingRESTAPI acount)
   {
      String reqbody = 'grant_type=password&client_id='+clientId+'&client_secret='+clientSecret+'&username='+username+'&password='+password;
     Http h = new Http();
      HttpRequest req = new HttpRequest();
      req.setBody(reqbody);
     req.setMethod('POST');
      req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
      HttpResponse res = h.send(req);
           system.debug('@@@@ res --' +res );

     deserializeResponse resp1 = (deserializeResponse)JSON.deserialize(res.getbody(),deserializeResponse.class);
      return resp1.access_token;
   }
  
   
   @future(callout=true)
   public static void callcreateAcc (String accName, String accId) {
   SendAccountUsingRESTAPI acount1 = new SendAccountUsingRESTAPI();
   String accessToken = acount1.ReturnAccessToken (acount1);
     system.debug('@@@@ accessToken' +accessToken );

   /*if(accessToken != null){
     String endPoint = 'https://ap2.salesforce.com/services/data/v32.0/sobjects/Account/';
     String jsonstr = '{"Name" : "' + accName + '"}';

      Http h2 = new Http();
      HttpRequest req1 = new HttpRequest();
     req1.setHeader('Authorization','Bearer ' + accessToken);
      req1.setHeader('Content-Type','application/json');
      req1.setHeader('accept','application/json');
      req1.setBody(jsonstr);
      req1.setMethod('POST');
      req1.setEndpoint(endPoint);
      HttpResponse res1 = h2.send(req1);

      deserializeResponse resp2 = (deserializeResponse)JSON.deserialize(res1.getbody(),deserializeResponse.class);
     Account a = [SELECT Id FROM Account WHERE Id = :accId];
     a.Siebel_Id__c = resp2.id;
      update a;
   }*/
   
   if(accessToken != null){
  String endPoint = 'https://upmacomp-dev-ed.my.salesforce.com/services/apexrest/v1/createAccount/';
   String jsonstr = '{"AccName" : "' + accName + '"}';

   Http h2 = new Http();
   HttpRequest req1 = new HttpRequest();
   req1.setHeader('Authorization','Bearer ' + accessToken);
   req1.setHeader('Content-Type','application/json');
   req1.setHeader('accept','application/json');
   req1.setBody(jsonstr);
   req1.setMethod('POST');
   req1.setEndpoint(endPoint);
   HttpResponse res1 = h2.send(req1);
   system.debug('@@@@ res1' +res1 );

  String trimmedResponse = res1.getBody().unescapeCsv().remove('\\');
  system.debug('@@@@ trimmedResponse -- ' + trimmedResponse);
   //deserializeResponse resp2 = (deserializeResponse)JSON.deserialize(trimmedResponse, deserializeResponse.class);
  // Account a = [SELECT Id FROM Account WHERE Id = :accId];

  // a.Siebel_Id__c = resp2.id;
  // update a;
}
   
   
   
}
   
   
   
   
   
   
   
}