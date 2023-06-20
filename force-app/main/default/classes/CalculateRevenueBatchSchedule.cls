global class CalculateRevenueBatchSchedule implements system.Schedulable
{
  global void Execute(system.SchedulableContext scontext)
  {
      CalCulateTotalAccountRevenue Acc=new CalCulateTotalAccountRevenue();
          database.executeBatch(Acc,5);
      }

}