-- Insert Owners
INSERT INTO Owners (FirstName, LastName, Phone, Email, Address, City, State) VALUES
('Alice', 'Smith', '555-0101', 'alice.smith@email.com', '123 Maple St', 'Freehold', 'NJ'),
('Bob', 'Johnson', '555-0102', 'bob.j@email.com', '456 Oak Ave', 'Manalapan', 'NJ'),
('Carol', 'Williams', '555-0103', 'carol.w@email.com', '789 Pine Rd', 'Marlboro', 'NJ'),
('David', 'Brown', '555-0104', 'david.b@email.com', '101 Birch Blvd', 'Freehold', 'NJ'),
('Eva', 'Jones', '555-0105', 'eva.j@email.com', '202 Cedar Ln', 'Howell', 'NJ'),
('Frank', 'Miller', '555-0106', 'frank.m@email.com', '303 Elm St', 'Colts Neck', 'NJ'),
('Grace', 'Davis', '555-0107', 'grace.d@email.com', '404 Walnut St', 'Freehold', 'NJ'),
('Hannah', 'Garcia', '555-0108', 'hannah.g@email.com', '505 Spruce Rd', 'Jackson', 'NJ'),
('Ian', 'Martinez', '555-0109', 'ian.m@email.com', '606 Ash Dr', 'Freehold', 'NJ'),
('Jane', 'Lee', '555-0110', 'jane.lee@email.com', '707 Willow Way', 'Marlboro', 'NJ');

-- Insert Groomers
INSERT INTO Groomers (FirstName, LastName, Phone, Email, Specialty) VALUES
('Linda', 'Bates', '555-0201', 'linda.b@petcare.com', 'Cats & Long Hair'),
('Amy', 'Smith', '555-0202', 'amy.s@petcare.com', 'Small Dogs & Nail Trims'),
('James', 'O''Neill', '555-0203', 'james.o@petcare.com', 'Large Breeds & Flea Care'),
('Ann', 'Jacobson', '555-0204', 'ann.j@petcare.com', 'Show Styling'),
('Sophie', 'Pulanski', '555-0205', 'sophie.p@petcare.com', 'Anxious Pets'),
('Brittany', 'Martins', '555-0206', 'brittany.m@petcare.com', 'Puppy/Kitten First Cuts'),
('Owen', 'Adams', '555-0207', 'owen.a@petcare.com', 'De-shedding Treatments'),
('Rachel', 'Brown', '555-0208', 'rachel.b@petcare.com', 'Creative Styling'),
('Michelle', 'Jackson', '555-0209', 'michelle.j@petcare.com', 'Medicated Baths'),
('Jackie', 'King', '555-0210', 'jackie.k@petcare.com', 'General Grooming');

-- Insert Services
INSERT INTO Services (ServiceName, Description, Price, DurationMinutes) VALUES
('Full Styling Bath & Cut', 'Premium cut, shampoo, blow dry, brush out, and cologne.', 75.00, 90),
('Basic Bath & Brush', 'Standard shampoo, blow dry, and thorough brush out.', 45.00, 45),
('Nail Trimming & Buffing', 'Claw clipping followed by standard filing smoothing.', 20.00, 15),
('Flea & Tick Treatment', 'Specialized medicated bath targeting pests.', 60.00, 60),
('De-shedding Treatment', 'Undercoat blowout using dedicated specialized tools.', 65.00, 75);

-- Insert Appointments
INSERT INTO Appointments (Groomers_GroomerID, AppointmentDate, Status, Notes) VALUES
(1, '2025-04-22', 'Completed', 'Very well behaved dog.'),
(2, '2025-04-16', 'Completed', 'Matted fur around the ears.'),
(3, '2025-05-04', 'Completed', 'Needs gentle handling.'),
(4, '2025-05-02', 'Completed', 'Regular customer.'),
(5, '2025-04-28', 'Completed', 'Slightly anxious during blow dry.'),
(6, '2025-04-22', 'Completed', 'First time visit.'),
(7, '2025-03-31', 'Completed', 'Heavy shedder.'),
(8, '2025-04-25', 'Completed', 'Allergic to standard perfumes.'),
(9, '2025-05-01', 'Completed', 'Needs medicated rinse.'),
(10, '2025-04-27', 'Completed', 'Calm cat.'),
(4, '2025-04-29', 'No Show', 'Client did not arrive or cancel.');

-- Insert Pets
INSERT INTO Pets (Owners_OwnerID, Appointments_AppointmentID, Name, Species, Breed, Age, Weight, MedicalNotes) VALUES
(1, 1, 'Molly', 'Dog', 'Golden Retriever', 4, 65.2, NULL),
(2, 2, 'Max', 'Dog', 'Shih Tzu', 2, 12.5, 'Ringworm history'),
(3, 3, 'Buddy', 'Dog', 'Labrador', 6, 75.0, 'Lyme Disease treatment completed'),
(4, 4, 'Luna', 'Cat', 'Siamese', 3, 8.7, NULL),
(5, 5, 'Bella', 'Cat', 'Maine Coon', 5, 15.4, 'Hypothyroidism'),
(6, 6, 'Rocky', 'Dog', 'Boxer', 1, 55.1, NULL),
(7, 7, 'Oscar', 'Dog', 'German Shepherd', 7, 82.3, NULL),
(8, 8, 'Lucy', 'Cat', 'Persian', 4, 9.1, NULL),
(9, 9, 'Bailey', 'Cat', 'Domestic Shorthair', 2, 10.2, NULL),
(10, 10, 'Daisy', 'Dog', 'Poodle', 5, 45.0, NULL),
(10, 11, 'Charlie', 'Dog', 'Beagle', 3, 26.4, NULL);

-- Insert Payments
INSERT INTO Payments (Appointments_AppointmentID, AmountPaid, PaymentDate, PaymentMethod) VALUES
(1, 66.00, '2025-04-22', 'Credit Card'),
(2, 49.00, '2025-04-16', 'Cash'),
(3, 66.00, '2025-05-04', 'Credit Card'),
(4, 191.00, '2025-05-02', 'Debit Card'),
(5, 171.00, '2025-04-28', 'Credit Card'),
(6, 65.00, '2025-04-22', 'Cash'),
(7, 87.00, '2025-03-31', 'Credit Card'),
(8, 187.00, '2025-04-25', 'Debit Card'),
(9, 61.00, '2025-05-01', 'Credit Card'),
(10, 63.00, '2025-04-27', 'Cash');
