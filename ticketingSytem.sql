-- =========================================================================
-- 1. CREATE USERS TABLE
-- =========================================================================
CREATE TABLE Users (
    user_id int,
    full_name varchar(50),
    email varchar(20) unique,
    role varchar(50),
    phone_number varchar(20),

  constraint pkUser primary key(user_id),
  constraint userEmail unique(email),
  constraint userRole check(role in('Football Fan', 'Ticket Manager'))
);

-- =========================================================================
-- 2. CREATE MATCHES TABLE
-- =========================================================================
CREATE TABLE Matches (
    match_id int,
    fixture varchar(100),
    tournament_category varchar(50),
    base_ticket_price decimal(10,2),
    match_status varchar(20),

  constraint pkMatch primary key(match_id),
  constraint matchPrice check(base_ticket_price>=0),
  constraint matchStatus check(match_status in('Available', 'Selling Fast', 'Sold Out'))
);

-- =========================================================================
-- 3. CREATE BOOKINGS TABLE
-- =========================================================================
CREATE TABLE Bookings (
    booking_id int ,
    user_id int,
    match_id int,
    seat_number varchar(20),
    payment_status varchar(20),
    total_cost decimal(10,2),

  constraint pkbooking primary key(booking_id),
  constraint fkBooking foreign key (user_id) references Users(user_id),
  constraint fkMatching foreign key (match_id) references Matches(match_id),
  constraint BookingCost check(total_cost>=0),
  constraint bookingStatus check(payment_status in('Confirmed','Pending'))

);


-- =========================================================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO USERS
-- =========================================================================
INSERT INTO Users (user_id, full_name, email, role, phone_number) VALUES
(1, 'Tanvir Rahman', 'tanvir@mail.com', 'Football Fan', '+8801711111111'),
(2, 'Asif Haque', 'asif@mail.com', 'Football Fan', '+8801722222222'),
(3, 'Sajjad Rahman', 'sajjad@mail.com', 'Ticket Manager', '+8801733333333'),
(4, 'Jannat Ara', 'jannat@mail.com', 'Football Fan', NULL);

-- =========================================================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO MATCHES
-- =========================================================================
INSERT INTO Matches (match_id, fixture, tournament_category, base_ticket_price, match_status) VALUES
(101, 'Real Madrid vs Barcelona', 'Champions League', 150.00, 'Available'),
(102, 'Man City vs Liverpool', 'Premier League', 120.00, 'Selling Fast'),
(103, 'Bayern Munich vs PSG', 'Champions League', 130.00, 'Available'),
(104, 'AC Milan vs Inter Milan', 'Serie A', 90.00, 'Sold Out'),
(105, 'Juventus vs Roma', 'Serie A', 80.00, 'Available');

-- =========================================================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO BOOKINGS
-- =========================================================================
INSERT INTO Bookings (booking_id, user_id, match_id, seat_number, payment_status, total_cost) VALUES
(501, 1, 101, 'A-12', 'Confirmed', 150.00),
(502, 1, 102, 'B-04', 'Confirmed', 120.00),
(503, 2, 101, 'A-13', 'Confirmed', 150.00),
(504, 2, 101, NULL, NULL, 150.00),
(505, 3, 102, 'C-20', 'Pending', 120.00);




























