CREATE OR REPLACE PROCEDURE erase_booking(input_booking_id INTEGER)
language plpgsql
AS $$BEGIN
    DELETE FROM bookings WHERE id=input_booking_id;
    RETURN;
    END
$$;

CALL erase_booking(1111);
