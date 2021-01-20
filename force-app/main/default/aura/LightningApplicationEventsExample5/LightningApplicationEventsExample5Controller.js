({
    handleClick : function(component, event) {
        //How you call to Application Event To Fire From parent
        var appEvent = $A.get("e.c:ApplicationEventExample5");
        appEvent.setParams({ 'message': 'Clicked! ' + (new Date().toGMTString()) });
        appEvent.fire();        
    }
})