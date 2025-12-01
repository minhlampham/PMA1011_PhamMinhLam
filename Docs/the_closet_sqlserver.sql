-- ================================================
-- DATABASE: SHOP QUẦN ÁO
-- ================================================
CREATE DATABASE the_closet;
GO

USE the_closet;
GO

-- ================================================
-- 1. BẢNG QUẢN LÝ NGƯỜI DÙNG
-- ================================================

-- Bảng vai trò
CREATE TABLE Roles (
    RoleID INT PRIMARY KEY IDENTITY(1,1),
    RoleCode NVARCHAR(20) NOT NULL UNIQUE,  
    RoleName NVARCHAR(50) NOT NULL,
    Description NVARCHAR(200),
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO

-- Bảng người dùng
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    UserCode NVARCHAR(20) NOT NULL UNIQUE,   
    Username NVARCHAR(50) NOT NULL UNIQUE,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    FullName NVARCHAR(100),
    Phone NVARCHAR(20),
    RoleID INT FOREIGN KEY REFERENCES Roles(RoleID),
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);
GO

-- Bảng địa chỉ giao hàng
CREATE TABLE ShippingAddresses (
    AddressID INT PRIMARY KEY IDENTITY(1,1),
    AddressCode NVARCHAR(20) NOT NULL UNIQUE,  
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    RecipientName NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(20) NOT NULL,
    AddressLine NVARCHAR(255) NOT NULL,
    Ward NVARCHAR(100),
    District NVARCHAR(100),
    City NVARCHAR(100) NOT NULL,
    IsDefault BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO


-- ================================================
-- 2. BẢNG QUẢN LÝ SẢN PHẨM
-- ================================================

-- Bảng danh mục sản phẩm (LOẠI BỎ FK TRỎ ĐẾN CHÍNH NÓ)
-- Dùng bảng riêng để quản lý cấu trúc cây
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryCode NVARCHAR(20) NOT NULL UNIQUE,  
    CategoryName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500),
    Level INT DEFAULT 1,  -- Cấp độ trong cây (1, 2, 3...)
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO

-- Bảng quan hệ cha-con của danh mục (thay thế ParentCategoryID)
CREATE TABLE CategoryHierarchy (
    HierarchyID INT PRIMARY KEY IDENTITY(1,1),
    ParentCategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID),
    ChildCategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID),
    CONSTRAINT UQ_CategoryHierarchy UNIQUE(ParentCategoryID, ChildCategoryID),
    CONSTRAINT CK_CategoryHierarchy CHECK (ParentCategoryID <> ChildCategoryID)
);
GO

-- Bảng thương hiệu
CREATE TABLE Brands (
    BrandID INT PRIMARY KEY IDENTITY(1,1),
    BrandCode NVARCHAR(20) NOT NULL UNIQUE,  
    BrandName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500),
    Logo NVARCHAR(255),
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO

-- Bảng sản phẩm
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductCode NVARCHAR(20) NOT NULL UNIQUE,  
    ProductName NVARCHAR(200) NOT NULL,
    CategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID),
    BrandID INT FOREIGN KEY REFERENCES Brands(BrandID),
    Description NVARCHAR(MAX),
    Material NVARCHAR(200),
    BasePrice DECIMAL(18,2) NOT NULL,
    DiscountPercent DECIMAL(5,2) DEFAULT 0,
    IsActive BIT DEFAULT 1,
    IsFeatured BIT DEFAULT 0,
    ViewCount INT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);
GO

-- Bảng màu sắc
CREATE TABLE Colors (
    ColorID INT PRIMARY KEY IDENTITY(1,1),
    ColorCode NVARCHAR(10) NOT NULL UNIQUE,   
    ColorName NVARCHAR(50) NOT NULL,
    HexCode NVARCHAR(7)
);
GO

-- Bảng size
CREATE TABLE Sizes (
    SizeID INT PRIMARY KEY IDENTITY(1,1),
    SizeCode NVARCHAR(10) NOT NULL UNIQUE,   
    SizeName NVARCHAR(10) NOT NULL,
    SortOrder INT DEFAULT 0
);
GO

