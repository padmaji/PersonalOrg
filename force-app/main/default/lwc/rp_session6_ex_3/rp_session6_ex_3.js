import { LightningElement, wire } from 'lwc';
import getcontacts from '@salesforce/apex/rp_session6_ex_3.getcontacts';

const cols=[
    {label:'firstName',fieldName:'FirstName',type:'text'},
    {label:'LASTNAME',fieldName:'LastName',type:'text'},
    {label:'Emaillll',fieldName:'Email',type:'text'}
]
export default class Rp_session6_ex_3 extends LightningElement {

    ssear;
    colm=cols;
    searchtxt(event)
    {
this.ssear=event.target.value;
    }

    @wire(getcontacts,{st:'$ssear'}) rp;


}