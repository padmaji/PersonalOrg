import { LightningElement, wire } from 'lwc';
//import hm_Name from '@salesforce/schema/Hiring_Manager__c.Name';
//import hm_Email from '@salesforce/schema/Hiring_Manager__c.Email_Address__c';
import gethr from '@salesforce/apex/GetHiringManagerrecords.gethmrecords';

//const colms=[hm_Name,hm_Email];
const colms=[
    {
        label:"Account Name",fieldName:'Name',type:'text'
    },
    {
        label:'Account email',fieldName:'Email_Address__c',type:'text'
    }
]

export default class Rp_session_ex_4 extends LightningElement {

    cols=colms;

    @wire(gethr) rp;

    onrowchange(event)
    {
        var e=event.detail.selectedRows;

        console.log('selected is',JSON.stringify(e));
    }
   

}