
﻿using High_Webbanquanao.Data;
using High_Webbanquanao.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using System.Security.Claims;
﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using System.Reflection.Metadata.Ecma335;
using Microsoft.EntityFrameworkCore;

namespace High_Webbanquanao.Controllers
{
    public class TrangchuController : Controller
    {

        private readonly HIGH_WEBBANQUANAOContext _context;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public TrangchuController(HIGH_WEBBANQUANAOContext context, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;
            _httpContextAccessor = httpContextAccessor;
        }
        public IActionResult Index(string userId)
        {
            var modelIndex = new Model_Index();
            var productCategories = _context.ProductCategories.ToList();

            // Fetch the latest 5 products
            var latestProducts = _context.Products
                .OrderByDescending(p => p.CreatedAt)
                .Take(5)
                .ToList();

            if (!string.IsNullOrEmpty(userId))
            {
                // Fetch user-specific data using the UserId
                var user = _context.Users.FirstOrDefault(u => u.UserId == userId);

                if (user != null)
                {
                    // Customize the modelIndex or view based on user-specific data
                    modelIndex.User = user;  // For example, set the user data in the model
                }
            }

            // Pass the latest products to the view model
            modelIndex.LatestProducts = latestProducts;

            ViewBag.ModelIndex = modelIndex;
            ViewBag.ProductCategories = productCategories;

            return View();
        }

        [HttpGet]
        public IActionResult Login()
        {
            var productCategories = _context.ProductCategories.ToList();
            ViewBag.ProductCategories = productCategories;
            return View();
        }

        [HttpPost]
        public IActionResult Login(LoginViewModel model)
        {
            var productCategories = _context.ProductCategories.ToList();
            ViewBag.ProductCategories = productCategories;

            // Check if the provided username and password are valid
            var user = _context.Users.FirstOrDefault(u => u.Username == model.User.Username && u.Password == model.User.Password);

            if (user != null)
            {
                // Set the user's ID in the session
                HttpContext.Session.SetString("UserId", user.UserId);

                if (user.UserType == "admin")
                {
                    return RedirectToAction("Index", "Trangadmin");
                }
                else
                {
                    return RedirectToAction("Index", "Trangchu");
                }
            }
            else
            {
                ModelState.AddModelError("", "Invalid login attempt.");
                return View(model);
            }
        }

        public IActionResult Logout()
        {
            // Xóa UserId khỏi session để đăng xuất
            HttpContext.Session.Remove("UserId");

            // Chuyển hướng đến trang chủ hoặc trang khác sau khi đăng xuất
            return RedirectToAction("Index", "Trangchu");
        }
        public IActionResult product_list_category(int categoryId, string gender, string userId, int page = 1, int pageSize = 9)
        {
            var modelIndex = new Model_Index();
            if (!string.IsNullOrEmpty(userId))
            {
                // Fetch user-specific data using the UserId
                var user = _context.Users.FirstOrDefault(u => u.UserId == userId);

                if (user != null)
                {
                    // Customize the modelIndex or view based on user-specific data
                    modelIndex.User = user;  // For example, set the user data in the model
                }
            }
            var productCategories = _context.ProductCategories.ToList();

            // Fetch products for the given category and gender on the current page without any specific order
            var products = _context.Products
                .Where(p => p.Categories.Any(c => c.CategoryId == categoryId) && p.Categories.Any(c => c.Gender == gender))
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            // Total number of products in the given category and gender
            var totalProducts = _context.Products
                .Count(p => p.Categories.Any(c => c.CategoryId == categoryId) && p.Categories.Any(c => c.Gender == gender));

            // Calculate total number of pages
            var totalPages = (int)Math.Ceiling((double)totalProducts / pageSize);

            var model = new ProductListModel
            {
                Productlist = products,
                CurrentPage = page,
                TotalPages = totalPages
            };
            ViewBag.ProductCategories = productCategories;
            ViewBag.CategoryId = categoryId; // Pass categoryId to the view
            ViewBag.Gender = gender; // Pass gender to the view
            return View("product_list_category", model); // Assuming you have a view named "product_list.cshtml"
        }
        [HttpGet]
        public IActionResult Register()
        {
            var productCategories = _context.ProductCategories.ToList();
            ViewBag.ProductCategories = productCategories;

            int nextNumericId = _context.Users.Max(u => u.NumericId) + 1;
            string userType = "user"; // Replace with your desired default UserType
            string computedUserId = $"{userType}_{nextNumericId}";

            var user = new User
            {
                UserType = userType,
                ComputedUserId = computedUserId,
                UserId = computedUserId
            };

            return View(user);
        }

