import { LightningElement, wire } from 'lwc';
import myaccList from '@salesforce/apex/Session4_Ex3_Apex.myaccList';

const cols=[

    {label:'Account Name',fieldName:'Name',type:"text"},
    {label:'Account Fax',fieldName:'Fax',type:"phone"},
    {label:'Account Phone',fieldName:'Phone',type:'Phone'},
    {label:'Account Industry',fieldName:'Industry',type:'text'},
    {label:'Account Rating',fieldName:'Rating',type:'Phone'}
]

export default class Session4_Ex4 extends LightningElement {
    colm=cols;
    @wire(myaccList) acclst;
}