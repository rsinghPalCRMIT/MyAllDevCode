({
    parentComponentEvent : function(cmp, event) { 
        //Get the event message attribute
        var message = event.getParam("message"); 
        console.log('@@@message' + message);
        //Set the handler attributes based on event data 
        cmp.set("v.eventMessage", message + 'Rohit');         
    } 
})