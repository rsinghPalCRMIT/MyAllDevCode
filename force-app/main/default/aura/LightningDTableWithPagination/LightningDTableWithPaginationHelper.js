({
    getAllAccountInfo : function(component, event) {
        var action = component.get("c.allAccountInformation");
        action.setCallback(this, function(response){
            var state = response.getState();
            
            //
            if(state === "SUCCESS"){
                //
                var allAccountRecord  = response.getReturnValue();
                if(allAccountRecord.length > 0){
                    component.set("v.listOfAllAccounts" , allAccountRecord);
                    component.set("v.totalRecordsCount" , allAccountRecord.length);
                    component.set("v.startPage",0);
                    component.set("v.endPage",pageSize-1);
                    var pageSize = component.get("v.pageSize");

                    var pageList=[];
                    for(var i=0; i < pageSize; i++){
                        if (component.get("v.listOfAllAccounts").length > i) {
                            pageList.push(allAccountRecord[i]);   
                        }
                    }
                    component.set("v.PaginationList" , pageList);
                }
            }
        });
        $A.enqueueAction(action);
    },
    // navigate to next pagination record set   
    next : function(component,event,sObjectList,end,start,pageSize){
        var Paginationlist = [];
        var counter = 0;
        for(var i = end + 1; i < end + pageSize + 1; i++){
            if(sObjectList.length > i){ 
                if(component.find("selectAllId").get("v.value")){
                    Paginationlist.push(sObjectList[i]);
                }else{
                    Paginationlist.push(sObjectList[i]);  
                }
            }
            counter ++ ;
        }
        start = start + counter;
        end = end + counter;
        component.set("v.startPage",start);
        component.set("v.endPage",end);
        component.set('v.PaginationList', Paginationlist);
    },
   // navigate to previous pagination record set   
    previous : function(component,event,sObjectList,end,start,pageSize){
        var Paginationlist = [];
        var counter = 0;
        for(var i= start-pageSize; i < start ; i++){
            if(i > -1){
                if(component.find("selectAllId").get("v.value")){
                    Paginationlist.push(sObjectList[i]);
                }else{
                    Paginationlist.push(sObjectList[i]); 
                }
                counter ++;
            }else{
                start++;
            }
        }
        start = start - counter;
        end = end - counter;
        component.set("v.startPage",start);
        component.set("v.endPage",end);
        component.set('v.PaginationList', Paginationlist);
    },
})