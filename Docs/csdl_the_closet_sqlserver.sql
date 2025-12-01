-- ================================================
-- DỮ LIỆU MẪU HOÀN CHỈNH - 10 BẢN GHI
-- ================================================
USE the_closet;
GO
-- ================================================
-- 1. USERS - 10 người dùng
-- ================================================
INSERT INTO Users (UserCode, Username, Email, PasswordHash, FullName, Phone, RoleID, IsActive) VALUES
('USER001', 'admin', 'admin@clothingshop.com', 'hash_admin_password', N'Nguyễn Văn Admin', '0901234567', 4, 1),
('USER002', 'manager01', 'manager@clothingshop.com', 'hash_manager_password', N'Trần Thị Manager', '0902234567', 3, 1),
('USER003', 'customer01', 'customer01@gmail.com', 'hash_customer01', N'Lê Văn An', '0903234567', 2, 1),
('USER004', 'customer02', 'customer02@gmail.com', 'hash_customer02', N'Phạm Thị Bình', '0904234567', 2, 1),
('USER005', 'customer03', 'customer03@gmail.com', 'hash_customer03', N'Hoàng Văn Cường', '0905234567', 2, 1),
('USER006', 'customer04', 'customer04@gmail.com', 'hash_customer04', N'Võ Thị Dung', '0906234567', 2, 1),
('USER007', 'customer05', 'customer05@gmail.com', 'hash_customer05', N'Đặng Văn Em', '0907234567', 2, 1),
('USER008', 'customer06', 'customer06@gmail.com', 'hash_customer06', N'Bùi Thị Phương', '0908234567', 2, 1),
('USER009', 'customer07', 'customer07@gmail.com', 'hash_customer07', N'Mai Văn Giang', '0909234567', 2, 1),
('USER010', 'customer08', 'customer08@gmail.com', 'hash_customer08', N'Ngô Thị Hoa', '0910234567', 2, 1);
GO

-- ================================================
-- 2. SHIPPING ADDRESSES - 10 địa chỉ
-- ================================================
INSERT INTO ShippingAddresses (AddressCode, UserID, RecipientName, Phone, AddressLine, Ward, District, City, IsDefault) VALUES
('ADDR001', 3, N'Lê Văn An', '0903234567', N'123 Nguyễn Huệ', N'Phường Bến Nghé', N'Quận 1', N'TP Hồ Chí Minh', 1),
('ADDR002', 3, N'Lê Văn An', '0903234567', N'456 Lê Lợi', N'Phường Bến Thành', N'Quận 1', N'TP Hồ Chí Minh', 0),
('ADDR003', 4, N'Phạm Thị Bình', '0904234567', N'789 Trần Hưng Đạo', N'Phường Cầu Ông Lãnh', N'Quận 1', N'TP Hồ Chí Minh', 1),
('ADDR004', 5, N'Hoàng Văn Cường', '0905234567', N'321 Điện Biên Phủ', N'Phường Đakao', N'Quận 1', N'TP Hồ Chí Minh', 1),
('ADDR005', 6, N'Võ Thị Dung', '0906234567', N'654 Hai Bà Trưng', N'Phường Tân Định', N'Quận 1', N'TP Hồ Chí Minh', 1),
('ADDR006', 7, N'Đặng Văn Em', '0907234567', N'987 Võ Văn Tần', N'Phường 5', N'Quận 3', N'TP Hồ Chí Minh', 1),
('ADDR007', 8, N'Bùi Thị Phương', '0908234567', N'147 Cách Mạng Tháng 8', N'Phường 7', N'Quận 3', N'TP Hồ Chí Minh', 1),
('ADDR008', 9, N'Mai Văn Giang', '0909234567', N'258 Lý Thái Tổ', N'Phường 1', N'Quận 10', N'TP Hồ Chí Minh', 1),
('ADDR009', 10, N'Ngô Thị Hoa', '0910234567', N'369 Lạc Long Quân', N'Phường 5', N'Quận 11', N'TP Hồ Chí Minh', 1),
('ADDR010', 4, N'Phạm Thị Bình', '0904234567', N'159 Nguyễn Thị Minh Khai', N'Phường Đa Kao', N'Quận 1', N'TP Hồ Chí Minh', 0);
GO

-- ================================================
-- 3. BRANDS - 10 thương hiệu
-- ================================================
INSERT INTO Brands (BrandCode, BrandName, Description, IsActive) VALUES
('BRAND001', 'Nike', N'Thương hiệu thể thao nổi tiếng', 1),
('BRAND002', 'Adidas', N'Thương hiệu thể thao Đức', 1),
('BRAND003', 'Zara', N'Thương hiệu thời trang Tây Ban Nha', 1),
('BRAND004', 'H&M', N'Thương hiệu thời trang Thụy Điển', 1),
('BRAND005', 'Uniqlo', N'Thương hiệu thời trang Nhật Bản', 1),
('BRAND006', 'Gucci', N'Thương hiệu xa xỉ Italy', 1),
('BRAND007', 'Louis Vuitton', N'Thương hiệu xa xỉ Pháp', 1),
('BRAND008', 'Canifa', N'Thương hiệu Việt Nam', 1),
('BRAND009', 'Routine', N'Thương hiệu Việt Nam', 1),
('BRAND010', 'The Blues', N'Thương hiệu Việt Nam', 1);
GO

