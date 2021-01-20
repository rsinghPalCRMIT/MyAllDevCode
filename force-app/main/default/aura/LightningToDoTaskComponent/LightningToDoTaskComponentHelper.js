({
    getData : function(component,event) {
        var action = component.get("c.loadData");
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var dotoList = response.getReturnValue();
                for(var i=0; i < dotoList.length;i++){
                    //To display description of todo item as link
                    dotoList[i].linkToRecord = '/'+dotoList[i].Id;
                }
                component.set("v.data",dotoList);
            }
            else{
                //To handle server error
                console.log('Error occured while init of data '+state);
            }
        })
        $A.enqueueAction(action);
    },
    saveTodoRecord : function(component,event) {
        //create new to do record
        var action = component.get("c.saveTodoRecord");
        action.setParams({
            toDoRecord : component.get("v.objTaskInfo")
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var toastRef = $A.get("e.force:showToast");
                if(response.getReturnValue() == null){
                    toastRef.setParams({
                        "type" : "Success",
                        "title" : "Success",
                        "message" : "New Task is Created.",
                        "mode" : "dismissible"
                    });
                }
                else{
                    toastRef.setParams({
                        "type" : "Error",
                        "title" : "Error",
                        "message" : response.getReturnValue(),
                        "mode" : "sticky"
                    }); 
                }
                toastRef.fire();
                
                $A.get("e.force:refreshView").fire();
            }
            else{
                //To handle server error
                console.log('Error during saving '+state);
            }
        });
        $A.enqueueAction(action);          

    }
})