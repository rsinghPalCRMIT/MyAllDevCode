import { LightningElement, track, api } from 'lwc';
export default class HelloWorld extends LightningElement {
    @track greeting = 'World';
    @api firstName;
    changeHandler(event) {
        this.greeting = event.target.value;
    }
}