trigger InsertOppLineItems on Opportunity (after insert) {

    InsertOpportunityLineItems.createLineItmes(Trigger.new);

}