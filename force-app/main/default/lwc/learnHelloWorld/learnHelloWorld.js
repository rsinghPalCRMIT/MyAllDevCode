import { LightningElement , track } from 'lwc';

export default class LearnHelloWorld extends LightningElement {
    /**
     *  the @api use to make this peroperty public if you it become prtivate by default nut binding will be there.
     *  Because it's decorated with @track, when the value of name changes, the template re-renders. 
     * If you remove @track, the property value still changes, but the component doesn’t re-render so the bound property doesn't change. 
     * Decorating a property with @track makes it private and reactive. To mark a property public and reactive, decorate it with @api
     */
    @track name = 'iiii!';
    firstName = 'Rohit';
    lstName = 'Pal';
    contacts = [
        {
            Id: '003171931112854375',
            Name: 'Amy Taylor',
            Title: 'COO',
        },
        {
            Id: '003192301009134555',
            Name: 'Michael Jones',
            Title: 'CTO',
        },
        {
            Id: '003848991274589432',
            Name: 'Jennifer Wu',
            Title: 'CEO',
        },
    ];
    changeName(event){
        this.name = event.target.value;
    }
    get uppercasedFullName(){
        const fullName = `${this.firstName} ${this.lastName}`; 
        return fullName.trim().toUpperCase();
    }
}