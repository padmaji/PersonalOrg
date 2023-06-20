//This class is used for updating the status filed for previous records
public class PositionHelper 
{
    public static void GetRecordswhichexceedsmilstonne()
    {
        List<Position__c> lstpos=[select id,Name,PositionStatus__c,MileStoneDate__c,LastModifiedDate from position__c where LastModifiedDate<Today and MileStoneDate__c<Today and PositionStatus__c!='closed'];
        if(!lstpos.isEmpty())
        {
           for(Position__C pos:lstpos)
            {
              pos.PositionStatus__c='Closed'; 
            }
            Database.SaveResult[] dbsave= database.update(lstpos, False);
            
            for( Database.SaveResult eachdbsave:dbsave)
            {
                system.debug('Status changed to closed...:'+eachdbsave.getid());
            }
        }
    }
    }