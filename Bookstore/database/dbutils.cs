using System;
using System.Data.OleDb;

namespace Bookstore.database
{
    public class dbutils
    {
        

        public static String connectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=";

        private static OleDbConnection conn = null;
        private static OleDbDataReader reader = null;
        

        public static String openConnection()
        {
            try
            {
                conn = new OleDbConnection(connectionString);
                conn.Open();

            }
            catch (Exception e)
            {
                return e.Message;
            }
            finally
            {
            }

            return "connected";

        }

        public static Object[] executeQuery(String command)
        {
            Object[] pin = new Object[2];

            try
            {
                OleDbCommand cmd =
                new OleDbCommand(command, conn);
                reader = cmd.ExecuteReader();
                pin[1] = reader;


                pin[0] = "success";
            }
            catch (Exception e)
            {
                pin[0] = "error";
                pin[1] = e.Message;
            }

            return pin;
        }

        public static String executeCommand(String command)
        {
            try
            {
                OleDbCommand cmd =
                new OleDbCommand(command, conn);
                cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                return e.Message;
            }
            return "success";
        }

        public static void closeConnection()
        {
            if (reader != null) reader.Close();
            if (conn != null) conn.Close();
        }
    }
}
