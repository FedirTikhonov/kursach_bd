INSERT INTO clients(name, surname, phone, passport, credit_card, email)
VALUES ('test_client_name', 'test_client_surname',
        '123456789012', '123456799', '1234567890123456', 'e');
SELECT * FROM clients;

UPDATE clients SET name = 'c', surname = 'd', phone = 'a', passport='a'
                 , credit_card='a', email='a' WHERE id = 13;

DELETE FROM clients WHERE id = 13;

SELECT * FROM bookings;

INSERT INTO bookings(client_id, room_id, agency_id, price,
                     check_in_date, check_out_date)
VALUES (6, 6, 4, 400, '2022-12-20', '2022-12-25');

UPDATE bookings SET client_id = 1, agency_id = 1, room_id = 1,
                    price = 1, check_in_date = '2022-01-01',
                    check_out_date = '2022-01-20'
WHERE id = 11;

SELECT * FROM rooms WHERE id > 500;

DELETE FROM bookings WHERE id=11;

