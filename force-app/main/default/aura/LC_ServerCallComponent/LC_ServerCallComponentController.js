({
    
    showMessage : function(component,event,helper)
    {
        var callingMethodfromApex=component.get("c.ShowMessage");
        callingMethodfromApex.setCallback(this,function(response)
                                          {
                                           var apexresult=response.getState();
                                              if(apexresult==='SUCCESS')
                                              {
                                                  var outputresult=response.getReturnValue();
                                                  component.set("v.result",outputresult);
                                                  console.log('successfully executed');
                                                  
                                              }
                                              else
                                              {
                                                  console.log('failed');
                                              }
                                          })
        $A.enqueueAction(callingMethodfromApex);
    }
})