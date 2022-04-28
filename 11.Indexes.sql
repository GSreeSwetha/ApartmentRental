CREATE INDEX concerns_listing_id_i ON concerns(listing_id);

Create INDEX listings_usr_id_i on listing(user_id);

CREATE INDEX list_status_id on listing_status(listing_id);

CREATE INDEX subscription_usr_id_i on subscriptions(user_id);