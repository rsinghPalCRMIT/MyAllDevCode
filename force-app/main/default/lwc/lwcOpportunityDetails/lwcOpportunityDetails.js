import { LightningElement, api } from 'lwc';

export default class LwcOpportunityDetails extends LightningElement {
    @api recordId;
    @api objectApiName;

    constructor(){
        super();
        console.log('record id ' + this.recordId);
        console.log('Object Name' + this.objectApiName);

    }
}