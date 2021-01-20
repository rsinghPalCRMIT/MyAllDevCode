({
	handleClick : function(component, event, helper) {
        var btmclicked = event.getSource();
        var btnmessage = btmclicked.get("v.label");
        component.set("v.message", btnmessage);	
	},
    
    showDate : function(component, event, helper) {
        var today = new Date();
        component.set("v.todaysDate", today);
         var today1 = Date.now();
        component.set("v.todaysDateTime", today1);
    },
    showDateTime : function(component, event, helper) {        
        var today = Date.now();
        component.set("v.todaysDateTime", today);
    }
})