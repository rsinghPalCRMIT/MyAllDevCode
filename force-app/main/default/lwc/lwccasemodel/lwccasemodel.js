import { LightningElement } from 'lwc';

export default class Lwccasemodel extends LightningElement {
    subject;
    description;
    statusVal;
    originVal;
    priortyVal;

    handleChange(event){

        let name = event.target.name;
        let val = event.target.value;
        if(name == 'subject'){
            this.subject = val;
        }
    }
    get status() {
        return [
            { label: 'New', value: 'New' },
            { label: 'Closed', value: 'Closed' },
        ];
    }

    get origin() {
        return [
            { label: 'web', value: 'Web' },
            { label: 'phone', value: 'Phone' },
            { label: 'email', value: 'Email' },
        ];
    }
    get priorty() {
        return [
            { label: 'high', value: 'High' },
            { label: 'low', value: 'Low' },
        ];
    }
    handleCreate(){

    }
}