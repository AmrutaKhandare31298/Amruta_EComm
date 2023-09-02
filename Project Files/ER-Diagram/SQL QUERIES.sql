use ecom;

CREATE TABLE User (
  userID INT PRIMARY KEY,
  username VARCHAR(50),
  email VARCHAR(100),
  password VARCHAR(100),
  role VARCHAR(20),
  createdAt DATETIME,
  updatedAt DATETIME
);

CREATE TABLE Category (
  categoryID INT PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE Brand (
  brandID INT PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE Product (
  productID INT PRIMARY KEY,
  name VARCHAR(100),
  description TEXT,
  price DECIMAL(10, 2),
  image VARCHAR(255),
  categoryID INT,
  brandID INT,
  createdAt DATETIME,
  updatedAt DATETIME,
  FOREIGN KEY (categoryID) REFERENCES Category(categoryID),
  FOREIGN KEY (brandID) REFERENCES Brand(brandID)
);

CREATE TABLE Cart (
  cartID INT PRIMARY KEY,
  userID INT,
  createdAt DATETIME,
  updatedAt DATETIME,
  FOREIGN KEY (userID) REFERENCES User(userID)
);

CREATE TABLE CartItem (
  cartItemID INT PRIMARY KEY,
  cartID INT,
  productID INT,
  quantity INT,
  createdAt DATETIME,
  updatedAt DATETIME,
  FOREIGN KEY (cartID) REFERENCES Cart(cartID),
  FOREIGN KEY (productID) REFERENCES Product(productID)
);

CREATE TABLE Orderr (
  orderID INT PRIMARY KEY,
  userID INT,
  status VARCHAR(20),
  paymentMethod VARCHAR(20),
  totalAmount DECIMAL(10, 2),
  createdAt DATETIME,
  updatedAt DATETIME,
  FOREIGN KEY (userID) REFERENCES User(userID)
);

CREATE TABLE OrderItem (
  orderItemID INT PRIMARY KEY,
  orderID INT,
  productID INT,
  quantity INT,
  price DECIMAL(10, 2),
  createdAt DATETIME,
  updatedAt DATETIME,
  FOREIGN KEY (orderID) REFERENCES Orderr(orderID),
  FOREIGN KEY (productID) REFERENCES Product(productID)
);