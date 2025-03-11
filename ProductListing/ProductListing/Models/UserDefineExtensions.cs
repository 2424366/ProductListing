using System.Data;
using System.Reflection;
using Newtonsoft.Json;

namespace ProductListing.Models
{
    public class UserDefineExtensions
    {
        public static List<T> DataReaderMapToList<T>(IDataReader dr)
        {
            List<T> list = new List<T>();
            T obj = default(T);
            while (dr.Read())
            {
                obj = Activator.CreateInstance<T>();
                foreach (PropertyInfo prop in obj.GetType().GetProperties())
                {
                    ExcludedAttribute MyExcluded = (ExcludedAttribute)Attribute.GetCustomAttribute(prop, typeof(ExcludedAttribute));
                    if (MyExcluded == null && (!object.Equals(dr[prop.Name], DBNull.Value)))
                    {
                        prop.SetValue(obj, dr[prop.Name], null);
                    }
                }
                list.Add(obj);
            }
            return list;
        }
        public static T DataReaderMapToEntity<T>(IDataReader dr)
        {
            T obj = default(T);
            while (dr.Read())
            {
                obj = Activator.CreateInstance<T>();
                foreach (PropertyInfo prop in obj.GetType().GetProperties())
                {
                    ExcludedAttribute MyExcluded = (ExcludedAttribute)Attribute.GetCustomAttribute(prop, typeof(ExcludedAttribute));
                    if (MyExcluded == null && (!object.Equals(dr[prop.Name], DBNull.Value)))
                    {
                        prop.SetValue(obj, dr[prop.Name], null);
                    }
                }
            }

            return obj;
        }

    }
}
