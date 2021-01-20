({
    init : function(component, event, helper) {
        //
        component.set('v.columns', [
            {
                label: 'Account Name', 
                fieldName: 'Name', 
                type: 'text'
            },
            {
                label: 'Account Number', 
                fieldName: 'AccountNumber', 
                type: 'number'
            },
            {
                label: 'Fax Number', 
                fieldName: 'Fax', 
                type: 'number'
            }
        ]);
        helper.setAccountData(component, event);
    }
})