INSERT INTO clients(name, surname, phone, passport, credit_card, email)
VALUES ('test_client_name', 'test_client_surname',
        '123456789012', '123456799', '1234567890123456', 'e');
SELECT * FROM clients WHERE id=2011;

UPDATE clients SET name = 'c', surname = 'd', phone = 'a', passport='a'
                 , credit_card='a', email='a' WHERE id = 13;

DELETE FROM clients WHERE id = 2011;

SELECT * FROM bookings;

INSERT INTO bookings(client_id, room_id, agency_id, price,
                     check_in_date, check_out_date)
VALUES (2, 1, 1, 1, '2022-12-12', '2022-12-17');

UPDATE bookings SET client_id = 7, agency_id = 2, room_id = 2,
                    price = 1, check_in_date = '2022-12-12',
                    check_out_date = '2022-12-15'
WHERE id = 2010;

SELECT * FROM rooms WHERE id > 500;

DELETE FROM bookings WHERE id=2011;