-- ================================================
-- 4. PRODUCTS - 10 sản phẩm
-- ================================================
INSERT INTO Products (ProductCode, ProductName, CategoryID, BrandID, Description, Material, BasePrice, DiscountPercent, IsActive, IsFeatured) VALUES
('PRD001', N'Áo thun nam basic', 4, 5, N'Áo thun nam thiết kế basic, dễ phối đồ', N'Cotton 100%', 199000, 10, 1, 1),
('PRD002', N'Áo sơ mi nam công sở', 4, 3, N'Áo sơ mi nam lịch sự cho công sở', N'Cotton pha', 399000, 15, 1, 1),
('PRD003', N'Quần jean nam slim fit', 5, 1, N'Quần jean nam form slim hiện đại', N'Denim cao cấp', 599000, 20, 1, 1),
('PRD004', N'Quần kaki nam', 5, 4, N'Quần kaki nam đa năng', N'Kaki', 349000, 0, 1, 0),
('PRD005', N'Áo thun nữ form rộng', 6, 5, N'Áo thun nữ form rộng trendy', N'Cotton 100%', 179000, 10, 1, 1),
('PRD006', N'Áo kiểu nữ công sở', 6, 3, N'Áo kiểu nữ thanh lịch', N'Vải lụa', 449000, 25, 1, 1),
('PRD007', N'Váy midi nữ', 7, 3, N'Váy midi nữ tính duyên dáng', N'Vải linen', 499000, 15, 1, 0),
('PRD008', N'Quần jean nữ skinny', 7, 2, N'Quần jean nữ ôm body', N'Denim co giãn', 549000, 20, 1, 1),
('PRD009', N'Áo hoodie unisex', 4, 1, N'Áo hoodie phong cách thể thao', N'Nỉ bông', 699000, 10, 1, 1),
('PRD010', N'Áo khoác jean nam', 4, 2, N'Áo khoác jean phong cách', N'Denim', 899000, 30, 1, 1);
GO

-- ================================================
-- 5. PRODUCT VARIANTS - 30 biến thể (mỗi sản phẩm 3 biến thể)
-- ================================================
INSERT INTO ProductVariants (VariantCode, ProductID, ColorID, SizeID, SKU, StockQuantity, Price, IsActive) VALUES
-- PRD001 - Áo thun nam basic
('PRD001-WHITE-M', 1, 1, 3, 'SKU-PRD001-WHT-M', 50, 179100, 1),
('PRD001-BLACK-L', 1, 2, 4, 'SKU-PRD001-BLK-L', 45, 179100, 1),
('PRD001-GRAY-XL', 1, 8, 5, 'SKU-PRD001-GRY-XL', 30, 179100, 1),

-- PRD002 - Áo sơ mi nam
('PRD002-WHITE-M', 2, 1, 3, 'SKU-PRD002-WHT-M', 40, 339150, 1),
('PRD002-BLUE-L', 2, 4, 4, 'SKU-PRD002-BLU-L', 35, 339150, 1),
('PRD002-GRAY-XL', 2, 8, 5, 'SKU-PRD002-GRY-XL', 25, 339150, 1),

-- PRD003 - Quần jean nam
('PRD003-BLUE-30', 3, 4, 3, 'SKU-PRD003-BLU-30', 60, 479200, 1),
('PRD003-BLACK-32', 3, 2, 4, 'SKU-PRD003-BLK-32', 55, 479200, 1),
('PRD003-GRAY-34', 3, 8, 5, 'SKU-PRD003-GRY-34', 40, 479200, 1),

-- PRD004 - Quần kaki nam
('PRD004-BEIGE-M', 4, 10, 3, 'SKU-PRD004-BGE-M', 45, 349000, 1),
('PRD004-BLACK-L', 4, 2, 4, 'SKU-PRD004-BLK-L', 50, 349000, 1),
('PRD004-BROWN-XL', 4, 9, 5, 'SKU-PRD004-BRN-XL', 35, 349000, 1),

-- PRD005 - Áo thun nữ
('PRD005-WHITE-S', 5, 1, 2, 'SKU-PRD005-WHT-S', 70, 161100, 1),
('PRD005-PINK-M', 5, 7, 3, 'SKU-PRD005-PNK-M', 65, 161100, 1),
('PRD005-BLACK-L', 5, 2, 4, 'SKU-PRD005-BLK-L', 50, 161100, 1),

