import { LightningElement,wire,track } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import getAllOpportunity from '@salesforce/apex/OpportunityDetailsController.getAllOpportunity';
const columns=[
    {label : 'Name',       fieldName : 'Name',      editable : true},
    {label : 'Stage Name', fieldName : 'StageName', editable : true},
    {label : 'Close Date', fieldName : 'CloseDate', editable : true},
    {label : 'Amount',     fieldName : 'Amount' ,   editable : true}
];
export default class OpportunityInLine extends LightningElement {
    columns=columns;
    @track data=[];
    @track saveDraftValues=[];

    @wire(getAllOpportunity)
    wiredAllOpportunity({data,error}){
        //window.alert('wired called');
        if(data){
            this.data=data;
        }
    }

    handleSave(event){
        const updatedField=event.detail.draftValues;
        updateAccountDetails({accountData : updatedField})
        .then(res=>{
            this.dispatchEvent( new ShowToastEvent({
                title : 'Success',
                message : 'Updated Successfully',
                variant : 'success'
            }))
        })
        .catch(error=>{
            this.dispatchEvent( new ShowToastEvent({
                title : 'Failed',
                message : 'failed',
                variant : 'error'
            })

            )
        })
    }
    
}