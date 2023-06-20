import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';

export default class Rp_session5_ex_1 extends LightningElement {

    fname;
    
    pname;
    iname;

    fnchange(event)
    {
this.fname=event.target.value;
    }
   
    pchange(event)
    {
      this.pname=event.target.value;  
    }
    ionchnage(event)
    {
        this.iname=event.target.value;
    }
    onsave(event)
    {
      const fields={'Name':this.fname,'Phone':this.pname,'Industry':this.iname};
      console.log('Name is'+this.fname   +'  Phone'+this.pname+'  Industry'+this.iname);
      const recordinput={apiName:'Account',fields};
      createRecord(recordinput).then(response=>{
        alert('Account is cretaed succesfully'+response.id);
      }).catch(error=>{
        alert('Account is not created'+error.body.message);
      });
    }
}