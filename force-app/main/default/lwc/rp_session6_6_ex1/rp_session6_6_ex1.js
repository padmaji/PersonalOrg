import { LightningElement,wire } from 'lwc';
import getsoslresult from '@salesforce/apex/soslclass.getsoslresult';

const col=[
    {label:"Account Name",fieldName:"Name",type:"text",editable:true},
    {label:"Account phone",fieldName:"Phone",type:"phone",editable:true},
    {label:"Account Industry",fieldName:"Industry",type:"text",editable:true}
]
export default class Rp_session6_6_ex1 extends LightningElement {

    colm=col;
    searchtext;
    ontxtchange(event)
    {
        this.searchtext=event.target.value;
    }
    @wire(getsoslresult,{searchk:'$searchtext'}) rp;




}