-- PRD006 - Áo kiểu nữ
('PRD006-WHITE-S', 6, 1, 2, 'SKU-PRD006-WHT-S', 35, 336750, 1),
('PRD006-PINK-M', 6, 7, 3, 'SKU-PRD006-PNK-M', 40, 336750, 1),
('PRD006-BLUE-L', 6, 4, 4, 'SKU-PRD006-BLU-L', 30, 336750, 1),

-- PRD007 - Váy midi
('PRD007-WHITE-S', 7, 1, 2, 'SKU-PRD007-WHT-S', 25, 424150, 1),
('PRD007-PINK-M', 7, 7, 3, 'SKU-PRD007-PNK-M', 30, 424150, 1),
('PRD007-BLACK-L', 7, 2, 4, 'SKU-PRD007-BLK-L', 20, 424150, 1),

-- PRD008 - Quần jean nữ
('PRD008-BLUE-S', 8, 4, 2, 'SKU-PRD008-BLU-S', 45, 439200, 1),
('PRD008-BLACK-M', 8, 2, 3, 'SKU-PRD008-BLK-M', 50, 439200, 1),
('PRD008-GRAY-L', 8, 8, 4, 'SKU-PRD008-GRY-L', 40, 439200, 1),

-- PRD009 - Áo hoodie
('PRD009-BLACK-M', 9, 2, 3, 'SKU-PRD009-BLK-M', 55, 629100, 1),
('PRD009-GRAY-L', 9, 8, 4, 'SKU-PRD009-GRY-L', 50, 629100, 1),
('PRD009-BLUE-XL', 9, 4, 5, 'SKU-PRD009-BLU-XL', 45, 629100, 1),

-- PRD010 - Áo khoác jean
('PRD010-BLUE-M', 10, 4, 3, 'SKU-PRD010-BLU-M', 30, 629300, 1),
('PRD010-BLACK-L', 10, 2, 4, 'SKU-PRD010-BLK-L', 35, 629300, 1),
('PRD010-GRAY-XL', 10, 8, 5, 'SKU-PRD010-GRY-XL', 25, 629300, 1);
GO


-- ================================================
-- 6. PRODUCT IMAGES - 20 hình ảnh (2 hình mỗi sản phẩm)
-- ================================================
INSERT INTO ProductImages (ImageCode, ProductID, ImageURL, IsPrimary, SortOrder) VALUES
('IMG001-1', 1, '/images/products/prd001_1.jpg', 1, 1),
('IMG001-2', 1, '/images/products/prd001_2.jpg', 0, 2),
('IMG002-1', 2, '/images/products/prd002_1.jpg', 1, 1),
('IMG002-2', 2, '/images/products/prd002_2.jpg', 0, 2),
('IMG003-1', 3, '/images/products/prd003_1.jpg', 1, 1),
('IMG003-2', 3, '/images/products/prd003_2.jpg', 0, 2),
('IMG004-1', 4, '/images/products/prd004_1.jpg', 1, 1),
('IMG004-2', 4, '/images/products/prd004_2.jpg', 0, 2),
('IMG005-1', 5, '/images/products/prd005_1.jpg', 1, 1),
('IMG005-2', 5, '/images/products/prd005_2.jpg', 0, 2),
('IMG006-1', 6, '/images/products/prd006_1.jpg', 1, 1),
('IMG006-2', 6, '/images/products/prd006_2.jpg', 0, 2),
('IMG007-1', 7, '/images/products/prd007_1.jpg', 1, 1),
('IMG007-2', 7, '/images/products/prd007_2.jpg', 0, 2),
('IMG008-1', 8, '/images/products/prd008_1.jpg', 1, 1),
('IMG008-2', 8, '/images/products/prd008_2.jpg', 0, 2),
('IMG009-1', 9, '/images/products/prd009_1.jpg', 1, 1),
('IMG009-2', 9, '/images/products/prd009_2.jpg', 0, 2),
('IMG010-1', 10, '/images/products/prd010_1.jpg', 1, 1),
('IMG010-2', 10, '/images/products/prd010_2.jpg', 0, 2);
GO


