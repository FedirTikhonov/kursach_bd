CREATE OR REPLACE VIEW rooms_and_clients AS
    SELECT bookings.room_id, clients.id,
           clients.name, clients.surname,
           bookings.check_in_date, bookings.check_out_date
    FROM bookings
    INNER JOIN clients on clients.id = bookings.client_id
    ORDER BY room_id, check_in_date;

SELECT * FROM rooms_and_clients WHERE room_id=1 ORDER BY check_in_date;
