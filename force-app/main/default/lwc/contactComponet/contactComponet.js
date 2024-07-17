import { LightningElement, track } from 'lwc';
import getAllContactAndAccountName from "@salesforce/apex/AccountDetailsController.getContactListBasedOnName";
import getContactDetails from "@salesforce/apex/AccountDetailsController.getContactDetails";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ContactComponent extends LightningElement {
    @track data = [];
    @track name = '';
    @track showTable = false;
    @track buttonLabel = 'Show';
    @track selectedRecordDetails = null;
    @track columns = [
        { label: 'Contact Name', fieldName: 'Name', type: 'text' },
        { label: 'Account Name', fieldName: 'AccountName', type: 'text' }
    ];

    handleInputChange(event) {
        this.name = event.target.value;
        if (this.name) {
            getAllContactAndAccountName({ contactName: this.name })
                .then(res => {
                    this.data = res;
                })
                .catch(error => {
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Error finding Contacts',
                            message: error.body.message,
                            variant: 'error'
                        })
                    );
                });
        } else {
            this.data = [];
        }
    }

    handleButtonClick() {
        this.showTable = !this.showTable;
        this.buttonLabel = this.showTable ? 'Hide' : 'Show';
    }

    handleRowSelection(event) {
        const selectedRows = event.detail.selectedRows;
        if (selectedRows.length > 0) {
            const contactId = selectedRows[0].Id;
            getContactDetails({ contactId: contactId })
                .then(res => {
                    this.selectedRecordDetails = res;
                })
                .catch(error => {
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Error fetching Contact Details',
                            message: error.body.message,
                            variant: 'error'
                        })
                    );
                });
        } else {
            this.selectedRecordDetails = null;
        }
    }
}

