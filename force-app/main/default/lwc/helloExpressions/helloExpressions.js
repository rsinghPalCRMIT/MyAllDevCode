import { LightningElement , track } from 'lwc';

export default class HelloExpressions extends LightningElement {

    @track firstName= '';
    @track lastName= '';

    handleInput(event){
        const field = event.target.name;
        if (field === 'firstName') {
            this.firstName = event.target.value;
        } else if (field === 'lastName') {
            this.lastName = event.target.value;
        }
    }

    get uppercasedFullName(){
        //const MyFullName = `${this.firstName} ${this.lastname}`;
        return `${this.firstName} ${this.lastName}`.trim().toUpperCase();
    }
}