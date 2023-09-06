# Hướng dẫn Kết nối Cơ sở dữ liệu SQL Server

Chào mừng bạn đến với trang web bán hàng của chúng tôi! Dưới đây là hướng dẫn chi tiết về cách kết nối cơ sở dữ liệu SQL Server vào ứng dụng của bạn.

## Bước 1: Bấm nút "Ok" để kết nối

Bắt đầu bằng việc bấm nút "Ok" sau khi bạn đã truy cập trang web bán hàng của chúng tôi.

![Bấm nút Ok](./High_Webbanquanao/wwwroot/Asset/img/z4667818641767_3c853dd6fc2b7bb4f9955213582f890c.jpg)

## Bước 2: Kết quả kết nối

Sau khi bấm "Ok," ứng dụng sẽ thực hiện kết nối và hiển thị kết quả như sau:

![Kết nối thành công](./High_Webbanquanao/wwwroot/Asset/img/z4667960191440_da18ed8b15d3f8d4aee740e9088e0da7.jpg)

## Bước 3: Lấy link kết nối

Chuột trái vào kết quả và chọn "Properties" để lấy link kết nối.

![Chọn Properties](./High_Webbanquanao/wwwroot/Asset/img/z4667959045597_b89034645d35d5a353a2764419c083de.jpg)

## Bước 4: Cập nhật tệp appsettings.json

Thêm phần kết nối cơ sở dữ liệu vào tệp `appsettings.json` của ứng dụng của bạn. Đảm bảo bạn cung cấp đúng thông tin kết nối.

![Thêm kết nối vào appsettings.json](./High_Webbanquanao/wwwroot/Asset/img/z4667954802048_8496b299abc841666abe9bc6d0af3dd7.jpg)

## Bước 5: Chỉnh sửa code trong Program.cs

Trong tệp `Program.cs`, bạn cần chỉnh sửa code để kết nối với SQL Server. Điều này đảm bảo ứng dụng của bạn có thể truy cập và sử dụng cơ sở dữ liệu.

![Chỉnh sửa code trong Program.cs](./High_Webbanquanao/wwwroot/Asset/img/z4667976732120_ac0ac15a3579ac09879d00213694859d.jpg)

## Trang Danh sách người dùng

![Danh sách người dùng](./High_Webbanquanao/wwwroot/Asset/img/z4667845133468_4949f5db8edeb5163ea05840ec79c921.jpg)

Trang Danh sách người dùng hiển thị danh sách các người dùng có trong hệ thống. Đây có thể là một tính năng quan trọng của ứng dụng của bạn.

## Trang Chủ dành cho người dùng

Phần đầu tiên sau khi khởi động sẽ được đưa tới trang chủ.

### Trang Chủ - Hình 1

![Trang chủ](./High_Webbanquanao/wwwroot/Asset/img/z4667824359008_f65361bb188ff00e216b5a77743277ad.jpg)

### Trang Chủ - Hình 2

![Trang chủ](./High_Webbanquanao/wwwroot/Asset/img/z4667825253412_28f86201cc8469ccc86024221aad246c.jpg)

### Trang Chủ - Hình 3

![Trang chủ](./High_Webbanquanao/wwwroot/Asset/img/z4667826666579_30fc68bac9ada6f1bc7999e2b2e7d8ff.jpg)

#### Phần footer trang chủ khi chưa đăng nhập 

![Footer](./High_Webbanquanao/wwwroot/Asset/img/z4667827583985_1a5371376b36b9995163a2089146bb00.jpg)

#### Phần footer trang chủ khi đã đăng nhập 

![Footer](./High_Webbanquanao/wwwroot/Asset/img/z4667828548834_e093df0203216f2ec2d763bdf1f0220f.jpg)
## Phần Danh sách sản phẩm

![Danh sách sản phẩm](./High_Webbanquanao/wwwroot/Asset/img/z4667836026687_f3c6f2fd65c7f6fe92f06da0f3ee47a6.jpg)

Trang danh sách sản phẩm hiển thị các sản phẩm có sẵn trong cửa hàng của bạn. Dưới đây là một số mục con liên quan đến trang này.

### Danh sách sản phẩm sau khi bấm tìm kiếm cơ bản

![Danh sách sản phẩm sau khi bấm tìm kiếm cơ bản](./High_Webbanquanao/wwwroot/Asset/img/z4667837076216_6c072b76d3612881eba65dd205c0f0c8.jpg)

### Danh sách sản phẩm sau khi bấm tìm kiếm nâng cao

![Danh sách sản phẩm sau khi bấm tìm kiếm nâng cao](./High_Webbanquanao/wwwroot/Asset/img/z4667839829619_698157305728dd078158609922946873.jpg)

### Danh sách sản phẩm theo danh mục

![Danh sách sản phẩm theo danh mục](./High_Webbanquanao/wwwroot/Asset/img/z4667832976082_c1fe6da08895967dad6e41000c5e5e50.jpg)

### Danh sách sản phẩm theo từ tìm kiếm

![Danh sách sản phẩm theo từ tìm kiếm](./High_Webbanquanao/wwwroot/Asset/img/z4667834347837_703c144c456ae0ad87031d7e12b145e9.jpg)

### Danh sách sản phẩm mới nhất

![Danh sách sản phẩm mới nhất](./High_Webbanquanao/wwwroot/Asset/img/z4668045000305_8d2e9cbef4e8c0ba02f94b65c2ee8e3d.jpg)

### Danh sách sản phẩm mới nhất sau khi bấm tìm kiếm cơ bản

![Danh sách sản phẩm mới nhất sau khi bấm tìm kiếm cơ bản](./High_Webbanquanao/wwwroot/Asset/img/z4667837076216_6c072b76d3612881eba65dd205c0f0c8.jpg)

### Danh sách sản phẩm mới nhất sau khi bấm tìm kiếm nâng cao

![Danh sách sản phẩm mới nhất sau khi bấm tìm kiếm nâng cao](./High_Webbanquanao/wwwroot/Asset/img/z4667839829619_698157305728dd078158609922946873.jpg)


## Trang đăng nhập 
![Danh sách sản phẩm mới nhất sau khi bấm tìm kiếm nâng cao](./High_Webbanquanao/wwwroot/Asset/img/z4668074276980_e22e312c70522f5bac3b50083b21817b.jpg)
## Trang đăng kí
![Danh sách sản phẩm mới nhất sau khi bấm tìm kiếm nâng cao](./High_Webbanquanao/wwwroot/Asset/img/z4668085813196_b99c6b490549afb5ac073123fcf662c8.jpg)

## Trang Chi tiết sản phẩm
![Trang Chi tiết sản phẩm](./High_Webbanquanao/wwwroot/Asset/img/z4668045734969_af2d1d802c88b0e2638e4b3754bebcb8.jpg)
## Giỏ hàng
Sau khi bấm nút giỏ hàng sản phẩm sẽ được thêm vào giỏ hàng
![Trang Chi tiết sản phẩm](./High_Webbanquanao/wwwroot/Asset/img/z4668059932079_e2e0545e809c13fc20b4371eee1c5c16.jpg)
## Thanh toán
Sau khi bấm chữ thanh toán trong giỏ hàng sản phẩm sẽ chuyển tới trang thanh toán
![Trang Chi tiết sản phẩm](./High_Webbanquanao/wwwroot/Asset/img/z4668060929624_39c86f42fd77476732c2492c42d33a4e.jpg)