-- ================================================
-- 7. PROMOTIONS - 10 mã khuyến mãi
-- ================================================
INSERT INTO Promotions (PromotionCode, PromotionName, Description, DiscountType, DiscountValue, MinOrderValue, MaxDiscountAmount, UsageLimit, UsedCount, StartDate, EndDate, IsActive) VALUES
('WELCOME10', N'Giảm 10% đơn hàng đầu', N'Giảm 10% cho đơn hàng đầu tiên', 'Percentage', 10, 200000, 50000, 100, 15, '2024-01-01', '2024-12-31', 1),
('SUMMER20', N'Giảm 20% mùa hè', N'Khuyến mãi mùa hè giảm 20%', 'Percentage', 20, 500000, 100000, 200, 45, '2024-06-01', '2024-08-31', 1),
('FREESHIP', N'Miễn phí vận chuyển', N'Miễn phí ship cho đơn từ 300k', 'FixedAmount', 30000, 300000, 30000, 500, 120, '2024-01-01', '2024-12-31', 1),
('MEGA50', N'Giảm 50k', N'Giảm 50k cho đơn từ 1 triệu', 'FixedAmount', 50000, 1000000, 50000, 150, 60, '2024-01-01', '2024-12-31', 1),
('NEWMEMBER', N'Thành viên mới', N'Giảm 15% cho thành viên mới', 'Percentage', 15, 0, 75000, 300, 85, '2024-01-01', '2024-12-31', 1),
('FLASH30', N'Flash Sale 30%', N'Flash sale giảm 30%', 'Percentage', 30, 800000, 200000, 100, 75, '2024-11-01', '2024-11-30', 1),
('VIP100', N'VIP giảm 100k', N'Giảm 100k cho khách VIP', 'FixedAmount', 100000, 1500000, 100000, 50, 20, '2024-01-01', '2024-12-31', 1),
('WEEKEND15', N'Cuối tuần giảm 15%', N'Giảm 15% cuối tuần', 'Percentage', 15, 400000, 80000, 250, 95, '2024-01-01', '2024-12-31', 1),
('BLACKFRI', N'Black Friday 40%', N'Black Friday giảm 40%', 'Percentage', 40, 1000000, 300000, 200, 150, '2024-11-25', '2024-11-29', 0),
('XMAS25', N'Giáng sinh 25%', N'Khuyến mãi Giáng sinh', 'Percentage', 25, 600000, 150000, 180, 0, '2024-12-20', '2024-12-26', 1);
GO


-- ================================================
-- 8. PROMOTION PRODUCTS - Áp dụng khuyến mãi cho sản phẩm
-- ================================================
INSERT INTO PromotionProducts (PromotionID, ProductID) VALUES
(2, 1), (2, 2), (2, 3), -- SUMMER20 áp dụng cho 3 sản phẩm
(6, 5), (6, 6), (6, 7), -- FLASH30 áp dụng cho 3 sản phẩm
(10, 1), (10, 2), (10, 5), (10, 6); -- XMAS25 áp dụng cho 4 sản phẩm
GO


-- ================================================
-- 9. CARTS - 5 giỏ hàng
-- ================================================
INSERT INTO Carts (CartCode, UserID) VALUES
('CART001', 3),
('CART002', 4),
('CART003', 5),
('CART004', 6),
('CART005', 7);
GO


-- ================================================
-- 10. CART ITEMS - 15 items trong giỏ hàng
-- ================================================
INSERT INTO CartItems (CartID, VariantID, Quantity) VALUES
(1, 1, 2), (1, 4, 1), (1, 13, 1),
(2, 7, 1), (2, 10, 2), (2, 16, 1),
(3, 19, 1), (3, 22, 2), (3, 25, 1),
(4, 2, 2), (4, 5, 1), (4, 14, 1),
(5, 28, 1), (5, 29, 1), (5, 30, 1);
GO


-- ================================================
-- 11. ORDERS - 10 đơn hàng
-- ================================================
INSERT INTO Orders (OrderCode, UserID, StatusID, RecipientName, RecipientPhone, ShippingAddress, SubTotal, ShippingFee, DiscountAmount, TotalAmount, PaymentMethod, PaymentStatus, PromotionID, OrderDate) VALUES
('ORD20241201001', 3, 5, N'Lê Văn An', '0903234567', N'123 Nguyễn Huệ, Phường Bến Nghé, Quận 1, TP HCM', 537300, 30000, 53730, 513570, 'COD', 'Paid', 1, '2024-11-15'),
('ORD20241201002', 4, 5, N'Phạm Thị Bình', '0904234567', N'789 Trần Hưng Đạo, Phường Cầu Ông Lãnh, Quận 1, TP HCM', 1018350, 0, 101835, 916515, 'Banking', 'Paid', 2, '2024-11-18'),
('ORD20241201003', 5, 4, N'Hoàng Văn Cường', '0905234567', N'321 Điện Biên Phủ, Phường Đakao, Quận 1, TP HCM', 629100, 30000, 0, 659100, 'COD', 'Pending', NULL, '2024-11-25'),
('ORD20241201004', 6, 3, N'Võ Thị Dung', '0906234567', N'654 Hai Bà Trưng, Phường Tân Định, Quận 1, TP HCM', 850950, 0, 30000, 820950, 'MoMo', 'Paid', 3, '2024-11-27'),
('ORD20241201005', 7, 5, N'Đặng Văn Em', '0907234567', N'987 Võ Văn Tần, Phường 5, Quận 3, TP HCM', 1258400, 0, 50000, 1208400, 'Banking', 'Paid', 4, '2024-11-10'),
('ORD20241201006', 8, 2, N'Bùi Thị Phương', '0908234567', N'147 Cách Mạng Tháng 8, Phường 7, Quận 3, TP HCM', 497250, 30000, 49725, 477525, 'COD', 'Pending', 1, '2024-11-28'),
('ORD20241201007', 9, 5, N'Mai Văn Giang', '0909234567', N'258 Lý Thái Tổ, Phường 1, Quận 10, TP HCM', 1258200, 0, 150000, 1108200, 'ZaloPay', 'Paid', 6, '2024-11-20'),
('ORD20241201008', 10, 1, N'Ngô Thị Hoa', '0910234567', N'369 Lạc Long Quân, Phường 5, Quận 11, TP HCM', 698000, 30000, 0, 728000, 'COD', 'Pending', NULL, '2024-11-29'),
('ORD20241201009', 3, 5, N'Lê Văn An', '0903234567', N'123 Nguyễn Huệ, Phường Bến Nghé, Quận 1, TP HCM', 1517400, 0, 227610, 1289790, 'Banking', 'Paid', 8, '2024-11-22'),
('ORD20241201010', 4, 6, N'Phạm Thị Bình', '0904234567', N'789 Trần Hưng Đạo, Phường Cầu Ông Lãnh, Quận 1, TP HCM', 629300, 30000, 0, 659300, 'COD', 'Cancelled', NULL, '2024-11-26');
GO


