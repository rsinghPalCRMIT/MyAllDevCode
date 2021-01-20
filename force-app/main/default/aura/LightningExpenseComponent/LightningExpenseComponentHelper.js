({
    createObjectData : function(component, event) {
        var opts = [];
        opts.push({
            class: "dynamic",
            label: "--- None ---",
            value: "None"
        });
        var rowItem = component.get("v.expenseList");
        rowItem.push({
            'sobjectType': 'Expense_Tracker__c',
            'Item_Name__c': '',
            'Purchased_On__c': '',
            'Purchased_Month__c': '',
            'Amount__c': '',
            'Comments__c': ''
        });
        component.set("v.expenseList", rowItem);
    },
    
    showExpenseHistory : function(component, event) {
        var action = component.get("c.shoeExpenseInfo");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                component.set("v.data" , response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
})