/*Query 1- Total revenue per groomer*/
SELECT g.FirstName, g.LastName, SUM(p.AmountPaid) AS RevenueGenerated
FROM Payments p
INNER JOIN Appointments a 
ON p.Appointments_AppointmentID = a.AppointmentID
INNER JOIN Groomers g 
ON a.Groomers_GroomerID = g.GroomerID
GROUP BY g.GroomerID;

/*Query 2- Pets with Special medical notes*/
SELECT Name, Species, MedicalNotes 
FROM Pets
WHERE MedicalNotes IS NOT NULL;

/*Query 3- Most Recent Appointment per Owner and Pet*/
SELECT o.FirstName, o.LastName, p.Name AS PetName, MAX(a.AppointmentDate) AS LastAppointment
FROM Owners o
INNER JOIN Pets p 
ON o.OwnerID = p.Owners_OwnerID
INNER JOIN Appointments a 
ON p.Appointments_AppointmentID = a.AppointmentID
GROUP BY p.PetID;

/*Query 4- Owners who have made payments above $50*/
SELECT DISTINCT o.FirstName, o.LastName, pay.AmountPaid
FROM Payments pay
INNER JOIN Appointments a 
ON pay.Appointments_AppointmentID = a.AppointmentID
INNER JOIN Pets p 
ON a.AppointmentID = p.Appointments_AppointmentID
INNER JOIN Owners o 
ON p.Owners_OwnerID = o.OwnerID
WHERE pay.AmountPaid > 50;

/*Query 5- Pets that had an appointment but no payment*/
SELECT Name
FROM Pets
WHERE Appointments_AppointmentID IN 
(SELECT AppointmentID
FROM Appointments
WHERE AppointmentID NOT IN (
SELECT Appointments_AppointmentID
FROM Payments));
