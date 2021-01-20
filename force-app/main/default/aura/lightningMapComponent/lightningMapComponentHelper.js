({
    showAccountMapInfo : function(component, event) {
        var action = component.get("c.allAccountLocationInfo");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                component.set("v.mapMarkers",response.getReturnValue());
                component.set('v.center', {
                    location: {
                        City: 'Denver'
                    }
                });
        
                component.set('v.zoomLevel', 4);
                component.set('v.markersTitle', 'Salesforce locations in United States');
                component.set('v.showFooter', true);
            }
        });
        $A.enqueueAction(action);
    }
})