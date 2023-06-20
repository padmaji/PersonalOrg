global class BatchJobfordeletingRecords implements system.Schedulable
{
global void Execute(system.SchedulableContext scontext)
{
   sobjectDeleteHelper sobj = new sobjectDeleteHelper();
   sobj.DeleteAllClosedPositionRecords();
}
}