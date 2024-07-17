import { LightningElement, track, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountDetailsController.getAccountListBasedOnName';
import deleteAccounts from '@salesforce/apex/AccountDetailsController.deleteAccountsByIds';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class AccountTest1 extends LightningElement {
    @track accounts = [];
    @track searchKey = '';
    @track selectedAccountIds = [];

    columns = [
        { label: 'Account Name', fieldName: 'Name' }
    ];

    handleSearchChange(event) {
        this.searchKey = event.target.value;
    }

    handleSearch() {
        getAccounts({ searchKey: this.searchKey })
            .then(result => {
                this.accounts = result;
            })
            .catch(error => {
                this.showToast('Error', error.body.message, 'error');
            });
    }

    handleRowSelection(event) {
        const selectedRows = event.detail.selectedRows;
        this.selectedAccountIds = selectedRows.map(row => row.Id);
    }

    handleDelete() {
        if (this.selectedAccountIds.length === 0) {
            this.showToast('Warning', 'Please select at least one account to delete.', 'warning');
            return;
        }

        deleteAccounts({ accountIds: this.selectedAccountIds })
            .then(() => {
                this.showToast('Success', 'Selected accounts have been deleted.', 'success');
                this.handleSearch();
            })
            .catch(error => {
                this.showToast('Error', error.body.message, 'error');
            });
    }

    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
        });
        this.dispatchEvent(event);
    }
}
