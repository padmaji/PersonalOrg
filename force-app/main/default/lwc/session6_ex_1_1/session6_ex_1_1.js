import { LightningElement, track, wire } from 'lwc';
import contact_FirstName from '@salesforce/schema/Contact.FirstName';
import contact_LastName from '@salesforce/schema/Contact.LastName';
import getcontacts from '@salesforce/apex/session6_Ex_1_Apex.getcontacts';
import { updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';

const col=[
    {label:'Contact_FirstName',fieldName:'FirstName',type:'text',editable:true},
    {label:'Contact_LastName',fieldName:'LastName',type:'text',editable:true},
    {label:'Contact_Email',fieldName:'Email',type:'email'},
    {label:'Contact_Phone',fieldName:'Phone',type:'phone'}
]

export default class Session6_ex_1_1 extends LightningElement {
column=col;
 newval=[];
@wire(getcontacts,{searchkey:'$txt'}) res;
txt;
onChange(event)
{
this.txt=event.target.value;
}  
savingrec(event)
{
    console.log('Saving the record started ok')
    this.newval=event.detail.draftValues;
 const recor=this.newval.slice().map((draft)=>{
    console.log('draft value',draft,'----',typeof(draft));
    const fields=Object.assign({},draft);
    return {fields};
    console.log('recor',recor);
 });


  const pro=recor.map(re=>
    updateRecord(re));
 Promise.all(pro).then(response=>{
const ev=new ShowToastEvent({
    title:'success',
    message:'Contacts update',
    variant:'success'

});
console.log('Toast message is displayed before');
this.dispatchEvent(ev);
console.log('Toast message is displayed after');
this.newval=[];
console.log('new value',this.newval);
//return refreshApex(this.res);
return this.refresh();

}).catch(error=>{
    const ev=new ShowToastEvent({
        title:'Error',
        message:error.body.message,
        variant:'destructive'


});
this.dispatchEvent(ev);
this.newval=[];
console.log('new value',this.newval);
//return refreshApex(this.res);
return this.refresh();
});
}
async refresh()
{
    console.log('refresh called');
    await refreshApex(this.res);
}
}