public class upateOpportunityFromProduct{


        public static void updateOpp(Map<Id, OpportunityLineItem> mapNewOppLineItems){
            
            List<opportunity> lstOpportunity;
            set<id> setProduct2Id = new set<id>();
            Map<Id, Product2> mapProducts;
            if(mapNewOppLineItems != null && !mapNewOppLineItems.isEmpty()){
                lstOpportunity = new List<opportunity>();
                
                for(OpportunityLineItem objoppLineItems : mapNewOppLineItems.values()){
                    if(objoppLineItems.Product2Id != null){
                        setProduct2Id.add(objoppLineItems.Product2Id);
                        
                    }
                }
                
                if(setProduct2Id != null){
                lstOpportunity = new List<opportunity>();
                    mapProducts =new Map<id, Product2>([SELECT id,
                                                               Name,
                                                               Family
                                                        FROM Product2 
                                                        WHERE ID IN : setProduct2Id]);
                                                        
                    for(OpportunityLineItem objoppLineItems : mapNewOppLineItems.values()){
                        
                        if(mapProducts.containskey(objoppLineItems.Product2Id) && mapProducts.get(objoppLineItems.Product2Id).Family == 'Sponsership'){
                            
                            opportunity objopportunity = new opportunity(id = objoppLineItems.OpportunityId);
                            objopportunity.Registration__c = 'Sponser';
                            lstOpportunity.add(objopportunity);
                        }
                    }
                    
                    update lstOpportunity;
                }
                
                
            }
        }
}