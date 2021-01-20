import { LightningElement, track } from 'lwc';
import insertAccountRecord from '@salesforce/apex/insertAccountController.insertAccountRecord';
// importing student object record
import Student_NAME from '@salesforce/schema/Student__c.Name';
import Student_Is_Travel_Required from '@salesforce/schema/Student__c.Is_Travel_Required__c';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class InsertAccountlwc extends LightningElement {
    @track message;
    @track error;
    // add the info in the track variable
    @track name = Student_NAME;
    @track isTravelRequired = Student_Is_Travel_Required

    studentRecord = {
        Name : this.Name,
        Is_Travel_Required__c : this.Student_Is_Travel_Required
    }

    handleNameChange(event){
        this.studentRecord.Name = event.target.value
    }

    handleTravelChange(event){
        this.studentRecord.Is_Travel_Required__c = event.target.value
    }

    handleClick(){
        insertAccountRecord({studentRecord : this.studentRecord})
        .then(result =>{
                this.message = result
                this.error = undefined
                if(this.message != undefined){
                    this.studentRecord.Name = ''
                    this.studentRecord.Is_Travel_Required__c = ''
                    this.dispatchEvent(
                        new ShowTestEvent({
                            title : 'Success',
                            message : 'Student Crated',
                            variant: 'success',
                        }),
                    );
                }
            }
        )
        .catch(error => {
            this.message = undefined
            this.error = error
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error creating record',
                    message: error.body.message,
                    variant: 'error',
                })
            );
        })
    }
}