--1
SELECT bookings.room_id, clients.id,
           clients.name, clients.surname,
           bookings.check_in_date, bookings.check_out_date
    FROM bookings
    INNER JOIN clients on bookings.client_id = clients.id
    ORDER BY room_id;
--2
SELECT hotel_business.name,
       travel_agency.name,
       travel_agency.comission
FROM hotel_business
INNER JOIN travel_agency on
    hotel_business.id = travel_agency.contract_with
ORDER BY hotel_business.name;
--3
SELECT facilities.name,
       facilities.type,
       hotel.address
FROM facilities
INNER JOIN hotel on hotel.id = facilities.part_of
WHERE facilities.type = 'gym';
--4
SELECT hotel_employees.name,
       hotel_employees.profession,
       hotel.address
FROM hotel_employees
INNER JOIN hotel on hotel.id = hotel_employees.works_at
ORDER BY profession;
--5
SELECT travel_agency.id,
       bookings.id
FROM travel_agency
INNER JOIN bookings ON travel_agency.id = bookings.agency_id;
--6
CREATE OR REPLACE TEMP VIEW agencies_and_bookings AS
SELECT travel_agency.id AS agency_id,
       bookings.id AS bookings_id
FROM travel_agency
INNER JOIN bookings ON travel_agency.id = bookings.agency_id;
--7
CREATE OR REPLACE TEMP VIEW businesses_and_agencies AS
SELECT travel_agency.id AS agency_id,
       hotel_business.name AS biz_name
FROM travel_agency
INNER JOIN hotel_business on travel_agency.contract_with = hotel_business.id;
--8
SELECT businesses_and_agencies.biz_name,
       agencies_and_bookings.bookings_id
FROM businesses_and_agencies
INNER JOIN agencies_and_bookings on
    businesses_and_agencies.agency_id = agencies_and_bookings.agency_id
ORDER BY biz_name;
--9
SELECT hotel.name,
       hotel.address,
       rooms.id,
       rooms.room_amount,
       rooms.type
FROM hotel
INNER JOIN rooms on hotel.id = rooms.is_in
ORDER BY hotel.name, rooms.id;
--10
SELECT clients.name,
       clients.surname,
       bookings.check_in_date,
       bookings.check_out_date
FROM clients
INNER JOIN bookings on clients.id = client_id
ORDER BY check_in_date;
--11
CREATE OR REPLACE TEMP VIEW agencies_and_their_employees AS
    SELECT travel_agency.id AS agency_id,
           travel_agency.name AS agency_name,
           agency_employee.name AS emp_name,
           agency_employee.surname AS emp_surname
FROM travel_agency
INNER JOIN agency_employee on travel_agency.id = agency_employee.works_at;
--12
SELECT businesses_and_agencies.biz_name,
       agencies_and_their_employees.emp_name AS agency_emp_name,
       agencies_and_their_employees.emp_surname AS agency_emp_surname
FROM businesses_and_agencies
INNER JOIN agencies_and_their_employees on
    businesses_and_agencies.agency_id = agencies_and_their_employees.agency_id;
--13
CREATE OR REPLACE TEMP VIEW hotel_and_its_employees AS
    SELECT hotel_employees.name AS emp_name,
       hotel_employees.profession,
       hotel.name AS hotel_name,
       hotel.address
FROM hotel_employees
INNER JOIN hotel on hotel.id = hotel_employees.works_at
ORDER BY profession;
--14
CREATE OR REPLACE TEMP VIEW business_and_its_hotels AS
    SELECT hotel_business.name AS biz_name,
           hotel.name AS hotel_name,
           hotel.address AS hotel_address
    FROM hotel_business
INNER JOIN hotel on hotel_business.id = hotel.belongs_to;
--15
SELECT business_and_its_hotels.biz_name AS business,
       hotel_and_its_employees.emp_name
    FROM business_and_its_hotels
INNER JOIN hotel_and_its_employees
    on business_and_its_hotels.hotel_name = hotel_and_its_employees.hotel_name
ORDER BY business, emp_name;
--16
CREATE OR REPLACE VIEW rooms_and_clients AS
    SELECT bookings.room_id, clients.id,
           clients.name, clients.surname,
           bookings.check_in_date, bookings.check_out_date
    FROM bookings
    INNER JOIN clients on clients.id = bookings.client_id
    ORDER BY room_id, check_in_date;
--17

CREATE OR REPLACE TEMP VIEW hotels_and_facilities AS
    SELECT hotel.name AS hotel_name,
           facilities.name AS fac_name,
           facilities.type
    FROM hotel
INNER JOIN facilities on hotel.id = facilities.part_of;
--18
SELECT business_and_its_hotels.biz_name,
       hotels_and_facilities.fac_name AS fac_name,
       hotels_and_facilities.type AS fac_type
FROM business_and_its_hotels
INNER JOIN hotels_and_facilities on
    business_and_its_hotels.hotel_name = hotels_and_facilities.hotel_name;

--19
SELECT bookings.room_id, clients.id,
           clients.name, clients.surname,
           bookings.check_in_date, bookings.check_out_date
    FROM bookings
    INNER JOIN clients on bookings.client_id = clients.id
    WHERE client_id > 1778
    ORDER BY room_id;
--20
SELECT hotel_business.name,
       travel_agency.name,
       travel_agency.comission
FROM hotel_business
INNER JOIN travel_agency on
    hotel_business.id = travel_agency.contract_with
WHERE comission>=3
ORDER BY hotel_business.name;














