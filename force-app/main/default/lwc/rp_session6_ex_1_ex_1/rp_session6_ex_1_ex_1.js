import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import { NavigationMixin } from 'lightning/navigation';

export default class Rp_session6_ex_1_ex_1 extends NavigationMixin(LightningElement) {

    cname;
    cemail;
    cloc;
    cdesc;
    ccon;

    fNamechange(event)
    {
        this.cname=event.target.value;
    }
    emailchange(event)
    {
this.cemail=event.target.value;

    }
    locchange(event)
    {
        this.cloc=event.target.value;
    }
    deschane(event)
    {
this.cdesc=event.target.value;
    }
    conchange(event)
    {
    this.ccon=event.target.value;
    }
    saveme(event)
    {
    const fields={'ContactNumber__c':this.ccon,'Designation__c':this.deschane,'Email_Address__c':this.cemail,'Name':this.cname,'Location__c':this.cloc};
    const recordInput={apiName:'Hiring_Manager__c',fields};
    createRecord(recordInput).then(response=>{
        alert('HiringManagerrr record created succesfully'+response.id);
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: response.id,
                objectApiName: 'Hiring_Manager__c',
                actionName: 'view'
            },
        });
    }).catch(error=>{
        alert('Hiring manger record did created');
    });
}


}