import { LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getDetailsBasedOnName from "@salesforce/apex/AccountDetailsController.getAccountListBasedOnName";
import deleteAccountsByIds from "@salesforce/apex/AccountDetailsController.deleteAccountsByIds";
import { RefreshEvent } from "lightning/refresh";

export default class AccountComponent extends LightningElement {
    @track data = [];
      name = '';
    @track columns = [
        {label: 'Name', fieldName: 'Name', type: 'text'},
        {label: 'Account Id', fieldName: 'Id', type: 'text'}
    ];
    @track selectedAccountIds = [];

   /* changeHandler(event) {
        this.name = event.target.value;
    } */

    getAccountsBasedOnName(event) {
        this.name=event.target.value;
        debugger;
        getDetailsBasedOnName({ accName: this.name })
            .then(res => {
                if (this.name) {
                    this.data = res;
                } else {
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: "Unsuccessful:",
                            message: "Search with names",
                            variant: 'warning'
                        })
                    );
                }
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error finding accounts',
                        message: 'Error in finding accounts',
                        variant: 'error'
                    })
                );
            });
    }

    rowHandler(event) {
        const rows = event.detail.selectedRows;
        //this.selectedAccountIds=rows.Id;
        this.selectedAccountIds = rows.map(row => row.Id);
        
    }
    

    deleteAccountBasedOnId() {
        if (this.selectedAccountIds.length > 0) {
            deleteAccountsByIds({ accountIds: this.selectedAccountIds })
                .then(() => {
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Success',
                            message: 'Accounts deleted successfully',
                            variant: 'success'
                        })
                        
                    );
                    
                   // window.location.reload();
                    this.getAccountsBasedOnName();
                
                })
                .catch(error => {
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Error',
                            message: "Not deleting Accounts",
                            variant: 'error'
                        })
                    );
                });
        }
    }
}