-- ================================================
-- 12. ORDER DETAILS - 25 chi tiết đơn hàng
-- ================================================
INSERT INTO OrderDetails (OrderID, VariantID, ProductName, ColorName, SizeName, Quantity, UnitPrice, Subtotal) VALUES
-- Order 1
(1, 1, N'Áo thun nam basic', N'Trắng', 'M', 2, 179100, 358200),
(1, 4, N'Áo sơ mi nam công sở', N'Trắng', 'M', 1, 179100, 179100),

-- Order 2
(2, 7, N'Quần jean nam slim fit', N'Xanh dương', '30', 1, 479200, 479200),
(2, 10, N'Quần kaki nam', N'Beige', 'M', 1, 349000, 349000),
(2, 13, N'Áo thun nữ form rộng', N'Trắng', 'S', 1, 161100, 161100),

-- Order 3
(3, 25, N'Áo hoodie unisex', N'Đen', 'M', 1, 629100, 629100),

-- Order 4
(4, 16, N'Áo kiểu nữ công sở', N'Trắng', 'S', 1, 336750, 336750),
(4, 19, N'Váy midi nữ', N'Trắng', 'S', 1, 424150, 424150),
(4, 22, N'Quần jean nữ skinny', N'Xanh dương', 'S', 1, 439200, 439200),

-- Order 5
(5, 7, N'Quần jean nam slim fit', N'Xanh dương', '30', 2, 479200, 958400),
(5, 10, N'Quần kaki nam', N'Beige', 'M', 1, 349000, 349000),

-- Order 6
(6, 13, N'Áo thun nữ form rộng', N'Trắng', 'S', 2, 161100, 322200),
(6, 16, N'Áo kiểu nữ công sở', N'Trắng', 'S', 1, 336750, 336750),

-- Order 7
(7, 1, N'Áo thun nam basic', N'Trắng', 'M', 3, 179100, 537300),
(7, 7, N'Quần jean nam slim fit', N'Xanh dương', '30', 1, 479200, 479200),
(7, 13, N'Áo thun nữ form rộng', N'Trắng', 'S', 1, 161100, 161100),

-- Order 8
(8, 28, N'Áo khoác jean nam', N'Xanh dương', 'M', 1, 629300, 629300),
(8, 29, N'Áo khoác jean nam', N'Đen', 'L', 1, 629300, 629300),

-- Order 9
(9, 4, N'Áo sơ mi nam công sở', N'Trắng', 'M', 2, 339150, 678300),
(9, 10, N'Quần kaki nam', N'Beige', 'M', 1, 349000, 349000),
(9, 16, N'Áo kiểu nữ công sở', N'Trắng', 'S', 1, 336750, 336750),
(9, 22, N'Quần jean nữ skinny', N'Xanh dương', 'S', 1, 439200, 439200),

-- Order 10
(10, 28, N'Áo khoác jean nam', N'Xanh dương', 'M', 1, 629300, 629300);
GO


-- ================================================
-- 13. ORDER STATUS HISTORY - 20 lịch sử trạng thái
-- ================================================
INSERT INTO OrderStatusHistory (OrderID, StatusID, Note, CreatedBy, CreatedAt) VALUES
(1, 1, N'Đơn hàng mới được tạo', 3, '2024-11-15 10:00:00'),
(1, 2, N'Đã xác nhận đơn hàng', 2, '2024-11-15 11:00:00'),
(1, 5, N'Giao hàng thành công', 2, '2024-11-17 15:30:00'),

(2, 1, N'Đơn hàng mới được tạo', 4, '2024-11-18 09:00:00'),
(2, 2, N'Đã xác nhận', 2, '2024-11-18 10:00:00'),
(2, 5, N'Giao hàng thành công', 2, '2024-11-20 14:00:00'),

(3, 1, N'Đơn hàng mới được tạo', 5, '2024-11-25 08:30:00'),
(3, 2, N'Đã xác nhận', 2, '2024-11-25 09:30:00'),
(3, 4, N'Đang giao hàng', 2, '2024-11-26 10:00:00'),

