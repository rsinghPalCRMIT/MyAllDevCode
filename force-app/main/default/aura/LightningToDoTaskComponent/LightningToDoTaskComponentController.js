({
    init: function (component, event, helper) {
        // create current date instance
        var now = new Date();
        var date = now.getDate();
        var month = now.getMonth() + 1;
        var fullYear = now.getFullYear();
        var today = fullYear + '-' + month + '-' + date;
        component.set("v.today", today);
        component.set('v.columns', [
            {   label: 'Name', 
                fieldName: 'linkToRecord', 
                type: 'url',
                typeAttributes:{label:{fieldName:'Name'},target:'_blank'}
            },

            {   label: 'Description', 
                fieldName: 'Description__c', 
                type: 'text'
            },


            {   label: 'Due Date', 
                fieldName: 'Due_Date__c', 
                type: 'date',
                typeAttributes:{day:'2-digit',month:'long',year:'2-digit'}
            },

            {   label: 'Reminder Date', 
                fieldName: 'Reminder_Date__c', 
                type: 'date',
                typeAttributes:{day:'2-digit',month:'long',year:'2-digit'}
            },
        ]);
        //get data
        helper.getData(component,event,helper);
    },
    toggleForm : function(component,event,helper){
        // change toggle button icon 
        var evtSource = event.getSource();
        if(evtSource.get("v.iconName") === 'utility:chevrondown'){
            evtSource.set("v.iconName" , 'utility:chevronright' );
        }else{
            evtSource.set("v.iconName" , 'utility:chevrondown' );
        }
        
        //To show/hide form elements
        $A.util.toggleClass(component.find("formDiv"),'slds-hide');
    },
    saveTodo : function(component, event, helper){
        helper.saveTodoRecord(component, event);
    },
    setMaxValueOfReminderDate : function(component, event, helper){
        var dueDate = event.getSource().get("v.value");
        component.find("reminderDate").set("v.value",'');
        //Once due date is entered , reminder date is enabled
        if(dueDate != null && dueDate != ''){
            component.find("reminderDate").set("v.disabled",false);
            //set max date limit for reminder date
            component.find("reminderDate").set("v.max",dueDate);
        }
        else{
            component.find("reminderDate").set("v.disabled",true);
        }        
    }
})