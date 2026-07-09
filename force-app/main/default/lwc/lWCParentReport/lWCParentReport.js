import { LightningElement } from 'lwc';
import recordData from '@salesforce/apex/LWCParentReport.getAccountDetails';
export default class LWCParentReport extends LightningElement {
    inputText = '';
    accounts  = [];
    handleChange(event) {
        this.inputText = event.target.value;
        recordData({ accId: this.inputText })
            .then(result => {
                this.accounts = result;
                console.log('--->',result);
            })
            .catch(error => {
                this.error = error;
                console.log('--->',error);
            });
    }
}