(4, 1, N'Đơn hàng mới được tạo', 6, '2024-11-27 11:00:00'),
(4, 2, N'Đã xác nhận', 2, '2024-11-27 12:00:00'),
(4, 3, N'Đang chuẩn bị hàng', 2, '2024-11-27 14:00:00'),

(5, 1, N'Đơn hàng mới được tạo', 7, '2024-11-10 13:00:00'),
(5, 2, N'Đã xác nhận', 2, '2024-11-10 14:00:00'),
(5, 5, N'Giao hàng thành công', 2, '2024-11-13 16:00:00'),

(6, 1, N'Đơn hàng mới được tạo', 8, '2024-11-28 15:00:00'),
(6, 2, N'Đã xác nhận', 2, '2024-11-28 16:00:00'),

(7, 1, N'Đơn hàng mới được tạo', 9, '2024-11-20 10:30:00'),
(7, 2, N'Đã xác nhận', 2, '2024-11-20 11:30:00'),
(7, 5, N'Giao hàng thành công', 2, '2024-11-23 15:00:00'),

(8, 1, N'Đơn hàng mới được tạo', 10, '2024-11-29 09:00:00'),

(9, 1, N'Đơn hàng mới được tạo', 3, '2024-11-22 12:00:00'),
(9, 2, N'Đã xác nhận', 2, '2024-11-22 13:00:00'),
(9, 5, N'Giao hàng thành công', 2, '2024-11-25 14:30:00'),

(10, 1, N'Đơn hàng mới được tạo', 4, '2024-11-26 10:00:00'),
(10, 6, N'Khách hàng hủy đơn', 4, '2024-11-26 15:00:00');
GO


-- ================================================
-- 14. PRODUCT REVIEWS - 10 đánh giá sản phẩm
-- ================================================
INSERT INTO ProductReviews (ReviewCode, ProductID, UserID, OrderDetailID, Rating, Comment, IsVerifiedPurchase, IsApproved, CreatedAt) VALUES
('REV001', 1, 3, 1, 5, N'Áo rất đẹp, chất liệu cotton mềm mại, mặc rất thoải mái. Sẽ ủng hộ shop lần sau!', 1, 1, '2024-11-18'),
('REV002', 2, 3, 2, 4, N'Áo sơ mi đẹp, form chuẩn. Tuy nhiên hơi dễ nhăn một chút.', 1, 1, '2024-11-18'),
('REV003', 3, 4, 3, 5, N'Quần jean chất lượng tốt, form slim vừa vặn, rất hài lòng!', 1, 1, '2024-11-21'),
('REV004', 4, 4, 4, 4, N'Quần kaki đẹp, màu sắc chuẩn như hình. Giá hơi cao một chút.', 1, 1, '2024-11-21'),
('REV005', 5, 4, 5, 5, N'Áo thun nữ form rộng rất trendy, chất vải mát mẻ. Rất đáng mua!', 1, 1, '2024-11-21'),
('REV006', 9, 3, 6, 5, N'Áo hoodie chất lượng xuất sắc, giữ ấm tốt, thiết kế đẹp!', 1, 1, '2024-11-28'),
('REV007', 6, 6, 7, 4, N'Áo kiểu đẹp, phù hợp đi làm. Chỉ tiếc là màu hơi dễ bám bẩn.', 1, 1, '2024-11-30'),
('REV008', 7, 6, 8, 5, N'Váy midi xinh xắn, vải mát, mặc rất thoải mái!', 1, 1, '2024-11-30'),
('REV009', 3, 7, 10, 5, N'Quần jean đẹp xuất sắc, chất lượng cao. Đặt 2 cái luôn!', 1, 1, '2024-11-14'),
('REV010', 1, 9, 14, 4, N'Áo thun basic đẹp, dễ phối đồ. Giá hợp lý.', 1, 1, '2024-11-26');
GO


-- ================================================
-- 15. REVIEW IMAGES - 10 hình ảnh đánh giá
-- ================================================
INSERT INTO ReviewImages (ReviewID, ImageURL, CreatedAt) VALUES
(1, '/images/reviews/rev001_1.jpg', '2024-11-18'),
(1, '/images/reviews/rev001_2.jpg', '2024-11-18'),
(3, '/images/reviews/rev003_1.jpg', '2024-11-21'),
(5, '/images/reviews/rev005_1.jpg', '2024-11-21'),
(5, '/images/reviews/rev005_2.jpg', '2024-11-21'),
(6, '/images/reviews/rev006_1.jpg', '2024-11-28'),
(8, '/images/reviews/rev008_1.jpg', '2024-11-30'),
(8, '/images/reviews/rev008_2.jpg', '2024-11-30'),
(9, '/images/reviews/rev009_1.jpg', '2024-11-14'),
(10, '/images/reviews/rev010_1.jpg', '2024-11-26');
GO


