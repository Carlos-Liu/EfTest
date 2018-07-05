using System;
using System.Data.Entity;

namespace EfDemo.DbContext
{
  [DbConfigurationType(typeof(AppDbConfiguration))]
  internal class AppDbContext : System.Data.Entity.DbContext
  {
    static AppDbContext()
    {
      Database.SetInitializer(new AppDbInitializer());
    }

    public AppDbContext()
    : base("DEVELOPER-LOCAL-DB")
    {
      Database.SetInitializer<AppDbContext>(null);
      
      try
      {
        Database.Initialize(true); // immediately initialize and force to recreate DB every time.
      }
      catch (Exception ex)
      {
        System.Diagnostics.Debug.Print("{0}", ex);
      }
    }
  }
}
