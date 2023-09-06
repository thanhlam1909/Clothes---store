using High_Webbanquanao.Data;
using High_Webbanquanao.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
﻿using Microsoft.AspNetCore.Mvc;


namespace High_Webbanquanao.Controllers
{
    public class TrangAdminController : Controller
    {
        private readonly HIGH_WEBBANQUANAOContext _context;
        public TrangAdminController(HIGH_WEBBANQUANAOContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            var products = _context.Products.ToList();
            var productCategories = _context.ProductCategories.ToList();
            var invoices = _context.Invoices.ToList();

            var users = _context.Users.ToList(); // Fetch users from your database

            var modelIndex = new Index_Admin
            {
                Products = products,
                ProductCategories = productCategories,
                Users = users,
                Invoices = invoices,
                UserCount = users.Count, // Set the user count
                ProductCount = products.Count // Set the product count
            };

            return View(modelIndex);
        }
        public IActionResult Dashboard_admin()
        {


            return View();
        }

        public IActionResult Create_categori()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create_categori(ProductCategory model)
        {
            if (ModelState.IsValid)
            {
                // Thêm danh mục sản phẩm mới vào context
                _context.ProductCategories.Add(model);
                _context.SaveChanges();

                return RedirectToAction("Index"); // Chuyển hướng về trang danh sách danh mục
            }

            // Nếu ModelState không hợp lệ, hiển thị lại form với thông báo lỗi
            return View(model);
        }
        public IActionResult Edit_categori(int id)
        {
            var productCategory = _context.ProductCategories.Find(id);

            if (productCategory == null)
            {
                return NotFound();
            }

            return View(productCategory);
        }
        [HttpPost]
        public IActionResult Edit_categori(ProductCategory model)
        {
            if (ModelState.IsValid)
            {
                var existingCategory = _context.ProductCategories.Find(model.CategoryId);

                if (existingCategory == null)
                {
                    return NotFound();
                }

                existingCategory.CategoryName = model.CategoryName;
                existingCategory.Gender = model.Gender;

                _context.SaveChanges();

                return RedirectToAction("Index"); // Chuyển hướng về trang danh sách danh mục
            }

            return View(model); // Nếu ModelState không hợp lệ, hiển thị lại form với thông báo lỗi
        }
        public IActionResult Detail_categori(int id)
        {
            var productCategory = _context.ProductCategories.Find(id);

            if (productCategory == null)
            {
                return NotFound();
            }

            return View(productCategory);
        }

        public IActionResult Delete_categori(int id)
        {
            var category = _context.ProductCategories
        .Include(c => c.Products) // Include để load danh sách sản phẩm liên quan
        .FirstOrDefault(c => c.CategoryId == id);

            if (category == null)
            {
                return NotFound();
            }

            foreach (var product in category.Products.ToList())
            {
                _context.Products.Remove(product); // Xóa sản phẩm
            }

            _context.ProductCategories.Remove(category); // Xóa danh mục sản phẩm
            _context.SaveChanges();

            return RedirectToAction("Index");
        }
        public IActionResult Product()
        {
            var products = _context.Products.ToList();
            var productCategories = _context.ProductCategories.ToList();

            var modelIndex = new Index_Admin
            {
                Products = products,
                ProductCategories = productCategories
            };

            return View(modelIndex);
        }
        public IActionResult Product_create()
        {
            var modelIndex = new Model_ProductCategory_ProductCreate();

            var categories = _context.ProductCategories.ToList();
            // Lấy giá trị từ cơ sở dữ liệu cho danh sách genders
            var genders = new List<string> { "Nam", "Nữ" }; // Thay đổi chỗ này để lấy giá trị từ cơ sở dữ liệu nếu cần thiết
            ViewBag.Genders = genders;

            ViewBag.Genders = genders;
            ViewBag.Categories = categories;

            return View();
        }

        private ProductCategory GetOrCreateCategory(string categoryName, string gender)
        {
            var existingCategory = _context.ProductCategories.FirstOrDefault(c => c.CategoryName == categoryName && c.Gender == gender);
            if (existingCategory != null)
            {
                return existingCategory;
            }

            var newCategory = new ProductCategory
            {
                CategoryName = categoryName,
                Gender = gender
            };

            _context.ProductCategories.Add(newCategory);
            _context.SaveChanges();

            return newCategory;
        }

