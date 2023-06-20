import { LightningElement,wire,api } from 'lwc';
import { getRecord,getFieldValue } from 'lightning/uiRecordApi';
import getallsegment from '@salesforce/apex/PC_GetSegment.getALLSegmentData';
import getallcurrency from '@salesforce/apex/PC_GetSegment.getALLcurrencyData';
import getallPlexos from '@salesforce/apex/PC_GetSegment.getALLPlexos';
import getallSegmentSizeDetailsc from '@salesforce/apex/PC_GetSegment.getallSegmentSizeDetailsc';
import 	OpportunityId_field from '@salesforce/schema/Quote.OpportunityId';

const FIELDS=['Opportunity.Customer__c'];

export default class Personalcalculator extends LightningElement {

segmentoptions=[];
vallicensediscount='0%';
currencyoptions=[];
plexosoptions=[];
@api recordId;
segmentvalue;
segmentmetricmap=new Map();
currentDate
quotedata;
segmentIdmap=new Map();
oppIDvalue;
OppId;
segmentIdvalue;
inpsizevalue=0;
stylewidth=0;
sizevalue=[];
size=[];
//progreebarminvalue;
progreebarmaxvalue;
customerid;
currencyval;
analystsuservalue;
analystsusers=[];
 
get todaydate()
{
    const date = new Date();

let day = date.getDate();
let month = date.getMonth() + 1;
let year = date.getFullYear();

// This arrangement can be altered based on how we want the date's format to appear.
 this.currentDate = `${day}-${month}-${year}`;
return this.currentDate;

}
get useranalysts()
{
    let numberInc={};
    for(let i=0;i<=50;i++)
    {
        numberInc['label']=i;
        numberInc['value']=i;
this.analystsusers.push(numberInc);
    }
    return this.analystsusers;
}
get gquotedata()
{
this.quotedata='Customer_'+this.currentDate;
             return this.quotedata;
    
}




@wire(getRecord,{recordId:'$recordId',fields:[OpportunityId_field]})
quotedata({data,error}){

    if(data)
    {
        console.log('quotedata');
        //console.log(data.fields.OpportunityId.value);
        this.OppId=data.fields.OpportunityId.value
    }
};
@wire(getRecord,{recordId:'$OppId',fields:FIELDS})
customerid({data,error}){
    if(data)
    {
        console.log('custmerId');
        console.log(data.fields.Customer__c.value);
        this.customerid=data.fields.Customer__c.value;
console.log(this.customerid);
    }
}

// get OppId()
// {
//     //console.log('Opportunit id');
// //console.log(this.quotedata.data);
// console.log('oppid is called');
// console.log(this.quotedata.data);
//     //this.oppIDvalue=getFieldValue(this.quotedata.data,OpportunityId_field);
//     return this.oppIDvalue;
// }
@wire(getallsegment)
allsegmentsData({data,error}){

    if(data)
    {
        let allsegments=[];
         console.log('allsegmentsData');
        //console.log(data);
    for(let eachdat of data)
         {
             const segmtericobject=new Object();
console.log('data');
    
            // console.log(eachdat);
            let localsegarr={};
            localsegarr['label']= eachdat.Name;
            localsegarr['value']= eachdat.Name;
             allsegments.push(localsegarr);
             let segemtmetriid={}
             segemtmetriid.metric=eachdat.Metric__c;
             segemtmetriid.id=eachdat.Id;

this.segmentmetricmap.set(eachdat.Name,segemtmetriid);
//console.log('segmentmetricmap');
//console.log(this.segmentmetricmap);

}
this.segmentoptions=allsegments;
}
}
@wire(getallcurrency)
allcurrenciesData({data,error}){

    if(data)
    {
        let allcurrencies=[];
        //console.log('allcurrenciesData');
        //console.log(data);
        //this.allsegments=data;
        for(let eachdat of data)
        {
           let arrmap={};
           //console.log(eachdat.Label);
           arrmap['label']= eachdat.Label;
           arrmap['value']= eachdat.Label;
     allcurrencies.push(arrmap);


        }
this.currencyoptions=allcurrencies;
        //console.log(this.currencyoptions);
    }
}
@wire(getallPlexos)
allplexosData({data,error}){

    if(data)
    {
        let allplexos=[];
        //console.log('allplexosData');
        //console.log(data);
        //this.allsegments=data;
        for(let eachdat of data)
        {
           let arrmap={};
           console.log(eachdat.Label);
           arrmap['label']= eachdat.Label;
           arrmap['value']= eachdat.Label;
     allplexos.push(arrmap);


        }
this.plexosoptions=allplexos;
        //console.log(this.plexosoptions);
    }
}
  get Auroraoptions() {
        return [
            { label: 'Electric', value: 'Electric' },
            
        ];
    }
    HandleSegmentchange(event)
    {
        
        //console.log(event);
        //console.log(event.detail.value);
this.segmentvalue=event.detail.value;
//console.log(this.segmentmetricmap);
this.metricvalue=this.segmentmetricmap.get(event.detail.value).metric;
//this.segmentIdvalue=this.segmentmetricmap.get(event.detail.value).id;
//console.log('this.segmetric');

//console.log('handleSegmentchnage'+this.metricvalue);

this.getallSegmentSizeDetailsresult(this.segmentmetricmap.get(event.detail.value).id);
    }

    handlesizevalChange(event)
    {
       console.log('handlesizevalChange');
this.inpsizevalue=event.detail.value;
 
}

     getallSegmentSizeDetailsresult(segmentvalue)
    {
this.sizevalue=[];
this.size=[];
         getallSegmentSizeDetailsc({segmentid:segmentvalue}).then(result=>{
             console.log('result');
             console.log(result);
             
             let count=0;
             let arraylength=result.length;
             
             for(let eachresult of result)
             {
               count++;
                 if(arraylength==count)
                 {
                     
                     this.progreebarmaxvalue=eachresult.Size__c;
                     console.log('this.progreebarmaxvalue'+this.progreebarmaxvalue);
                 }
                 
                 console.log(eachresult);
                 this.sizevalue.push(eachresult.Size_Value__c);
                 this.size.push(eachresult.Size__c);
             }
         }).catch(error=>{
             console.log('error');
             console.log(error);
         })
    }
    // @wire(getallSegmentSizeDetailsc,{segmentid:'$segmentvalue'})
    // getallSegmentSizeDetailsresult({data,error}){

    //     if(data)
    //     {
    //         console.log('getallSegmentSizeDetailsresult');
    //         console.log(data);
    //     }
    // };
handleCurrencyChange(event)
{
    this.currencyval=event.detail.value;
    console.log(event.detail.value);
}

}