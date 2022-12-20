CREATE INDEX client_name_index ON clients(name);

EXPLAIN SELECT * FROM clients WHERE name = 'client_name_1001';

DROP INDEX client_name_index;

CREATE INDEX client_id_index ON bookings(client_id);
CREATE INDEX room_id_index ON bookings(room_id);
CREATE INDEX agency_id_index ON bookings(agency_id);

EXPLAIN SELECT * FROM bookings WHERE agency_id = 2 AND room_id = 256 AND client_id = 256;









