trigger updateOpporutnitty on OpportunityLineItem (after insert , after update) {
    
    if(Trigger.isInsert || Trigger.isUpdate){
        upateOpportunityFromProduct.updateOpp(trigger.newmap);
    }
    
}