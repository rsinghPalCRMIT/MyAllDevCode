({
    handleSampleEvent : function(component, event, helper) {       
        component.set("v.setMeOnEventFiring", "OK I handled it " + event.getParam( 'message'));        
    }
})