        public IActionResult Register_test()
        {
            var productCategories = _context.ProductCategories.ToList();
            ViewBag.ProductCategories = productCategories;
            // Xử lý logic của trang Đăng kí
            return View();
        }
        [HttpPost]
        public IActionResult Register(User user)
        {
            if (ModelState.IsValid)
            {
                // Check if the username is already in use
                var existingUserByUsername = _context.Users.FirstOrDefault(u => u.Username == user.Username);
                if (existingUserByUsername != null)
                {
                    ModelState.AddModelError("Username", "Tên đăng nhập đã tồn tại. Vui lòng chọn tên đăng nhập khác.");
                    var categories = _context.ProductCategories.ToList();
                    ViewBag.ProductCategories = categories;
                    return View(user);
                }

                // Check if the email is already in use
                var existingUserByEmail = _context.Users.FirstOrDefault(u => u.Email == user.Email);
                if (existingUserByEmail != null)
                {
                    ModelState.AddModelError("Email", "Email đã được sử dụng. Vui lòng sử dụng một địa chỉ email khác.");
                    var categories = _context.ProductCategories.ToList();
                    ViewBag.ProductCategories = categories;
                    return View(user);
                }

                // If neither username nor email is in use, save the user to the database
                _context.Users.Add(user);
                _context.SaveChanges();

                // Redirect to the desired page after successful registration
                return RedirectToAction("Index");
            }

            var productCategories = _context.ProductCategories.ToList();
            ViewBag.ProductCategories = productCategories;

            return View(user);
        }


        public IActionResult Cart()
        {
            var model = new CartViewModel();  // Khởi tạo ViewModel cho trang giỏ hàng

            // Lấy ID của người dùng đăng nhập từ session
            var userId = HttpContext.Session.GetString("UserId");

            if (!string.IsNullOrEmpty(userId))
            {
                var user = _context.Users.FirstOrDefault(u => u.UserId == userId);

                if (user != null)
                {
                    model.UserId = userId;  // Gán giá trị userId vào ViewModel
                    model.User = user;      // Gán dữ liệu người dùng vào ViewModel
                }

                // Lấy giỏ hàng của người dùng bao gồm chi tiết giỏ hàng và sản phẩm
                var userCart = _context.Carts
                    .Include(c => c.CartDetails)
                    .ThenInclude(cd => cd.Product) // Lấy thông tin sản phẩm liên quan
                    .FirstOrDefault(c => c.UserId == userId);

                if (userCart != null)
                {
                    model.Cart = userCart;  // Gán dữ liệu giỏ hàng của người dùng vào ViewModel
                    model.Products = userCart.CartDetails.Select(cd => cd.Product).ToList(); // Lấy danh sách sản phẩm từ chi tiết giỏ hàng
                }
            }

            var productCategories = _context.ProductCategories.ToList();
            ViewBag.ProductCategories = productCategories;

            return View(model);
        }
        [HttpPost]
        public IActionResult RemoveFromCart(int productId)
        {
            // Lấy ID của người dùng đăng nhập từ session
            var userId = HttpContext.Session.GetString("UserId");

            if (!string.IsNullOrEmpty(userId))
            {
                // Lấy giỏ hàng của người dùng
                var userCart = _context.Carts
                    .Include(c => c.CartDetails)
                    .FirstOrDefault(c => c.UserId == userId);

                if (userCart != null)
                {
                    // Tìm chi tiết giỏ hàng chứa sản phẩm cần xóa
                    var cartDetailToRemove = userCart.CartDetails.FirstOrDefault(cd => cd.ProductId == productId);

                    if (cartDetailToRemove != null)
                    {
                        // Xóa chi tiết giỏ hàng khỏi danh sách chi tiết giỏ hàng của người dùng
                        userCart.CartDetails.Remove(cartDetailToRemove);

                        // Cập nhật lại tổng giá trị của giỏ hàng (nếu cần)
                        // userCart.TotalPrice -= cartDetailToRemove.Product.Price * cartDetailToRemove.Quantity;

                        // Lưu thay đổi vào cơ sở dữ liệu
                        _context.SaveChanges();
                    }
                }
            }

            // Chuyển hướng người dùng đến trang giỏ hàng sau khi xóa sản phẩm
            return RedirectToAction("Cart");
        }



