--vw_user
create or replace view vw_queries
as
select 
c.id as query_id,
listing_id,
User_id as query_raised_by,
u.email as email_query_raised_by,
date_added,
date_resolved,
query,
solution,
addressed_by,
case when uc.id is null then m.email else uc.email end as addressed_by_email,
case when addressed_by is null then 'Query not yet addressed' else 'Query Addressed' end as query_address_status
from concerns c
left join users u on c.user_id = u.id
left join management m on c.addressed_by = m.id
left join users uc on c.addressed_by = uc.id
where query is not null;
/
--vw_complaint
create or replace view vw_complaints
as
select 
c.id as complaint_id,
listing_id,
User_id as complaint_raised_by,
u.email as email_complaint_raised_by,
date_added,
date_resolved,
query,
solution,
addressed_by,
case when uc.id is not null then uc.email else m.email end as addressed_by_email,
case when addressed_by is null then 'Query not yet addressed' else 'Query Addressed' end as query_address_status
from concerns c
left join users u on c.user_id = u.id
left join management m on c.addressed_by = m.id
left join users uc on c.addressed_by = uc.id
where complaint is not null;
/

--select * from vw_queries;
--select * from vw_complaints;

--vw_ListingSummary
create or replace view vw_Listing_Summary
as
select 
l.id,
user_id as listing_posted_by,
is_premium,
door_no ||', '||street as address,
city,
state,
country,
banner,
descript,
case when ls.IS_AVAILABLE ='Y' then 'Available' when ls.IS_AVAILABLE = 'N' then 'Not Available' else null end as listing_availability_status,
heat,
hot_water,
laundry,
pt.type,
pt.beds,
pt.baths,
ar.min_area,
ar.max_area,
o.offers as no_of_offers,
tags_t as tags
--(select listagg(tag,', ') within group (order by l.id) from tags t where id = lt.tag_id group by l.id) as tags
from listing l
left join 
(select lt.listing_id, listagg(t.tag,', ') within group(order by lt.listing_id) as tags_t from listing_tags lt 
join tags t on t.id = lt.tag_id
group by lt.listing_id) lte on l.id = lte.listing_id
left join 
(select a.id,door_no,
(select name from state s where s.id = a.state_id) as state,
(select name from city c where c.id = a.city_id) as city,
(select name from street st where st.id = a.street_id) as street,
(select name from country cr where cr.id = a.country_id) as country
from address a) la on l.address_id = la.id
left join
(select listing_id,count(id) as offers from offer group by listing_id) o on l.id = o.listing_id
left join property_type pt on l.property_type_id = pt.id
left join area ar on l.area_id = ar.id
left join listing_status ls on l.id = ls.listing_id;
/
--select * from vw_listing_Summary;

--vw_Address_Listing
create or replace view vw_Address_Listing as
select
door_no,
state_id,
(select name from state s where s.id = a.state_id) as state,
city_id,
(select name from city c where c.id = a.city_id) as city,
street_id,
(select name from street st where st.id = a.street_id) as street,
country_id,
(select name from country cr where cr.id = a.country_id) as country
from address a;
/

--vw_Address
create or replace view vw_Address as
select
s.id as street_id,
s.name as street_name,
city_id,
c.name as city,
state_id,
st.name as state_name
--co.country_id,
--co.name as contry_name
from street s
join city c on s.city_id =  c.id
join state st on c.state_id = st.id;
--join country co on st.country_id = co.id
/

--select * from vw_address;
--vw_User_Activity_Summary

create or replace view vw_User_Activity_Summary
as
select 
u.id as user_id,
first_name || ' ' || last_name as user_name,
email,
case when u.street_id is not null then (door_no || ', ' || (select name from street st where st.id = u.street_id)) else to_char(door_no) end as street,
(select name from state s where s.id = u.state_id) as state,
(select name from city c where c.id = u.city_id) as city,
(select name from country cr where cr.id = u.country_id) as country,
case when is_poster = 1 then 'Yes' when is_poster = 0 then 'No' else null end as user_is_poster,
case when is_owner = 1 then 'Yes' when is_owner = 0 then 'No' else null end as user_is_owner,
case when is_buyer = 1 then 'Yes' when is_buyer = 0 then 'No' else null end as user_is_buyer,
date_joined,
last_activity,
case when s.status =1 then 'Subscribed' else 'Not Subscribed' end as user_subscription_status,
nvl(offers,0) as no_of_offers,
nvl(deals,0) as no_of_deals,
nvl(listings,0) as no_of_listings,
nvl(complaints,0) as complaints_raised,
nvl(complaints_add,0) as complaints_addressed
from users u
left join subscriptions s on u.id = s.user_id
left join (select user_id, count(id) as offers from offer group by user_id) o on u.id = o.user_id
left join (select user_id, count(id) as deals from offer where deal =1 group by user_id) od on u.id = od.user_id
left join (select user_id, count(id) as listings from listing group by user_id) l on u.id = l.user_id
left join (select user_id, count(id) as complaints from concerns where complaint is not null group by user_id) c on u.id = c.user_id
left join (select addressed_by, count(id) as complaints_add from concerns where complaint is not null group by addressed_by) ca on u.id = ca.addressed_by;
/
--vw_User_Details(user)
create or replace view vw_User_Details
as
select 
u.id as user_id,
first_name || ' ' || last_name as user_name,
email,
--case when u.street_id is not null then (door_no || ', ' || (select name from street st where st.id = u.street_id)) else to_char(door_no) end as street,
door_no,
street_id,
(select name from street st where st.id = u.street_id) as street,
state_id,
(select name from state s where s.id = u.state_id) as state,
city_id,
(select name from city c where c.id = u.city_id) as city,
country_id,
(select name from country cr where cr.id = u.country_id) as country,
case when is_poster = 1 then 'Yes' when is_poster = 0 then 'No' else null end as user_is_poster,
case when is_owner = 1 then 'Yes' when is_owner = 0 then 'No' else null end as user_is_owner,
case when is_buyer = 1 then 'Yes' when is_buyer = 0 then 'No' else null end as user_is_buyer,
date_joined,
last_activity
from users u;
/
--SELECT * FROM vw_User_Details;



