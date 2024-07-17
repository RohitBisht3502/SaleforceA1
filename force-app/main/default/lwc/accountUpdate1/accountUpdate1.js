import { LightningElement ,api, track} from 'lwc';
import {CloseActionScreenEvent} from "lightning/actions";
import updateAccount from "@salesforce/apex/AccountDetailsController.updateAccountsName";
/*import { updateRecord } from 'lightning/uiRecordApi';
import Id_field from "@salesforce/schema/Account.Id";
import Name_field from "@salesforce/schema/Account.Name"; */

export default class AccountUpdate1 extends LightningElement {


    @api recordId;
    @track userInput

    changeHandler(event){
        this.userInput=event.target.value;
        
    }

    clickHandler(){
        debugger;
        updateAccount({accountId : this.recordId ,updatedName : this.userInput})
        .then(() =>{
            
          
        })
        .catch(error =>{
           this.showToast('Error', error.body.message, 'error');
        })
        this.dispatchEvent(new CloseActionScreenEvent());     
        
    }

   

    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
        });
        this.dispatchEvent(event);
    }
    
    
   /* clickHandler(event){
        const fields={};
        fields[Id_field.fieldApiName]=this.recordId;
        fields[Name_field.fieldApiName]=this.userInput;

        const recordInput={
            fields:fields 
        };

        updateRecord(recordInput)
        .then(res=> {

        }).catch(error=>{

        })
        this.dispatchEvent(new CloseActionScreenEvent());
    } */


}
    