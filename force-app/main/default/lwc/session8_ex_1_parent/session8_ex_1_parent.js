import { LightningElement } from 'lwc';

export default class Session8_ex_1_parent extends LightningElement {

ctrl='wiating for the button';
vol=0;
constructor()
{
    super();
    this.template.addEventListener('Increase',this.handleincrease.bind(this));
    this.template.addEventListener('decrease',this.handledecrease.bind(this));
}
handleincrease(event)
{
    this.ctrl=event.detail;  
if(this.vol>=0 && this.vol<=100)
{
this.vol=this.vol+1;
}
}
handledecrease(event)
{
    this.ctrl=event.detail;
if(this.vol>0 && this.vol<=100)
{
this.vol=this.vol-1;
}
}

}