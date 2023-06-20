import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';

export default class Session5_Ex1 extends LightningElement {

    name;
    phone;
    fax;
    industry;
    Namechange(event)
    {
this.name=event.target.value;
    }
    Phonechange(event)
    {
        this.phone=event.target.value;
    }
    Faxchange(event)
    {
        this.fax=event.target.value;
    }
    industrychange(event)
    {
        this.industry=event.target.value;
    }
    saveClick(event)
    {
        const fields={'Name':this.name,'Phone':this.phone,'Fax':this.fax,'Industry':this.industry};

        const recordData={apiName:'Account',fields};
        
        createRecord(recordData).then(response=>{
            alert('Account record created successully'+response.id);
        }).catch(error=>{
            alert('Error got created '+error.body.message);
        });
        

    }
   

}