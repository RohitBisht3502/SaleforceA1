import { LightningElement ,track} from 'lwc';

export default class IfElseLwc extends LightningElement {
    @track onChangeLabel='Show';

    @track showTable=false;
    handlerClick(event){
        const label=event.target.label;
        if(label==='Show'){
            this.onChangeLabel='Hide';
            this.showTable=true;
        }else if(label==='Hide'){
            this.onChangeLabel='Show';
            this.showTable=false;
        }

    }


}