import { LightningElement, track,api, wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import fetchMetaListLwc from '@salesforce/apex/Dropdownmenucontroller.fetchMetaListLwc';
//import { createRecord } from 'lightning/uiRecordApi';
import historytracking from '@salesforce/apex/Dropdownmenucontroller.historytracking';
export default class Dropdownmenucontroller extends NavigationMixin(LightningElement) {
@track value = '';
    @track optionarray= [];
    @api citie;
   
    @track selectedLabel;
   

get options() {
     return this.optionarray;
    }
    
    connectedCallback(){
        let input = "Hyderabad"; //this.category;
        
        this.getMethod(input);
    }
   
    
    handleChange(event) {
        //alert('dblab'+dblab);
        
        this.label = event.detail.value;
    
        this.selectedLabel = event.target.options.find(opt => opt.value === event.detail.value).label;
        //this.prelab=this.selectedLabel;
       // alert('prelab'+prelab);
         historytracking({lvalue:event.detail.value,llabel:this.selectedLabel}).then(
            result=>{
                console.log('the rsut is '+result);
            }
        ).catch(error=>{console.log('method error is '+JSON.stringify(error))});

        
     
     //console.log('Event is '+JSON.stringify(event.detail));
      
       //console.log('SELECTED LABEL IS '+ this.selectedLabel);
     //var fields = {'Newurl__c': event.detail.value,'Newvalue__c':this.selectedLabel};
     //var objRecordInput = {'apiName' : 'HistoryTracking__c', fields};
     /*createRecord(objRecordInput).then(response => {
            //alert('History record created with Id: ' +response.id);
        }).catch(error => {
            //alert('Error: ' +JSON.stringify(error));
        });*/
        
         this[NavigationMixin.GenerateUrl]({
           type: 'standard__webPage',
           attributes: {
               url: ''
           }
       }).then(url => {
        
             window.open(this.label, "_self");
          }); 
       }

    getMethod(input){
        fetchMetaListLwc({cities : input}).then(result=> {
            console.log('Result is '+result);
         let arr = [];
         result.forEach(ele => {
            arr.push({ label :ele.Area__c,value :ele.Url__c})
         });
         this.optionarray = arr;
     }).catch(error=>{
        console.log(JSON.stringify(+error));
     })
    }
}