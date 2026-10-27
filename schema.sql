CREATE DATABASE PetCareGrooming;

-- ----------------------------------------------------------------------------
-- 1. Core Entity Tables (Independent Tables)
-- ----------------------------------------------------------------------------

CREATE TABLE Owners (
    OwnerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    Email VARCHAR(100) NULL,
    Address VARCHAR(255) NULL,
    City VARCHAR(100) NULL,
    State CHAR(2) NULL
);

CREATE TABLE Groomers (
    GroomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    Email VARCHAR(100) NULL,
    Specialty VARCHAR(100) NULL
);

CREATE TABLE Services (
    ServiceID INT AUTO_INCREMENT PRIMARY KEY,
    ServiceName VARCHAR(100) NOT NULL,
    Description TEXT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    DurationMinutes INT NOT NULL
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL DEFAULT 0
);

-- ----------------------------------------------------------------------------
-- 2. Dependent Entity Tables (Contains Foreign Keys)
-- ----------------------------------------------------------------------------

CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    Groomers_GroomerID INT NOT NULL,
    AppointmentDate DATE NOT NULL,
    Status VARCHAR(50) NOT NULL DEFAULT 'Scheduled',
    Notes TEXT NULL,
    CONSTRAINT fk_appointments_groomers 
        FOREIGN KEY (Groomers_GroomerID) REFERENCES Groomers(GroomerID) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Pets (
    PetID INT AUTO_INCREMENT PRIMARY KEY,
    Owners_OwnerID INT NOT NULL,
    Appointments_AppointmentID INT NULL,
    Name VARCHAR(50) NOT NULL,
    Species VARCHAR(50) NOT NULL,
    Breed VARCHAR(100) NULL,
    Age INT NULL,
    Weight DECIMAL(5, 2) NULL,
    MedicalNotes TEXT NULL,
    CONSTRAINT fk_pets_owners 
        FOREIGN KEY (Owners_OwnerID) REFERENCES Owners(OwnerID) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_pets_appointments 
        FOREIGN KEY (Appointments_AppointmentID) REFERENCES Appointments(AppointmentID) 
        ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    Appointments_AppointmentID INT NOT NULL,
    AmountPaid DECIMAL(10, 2) NOT NULL,
    PaymentDate DATE NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL,
    CONSTRAINT fk_payments_appointments 
        FOREIGN KEY (Appointments_AppointmentID) REFERENCES Appointments(AppointmentID) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Sales (
    SaleID INT AUTO_INCREMENT PRIMARY KEY,
    Owners_OwnerID INT NOT NULL,
    SaleDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_sales_owners 
        FOREIGN KEY (Owners_OwnerID) REFERENCES Owners(OwnerID) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- ----------------------------------------------------------------------------
-- 3. Associative Tables (Many-to-Many Bridge Resolutions)
-- ----------------------------------------------------------------------------

CREATE TABLE AppointmentServices (
    AppointmentID INT NOT NULL,
    ServiceID INT NOT NULL,
    PRIMARY KEY (AppointmentID, ServiceID),
    CONSTRAINT fk_apptservices_appointments 
        FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_apptservices_services 
        FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE SaleDetails (
    SaleID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    PRIMARY KEY (SaleID, ProductID),
    CONSTRAINT fk_saledetails_sales 
        FOREIGN KEY (SaleID) REFERENCES Sales(SaleID) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_saledetails_products 
        FOREIGN KEY (ProductID) REFERENCES Products(ProductID) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE GroomerServices (
    GroomerID INT NOT NULL,
    ServiceID INT NOT NULL,
    PRIMARY KEY (GroomerID, ServiceID),
    CONSTRAINT fk_groomerservices_groomers 
        FOREIGN KEY (GroomerID) REFERENCES Groomers(GroomerID) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_groomerservices_services 
        FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);
