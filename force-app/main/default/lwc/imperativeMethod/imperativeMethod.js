import { LightningElement ,track} from 'lwc';
import getAccountDetails from '@salesforce/apex/FootballAccountData.getAccountDetails';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import {CloseActionScreenEvent} from "lightning/actions";
const columns=[
    {label : "Account Id",fieldName : "Id",type : "text" },
    {label : "Account Name" ,fieldName : "Name", type : "text"}
]
export default class ImperativeMethod extends LightningElement {
    @track columns=columns;
    searchName='';
    @track data=[];
    handleSearch(event){
        this.searchName=event.target.value;
        getAccountDetails({name : this.searchName})
        .then(res=>{
            this.data=res;
            
        })
        .catch(error=>{
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error finding Contacts',
                    message: 'Error in finding contacts',
                    variant: 'error'
                })
            );
        });
        
    }

}