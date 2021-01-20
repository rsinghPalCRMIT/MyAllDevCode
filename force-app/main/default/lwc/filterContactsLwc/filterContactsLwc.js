import { LightningElement, track, api } from 'lwc';
import getRelatedContacts from '@salesforce/apex/filterContactsLwcController.getRelatedContacts';
import getRelatedContactsByFilter from '@salesforce/apex/filterContactsLwcController.getRelatedContacts';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class FilterContactsLwc extends LightningElement {
    @track filterValue;
    @track submittedFilterValue;
    @api componentLabel;

    handleChange(event){
        this.filterValue=event.target.value;
    }

    handleClick(){
        /**
         * Don’t use the window or document global properties to query for DOM elements
         * Don’t use ID selectors with querySelector. The IDs that you define in HTML templates
         *  may be transformed into globally unique values when the template is rendered.
         */
        let filterBox = this.template.querySelector("lightning-input");
        let filterKeyValue = filterBox.value;
        this.submittedFilterValue=filterKeyValue;
        
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Submitted Filter Value',
                message: this.submittedFilterValue,
                variant: 'success'
            })
        );

        /*Creates the event with the contact ID data.
        To pass data up to a receiving component, set a detail property in the CustomEvent constructor.
        Receiving components access the data in the detail property in the event listener’s handler function*/
        const selectedEvent = new CustomEvent('filterkeysubmit', { detail : filterKeyValue });

        // Dispatches the event.
        this.dispatchEvent(selectedEvent);
    }
}