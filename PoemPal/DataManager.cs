using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Web.Configuration;

namespace PoemPal
{
    // class to manage the data
    public static class DataManager
    {

        // key for the dataset in cache
        public static string CacheKey = "ContentDataSet";
        // connection string
        public static string ConnectionStr = WebConfigurationManager.ConnectionStrings["DatabaseCon"].ConnectionString;

        // cache instance
        public static Cache Cache = HttpRuntime.Cache;

        // lock object to ensure thread safety while retrieving the dataset
        private static readonly object lockHelper = new object();

        // lock object to ensure thread safety while updating the db and caching
        private static readonly object lockDb = new object();

        // method to retrieve data from cache
        // if not in cache, retrieve from DB and set in cache
        public static DataSet GetFromCacheOrDatabase()
        {

            lock (lockHelper)
            {
                // check if it is in cache
                if (Cache[CacheKey] == null)
                {
                    // not in cache
                    // get from database
                    return GetFromDatabase();

                }
                else
                {
                    // present in cache
                    Debug.WriteLine("getting from cache");
                    return (DataSet)Cache[CacheKey];
                }
            }
            
        }

        // method to retrieve from database and set in cache
        public static DataSet GetFromDatabase()
        {

            // will let only one thread to retrieve from db
            // others will wait till retrieved, and then use the value

            // invalidate the data in cache
            Cache.Remove(CacheKey);

            lock(lockDb)
            {
                if(Cache[CacheKey] == null)
                {

                    // only the first thread to lock will come here

                    // log
                    Debug.WriteLine("getting from db");
                    
                    // connection object
                    SqlConnection con = new SqlConnection(ConnectionStr);
                    SqlCommand cmd = con.CreateCommand();
                    cmd.CommandText = "SELECT C.Id, C.Title, C.Type, U.Name as Author, C.Date, C.Content " +
                         "FROM Content C " +
                         "INNER JOIN Users U ON U.Id = C.Author";

                    // sql data adapter
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);

                    DataSet ds = new DataSet();

                    // open the connection
                    con.Open();
                    // fill
                    adapter.Fill(ds, "Content");
                    // close
                    con.Close();

                    // set in cache
                    Cache[CacheKey] = ds;

                    return ds;
                }
                else
                {

                    // log
                    Debug.WriteLine("getting from cache");

                    // others will return directly, since the first thread will set in cache
                    return (DataSet)Cache[CacheKey];
                }
            }

        }

        // method to insert content and update cache
        // will return the id of newly inserted content
        public static int InsertContentAndUpdateCache(string type, string title, string content, DateTime date, int author)
        {

            Debug.WriteLine("Inserting into DB");

            // connection
            SqlConnection con = new SqlConnection(ConnectionStr);

            // command
            SqlCommand cmd = con.CreateCommand();

            cmd.CommandText = "INSERT Into Content (Type, Title, Content, Date, Author) VALUES (@type, @title, @content, @date, @author) SELECT SCOPE_IDENTITY();";

            cmd.Parameters.AddWithValue("@type", type);
            cmd.Parameters.AddWithValue("@title", title);
            cmd.Parameters.AddWithValue("@content", content);
            cmd.Parameters.AddWithValue("@date", date);
            cmd.Parameters.AddWithValue("@author", author);

            con.Open();

            int id = Convert.ToInt32(cmd.ExecuteScalar());

            // update the cache
            GetFromDatabase();

            return id;

        }

    }
}