        public IActionResult Checkout()
        {
            var modelIndex = new Model_Index();
            var model = new CartViewModel();  // Initialize the ViewModel for MyAccount
            var userId = HttpContext.Session.GetString("UserId");

            if (!string.IsNullOrEmpty(userId))
            {
                var user = _context.Users.FirstOrDefault(u => u.UserId == userId);

                if (user != null)
                {
                    model.UserId = userId;  // Gán giá trị userId vào ViewModel
                    model.User = user;      // Gán dữ liệu người dùng vào ViewModel
                }

                // Lấy giỏ hàng của người dùng bao gồm chi tiết giỏ hàng và sản phẩm
                var userCart = _context.Carts
                    .Include(c => c.CartDetails)
                    .ThenInclude(cd => cd.Product) // Lấy thông tin sản phẩm liên quan
                    .FirstOrDefault(c => c.UserId == userId);

                if (userCart != null)
                {
                    model.Cart = userCart;  // Gán dữ liệu giỏ hàng của người dùng vào ViewModel
                    model.Products = userCart.CartDetails.Select(cd => cd.Product).ToList(); // Lấy danh sách sản phẩm từ chi tiết giỏ hàng
                }
            }

            var productCategories = _context.ProductCategories.ToList();
            ViewBag.ProductCategories = productCategories;

            // Xử lý logic của trang đăng nhập
            return View(model);
        }
        public IActionResult myaccount()
        {
            var modelIndex = new Model_Index();
            var model = new MyAccountViewModel();  // Initialize the ViewModel for MyAccount
            var userId = HttpContext.Session.GetString("UserId");

            if (!string.IsNullOrEmpty(userId))
            {
                var user = _context.Users.FirstOrDefault(u => u.UserId == userId);

                if (user != null)
                {
                    model.UserId = userId;  // Assign the userId value to the ViewModel
                    model.User = user;      // Assign user data to the ViewModel
                    modelIndex.User = user;
                    var invoices = _context.Invoices
                                .Where(i => i.UserId == userId)
                                .ToList();

                    model.Invoices = invoices;
                }
            }

            var productCategories = _context.ProductCategories.ToList();
            ViewBag.ProductCategories = productCategories;

            // Xử lý logic của trang đăng nhập
            return View(model);
        }
        public IActionResult product_detail(int productId)
        {
            var modelIndex = new Model_Index();
            var model = new ProductDetailViewModel();  // Initialize the ViewModel

            // Get the logged-in user's ID from the session
            var userId = HttpContext.Session.GetString("UserId");

            if (!string.IsNullOrEmpty(userId))
            {
                var user = _context.Users.FirstOrDefault(u => u.UserId == userId);

                if (user != null)
                {
                    model.UserId = userId;  // Assign the userId value to the ViewModel
                    model.User = user;      // Assign user data to the ViewModel
                    modelIndex.User = user; // Assign user data to modelIndex (if needed)
                }
            }

            var productCategories = _context.ProductCategories.ToList();
            ViewBag.ProductCategories = productCategories;

            var product = _context.Products.FirstOrDefault(p => p.ProductId == productId);

            if (product == null)
            {
                return NotFound();
            }

            model.Product = product;  // Assign product data to the ViewModel

            return View(model);
        }

