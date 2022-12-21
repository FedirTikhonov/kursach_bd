CREATE OR REPLACE FUNCTION execute_on_update_clients()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
    $$
    BEGIN
        IF NEW.name <> OLD.name THEN
            RAISE NOTICE
                'THE CLIENT WITH ID % HAD HIS NAME CHANGED FROM % TO %'
                , OLD.id, OLD.name, NEW.name;
        end if;
        IF NEW.surname <> OLD.surname THEN
            RAISE NOTICE
                'THE CLIENT WITH ID % HAD HIS SURNAME CHANGED FROM % TO %'
                , OLD.id, OLD.surname, NEW.surname;
        end if;
        IF NEW.phone <> OLD.phone THEN
            RAISE NOTICE
                'THE CLIENT WITH ID % HAD HIS PHONE CHANGED FROM % TO %'
                , OLD.id, OLD.phone, NEW.phone;
        end if;
        IF NEW.passport <> OLD.passport THEN
            RAISE NOTICE
                'THE CLIENT WITH ID % HAD HIS PASSPORT CHANGED FROM % TO %'
                , OLD.id, OLD.phone, NEW.phone;
        end if;
        IF NEW.credit_card<> OLD.credit_card THEN
            RAISE NOTICE
                'THE CLIENT WITH ID % HAD HIS CREDIT CARD CHANGED FROM % TO %'
                , OLD.id, OLD.credit_card, NEW.credit_card;
        end if;
        IF NEW.email<> OLD.email THEN
            RAISE NOTICE
                'THE CLIENT WITH ID % HAD HIS CREDIT CARD CHANGED FROM % TO %'
                , OLD.id, OLD.email, NEW.email;
        end if;
        RETURN NEW;
    END;
    $$;

CREATE OR REPLACE FUNCTION execute_on_delete_clients()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
    $$
    BEGIN
        RAISE NOTICE 'CLIENT WITH ID %, NAME %, SURNAME % WAS DELETED',
            OLD.id, OLD.name, OLD.surname;
        RETURN NEW;
    END
    $$;


CREATE OR REPLACE FUNCTION execute_on_insert_clients()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
    $$
    BEGIN
        RAISE NOTICE 'A NEW CLIENT WITH ID %, NAME %, SURNAME % WAS ADDED',
            NEW.id, NEW.name, NEW.surname;
        RETURN NEW;
    END;
    $$;


CREATE OR REPLACE FUNCTION execute_on_update_bookings()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
    $$
    DECLARE b_row bookings%rowtype;
    BEGIN
        IF NEW.client_id <> OLD.client_id THEN
            RAISE NOTICE
                'THE BOOKING WITH ID % HAD ITS CLIENT ID CHANGED FROM % TO %'
                , OLD.id, OLD.client_id, NEW.client_id;
        end if;
        IF NEW.room_id <> OLD.room_id THEN
            RAISE NOTICE
                'THE BOOKING WITH ID % HAD ITS ROOM ID CHANGED FROM % TO %'
                , OLD.id, OLD.room_id, NEW.room_id;
        end if;
        IF NEW.agency_id <> OLD.agency_id THEN
            RAISE NOTICE
                'THE BOOKING WITH ID % HAD ITS TRAVEL AGENCY ID CHANGED FROM % TO %'
                , OLD.id, OLD.agency_id, NEW.agency_id;
        end if;
        IF NEW.price <> OLD.price THEN
            RAISE NOTICE
                'THE BOOKING WITH ID % HAD ITS PRICE CHANGED FROM % TO %'
                , OLD.id, OLD.price, NEW.price;
        end if;
        IF NEW.check_in_date<> OLD.check_in_date THEN
            RAISE NOTICE
                'THE BOOKING WITH ID % HAD ITS CHECK IN DATE CHANGED FROM % TO %'
                , OLD.id, OLD.check_in_date, NEW.check_in_date;
        end if;
        IF NEW.check_out_date<> OLD.check_out_date THEN
            RAISE NOTICE
                'THE BOOKING WITH ID % HAD HIS CREDIT CARD CHANGED FROM % TO %'
                , OLD.id, OLD.check_out_date, NEW.check_out_date;
        end if;
        FOR b_row IN SELECT * FROM bookings LOOP
            IF b_row.room_id = NEW.room_id AND(b_row.check_in_date >= NEW.check_in_date AND
                                               b_row.check_in_date <= NEW.check_out_date OR
                                               b_row.check_out_date >= NEW.check_in_date AND
                                               b_row.check_out_date <= NEW.check_out_date) THEN
                RAISE EXCEPTION 'NEW BOOKING ID=% IS OVERLAID WITH ANOTHER ONE ID=%', NEW.id, b_row.id;
            END IF;
            END LOOP;
        RETURN NEW;
    END
    $$;

CREATE OR REPLACE FUNCTION execute_on_delete_bookings()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
    $$
    BEGIN
        RAISE NOTICE 'BOOKING WITH ID % CLIENT ID % ROOM ID % WAS DELETED',
            OLD.id, OLD.client_id, OLD.room_id;
        RETURN NEW;
    END;
    $$;


CREATE OR REPLACE FUNCTION execute_on_insert_bookings()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
    $$
    DECLARE b_row bookings%rowtype;
    BEGIN
        RAISE NOTICE 'A NEW BOOKING WITH ID % CLIENT ID % ROOM ID % WAS ADDED',
            NEW.id, NEW.client_id, NEW.room_id;
        FOR b_row IN SELECT * FROM bookings LOOP
            IF b_row.room_id = NEW.room_id AND(b_row.check_in_date >= NEW.check_in_date AND
                                               b_row.check_in_date <= NEW.check_out_date OR
                                               b_row.check_out_date >= NEW.check_in_date AND
                                               b_row.check_out_date <= NEW.check_out_date) THEN
                RAISE EXCEPTION 'NEW BOOKING ID=% IS OVERLAID WITH ANOTHER ONE ID=%', NEW.id, b_row.id;
            END IF;
            END LOOP;
        RETURN NEW;
    END;
    $$;

CREATE OR REPLACE FUNCTION room_usage_history(input_room_id INTEGER)
    RETURNS TABLE(
        used_room_id INTEGER,
        client_id INTEGER,
        client_name VARCHAR(32),
        client_surname VARCHAR(32),
        check_in_date DATE,
        check_out_date DATE
                 )
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT * FROM rooms_and_clients WHERE room_id = input_room_id ORDER BY check_in_date;
END
$$;

CREATE OR REPLACE FUNCTION calculate_price_per_stay(days_num INTEGER, input_room_id INTEGER)
RETURNS INTEGER
    LANGUAGE plpgsql
AS $$
    DECLARE stay_price INTEGER := 0;
        daily_room_price INTEGER := 0;
    BEGIN
        SELECT daily_price FROM rooms WHERE id = input_room_id INTO daily_room_price;
        stay_price := daily_room_price * days_num;
        RETURN stay_price;
    END
    $$;

SELECT * FROM calculate_price_per_stay(120, 13);
SELECT * FROM room_usage_history(14);
