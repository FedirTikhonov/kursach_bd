SELECT bookings.room_id, clients.id,
           clients.name, clients.surname,
           bookings.check_in_date, bookings.check_out_date
    FROM bookings
    INNER JOIN clients on bookings.client_id = clients.id
    ORDER BY room_id;