        public IActionResult product_list(string userId, int page = 1, int pageSize = 9)
        {
            var modelIndex = new Model_Index();
            if (!string.IsNullOrEmpty(userId))
            {
                // Fetch user-specific data using the UserId
                var user = _context.Users.FirstOrDefault(u => u.UserId == userId);

                if (user != null)
                {
                    // Customize the modelIndex or view based on user-specific data
                    modelIndex.User = user;  // For example, set the user data in the model
                }
            }
            var productCategories = _context.ProductCategories.ToList();

            // Fetch products for the current page without any specific order
            var products = _context.Products
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            // Total number of products
            var totalProducts = _context.Products.Count();

            // Calculate total number of pages
            var totalPages = (int)Math.Ceiling((double)totalProducts / pageSize);

            var model = new ProductListModel
            {
                Productlist = products,
                CurrentPage = page,
                TotalPages = totalPages
            };
            ViewBag.ProductCategories = productCategories;

            return View(model);
        }
        public IActionResult wishlist(string userId)
        {
            var modelIndex = new Model_Index();
            if (!string.IsNullOrEmpty(userId))
            {
                // Fetch user-specific data using the UserId
                var user = _context.Users.FirstOrDefault(u => u.UserId == userId);

                if (user != null)
                {
                    // Customize the modelIndex or view based on user-specific data
                    modelIndex.User = user;  // For example, set the user data in the model
                }
            }
            var productCategories = _context.ProductCategories.ToList();
            ViewBag.ProductCategories = productCategories;
            return View();
        }
        public IActionResult contact(string userId)
        {
            var modelIndex = new Model_Index();
            if (!string.IsNullOrEmpty(userId))
            {
                // Fetch user-specific data using the UserId
                var user = _context.Users.FirstOrDefault(u => u.UserId == userId);

                if (user != null)
                {
                    // Customize the modelIndex or view based on user-specific data
                    modelIndex.User = user;  // For example, set the user data in the model
                }
            }
            var productCategories = _context.ProductCategories.ToList();
            ViewBag.ProductCategories = productCategories;
            return View();
        }
        public IActionResult product_list_new(string userId,int page = 1, int pageSize = 9)
        {
            var modelIndex = new Model_Index();
            if (!string.IsNullOrEmpty(userId))
            {
                // Fetch user-specific data using the UserId
                var user = _context.Users.FirstOrDefault(u => u.UserId == userId);

                if (user != null)
                {
                    // Customize the modelIndex or view based on user-specific data
                    modelIndex.User = user;  // For example, set the user data in the model
                }
            }
            var productCategories = _context.ProductCategories.ToList();

            // Fetch the latest products for the current page
            var latestProducts = _context.Products
                .OrderByDescending(p => p.CreatedAt)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            // Total number of products
            var totalProducts = _context.Products.Count();

            // Calculate total number of pages
            var totalPages = (int)Math.Ceiling((double)totalProducts / pageSize);

            var model = new ProductListNewModel
            {
                LatestProducts = latestProducts,
                CurrentPage = page,
                TotalPages = totalPages
            };
            ViewBag.ProductCategories = productCategories;

            return View(model);
        }
        [HttpGet]
        public IActionResult Search(string userId,string query, int page = 1, int pageSize = 9)
        {
            var modelIndex = new Model_Index();
            if (!string.IsNullOrEmpty(userId))
            {
                // Fetch user-specific data using the UserId
                var user = _context.Users.FirstOrDefault(u => u.UserId == userId);

                if (user != null)
                {
                    // Customize the modelIndex or view based on user-specific data
                    modelIndex.User = user;  // For example, set the user data in the model
                }
            }
            var productCategories = _context.ProductCategories.ToList();
            ViewBag.ProductCategories = productCategories;
            // Perform the search based on the query
            var searchResults = _context.Products
                .Where(p => p.ProductName.Contains(query) || p.Description.Contains(query))
                .OrderByDescending(p => p.CreatedAt)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            // Total number of search results
            var totalResults = _context.Products
                .Count(p => p.ProductName.Contains(query) || p.Description.Contains(query));

            // Calculate total number of pages for search results
            var totalSearchPages = (int)Math.Ceiling((double)totalResults / pageSize);

            var model = new ProductSearchModel
            {
                Query = query,
                SearchResults = searchResults,
                CurrentPage = page,
                TotalSearchPages = totalSearchPages
            };
            return View(model);
        }
        [HttpPost]
        public IActionResult Searchs(string searchTerm)
        {
            var products = _context.Products
                .Where(p => p.ProductName.Contains(searchTerm)) // Thay đổi cách tìm kiếm tùy theo nhu cầu
                .ToList();

            var model = new ProductListModel
            {
                Productlist = products
            };

            return PartialView("_ProductList", model); // "_ProductList" là tên của Partial View chứa danh sách sản phẩm
        }
        [HttpPost]
        public IActionResult AdvancedSearch(string searchTerm, int? minPrice, int? maxPrice)
        {
            var query = _context.Products.AsQueryable();

            if (!string.IsNullOrEmpty(searchTerm))
            {
                query = query.Where(p => p.ProductName.Contains(searchTerm));
            }

            if (minPrice.HasValue)
            {
                query = query.Where(p => p.Price >= minPrice);
            }

            if (maxPrice.HasValue)
            {
                query = query.Where(p => p.Price <= maxPrice);
            }

            var products = query.ToList();

            var model = new ProductListModel
            {
                Productlist = products
            };

            return PartialView("_ProductList", model);
        }
        public IActionResult SearchProducts(string query, int categoryId, string gender, int page = 1, int pageSize = 9)
        {
            var productCategories = _context.ProductCategories.ToList();

            // Fetch products that match the query, category, and gender on the current page
            var products = _context.Products
                .Where(p => p.ProductName.Contains(query) &&
                            p.Categories.Any(c => c.CategoryId == categoryId) &&
                            p.Categories.Any(c => c.Gender == gender))
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            // Total number of products that match the query, category, and gender
            var totalProducts = _context.Products
                .Count(p => p.ProductName.Contains(query) &&
                            p.Categories.Any(c => c.CategoryId == categoryId) &&
                            p.Categories.Any(c => c.Gender == gender));

            // Calculate total number of pages
            var totalPages = (int)Math.Ceiling((double)totalProducts / pageSize);

            var model = new ProductListModel
            {
                Productlist = products,
                CurrentPage = page,
                TotalPages = totalPages
            };

            ViewBag.ProductCategories = productCategories;
            ViewBag.CategoryId = categoryId;
            ViewBag.Gender = gender;
            ViewBag.Query = query; // Pass the query to the view

            return PartialView("_SearchResultsPartial", model); // Assuming you have a view named "product_list_category.cshtml"
        }
        [HttpGet]
        public IActionResult AddToCart(int productId)
        {
            // Kiểm tra xem người dùng đã đăng nhập hay chưa
            var userId = HttpContext.Session.GetString("UserId");

            if (!string.IsNullOrEmpty(userId))
            {
                // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng của người dùng hay chưa
                var cart = _context.Carts.Include(c => c.CartDetails).FirstOrDefault(c => c.UserId == userId);

                if (cart == null)
                {
                    // Nếu giỏ hàng chưa tồn tại, tạo một giỏ hàng mới cho người dùng
                    cart = new Cart
                    {
                        UserId = userId,
                        CreatedDate = DateTime.Now
                    };
                    _context.Carts.Add(cart);
                    _context.SaveChanges(); // Lưu thay đổi để có CartId

                    // Bạn cần lưu lại thay đổi và sau đó mới sử dụng CartId để tạo CartDetail
                }

                // Kiểm tra xem sản phẩm đã có trong giỏ hàng hay chưa
                var cartItem = cart.CartDetails.FirstOrDefault(cd => cd.ProductId == productId);

                if (cartItem == null)
                {
                    // Nếu sản phẩm chưa có trong giỏ hàng, thêm sản phẩm vào giỏ hàng với số lượng là 1
                    cartItem = new CartDetail
                    {
                        CartId = cart.CartId, // Sử dụng CartId từ cart đã tạo hoặc đã tồn tại
                        ProductId = productId,
                        Quantity = 1
                    };
                    _context.CartDetails.Add(cartItem);
                    _context.SaveChanges(); // Lưu thay đổi sau khi thêm CartDetail
                }

                // Điều hướng người dùng đến trang giỏ hàng hoặc trang chính
                return RedirectToAction("Cart", "Trangchu");
            }
            else
            {
                // Nếu người dùng chưa đăng nhập, bạn có thể điều hướng họ đến trang đăng nhập
                return RedirectToAction("Login", "Trangchu");
            }
        }

