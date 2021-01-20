import { LightningElement } from 'lwc';

export default class LWCCalculatorExample extends LightningElement {

    number1;
    number2;
    handlechange(event){

        const val = event.target.value;
        const name = event.target.name;

        if(name === "Input 1"){
            this.number1 = val;
        }else{
            this.number2 = val;
        }
    }
    doSum(){
        
        const totalSum = parseInt(this.number1)  + parseInt(this.number2);
        alert(totalSum);
    }
}