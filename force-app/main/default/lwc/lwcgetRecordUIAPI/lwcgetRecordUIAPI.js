import { LightningElement, api, wire } from 'lwc';
import {getRecord, createRecord} from 'lightning/uiRecordApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import Name_Field from '@salesforce/schema/Account.Name';
export default class LwcgetRecordUIAPI extends LightningElement {
    @api recordId;

    @wire(getRecord, {recordId : '$recordId', layoutTypes : ['Full' , 'Compact'], 
                    modes : ['View' , 'Edit', 'Create']})
        wireRecord({data, error}){
            if(data){
                console.log('Data -- ' , data);
                const scompany = data.fields.Company.value;
                console.log('Data --  scompany' , scompany);
            }
            if(error){
                console.log('Error -- ', error);
            }
        }

        handleCreate(){
            const fields ={};
            console.log('Name_Field -- ' + Name_Field);
            fields[Name_Field.fieldApiName] = 'Rohit Get API Record';
            console.log('ACCOUNT_OBJECT -- ' + ACCOUNT_OBJECT);
            const accountRecord= {apiName : ACCOUNT_OBJECT.objectApiName, fields : fields};
            createRecord(accountRecord)
            .then(result =>{

                const rId = result.id;
                alert('record iD - ' + rId);
            })
            .catch(error =>{
                console.log('Error -error- ', error);
            })
        }
}