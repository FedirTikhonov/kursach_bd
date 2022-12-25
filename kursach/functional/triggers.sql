CREATE TRIGGER client_update
    AFTER UPDATE
    ON clients
    FOR EACH ROW
    EXECUTE PROCEDURE execute_on_update_clients();

CREATE TRIGGER client_delete
    AFTER DELETE
    ON clients
    FOR EACH ROW
    EXECUTE PROCEDURE execute_on_delete_clients();

CREATE TRIGGER client_insert
    AFTER INSERT
    ON clients
    FOR EACH ROW
    EXECUTE PROCEDURE execute_on_insert_clients();

CREATE TRIGGER bookings_update
    BEFORE UPDATE
    ON bookings
    FOR EACH ROW
    EXECUTE PROCEDURE execute_on_update_bookings();

CREATE TRIGGER booking_insert
    BEFORE INSERT
    ON bookings
    FOR EACH ROW
    EXECUTE PROCEDURE execute_on_insert_bookings();


CREATE TRIGGER booking_delete
    AFTER DELETE
    ON bookings
    FOR EACH ROW
    EXECUTE PROCEDURE execute_on_delete_bookings();
