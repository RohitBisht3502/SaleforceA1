import { LightningElement ,track,api} from 'lwc';
// create a button for creating new contact in account
import { createRecord } from 'lightning/uiRecordApi';
import CONTACT_OBJ from '@salesforce/schema/Contact';
import FIRST_NAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LAST_NAME_FIELD from '@salesforce/schema/Contact.LastName';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class AccountAssignment2 extends LightningElement {
    @track firstName='';
    @track lastName='';
    @track email='';
    @track phone='';
    @api recordId;

    handleInputChange(event){
       const field=event.target.label;
        if(field==='First Name'){
            this.firstName=event.target.value;
        }else if(field==='Last Name'){
            this.lastName=event.target.value;
        }else if(field==='Email'){
            this.email=event.target.value;
        }else if(field==='Phone'){
            this.phone=event.target.value;
        }

    }
    clickHandler(){
        const fields={};
        fields[FIRST_NAME_FIELD.fieldApiName]=this.firstName;
        fields[LAST_NAME_FIELD.fieldApiName]=this.lastName;
        fields[EMAIL_FIELD.fieldApiName]=this.email;
        fields[PHONE_FIELD.fieldApiName]=this.phone;
        fields['AccountId']=this.recordId;

        const recordInput={apiName : CONTACT_OBJ.objectApiName,fields};

        createRecord(recordInput)
        .then(res=>{
            this.dispatchEvent(
                new ShowToastEvent({
                    title   : 'Sucess',
                    message : 'Contact Created Successfully',
                    variant  : 'success'

                })
            );
        })
        .catch(error=>{
            this.dispatchEvent(
                new ShowToastEvent({
                    title    : 'Error Creating Contact',
                    message  : error.body.message,
                    variant   : 'error'
                })
            )
        })
    }
}