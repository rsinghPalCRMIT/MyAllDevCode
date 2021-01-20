import { LightningElement, wire, track ,api} from 'lwc';
import getAllUserGroupValues from '@salesforce/apex/lwcUpdateUserwithGroupsController.getAllUserGroupValues';
import getAllUserGroupValues1 from '@salesforce/apex/lwcUpdateUserwithGroupsController.getAllUserGroupValues1';
import {refreshApex, getSObjectValue} from '@salesforce/apex';
export default class LwcUpdateUserwithGroups extends LightningElement {

    data=[];
    error;
    @track optionsUser;
    @track optionsGroup;
    wiredIssueResult;
    //

    //
   
    @wire(getAllUserGroupValues)
    allUserGroupWrapper(result){
        this.wiredIssueResult = result;
        if (result.data) {
            this.data = result.data;
            result.data.map(plValue => {
                this.optionsUser = plValue.objUser.map(objValue =>{ 
                    console.log('@@@  - ' + JSON.stringify(objValue));
                    return {
                        label: objValue.Name,
                        value: objValue.Id
                    };
                })
                //
                this.optionsGroup = plValue.objGroup.map(objValue =>{ 
                    console.log('@@@  - ' + JSON.stringify(objValue));
                    return {
                        label: objValue.DeveloperName,
                        value: objValue.Id
                    };
                })
            });
            //
            

        }else if(result.error){
            this.error = result.error;
        }
    }
    @api addRow(event) {
        var dataList = {};
        dataList = this.data;
            getAllUserGroupValues1()
            .then(result =>{
                for (var i = 0; i <result.length; i++) {                                
             console.log('@@@ data  - ' + JSON.stringify(result[i].isSelect));  
              console.log('@@@ result  - ' + JSON.stringify(result[i].objUser));
              console.log('@@@ dataList - ' + JSON.stringify(result[i].objGroup));
              this.data.push(result[i]);
                }
            console.log('@@@ dataList - ' + JSON.stringify(dataList));
            })
            .catch(error =>{
                console.log('Error -error- ', error);
            })
        }
       // return refreshApex(this.wiredIssueResult);
       //eval("$A.get('e.force:refreshView').fire();");

    //
    /*
   @wire(getAllUserGroupValues)
    allUserGroupWrapper(result){
        
        console.log('@@@ - ' + JSON.stringify(result.data.value));
        if (result.data) {
            this.data = result.data;
            
            
        }else if(result.error){
            this.error = result.error;
        }
    }
 */
}