-- ================================================
-- 16. WISHLISTS - 10 sản phẩm yêu thích
-- ================================================
INSERT INTO Wishlists (UserID, ProductID, AddedAt) VALUES
(3, 6, '2024-11-10'),
(3, 7, '2024-11-12'),
(4, 9, '2024-11-15'),
(4, 10, '2024-11-15'),
(5, 2, '2024-11-18'),
(5, 6, '2024-11-18'),
(6, 1, '2024-11-20'),
(7, 3, '2024-11-22'),
(8, 5, '2024-11-25'),
(9, 8, '2024-11-27');
GO


-- ================================================
-- 17. INVENTORY TRANSACTIONS - 10 giao dịch kho
-- ================================================
INSERT INTO InventoryTransactions (TransactionCode, VariantID, TransactionType, Quantity, Note, CreatedBy, CreatedAt) VALUES
('IMP20241101001', 1, 'Import', 100, N'Nhập hàng đầu tháng 11', 2, '2024-11-01'),
('IMP20241101002', 4, 'Import', 80, N'Nhập hàng đầu tháng 11', 2, '2024-11-01'),
('IMP20241101003', 7, 'Import', 120, N'Nhập hàng đầu tháng 11', 2, '2024-11-01'),
('EXP20241115001', 1, 'Export', 2, N'Xuất kho cho đơn hàng ORD20241201001', 2, '2024-11-15'),
('EXP20241118001', 7, 'Export', 1, N'Xuất kho cho đơn hàng ORD20241201002', 2, '2024-11-18'),
('ADJ20241120001', 13, 'Adjustment', -5, N'Điều chỉnh tồn kho do kiểm kê phát hiện thiếu', 2, '2024-11-20'),
('IMP20241125001', 25, 'Import', 100, N'Nhập hàng bổ sung', 2, '2024-11-25'),
('EXP20241125002', 25, 'Export', 1, N'Xuất kho cho đơn hàng ORD20241201003', 2, '2024-11-25'),
('IMP20241128001', 28, 'Import', 60, N'Nhập hàng mới về', 2, '2024-11-28'),
('ADJ20241129001', 16, 'Adjustment', 3, N'Điều chỉnh tồn kho sau kiểm kê', 2, '2024-11-29');
GO


-- ================================================
-- 18. CHAT SESSIONS - 10 phiên chat
-- ================================================
INSERT INTO ChatSessions (SessionCode, UserID, SupportStaffID, Status, StartedAt, EndedAt) VALUES
('CHAT20241115001', 3, 2, 'Closed', '2024-11-15 10:00:00', '2024-11-15 10:30:00'),
('CHAT20241116001', 4, 2, 'Closed', '2024-11-16 14:00:00', '2024-11-16 14:20:00'),
('CHAT20241118001', 5, 2, 'Closed', '2024-11-18 09:00:00', '2024-11-18 09:15:00'),
('CHAT20241120001', 6, 2, 'Closed', '2024-11-20 16:00:00', '2024-11-20 16:25:00'),
('CHAT20241122001', 7, 2, 'Closed', '2024-11-22 11:00:00', '2024-11-22 11:10:00'),
('CHAT20241125001', 8, 2, 'InProgress', '2024-11-25 13:00:00', NULL),
('CHAT20241126001', 9, 2, 'Closed', '2024-11-26 15:30:00', '2024-11-26 15:45:00'),
('CHAT20241127001', 10, 2, 'Closed', '2024-11-27 10:00:00', '2024-11-27 10:20:00'),
('CHAT20241128001', 3, 2, 'Open', '2024-11-28 14:00:00', NULL),
('CHAT20241129001', 4, 2, 'Closed', '2024-11-29 09:00:00', '2024-11-29 09:30:00');
GO


-- ================================================
-- 19. CHAT MESSAGES - 30 tin nhắn (3 tin mỗi phiên)
-- ================================================
INSERT INTO ChatMessages (SessionID, SenderID, MessageContent, IsRead, SentAt) VALUES
-- Chat Session 1
(1, 3, N'Xin chào, tôi muốn hỏi về sản phẩm áo thun nam basic', 1, '2024-11-15 10:00:00'),
(1, 2, N'Chào anh, em có thể tư vấn cho anh về sản phẩm này ạ. Anh muốn biết thông tin gì?', 1, '2024-11-15 10:01:00'),
(1, 3, N'Chất liệu áo có co giãn không? Tôi cao 1m75 nặng 70kg thì mặc size nào?', 1, '2024-11-15 10:02:00'),

-- Chat Session 2
(2, 4, N'Shop ơi, đơn hàng của tôi khi nào được giao?', 1, '2024-11-16 14:00:00'),
(2, 2, N'Dạ cho em xin mã đơn hàng để em kiểm tra giúp chị ạ', 1, '2024-11-16 14:02:00'),
(2, 4, N'Mã đơn là ORD20241201002', 1, '2024-11-16 14:03:00'),

