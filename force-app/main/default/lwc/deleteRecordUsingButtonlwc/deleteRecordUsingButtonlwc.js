import { LightningElement, wire, track, api } from 'lwc';
import getAllAccounts from '@salesforce/apex/deleteRecordUsingButtonlwcController.getAllAccounts';
import {refreshApex} from '@salesforce/apex';
import { deleteRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';
export default class DeleteRecordUsingButtonlwc extends LightningElement {

    @api recordId;
    @api objectApiName;
    @track error;
    // wire to call to apex and get all accounts
    @wire(getAllAccounts) accounts;

    //
    handleDelete(event){
        this.recordId = event.target.value;
        //
        deleteRecord(this.recordId)
        .then(() => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Record deleted',
                    variant: 'success'
                })
            );

            return refreshApex(this.accounts);
        })
        .catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error deleting record',
                    message: error.body.message,
                    variant: 'error'
                })
            );
        })
    }
}