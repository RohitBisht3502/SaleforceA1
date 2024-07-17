import { LightningElement,track,api,wire } from 'lwc';
import getAllAccounts from '@salesforce/apex/AccountDetailsController.getAllAccounts';
import {getAllRelatedOpportunities} from 'lightning/uiRelatedListApi';
import getOpportunityRelatedToAccountId from '@salesforce/apex/AccountDetailsController.getOpportunityRelatedToAccountId';
const columns=[
    {label : 'Name',       fieldName : 'Name'},
    {label : 'Stage Name', fieldName : 'StageName'},
    {label : 'Amount',     fieldName : 'Amount'}
];
export default class AccountAssignment3 extends LightningElement {

    @track value=""; 
    @track options=[]; 
    @track showCard=false;
    @track data=[]; 
    @track columns=columns;

    connectedCallback(){
        getAllAccounts()
        .then(res=>{
            let arr=[];
            for(var i=0;i<res.length;i++){
                arr.push({label :res[i].Name ,value : res[i].Id})
            }
            this.options=arr;
        })
    }


    handlerChange(event){
        this.showCard=true;
        this.value=event.detail.value;
        window.alert("Id is : "+ this.value);
        getOpportunityRelatedToAccountId({selectedAccountId : this.value})
        .then(res=>{
            this.data=res;
        })
        .catch(error=>{
            window.alert("error : "+error);
        })
    }




}