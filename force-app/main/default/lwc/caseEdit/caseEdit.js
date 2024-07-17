import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CASE_APINAME from '@salesforce/schema/Case';
import CASE_SUBJECT from '@salesforce/schema/Case.Subject';
import CASE_STATUS from '@salesforce/schema/Case.Status';
import CASE_DESCRIPTION from '@salesforce/schema/Case.Description';
import CASE_ID from '@salesforce/schema/Case.Id';

export default class CaseEdit extends LightningElement {
    objectApiName = CASE_APINAME;
    fieldSubject = CASE_SUBJECT;
    fieldStatus = CASE_STATUS;
    fieldDescription = CASE_DESCRIPTION;
    fieldId = CASE_ID;

    handleSuccess(event) {
        this.fieldId=event.detail.id;
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Case updated successfully. Record ID: ' + event.detail.id,
                variant: 'success'
            })
        );
    }
}
