using Microsoft.AspNetCore.Mvc;
using ProductListing.Models;
using System.Diagnostics;

namespace ProductListing.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }
        DatabaseProduct objDatabaseProduct = new DatabaseProduct();
        public IActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult GetProductList(JQueryDataTableParamModel param, string Name, string IsAvailable, string IsBestSeller)
        {
            try
            {
                IEnumerable<string[]> obj = Enumerable.Empty<string[]>();
                int noOfRecords;
                var SortOrderString = param.sColumns.Split(',');
                param.iSortCol_0 = SortOrderString[Convert.ToInt32(param.iSortCol_0)];
                List<ProductListModel> list = objDatabaseProduct.GetProductList(param, Name, IsAvailable, IsBestSeller, out noOfRecords);
                obj = from c in list
                      select new[]
                      {
                        Convert.ToString(c.ProductID), 
                        c.ProductName,
                        Convert.ToString(c.Price),
                        Convert.ToString(c.Qauntity)
                      };

                return Json(new
                {
                    sEcho = param.sEcho,
                    iTotalRecords = noOfRecords,
                    iTotalDisplayRecords = noOfRecords,
                    aaData = obj
                });
            }
            catch (Exception) { throw; }
        }

        [Route("product/add-edit-product")]
        [HttpGet]
        public ActionResult AddEditProduct(int ProductID)
        {
            AddEditProductViewModel addEditProductModel = new AddEditProductViewModel();

            GetProductDetailsById getProductDetailsById = objDatabaseProduct.GetProductDetailsById(ProductID);
            if (getProductDetailsById != null)
            {
                addEditProductModel.ProductID = ProductID;
                addEditProductModel.Name = getProductDetailsById.ProductName;
                addEditProductModel.Price = getProductDetailsById.Price;
                addEditProductModel.Qauntity = getProductDetailsById.Qauntity;
            }
            else
            {
                ViewBag.IsReadOnlyClass = "";
            }
            return View("_AddEditProduct", addEditProductModel);
        }
         
        [HttpPost]
        [Route("product/add-edit-product")]
        public IActionResult AddEditProduct(AddEditProductViewModel addEditProuctViewModel, IFormFile ImageName)
        {
            try
            {
                if (addEditProuctViewModel.ProductID > 0)
                {
                     

                    AddEditProductResponse addEditProductResponse = new AddEditProductResponse();
                    addEditProductResponse = objDatabaseProduct.AddEditProduct(addEditProuctViewModel);
                    if (addEditProductResponse.status == 201)
                    {
                        return RedirectToAction("Index", new { Status = addEditProductResponse.status });
                    }
                    else
                    {
                        return View("_AddEditProduct", addEditProuctViewModel);
                    }
                }
                else
                {
                     
                    AddEditProductResponse addEditProductResponse = new AddEditProductResponse();
                    addEditProductResponse = objDatabaseProduct.AddEditProduct(addEditProuctViewModel);
                    if (addEditProductResponse.status == 200)
                    {
                        return RedirectToAction("Index", new { Status = addEditProductResponse.status });
                    }
                    else
                    {
                        return View("_AddEditProduct", addEditProuctViewModel);
                    }
                }


            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public ActionResult DeleteProduct(int ProductID)
        {
            try
            {
                DeleteProductResponse DeleteProductResponse = new DeleteProductResponse();
                DeleteProductResponse = objDatabaseProduct.DeleteProduct(ProductID);
                //return RedirectToAction("Index", new { Status = DeleteProductResponse.AllowToDelete });
                return Json(new { result = DeleteProductResponse });
            }
            catch
            {
                throw;
            }
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
