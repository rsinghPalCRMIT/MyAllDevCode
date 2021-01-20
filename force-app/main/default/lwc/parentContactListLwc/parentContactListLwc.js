import { LightningElement, api, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import getRelatedContactsByFilter from '@salesforce/apex/ParentContactListLwcController.getRelatedContactsByFilter';
export default class ParentContactListLwc extends LightningElement {
    @api recordId;//Inherits Account Record Id from Account Record Page
    @api label = 'WIPDeveloper.com  !!!';
    @wire(getRelatedContactsByFilter,{
        accountId : this.recordId,
        key : ''
    }) contactList;

}