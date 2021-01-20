import { LightningElement , api } from 'lwc';

export default class LwcEditRecordForm extends LightningElement {
    @api recordId;
    @api objectApiName;
}