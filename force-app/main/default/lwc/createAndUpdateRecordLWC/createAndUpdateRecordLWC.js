import { LightningElement,wire,api } from 'lwc';
import getAllAccount from '@salesforce/apex/createAndUpdateRecordLWCController.getAllAccount';
import updateSelectedAccount from '@salesforce/apex/createAndUpdateRecordLWCController.updateSelectedAccount';
import {refreshApex} from '@salesforce/apex';
export default class CreateAndUpdateRecordLWC extends LightningElement {
    @api accountId;
    @api errors;
    @wire(getAllAccount) accounts;
    
    // wire property have accoun data and Errors from apex method

    handleUpdate(event){
        this.accountId = event.target.value;
        updateSelectedAccount({
            strAccountId : this.accountId
        })
        .then((result) =>{
            console.log('@@@' + JSON.stringify(result.data));
            return refreshApex(this.accounts);
        })
        .catch((error) => {
            this.errors = error;
        })
    }
}