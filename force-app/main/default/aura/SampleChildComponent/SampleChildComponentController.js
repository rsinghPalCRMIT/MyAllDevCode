({
    childComponentEvent : function(component, event, helper) {
        var componentEvent = component.getEvent("sampleCmpEvent");
        componentEvent.setParams({
            "message" : "Welcome"
        });
        componentEvent.fire();
    }
})