using System.Collections.Generic;
using System.Data.Entity;
using EfDemo.Properties;
using EfDemo.Utils;

namespace EfDemo.DbContext
{
  internal class AppDbInitializer : DropCreateDatabaseAlways<AppDbContext>
  {
    protected override void Seed(AppDbContext context)
    {
      base.Seed(context);

      var scripts = DbUtils.EscapeSqlGoStatements(Resources.create_tables_v1_0);
      ExecuteSqlCommands(context, scripts);

      var initialData = DbUtils.EscapeSqlGoStatements(Resources.InitialData_v1_0);
      ExecuteSqlCommands(context, initialData);
    }
    private static void ExecuteSqlCommands(AppDbContext dbContext, IEnumerable<string> escapedSqlScripts)
    {
      foreach (var sqlBlock in escapedSqlScripts)
      {
        if (!string.IsNullOrEmpty(sqlBlock))
        {
          dbContext.Database.ExecuteSqlCommand(sqlBlock);
        }
      }
    }
  }
}
