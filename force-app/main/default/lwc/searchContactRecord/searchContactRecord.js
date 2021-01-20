import { LightningElement, track } from 'lwc';
import findContacts from '@salesforce/apex/searchContactRecord.findContacts';
/** The delay used when debouncing event handlers before invoking Apex. */
const DELAY = 350;
export default class SearchContactRecords extends LightningElement {
    @track contacts;
    @track errors;

    handleKeyChange(event) {
        // Debouncing this method: Do not actually invoke the Apex call as long as this function is
        // being called within a delay of DELAY. This is to avoid a very large number of Apex method calls.
        window.clearTimeout(this.delayTimeout);
        const strSearchContact = event.target.value;
        // eslint-disable-next-line @lwc/lwc/no-async-operation
        this.delayTimeout = setTimeout(() => {
            findContacts({ strSearchContact })
                .then(result => {
                    this.contacts = result;
                    this.error = undefined;
                })
                .catch(error => {
                    this.error = error;
                    this.contacts = undefined;
                });
        }, DELAY);
    }
}