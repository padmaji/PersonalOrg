import { LightningElement } from 'lwc';

export default class Session7_ex_4_child extends LightningElement {

    name;
    phone;
    age;
    city;

    firstname(event)
    {
    this.name=event.target.value;
    console.log('firstname label is',event.target.label);

    }
    phone(event)
    {
        this.phone=event.target.value;
    }
    age(event)
    {
       this.age=event.target.value; 
    }
    city(event)
    {
      this.city=event.target.value;  
    }
    onsubmit(event)
    {
        console.log("submit button is clicked in child");
        console.log('submit data in child',this.name,  this.city,  this.age   ,this.phone);
        this.dispatchEvent(new CustomEvent("save",{detail:{en:this.name,ep:this.phone,ea:this.age,ec:this.city}}));
        
    }
}