import { LightningElement } from 'lwc';

export default class LwchostLookupInLwc extends LightningElement {
    selectedRecordId; //store the record id of the selected 
    //
    handleValueSelcted(event) {
        this.selectedRecordId = event.detail;
    }
    validateLookupField() {
        this.template.querySelector('c-lwc-custom-lookup').isValid();
}
}