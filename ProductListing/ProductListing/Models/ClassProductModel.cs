using System.ComponentModel.DataAnnotations;

namespace ProductListing.Models
{

    public class ProductListModel
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public decimal Price { get; set; }
        public int Qauntity { get; set; }
    }
    public class AddEditProductViewModel
    {
        public int ProductID { get; set; }

        [Required(ErrorMessage = "Please enter product name")]
        [StringLength(200, ErrorMessage = "Name length can't be more than 200.")]
        [Display(Name = "Name")]
        public string Name { get; set; }
         

        [Required(ErrorMessage = "Please enter price of product")]
        [Display(Name = "Price")]
        public decimal Price { get; set; }

        [Required(ErrorMessage = "Please enter qauntity of product")]
        [Display(Name = "Qauntity")]
        public int Qauntity { get; set; }



    }
    public class GetProductDetailsById
    {
        public int ProductID { get; set; } 
        public string ProductName { get; set; }
        public decimal Price { get; set; }
        public int Qauntity { get;  set; }
         

    }
    public class AddEditProductResponse
    {
        public int status { get; set; }
        public int ProductID { get; set; }
    }
    public class DeleteProductResponse
    {
        public bool AllowToDelete { get; set; }
    }
}