-- Bảng biến thể sản phẩm
CREATE TABLE ProductVariants (
    VariantID INT PRIMARY KEY IDENTITY(1,1),
    VariantCode NVARCHAR(30) NOT NULL UNIQUE,   
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    ColorID INT FOREIGN KEY REFERENCES Colors(ColorID),
    SizeID INT FOREIGN KEY REFERENCES Sizes(SizeID),
    SKU NVARCHAR(50) UNIQUE,  -- SKU có thể khác với VariantCode
    StockQuantity INT DEFAULT 0,
    Price DECIMAL(18,2),
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT UQ_ProductVariant UNIQUE(ProductID, ColorID, SizeID)
);
GO

-- Bảng hình ảnh sản phẩm
CREATE TABLE ProductImages (
    ImageID INT PRIMARY KEY IDENTITY(1,1),
    ImageCode NVARCHAR(30) NOT NULL UNIQUE,  
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    ImageURL NVARCHAR(500) NOT NULL,
    IsPrimary BIT DEFAULT 0,
    SortOrder INT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO

-- ================================================
-- 3. BẢNG QUẢN LÝ KHUYẾN MÃI
-- ================================================

-- Bảng khuyến mãi
CREATE TABLE Promotions (
    PromotionID INT PRIMARY KEY IDENTITY(1,1),
    PromotionCode NVARCHAR(50) UNIQUE NOT NULL,   
    PromotionName NVARCHAR(200) NOT NULL,
    Description NVARCHAR(500),
    DiscountType NVARCHAR(20) CHECK (DiscountType IN ('Percentage', 'FixedAmount')),
    DiscountValue DECIMAL(18,2) NOT NULL,
    MinOrderValue DECIMAL(18,2) DEFAULT 0,
    MaxDiscountAmount DECIMAL(18,2),
    UsageLimit INT,
    UsedCount INT DEFAULT 0,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL,
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO

-- Bảng sản phẩm áp dụng khuyến mãi
CREATE TABLE PromotionProducts (
    PromotionProductID INT PRIMARY KEY IDENTITY(1,1),
    PromotionID INT FOREIGN KEY REFERENCES Promotions(PromotionID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    CONSTRAINT UQ_PromotionProduct UNIQUE(PromotionID, ProductID)
);
GO

-- ================================================
-- 4. BẢNG QUẢN LÝ GIỎ HÀNG
-- ================================================

-- Bảng giỏ hàng
CREATE TABLE Carts (
    CartID INT PRIMARY KEY IDENTITY(1,1),
    CartCode NVARCHAR(20) NOT NULL UNIQUE,  
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);
GO

-- Bảng chi tiết giỏ hàng
CREATE TABLE CartItems (
    CartItemID INT PRIMARY KEY IDENTITY(1,1),
    CartID INT FOREIGN KEY REFERENCES Carts(CartID),
    VariantID INT FOREIGN KEY REFERENCES ProductVariants(VariantID),
    Quantity INT NOT NULL CHECK (Quantity > 0),
    AddedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT UQ_CartItem UNIQUE(CartID, VariantID)
);
GO

-- ================================================
-- 5. BẢNG QUẢN LÝ ĐƠN HÀNG
-- ================================================

-- Bảng trạng thái đơn hàng
CREATE TABLE OrderStatuses (
    StatusID INT PRIMARY KEY IDENTITY(1,1),
    StatusCode NVARCHAR(20) NOT NULL UNIQUE,  
    StatusName NVARCHAR(50) NOT NULL,
    Description NVARCHAR(200),
    SortOrder INT DEFAULT 0
);
GO


-- Bảng đơn hàng
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    OrderCode NVARCHAR(50) UNIQUE NOT NULL,   
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    StatusID INT FOREIGN KEY REFERENCES OrderStatuses(StatusID),
    
    -- Thông tin giao hàng
    RecipientName NVARCHAR(100) NOT NULL,
    RecipientPhone NVARCHAR(20) NOT NULL,
    ShippingAddress NVARCHAR(500) NOT NULL,
    
    -- Thông tin thanh toán
    SubTotal DECIMAL(18,2) NOT NULL,
    ShippingFee DECIMAL(18,2) DEFAULT 0,
    DiscountAmount DECIMAL(18,2) DEFAULT 0,
    TotalAmount DECIMAL(18,2) NOT NULL,
    
    PaymentMethod NVARCHAR(50),
    PaymentStatus NVARCHAR(50) DEFAULT 'Pending',
    
    PromotionID INT FOREIGN KEY REFERENCES Promotions(PromotionID),
    Note NVARCHAR(500),
    
    OrderDate DATETIME DEFAULT GETDATE(),
    CompletedDate DATETIME,
    CancelledDate DATETIME,
    CancelReason NVARCHAR(500)
);
GO

-- Bảng chi tiết đơn hàng
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    VariantID INT FOREIGN KEY REFERENCES ProductVariants(VariantID),
    ProductName NVARCHAR(200) NOT NULL,
    ColorName NVARCHAR(50),
    SizeName NVARCHAR(10),
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(18,2) NOT NULL,
    Subtotal DECIMAL(18,2) NOT NULL
);
GO


-- Bảng lịch sử trạng thái đơn hàng
CREATE TABLE OrderStatusHistory (
    HistoryID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    StatusID INT FOREIGN KEY REFERENCES OrderStatuses(StatusID),
    Note NVARCHAR(500),
    CreatedBy INT FOREIGN KEY REFERENCES Users(UserID),
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO


-- ================================================
-- 6. BẢNG QUẢN LÝ ĐÁNH GIÁ
-- ================================================

-- Bảng đánh giá sản phẩm
CREATE TABLE ProductReviews (
    ReviewID INT PRIMARY KEY IDENTITY(1,1),
    ReviewCode NVARCHAR(20) NOT NULL UNIQUE,  
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    OrderDetailID INT FOREIGN KEY REFERENCES OrderDetails(OrderDetailID),
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment NVARCHAR(1000),
    IsVerifiedPurchase BIT DEFAULT 0,
    IsApproved BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);
GO


-- Bảng hình ảnh đánh giá
CREATE TABLE ReviewImages (
    ReviewImageID INT PRIMARY KEY IDENTITY(1,1),
    ReviewID INT FOREIGN KEY REFERENCES ProductReviews(ReviewID),
    ImageURL NVARCHAR(500) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO

-- ================================================
-- 7. BẢNG WISHLIST
-- ================================================

-- Bảng danh sách yêu thích
CREATE TABLE Wishlists (
    WishlistID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    AddedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT UQ_Wishlist UNIQUE(UserID, ProductID)
);
GO

-- ================================================
-- 8. BẢNG QUẢN LÝ KHO HÀNG
-- ================================================

-- Bảng lịch sử nhập/xuất kho
CREATE TABLE InventoryTransactions (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    TransactionCode NVARCHAR(30) NOT NULL UNIQUE,  
    VariantID INT FOREIGN KEY REFERENCES ProductVariants(VariantID),
    TransactionType NVARCHAR(20) CHECK (TransactionType IN ('Import', 'Export', 'Adjustment')),
    Quantity INT NOT NULL,
    Note NVARCHAR(500),
    CreatedBy INT FOREIGN KEY REFERENCES Users(UserID),
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO


-- ================================================
-- 9. BẢNG HỖ TRỢ CHAT
-- ================================================

-- Bảng phiên chat
CREATE TABLE ChatSessions (
    SessionID INT PRIMARY KEY IDENTITY(1,1),
    SessionCode NVARCHAR(30) NOT NULL UNIQUE,  
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    SupportStaffID INT FOREIGN KEY REFERENCES Users(UserID),
    Status NVARCHAR(20) CHECK (Status IN ('Open', 'InProgress', 'Closed')),
    StartedAt DATETIME DEFAULT GETDATE(),
    EndedAt DATETIME
);
GO


-- Bảng tin nhắn chat
CREATE TABLE ChatMessages (
    MessageID INT PRIMARY KEY IDENTITY(1,1),
    SessionID INT FOREIGN KEY REFERENCES ChatSessions(SessionID),
    SenderID INT FOREIGN KEY REFERENCES Users(UserID),
    MessageContent NVARCHAR(MAX) NOT NULL,
    IsRead BIT DEFAULT 0,
    SentAt DATETIME DEFAULT GETDATE()
);
GO


-- ================================================
-- 10. VIEWS CHO BÁO CÁO
-- ================================================

-- View danh mục cây (thay thế cho ParentCategoryID)
CREATE VIEW vw_CategoryTree AS
SELECT 
    c.CategoryID,
    c.CategoryCode,
    c.CategoryName,
    c.Level,
    ch.ParentCategoryID,
    pc.CategoryCode AS ParentCategoryCode,
    pc.CategoryName AS ParentCategoryName
FROM Categories c
LEFT JOIN CategoryHierarchy ch ON c.CategoryID = ch.ChildCategoryID
LEFT JOIN Categories pc ON ch.ParentCategoryID = pc.CategoryID;
GO

-- View báo cáo doanh thu
CREATE VIEW vw_SalesReport AS
SELECT 
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    COUNT(OrderID) AS TotalOrders,
    SUM(TotalAmount) AS TotalRevenue,
    AVG(TotalAmount) AS AvgOrderValue
FROM Orders
WHERE PaymentStatus = 'Paid'
GROUP BY YEAR(OrderDate), MONTH(OrderDate);
GO

-- View sản phẩm bán chạy
CREATE VIEW vw_BestSellingProducts AS
SELECT TOP 100
    p.ProductID,
    p.ProductCode,
    p.ProductName,
    c.CategoryName,
    b.BrandName,
    SUM(od.Quantity) AS TotalSold,
    SUM(od.Subtotal) AS TotalRevenue
FROM Products p
JOIN ProductVariants pv ON p.ProductID = pv.ProductID
JOIN OrderDetails od ON pv.VariantID = od.VariantID
JOIN Categories c ON p.CategoryID = c.CategoryID
LEFT JOIN Brands b ON p.BrandID = b.BrandID
JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.PaymentStatus = 'Paid'
GROUP BY p.ProductID, p.ProductCode, p.ProductName, c.CategoryName, b.BrandName
ORDER BY TotalSold DESC;
GO

-- ================================================
-- INSERT DỮ LIỆU MẪU
-- ================================================

-- Insert Roles
INSERT INTO Roles (RoleCode, RoleName, Description) VALUES
('GUEST', N'Khách vãng lai', N'Người dùng chưa đăng nhập'),
('CUSTOMER', N'Khách hàng', N'Khách hàng đã đăng ký'),
('MANAGER', N'Quản lý', N'Quản lý cửa hàng'),
('ADMIN', N'Quản trị viên', N'Quản trị hệ thống');

-- Insert Order Statuses
INSERT INTO OrderStatuses (StatusCode, StatusName, Description, SortOrder) VALUES
('PENDING', N'Chờ xác nhận', N'Đơn hàng chờ xác nhận', 1),
('CONFIRMED', N'Đã xác nhận', N'Đơn hàng đã được xác nhận', 2),
('PREPARING', N'Đang chuẩn bị', N'Đang chuẩn bị hàng', 3),
('SHIPPING', N'Đang giao', N'Đang giao hàng', 4),
('DELIVERED', N'Đã giao', N'Đã giao hàng thành công', 5),
('CANCELLED', N'Đã hủy', N'Đơn hàng đã bị hủy', 6);

-- Insert Colors
INSERT INTO Colors (ColorCode, ColorName, HexCode) VALUES
('WHITE', N'Trắng', '#FFFFFF'),
('BLACK', N'Đen', '#000000'),
('RED', N'Đỏ', '#FF0000'),
('BLUE', N'Xanh dương', '#0000FF'),
('GREEN', N'Xanh lá', '#00FF00'),
('YELLOW', N'Vàng', '#FFFF00'),
('PINK', N'Hồng', '#FFC0CB'),
('GRAY', N'Xám', '#808080'),
('BROWN', N'Nâu', '#A52A2A'),
('BEIGE', N'Be', '#F5F5DC');

-- Insert Sizes
INSERT INTO Sizes (SizeCode, SizeName, SortOrder) VALUES
('XS', 'XS', 1), 
('S', 'S', 2), 
('M', 'M', 3), 
('L', 'L', 4), 
('XL', 'XL', 5), 
('XXL', 'XXL', 6);

-- Insert Categories (Level 1 - Danh mục cha)
INSERT INTO Categories (CategoryCode, CategoryName, Description, Level) VALUES
('CAT_MEN', N'Thời trang Nam', N'Các sản phẩm dành cho nam giới', 1),
('CAT_WOMEN', N'Thời trang Nữ', N'Các sản phẩm dành cho nữ giới', 1),
('CAT_ACCESSORIES', N'Phụ kiện', N'Phụ kiện thời trang', 1);

-- Insert Categories (Level 2 - Danh mục con)
INSERT INTO Categories (CategoryCode, CategoryName, Description, Level) VALUES
('CAT_MEN_SHIRT', N'Áo Nam', N'Các loại áo dành cho nam', 2),
('CAT_MEN_PANT', N'Quần Nam', N'Các loại quần dành cho nam', 2),
('CAT_WOMEN_SHIRT', N'Áo Nữ', N'Các loại áo dành cho nữ', 2),
('CAT_WOMEN_PANT', N'Quần Nữ', N'Các loại quần dành cho nữ', 2);

-- Insert Category Hierarchy (quan hệ cha-con)
INSERT INTO CategoryHierarchy (ParentCategoryID, ChildCategoryID) 
SELECT p.CategoryID, c.CategoryID
FROM Categories p, Categories c
WHERE p.CategoryCode = 'CAT_MEN' AND c.CategoryCode IN ('CAT_MEN_SHIRT', 'CAT_MEN_PANT');

INSERT INTO CategoryHierarchy (ParentCategoryID, ChildCategoryID) 
SELECT p.CategoryID, c.CategoryID
FROM Categories p, Categories c
WHERE p.CategoryCode = 'CAT_WOMEN' AND c.CategoryCode IN ('CAT_WOMEN_SHIRT', 'CAT_WOMEN_PANT');

-- ================================================
-- TẠO INDEXES
-- ================================================

-- Index cho mã nghiệp vụ
CREATE INDEX IX_Users_UserCode ON Users(UserCode);
CREATE INDEX IX_Products_ProductCode ON Products(ProductCode);
CREATE INDEX IX_Orders_OrderCode ON Orders(OrderCode);
CREATE INDEX IX_ProductVariants_VariantCode ON ProductVariants(VariantCode);

-- Index cho Users
CREATE INDEX IX_Users_Email ON Users(Email);
CREATE INDEX IX_Users_RoleID ON Users(RoleID);

-- Index cho Products
CREATE INDEX IX_Products_CategoryID ON Products(CategoryID);
CREATE INDEX IX_Products_BrandID ON Products(BrandID);
CREATE INDEX IX_Products_IsActive ON Products(IsActive);

-- Index cho ProductVariants
CREATE INDEX IX_ProductVariants_ProductID ON ProductVariants(ProductID);
CREATE INDEX IX_ProductVariants_SKU ON ProductVariants(SKU);

-- Index cho Orders
CREATE INDEX IX_Orders_UserID ON Orders(UserID);
CREATE INDEX IX_Orders_StatusID ON Orders(StatusID);
CREATE INDEX IX_Orders_OrderDate ON Orders(OrderDate);

-- Index cho OrderDetails
CREATE INDEX IX_OrderDetails_OrderID ON OrderDetails(OrderID);
CREATE INDEX IX_OrderDetails_VariantID ON OrderDetails(VariantID);

-- Index cho ProductReviews
CREATE INDEX IX_ProductReviews_ProductID ON ProductReviews(ProductID);
CREATE INDEX IX_ProductReviews_UserID ON ProductReviews(UserID);

-- Index cho CategoryHierarchy
CREATE INDEX IX_CategoryHierarchy_Parent ON CategoryHierarchy(ParentCategoryID);
CREATE INDEX IX_CategoryHierarchy_Child ON CategoryHierarchy(ChildCategoryID);

GO