--vw_Listing_User_Deal_Offerin
create or replace view vw_Listing_User_Deal_Offering
as
select l.id as listing_id,
l.is_premium,
la.door_no ||', '||street as address,
city,
state,
country,
o.id as offer_id,
o.user_id as user_who_made_offer,
u.first_name || ' ' || u.last_name as user_name_who_made_offer,
u.email as user_email_who_made_offer,
u.is_poster as is_user_poster,
u.is_buyer as is_user_buyer,
u.is_owner as is_user_owner,
case when s.status = 1 then 'Active' when s.status = 0 then 'Not Active' else 'No Subscription' end as user_subscription_status,
case when o.deal = 1 then 'Deal made' when o.deal = 0 then 'Deal not yet made' else null end as offer_deal_made,
o.date_added as offer_date_added,
o.status as is_offer_active
from listing l
left join 
(select a.id,door_no,
(select name from state s where s.id = a.state_id) as state,
(select name from city c where c.id = a.city_id) as city,
(select name from street st where st.id = a.street_id) as street,
(select name from country cr where cr.id = a.country_id) as country
from address a) la on l.address_id = la.id
join offer o on l.id = o.listing_id
left join users u on o.user_id = u.id
left join subscriptions s on s.user_id = u.id;
/
--select * from vw_Listing_User_Deal_Offerin

--vw_Listing_Attributes
create or replace view vw_Listing_Attributes
as
select
l.id as listing_id,
l.user_id as listing_posted_by,
u.email as email_listing_posted_by,
--listagg(lt.tag_id,', ') within group(order by l.id) as listing_tag_id,
tagids as tag_ids,
tags_t as tags,
offerids as offers,
madeoffers as user_id_offers_made,
madeoffersemails as user_emails_offers_made,
complaints as complaint_ids,
madecomplaintsemails as user_emails_complaints_made
from listing l
left join users u on l.user_id = u.id
left join (select listing_id,listagg(tag_id,', ') within group(order by listing_id) as tagids from listing_tags group by listing_id) lt on lt.listing_id = l.id
left join 
(select lt.listing_id, listagg(t.tag,', ') within group(order by lt.listing_id) as tags_t from listing_tags lt 
join tags t on t.id = lt.tag_id
group by lt.listing_id) lte on l.id = lte.listing_id
left join
(select listing_id, listagg(id,', ') within group(order by listing_id) as offerids from offer group by listing_id) o on o.listing_id = l.id
left join
(select listing_id, listagg(user_id,', ') within group(order by listing_id) as madeoffers from offer group by listing_id) oi on oi.listing_id = l.id
left join
(select oe.listing_id, listagg(u.email,', ') within group(order by oe.listing_id) as madeoffersemails from offer oe
join users u on oe.user_id = u.id
group by oe.listing_id) o on o.listing_id = l.id
left join
(select listing_id, listagg(id,', ') within group(order by listing_id) as complaints from concerns where complaint is not null group by listing_id) c on c.listing_id = l.id
left join
(select ce.listing_id, listagg(u.email,', ') within group(order by ce.listing_id) as madecomplaintsemails from concerns ce
join users u on ce.user_id = u.id
where ce.complaint is not null
group by ce.listing_id) ci on ci.listing_id = l.id;
/
--select * from vw_Listing_Attributes

--vw_Listings_with_no_offers
create or replace view vw_Listings_with_no_offers
as
select * from Listing l where not exists (select 1 from offer o where o.listing_id = l.id);
/
create or replace view vw_Listings_with_deals
as
select * from listing l where exists (select 1 from offer o where o.listing_id = l.id and deal = 1);
/
create or replace view vw_Listings_with_offers
as
select * from Listing l where exists (select 1 from offer o where o.listing_id = l.id);
/
create or replace view vw_Listings_with_concerns
as
select * from Listing l where exists (select 1 from concerns o where o.listing_id = l.id);
/
create or replace view vw_Listings_with_no_concerns
as
select * from Listing l where not exists (select 1 from concerns o where o.listing_id = l.id);
/
create or replace view vw_users_with_no_listing_postings
as
select * from users u where not exists (select 1 from listing l where l.user_id = u.id);
/
create or replace view vw_users_with_listing_postings
as
select * from users u where exists (select 1 from listing l where l.user_id = u.id);
/


--for Make_Offer
---listings with offers view
--listings which do not have offers or deals yet
--listings with deals view

--for make_complaint and question
--listings which do not have complants or queires yet
--listings whicht have complants or queires yet

--vw_Listing_Attributes
--listagg
--tagids,tags, offerids, who made offers ids, complaint ids, who made complaint ids,who addressed complaint ids,offer ids when deal
