import { LightningElement, track, api, wire } from 'lwc';
import getAllAccounts from '@salesforce/apex/class1SampleTableController.getAllAccounts';
export default class Class1SampleTable extends LightningElement {

    FullName = 'Rohit Singh Pal';
    @track Name;
   // @api FirstName;
   // @wire info;

   @wire(getAllAccounts) accounts;
   // wire is used to called apex class method
   /// it has 2 property data and error
}