        [HttpPost]
        public IActionResult UpdateCartItemQuantity(int productId, string action)
        {
            // Retrieve the user's cart and the corresponding cart item
            var userId = HttpContext.Session.GetString("UserId");

            if (string.IsNullOrEmpty(userId))
            {
                // Handle the case where the user is not logged in, return an error or redirect as needed.
                return BadRequest("User not logged in.");
            }

            var cart = _context.Carts.Include(c => c.CartDetails).FirstOrDefault(c => c.UserId == userId);

            if (cart == null)
            {
                // Handle the case where the cart does not exist, return an error or create a new cart as needed.
                return BadRequest("Cart not found.");
            }

            var cartItem = cart.CartDetails.FirstOrDefault(cd => cd.ProductId == productId);

            if (cartItem == null)
            {
                // Handle the case where the cart item does not exist, return an error or create a new cart item as needed.
                return BadRequest("Cart item not found.");
            }

            // Update the quantity based on the action (increment or decrement)
            if (action == "increment")
            {
                cartItem.Quantity++;
            }
            else if (action == "decrement" && cartItem.Quantity > 1)
            {
                cartItem.Quantity--;
            }

            _context.SaveChanges();

            // Calculate the new total for the cart item

            // Return a JSON response with the updated cart item information
            return Json(new { quantity = cartItem.Quantity });
        }

