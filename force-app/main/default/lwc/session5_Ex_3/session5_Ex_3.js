import { LightningElement, wire } from 'lwc';
import getcontacts from '@salesforce/apex/session5_Ex_3.getcontacts';

const Fiel=[
    {label:'Contact FirstName', fieldName:'FirstName',type:'text'},
    {label:'Contact LastName',fieldName:'LastName',type:'text'},
    {label:'Email',fieldName:'Email',type:'email'},
    {label:'Phone',fieldName:'Phone',type:'phone'}
]
export default class Session5_Ex_3 extends LightningElement {

colm=Fiel;
searchinp;
onchange(event)
{
this.searchinp=event.target.value;
}

@wire(getcontacts,{searchkey:'$searchinp'}) res;
}