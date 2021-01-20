({
	handleSampleEvent : function(component, event, helper) {
		component.set("v.setMeOnEventFiring", "OK I handled it again in Third Component " + event.getParam( 'message'));        	
	}
})