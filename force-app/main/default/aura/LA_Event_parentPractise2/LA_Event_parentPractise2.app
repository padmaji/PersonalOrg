<aura:application extends="force:slds">
    <aura:handler name="first" event="c:LE_Event_Practise2" action="{!c.Handle}"/>
    
    <lightning:card title="This is application">
    This is lightning application parent 
    </lightning:card>
    <c:LC_Event_parentPractise2></c:LC_Event_parentPractise2>
</aura:application>