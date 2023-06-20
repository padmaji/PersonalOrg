import { LightningElement } from 'lwc';

export default class Session7_ex_4_parent extends LightningElement {
 
    empname;
    empage;
    empcity;
    empphone;
    evsave(event)
    {
        console.log('evsave is called ');
        
this.empname=event.detail.en;
console.log('empname',this.empname);
this.empage=event.detail.ea;
this.empcity=event.detail.ec;
this.empphone=event.detail.ep;
    }
}