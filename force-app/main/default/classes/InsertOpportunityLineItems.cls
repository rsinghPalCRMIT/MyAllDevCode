Public class InsertOpportunityLineItems{

    public static void createLineItmes(List<Opportunity> mapNewOpportunity){
       
         Student__c obj = new Student__c();
      obj.Name = 'Test';

       // Opportunity accountReference = new Opportunity(External_Id__C = '123456');
       
        Opportunity opp = new Opportunity();
       opp.Name  = 'TEst';
       opp.stagename = 'Prospect';
       opp.closedate = system.today();
       opp.External_Id__C = '123456';
 obj.Opportunity__r = opp;

         Database.UpsertResult[] results = Database.upsert(new SObject[] {
            opp, obj });

    }
}