        [HttpPost]
        public IActionResult Product_create(Model_ProductCategory_ProductCreate model, IFormFile Product_fileInput)
        {

                if (model.Product != null &&
                    !string.IsNullOrEmpty(model.Product.ProductName) &&
                    !string.IsNullOrEmpty(model.Product.Description) &&
                    Product_fileInput != null &&
                    model.Product.Price > 0 &&
                    !string.IsNullOrEmpty(model.Product.Material) &&
                    !string.IsNullOrEmpty(model.Product.Size) &&
                    !string.IsNullOrEmpty(model.Product.Color) &&
                    model.ProductCategory != null &&
                    !string.IsNullOrEmpty(model.ProductCategory.Gender) &&
                    !string.IsNullOrEmpty(model.ProductCategory.CategoryName))
                {
                    // Xử lý tải lên ảnh
                    string newImagePath = Hinh.UploadImageToFolder(Product_fileInput, "SanPham");
                    model.Product.ProductImage = newImagePath; // Cập nhật đường dẫn ảnh mới

                    _context.Products.Add(model.Product);
                    _context.SaveChanges();

                    TempData["SuccessMessage"] = "Thêm sản phẩm thành công";
                    return RedirectToAction("Index"); // Hoặc chuyển hướng tới trang khác
                }
            

            // Nếu dữ liệu không hợp lệ, cần cập nhật danh sách genders và categories cho view
            var categories = _context.ProductCategories.ToList();
            var genders = new List<string> { "Nam", "Nữ" };
            ViewBag.Genders = genders;
            ViewBag.Categories = categories;

            TempData["ErrorMessage"] = "Thêm sản phẩm thất bại. Vui lòng kiểm tra lại thông tin.";

            return View("Product_create", model); // Hiển thị lại form với thông báo lỗi
        }


        public IActionResult Product_detail(int id)
        {

            var product = _context.Products.Find(id);

            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }
        public IActionResult Product_delete(int id)
        {
            var product = _context.Products
               .Include(p => p.Categories) // Include để load danh sách danh mục sản phẩm liên quan
               .FirstOrDefault(p => p.ProductId == id);

            if (product == null)
            {
                return NotFound();
            }

            foreach (var category in product.Categories.ToList())
            {
                category.Products.Remove(product); // Xóa sản phẩm khỏi danh sách sản phẩm của danh mục
            }

            _context.Products.Remove(product);
            _context.SaveChanges();

            TempData["SuccessMessageDelete"] = "Xóa sản phẩm thành công";
            return RedirectToAction("Index");
        }


        public IActionResult Product_edit(int id)
        {
            var product = _context.Products.Find(id);

            if (product == null)
            {
                return NotFound();
            }

            var model = new Model_ProductCategory_ProductCreate
            {
                Product = product,

                ProductCategory = new ProductCategory() // Tạo một đối tượng ProductCategory để có thể sử dụng EditorFor
            };

            var categories = _context.ProductCategories.ToList();
            var genders = new List<string> { "Nam", "Nữ" }; // Thay đổi chỗ này để lấy giá trị từ cơ sở dữ liệu nếu cần thiết
            ViewBag.Genders = genders;
            ViewBag.Categories = categories;

            return View(model);
        }
        [HttpPost]
        public IActionResult Product_edit(Model_ProductCategory_ProductCreate model, IFormFile Product_fileInput)
        {
            var existingProduct = _context.Products.Find(model.Product.ProductId);

            if (existingProduct == null)
            {
                return NotFound();
            }

            if (Product_fileInput != null)
            {
                // Xử lý tải lên ảnh và cập nhật đường dẫn ảnh mới
                string newImagePath = Hinh.UploadImageToFolder(Product_fileInput, "SanPham");

                // Cập nhật liên kết ảnh mới
                existingProduct.ProductImage = newImagePath;
            }

            existingProduct.ProductName = model.Product.ProductName;
            existingProduct.Description = model.Product.Description; // Cập nhật mô tả
            existingProduct.Price = model.Product.Price;             // Cập nhật giá
            existingProduct.StockQuantity = model.Product.StockQuantity; // Cập nhật số lượng tồn kho
            existingProduct.Material = model.Product.Material;       // Cập nhật chất liệu
            existingProduct.Size = model.Product.Size;               // Cập nhật kích thước
            existingProduct.Color = model.Product.Color;

            _context.SaveChanges();

            return RedirectToAction("Index");
        }

        public IActionResult Logout()
        {
            // Xóa UserId khỏi session để đăng xuất
            HttpContext.Session.Remove("UserId");

            // Chuyển hướng đến trang chủ hoặc trang khác sau khi đăng xuất
            return RedirectToAction("Index", "Trangchu");
        }
        public IActionResult Updatestatusorder()
        {
            var invoices = _context.Invoices.ToList();

            return View(invoices); // Pass the 'invoices' data to the view
        }
        [HttpGet]
        public IActionResult Edit_UpdateOrderStatus(int id)
        {
            // Retrieve the invoice with the specified ID from your data source
            var invoice = _context.Invoices.FirstOrDefault(i => i.InvoiceId == id);

            if (invoice == null)
            {
                return NotFound(); // Handle the case where the invoice is not found
            }

            return View(invoice); // Pass the 'invoice' data to the view
        }
        [HttpPost]
        public IActionResult EditUpdateOrderStatus(Invoice model)
        {
            if (ModelState.IsValid)
            {
                var existingInvoice = _context.Invoices.Find(model.InvoiceId);

                if (existingInvoice == null)
                {
                    return NotFound();
                }

                // Update the order status with the new value
                existingInvoice.StatusOrder = model.StatusOrder;

                _context.SaveChanges();

                TempData["SuccessMessage_UpdateOrder"] = "Cập nhật trạng thái đơn hàng thành công";

                return RedirectToAction("Index"); // Redirect back to the list of invoices or any other desired page
            }

            // If ModelState is not valid, return to the edit view with validation errors
            return View(model);
        }

        // Handle the form submission for updating order status

    }
}