        [HttpPost]
        public IActionResult ThanhToan([FromForm] string paymentMethod)
        {
            var userId = HttpContext.Session.GetString("UserId");

            if (!string.IsNullOrEmpty(userId))
            {
                var userCart = _context.Carts
                    .Include(c => c.CartDetails)
                    .ThenInclude(cd => cd.Product)
                    .FirstOrDefault(c => c.UserId == userId);

                if (userCart != null)
                {
                    // Create a new invoice
                    var invoice = new Invoice
                    {
                        UserId = userId,
                        InvoiceDate = DateTime.Now,
                        ShippingFee = 1, // Update shipping fee logic as needed
                        PaymentMethod = paymentMethod, // Set payment method based on user selection
                        StatusOrder = "Chờ xác nhận" // Update order status as needed
                    };

                    // Create a list of invoice details from the user's cart
                    var invoiceDetails = new List<InvoiceDetail>();
                    foreach (var cartItem in userCart.CartDetails)
                    {
                        if (cartItem.ProductId.HasValue && cartItem.Quantity.HasValue)
                        {
                            var invoiceDetail = new InvoiceDetail
                            {
                                ProductId = cartItem.ProductId.Value,
                                Quantity = cartItem.Quantity.Value,
                                UnitPrice = cartItem.Product.Price // Product price from the cart
                            };

                            invoiceDetails.Add(invoiceDetail);
                        }
                    }

                    // Assign the invoice details to the invoice
                    invoice.InvoiceDetails = invoiceDetails;

                    // Calculate the total amount for the invoice
                    invoice.TotalAmount = invoiceDetails.Sum(cd => cd.Quantity * cd.UnitPrice) + invoice.ShippingFee;

                    // Save the invoice and invoice details to the database
                    _context.Invoices.Add(invoice);
                    _context.SaveChanges();

                    // Remove the user's cart after successful payment
                    _context.Carts.Remove(userCart);
                    _context.SaveChanges();
                }
            }

            return RedirectToAction("Index"); // Redirect to the desired page after payment
        }



    }


}
