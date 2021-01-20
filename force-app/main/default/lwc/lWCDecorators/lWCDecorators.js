import { LightningElement, track, api } from 'lwc';

export default class LWCDecorators extends LightningElement {
    
   @track message = 'Its change now';
   @api messageapi = 'Its show to api property';

   get name(){

        return 'is a getter prop';
   }
    handleChange(event){

        this.message =event.target.value;
        console.log('1111 - ' + event.target.value );
    }
}