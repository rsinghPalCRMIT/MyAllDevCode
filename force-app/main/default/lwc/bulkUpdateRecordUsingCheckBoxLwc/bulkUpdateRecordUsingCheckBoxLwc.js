import { LightningElement, track, wire, api } from 'lwc';
import getAllAccount from '@salesforce/apex/bulkUpdateRecordUsingCheckBoxLwcCont.getAllAccount';
import selectedAllAccounts from '@salesforce/apex/bulkUpdateRecordUsingCheckBoxLwcCont.selectedAllAccounts';
import {refreshApex} from '@salesforce/apex';
export default class BulkUpdateRecordUsingCheckBoxLwc extends LightningElement {

@track accountList;
@track errors;
    //
    @wire(getAllAccount) accountLists;

    handleDelete(event){
        //
        let i;
        let allCheckbox = [];
       // var accountWrapperInfo ={};
       // let allCheckbox1 = [];
        let checkboxes = this.template.querySelectorAll('[data-id="checkbox"]')
        //
        for(i=0; i<checkboxes.length; i++) {
            if(checkboxes[i].checked){
                console.log('@@@@ - ' + checkboxes[i]);
                console.log('@@@@ - json  ' + JSON.stringify(checkboxes[i].name));
                allCheckbox.push({Id : checkboxes[i].name});
               
         //       accountWrapperInfo.isSelect = checkboxes[i].checked;
           //     accountWrapperInfo.acc = {Id : checkboxes[i].name};
            //    console.log('@@@ accountWrapperInfo - ' + JSON.stringify(accountWrapperInfo));
             //   allCheckbox1.push({accountWrapper : accountWrapperInfo});
              //  console.log('@@@ allCheckbox1 - ' + JSON.stringify(allCheckbox1));
            }
        }
        //
        if(allCheckbox != null && allCheckbox != undefined){
            //
            selectedAllAccounts({
                lstAccounts : allCheckbox
            })
            .then((result) =>{
                console.log('@@@ result ');
                return refreshApex(this.accountLists);
            })
            .catch((error) =>{
                console.log('@@@ error ');
            })
        }
    }
}