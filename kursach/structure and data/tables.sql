CREATE TABLE hotel_business(
    id SERIAL PRIMARY KEY ,
    name VARCHAR(32) UNIQUE
);

CREATE TABLE clients(
    id SERIAL PRIMARY KEY,
    name VARCHAR(32),
    surname VARCHAR(32),
    phone VARCHAR(12),
    passport VARCHAR(9) UNIQUE,
    credit_card VARCHAR(16),
    email VARCHAR(50)
);

CREATE TABLE clients_to_optimise(
    id SERIAL PRIMARY KEY,
    name VARCHAR(32),
    surname VARCHAR(32),
    phone VARCHAR(12),
    passport VARCHAR(9) UNIQUE,
    credit_card VARCHAR(16),
    email VARCHAR(50)
);

CREATE TABLE travel_agency(
    id SERIAL PRIMARY KEY,
    name VARCHAR(32) UNIQUE,
    contract_with INTEGER,
    comission DECIMAL,
    FOREIGN KEY(contract_with) REFERENCES hotel_business ON DELETE CASCADE
);

CREATE TABLE hotel(
    id SERIAL PRIMARY KEY,
    name VARCHAR(32),
    belongs_to INTEGER,
    address VARCHAR(32),
    rating DECIMAL,
    FOREIGN KEY(belongs_to) REFERENCES hotel_business ON DELETE CASCADE
);

CREATE TABLE agency_employee(
    id SERIAL PRIMARY KEY,
    name VARCHAR(32),
    surname VARCHAR(32),
    works_at INTEGER,
    charisma VARCHAR(32),
    wage INTEGER,
    FOREIGN KEY(works_at) REFERENCES travel_agency ON DELETE CASCADE
);

CREATE TABLE transport(
    id SERIAL PRIMARY KEY,
    type VARCHAR(32),
    cost INTEGER,
    belongs_to INTEGER,
    FOREIGN KEY(belongs_to) REFERENCES hotel ON DELETE CASCADE
);

CREATE TABLE facilities(
    id SERIAL PRIMARY KEY,
    name VARCHAR(32),
    part_of INTEGER,
    type VARCHAR(32),
    FOREIGN KEY(part_of) REFERENCES  hotel ON DELETE CASCADE
);

CREATE TABLE rooms(
    id SERIAL PRIMARY KEY,
    is_in INTEGER,
    room_amount INTEGER,
    daily_price INTEGER,
    type VARCHAR(32),
    FOREIGN KEY(is_in) REFERENCES hotel ON DELETE CASCADE
);

CREATE TABLE hotel_employees(
    id SERIAL PRIMARY KEY,
    name VARCHAR(32),
    works_at INTEGER,
    profession VARCHAR(32),
    wage INTEGER,
    FOREIGN KEY(works_at) REFERENCES hotel ON DELETE CASCADE
);

CREATE TABLE bookings(
    id SERIAL PRIMARY KEY,
    client_id INTEGER,
    room_id INTEGER,
    agency_id INTEGER,
    price INTEGER,
    check_in_date DATE,
    check_out_date DATE,
    CHECK ( bookings.check_out_date > bookings.check_in_date),
    FOREIGN KEY(client_id) REFERENCES clients ON DELETE CASCADE,
    FOREIGN KEY(room_id) REFERENCES rooms ON DELETE CASCADE,
    FOREIGN KEY (agency_id) REFERENCES travel_agency ON DELETE CASCADE
);


