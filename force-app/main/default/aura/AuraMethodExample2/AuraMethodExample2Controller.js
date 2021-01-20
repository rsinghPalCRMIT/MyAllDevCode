({
	doInit : function(component, event, helper) {
		component.defaultParamers ();
	},
    loadDefaultParams : function(component, event, helper) {
		var params = event.getParam('arguments');
        console.log(params);
        if (params) {
            var title = params.title;
            var header = params.header;
            var footer = params.footer;
            console.log(title);
            console.log(header);
            console.log(footer);
        }
        var onSucess = function(result){
            console.log(result);
        }
        var action = component.get("c.getServerSideParams");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                onSucess(response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	},
})