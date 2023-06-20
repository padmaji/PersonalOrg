import { LightningElement,api,wire } from 'lwc';
import accountmethod from '@salesforce/apex/rpsession4_Ex2_Account.account_rpsession4_Ex2_Account';

const col=[
    {label:'Account Name',fieldName:'Name',type:'text'},
    {label:'Account Phone',fieldName:'Phone',type:'text'},
    {label:'Account fax',fieldName:'Fax',type:'text'},
    {label:'Account_Industry' ,fieldName:'Industry',type:'text'}
]
export default class Rp_session4_example2 extends LightningElement {
colm=col;
    @wire(accountmethod) acc;

}