-- Chat Session 3
(3, 5, N'Tôi muốn đổi size sản phẩm', 1, '2024-11-18 09:00:00'),
(3, 2, N'Dạ, anh vui lòng cung cấp mã đơn hàng để em hỗ trợ ạ', 1, '2024-11-18 09:02:00'),
(3, 5, N'Được, để tôi tìm mã đơn', 1, '2024-11-18 09:05:00'),

-- Chat Session 4
(4, 6, N'Áo kiểu nữ có màu nào khác không?', 1, '2024-11-20 16:00:00'),
(4, 2, N'Dạ, hiện tại shop còn 3 màu: trắng, hồng và xanh dương ạ', 1, '2024-11-20 16:03:00'),
(4, 6, N'Vậy shop còn size M màu hồng không?', 1, '2024-11-20 16:05:00'),

-- Chat Session 5
(5, 7, N'Cho tôi hỏi về chính sách đổi trả', 1, '2024-11-22 11:00:00'),
(5, 2, N'Dạ, shop hỗ trợ đổi trả trong vòng 7 ngày kể từ khi nhận hàng ạ', 1, '2024-11-22 11:02:00'),
(5, 7, N'Oke, cảm ơn shop', 1, '2024-11-22 11:03:00'),

-- Chat Session 6
(6, 8, N'Tôi muốn hủy đơn hàng', 0, '2024-11-25 13:00:00'),
(6, 2, N'Dạ, cho em xin mã đơn hàng ạ', 0, '2024-11-25 13:02:00'),
(6, 8, N'ORD20241201006', 0, '2024-11-25 13:05:00'),

-- Chat Session 7
(7, 9, N'Sản phẩm có bảo hành không?', 1, '2024-11-26 15:30:00'),
(7, 2, N'Dạ, sản phẩm được bảo hành về lỗi may gia công trong 30 ngày ạ', 1, '2024-11-26 15:32:00'),
(7, 9, N'Ok, tôi hiểu rồi', 1, '2024-11-26 15:35:00'),

-- Chat Session 8
(8, 10, N'Shop có ship toàn quốc không?', 1, '2024-11-27 10:00:00'),
(8, 2, N'Dạ có ạ, shop ship toàn quốc. Phí ship tùy vào khu vực ạ', 1, '2024-11-27 10:02:00'),
(8, 10, N'Ship đến Đà Nẵng mất bao nhiêu tiền?', 1, '2024-11-27 10:05:00'),

-- Chat Session 9
(9, 3, N'Tôi muốn hỏi về mã giảm giá', 0, '2024-11-28 14:00:00'),
(9, 2, N'Dạ, hiện tại shop đang có các mã giảm giá gì ạ', 0, '2024-11-28 14:02:00'),

-- Chat Session 10
(10, 4, N'Làm sao để trở thành thành viên VIP?', 1, '2024-11-29 09:00:00'),
(10, 2, N'Dạ, khách hàng mua hàng đạt 10 triệu sẽ được nâng lên VIP ạ', 1, '2024-11-29 09:03:00'),
(10, 4, N'Oke, cảm ơn shop nhé', 1, '2024-11-29 09:05:00');
GO


-- ================================================
-- KẾT THÚC INSERT DATA
-- ================================================

PRINT N'==============================================';
PRINT N'Đã hoàn thành insert dữ liệu mẫu!';
PRINT N'';
PRINT N'TỔNG KẾT DỮ LIỆU:';
PRINT N'- Roles: 4 bản ghi';
PRINT N'- Users: 10 bản ghi';
PRINT N'- ShippingAddresses: 10 bản ghi';
PRINT N'- OrderStatuses: 6 bản ghi';
PRINT N'- Colors: 10 bản ghi';
PRINT N'- Sizes: 6 bản ghi';
PRINT N'- Categories: 7 bản ghi (3 cấp 1, 4 cấp 2)';
PRINT N'- CategoryHierarchy: 4 quan hệ cha-con';
PRINT N'- Brands: 10 bản ghi';
PRINT N'- Products: 10 bản ghi';
PRINT N'- ProductVariants: 30 bản ghi';
PRINT N'- ProductImages: 20 bản ghi';
PRINT N'- Promotions: 10 bản ghi';
PRINT N'- PromotionProducts: 10 bản ghi';
PRINT N'- Carts: 5 bản ghi';
PRINT N'- CartItems: 15 bản ghi';
PRINT N'- Orders: 10 bản ghi';
PRINT N'- OrderDetails: 25 bản ghi';
PRINT N'- OrderStatusHistory: 30 bản ghi';
PRINT N'- ProductReviews: 10 bản ghi';
PRINT N'- ReviewImages: 10 bản ghi';
PRINT N'- Wishlists: 10 bản ghi';
PRINT N'- InventoryTransactions: 10 bản ghi';
PRINT N'- ChatSessions: 10 bản ghi';
PRINT N'- ChatMessages: 30 bản ghi';
PRINT N'==============================================';