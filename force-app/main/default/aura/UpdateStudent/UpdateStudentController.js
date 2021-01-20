({
 callServer: function(component, event, helper) {
  var action = component.get('c.methodName');
  // method name i.e. getEntity should be same as defined in apex class
  // params name i.e. entityType should be same as defined in getEntity method
  action.setParams({
   "CurrentRecordId": component.get('v.recordId')
  });
  action.setCallback(this, function(response) {
   var state = response.getState();
   if (state === "SUCCESS") {
    console.log('Rohit');
    if (response.getReturnValue() != undefined && response.getReturnValue() == "False") {
     var toastEvent = $A.get("e.force:showToast");
     toastEvent.setParams({
      title: 'Warning',
      message: 'You dont have Permission to Edit this REcord',
      messageTemplate: 'You dont have Permission to Edit this REcord',
      messageTemplateData: ['Salesforce', {
       url: 'http://www.webkul.com/',
       label: 'Click Here',
      }],
      duration: ' 50',
      key: 'info_alt',
      type: 'warning',
      mode: 'pester'
     });
     toastEvent.fire();
    } else {
     component.set("v.ShowFields", response.getReturnValue());
    }

   } else {
    var toastEvent = $A.get("e.force:showToast");
    toastEvent.setParams({
     title: 'Warning',
     message: 'You dont have Permission to Edit this REcord',
     messageTemplate: 'You dont have Permission to Edit this REcord',
     messageTemplateData: ['Salesforce', {
      url: 'http://www.webkul.com/',
      label: 'Click Here',
     }],
     duration: ' 50',
     key: 'info_alt',
     type: 'warning',
     mode: 'pester'
    });
    toastEvent.fire();
       setTimeout(function(){
            		$A.get("e.force:closeQuickAction").fire(); 
		}, 1000);
   }
  });
     
  $A.enqueueAction(action);
 },
 saveRecordCntrlr: function(component, event, helper) {
  component.find("recordHandler").saveRecord($A.getCallback(function(saveResult) {
   if (saveResult.state === "SUCCESS") {
    console.log('recordSaved');
   // component.set("v.curView", "baseView");
    var toastEvent = $A.get("e.force:showToast");
    toastEvent.setParams({
     title: 'Record Save',
     message: 'Record has been Saved Successfully',
     messageTemplate: 'Record {0} created! See it {1}!',
     duration: ' 5000',
     key: 'info_alt',
     type: 'success',
     mode: 'pester'
    });
    toastEvent.fire();
       setTimeout(function(){
        	$A.get("e.force:closeQuickAction").fire(); 
		}, 1000);
   }
       var navEvt = $A.get("e.force:navigateToSObject");
    navEvt.setParams({
     "recordId": component.get("v.recordId")
    });
      navEvt.fire();
  }));
  $A.enqueueAction(action);
 }
})