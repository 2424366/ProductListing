using Microsoft.Data.SqlClient;
using System.Data;
namespace ProductListing.Models
{
    public class DatabaseProduct
    {
        #region Product 
        public List<ProductListModel> GetProductList(JQueryDataTableParamModel param, string Name, string IsAvailable, string IsBestSeller, out int noOfRecords)
        {
            List<ProductListModel> productListModel = new List<ProductListModel>();
            using (SqlConnection con = new SqlConnection(Common.DBConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("usp_GetProductGrid", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Search", SqlDbType.NVarChar, 100)).Value = Name;
                    cmd.Parameters.Add(new SqlParameter("@DisplayStart", SqlDbType.Int)).Value = param.iDisplayStart;
                    cmd.Parameters.Add(new SqlParameter("@PageSize", SqlDbType.Int)).Value = param.iDisplayLength;
                    cmd.Parameters.Add(new SqlParameter("@SortColumnName", SqlDbType.VarChar, 50)).Value = param.iSortCol_0;
                    cmd.Parameters.Add(new SqlParameter("@SortOrder", SqlDbType.VarChar, 50)).Value = param.sSortDir_0;
                    con.Open();
                    SqlParameter resultOutPut = new SqlParameter("@noOfRecords", SqlDbType.VarChar);
                    resultOutPut.Size = 50;
                    resultOutPut.Direction = ParameterDirection.Output;
                    cmd.Parameters.Add(resultOutPut);
                    using (IDataReader dataReader = cmd.ExecuteReader())
                    {
                        productListModel = UserDefineExtensions.DataReaderMapToList<ProductListModel>(dataReader);
                    }
                    noOfRecords = Convert.ToInt32(cmd.Parameters["@noOfRecords"].Value);
                    con.Close();
                }
            }
            return productListModel;
        }
        public GetProductDetailsById GetProductDetailsById(int ProductID)
        {
            GetProductDetailsById getProductDetailsById = new GetProductDetailsById();
            try
            {
                using (SqlConnection con = new SqlConnection(Common.DBConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("usp_GetProductDetailsById", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ProductID", ProductID);
                        con.Open();
                        using (IDataReader datareader = cmd.ExecuteReader())
                        {
                            getProductDetailsById = UserDefineExtensions.DataReaderMapToEntity<GetProductDetailsById>(datareader);
                        }
                        con.Close();
                    }
                }
                return getProductDetailsById;
            }
            catch
            {
                throw;
            }
        }
      

        public AddEditProductResponse AddEditProduct(AddEditProductViewModel addEditProductViewModel)
        {
            try
            {
                AddEditProductResponse addEditProductResponse = new AddEditProductResponse();
                using (SqlConnection con = new SqlConnection(Common.DBConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("usp_AddEditProduct", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ProductID", addEditProductViewModel.ProductID);
                        cmd.Parameters.AddWithValue("@ProductName", addEditProductViewModel.Name);
                        cmd.Parameters.AddWithValue("@Price", addEditProductViewModel.Price);
                        cmd.Parameters.AddWithValue("@Qauntity", addEditProductViewModel.Qauntity);
                        con.Open();
                        using (IDataReader datareader = cmd.ExecuteReader())
                        {
                            addEditProductResponse = UserDefineExtensions.DataReaderMapToEntity<AddEditProductResponse>(datareader);
                        }
                        con.Close();
                    }
                    return addEditProductResponse;
                }
            }
            catch
            {
                throw;
            }
        }

        public DeleteProductResponse DeleteProduct(int ProductID)
        {
            DeleteProductResponse deleteProductResponse = new DeleteProductResponse();
            try
            {
                using (SqlConnection con = new SqlConnection(Common.DBConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("usp_DeleteProduct", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ProductID", ProductID);
                        con.Open();
                        using (IDataReader datareader = cmd.ExecuteReader())
                        {
                            deleteProductResponse = UserDefineExtensions.DataReaderMapToEntity<DeleteProductResponse>(datareader);
                        }
                        con.Close();
                    }
                }
                return deleteProductResponse;
            }
            catch
            {
                throw;
            }
        }

        #endregion
    }
}
