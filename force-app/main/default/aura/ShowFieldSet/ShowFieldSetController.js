({
    doInit : function(cmp, event, helper) {
        var action = cmp.get("c.getCheckFieldPath");

        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set('v.Interlocuteurs', response.getReturnValue());
            console.log(cmp.get('v.Interlocuteurs'));
            }

        });
        $A.enqueueAction(action);
}
})