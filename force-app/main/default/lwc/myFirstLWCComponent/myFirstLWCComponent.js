import { LightningElement, api, track } from 'lwc';
import id from '@salesforce/user/Id';
export default class MyFirstLWCComponent extends LightningElement { 
    @api name ='Rohit Pal';
    @track title = 'Salesforce CRM';
    phone='9876543234';
    email = 'rsinghpal@gmail.com'
    userId = id;
    handleClick(){
        console.log('@@@@ ' + this.name);
        console.log('@@@@ ' + this.userId);
    }
}