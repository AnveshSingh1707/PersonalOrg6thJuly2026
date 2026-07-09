import { LightningElement } from 'lwc';
import callApexMethod_JS from '@salesforce/apex/TestLWCParent1Ctrl.callApexMethod';


export default class TestLWCParent1 extends LightningElement {
    rcdId = '';
    handleAdd() {
        callApexMethod_JS().then( result =>{
            console.log(result);
            this.rcdId = result;
        }).error( err => {
            console.log('err---',err);
        });
    }
}