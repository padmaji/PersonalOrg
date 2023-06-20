import { LightningElement, wire,track } from 'lwc';
import getcontacts from '@salesforce/apex/session6_Ex_1_Apex.getcontacts';
import Id_field from '@salesforce/schema/Contact.Id';
import FirstName from '@salesforce/schema/Contact.FirstName';
import LastName from '@salesforce/schema/Contact.LastName';
import { updateRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


const col=[
{label:'Contact FirstName',fieldName:'FirstName',type:'text',editable:true},
{label:'Contact LastName',fieldName:'LastName',type:'text',editable:true},
{label:'Contact Email',fieldName:'Email',type:'email'},
{label:'contact Phone',fieldName:'Phone',type:'phone'}
]
export default class Session_6_Ex_1 extends LightningElement {

colum=col;
input;
    draftValues=[];
@wire(getcontacts,{searchkey:'$input'}) res;

onlabelChange(event)
{
this.input=event.target.value;
}
onSave(event)
{

    const fields={}

    fields[Id_field.fieldApiName]=event.detail.draftValues[0].Id;
    fields[FirstName.fieldApiName]=event.detail.draftValues[0].FirstName;
    fields[LastName.fieldApiName]=event.detail.draftValues[0].LastName;

    const recordData={fields};

    updateRecord(recordData).then(Response=>{
        const event = new ShowToastEvent({
            title: 'Record Updated Successfully',
            message: 'Your changes were successfully updated',
            variant:'success'
           });
        this.dispatchEvent(event);

        this.draftValues=[];
        return refreshApex(this.res);
    }).catch(error=>{
        const event = new ShowToastEvent({
            title: 'Update failed',
            message: 'Your changes were not updated',
            variant:"error"
           
        });
        this.dispatchEvent(event);
        this.draftValues=[];
        return refreshApex(this.res);

    });

}


}