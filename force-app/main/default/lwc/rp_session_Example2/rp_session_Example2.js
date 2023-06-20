import { LightningElement } from 'lwc';

export default class Rp_session_Example2 extends LightningElement {

    result;
    greater;
    num1;
    num2;
    num3;
    FNchan(event)
    {
this.num1=parseInt(event.target.value);

    }
    SNchan(event)
    {
this.num2=parseInt(event.target.value);
    }
    TNchan(event)
    {
this.num3=parseInt(event.target.value);
    }

    onAddition()
    {
  this.result=this.num1+this.num2;

    }
    onsubbtraction()
    {
        this.result=this.num1-this.num2; 
    }
    onMultiply()
    {
        this.result=this.num1*this.num2;  
    }
    ondiv()
    {
        this.result=this.num1/this.num2;
    }
    ongreater()
    {
      if(this.num1>this.num2 && this.num1>this.num3)
      {
        this.greater=this.num1;
      }  
      else if(this.num2>this.num3)
      {
        this.greater=this.num2;
      }
      else{
        this.greater=this.num3;
      }
    }
    onclearme()
    {
this.num1=0;
this.num2=0;
this.num3=0;
this.result=0;
this.greater=0;
    }
    
}