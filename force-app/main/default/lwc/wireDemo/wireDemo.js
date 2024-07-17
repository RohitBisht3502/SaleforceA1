import Field from '@salesforce/schema/AccountHistory.Field';
import { LightningElement,wire,track } from 'lwc';
import getAccountDetails from "@salesforce/apex/FootballAccountData.getAccountDetails";
import getDetailsBasedOnName from "@salesforce/apex/AccountDetailsController.getAccountListBasedOnName";
const columns = [
    {label : 'Name' , fieldName: "Name"},
    {label : 'Account Id',fieldName : 'Id'}
]
export default class WireDemo extends LightningElement {
    @track columns=columns;
    @track data=[];
    name = 'ac';

    @wire(getAccountDetails)
    accountDetails({data,error}){
        if(data){
            this.data=data;
        }else if(error) console.log("error occured")
    }

    getAccountsBasedOnName() {
        getDetailsBasedOnName({accName : this.name})
        .then(res => {
            debugger;
        })
        .catch(error => {
            debugger;
        });
    }
} 