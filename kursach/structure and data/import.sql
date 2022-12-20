COPY hotel_business(name)
FROM '/Users/ted/Documents/GitHub/kursach_bd/kursach/kursach_files/hotel_business.csv'
DELIMITER ';'
CSV HEADER;

COPY hotel(name, belongs_to, address, rating)
FROM '/Users/ted/Documents/GitHub/kursach_bd/kursach/kursach_files/hotels.csv'
DELIMITER ';'
CSV HEADER;

COPY clients(name, surname, phone, passport, credit_card, email)
FROM '/Users/ted/Documents/GitHub/kursach_bd/kursach/kursach_files/clients.csv'
DELIMITER ';'
CSV HEADER;

COPY facilities(name, part_of, type)
FROM '/Users/ted/Documents/GitHub/kursach_bd/kursach/kursach_files/facilities.csv'
DELIMITER ';'
CSV HEADER;

COPY rooms(is_in, room_amount, daily_price, type)
FROM '/Users/ted/Documents/GitHub/kursach_bd/kursach/kursach_files/rooms.csv'
DELIMITER ';'
CSV HEADER;

COPY transport(type, cost, belongs_to)
FROM '/Users/ted/Documents/GitHub/kursach_bd/kursach/kursach_files/transport.csv'
DELIMITER ';'
CSV HEADER;

COPY hotel_employees(name, works_at, profession, wage)
FROM '/Users/ted/Documents/GitHub/kursach_bd/kursach/kursach_files/hotel_employees.csv'
DELIMITER ';'
CSV HEADER;

COPY travel_agency(name, contract_with, comission)
FROM '/Users/ted/Documents/GitHub/kursach_bd/kursach/kursach_files/agencies.csv'
DELIMITER ';'
CSV HEADER;

COPY agency_employee(name, surname, works_at, charisma, wage)
FROM '/Users/ted/Documents/GitHub/kursach_bd/kursach/kursach_files/agency_employees.csv'
DELIMITER ';'
CSV HEADER;

COPY bookings(client_id, room_id, agency_id, price, check_in_date, check_out_date)
FROM '/Users/ted/Documents/GitHub/kursach_bd/kursach/kursach_files/bookings.csv'
DELIMITER ';'
CSV HEADER;


