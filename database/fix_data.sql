-- Fix hotel types to match constraint (Hotel, Resort, Lodge, Guest House, Hostel, Boutique)
INSERT INTO hotels (name, city, address, description, type, rating, review_count, price_per_night, is_featured, is_active) VALUES
('Sheraton Addis',           'Addis Ababa', 'Taitu St, Addis Ababa',      'Luxury 5-star hotel in the heart of Addis Ababa.',        'Hotel',    4.8, 1240, 12000, TRUE,  TRUE),
('Hyatt Regency Addis',      'Addis Ababa', 'Africa Ave, Addis Ababa',    'Modern 5-star hotel with spectacular city views.',        'Hotel',    4.7,  980, 10500, TRUE,  TRUE),
('Kuriftu Resort Bahir Dar', 'Bahir Dar',   'Lake Tana Shore',            'Stunning lakeside resort on Lake Tana.',                  'Resort',   4.9,  650,  8500, TRUE,  TRUE),
('Haile Resort Hawassa',     'Hawassa',     'Hawassa Lake',               'Beautiful lakeside resort on Lake Hawassa.',              'Resort',   4.6,  520,  7000, TRUE,  TRUE),
('Axum Hotel',               'Axum',        'Main St, Axum',              'Comfortable hotel near the Axum obelisks.',               'Hotel',    4.2,  310,  3500, FALSE, TRUE),
('Gonder Goha Hotel',        'Gondar',      'Fasilides St, Gondar',       'Historic hotel close to Gondar castles.',                 'Hotel',    4.3,  420,  4000, FALSE, TRUE),
('Bale Mountain Lodge',      'Arba Minch',  'Nechisar National Park',     'Eco-lodge inside Nechisar National Park.',                'Lodge',    4.7,  280,  9500, TRUE,  TRUE),
('Lalibela Lodge',           'Lalibela',    'Rock Church Area, Lalibela', 'Boutique lodge near the rock-hewn churches.',             'Boutique', 4.5,  390,  6500, TRUE,  TRUE),
('Capital Hotel Addis',      'Addis Ababa', 'Bole Rd, Addis Ababa',       'Modern business hotel near Bole Airport.',                'Hotel',    4.4,  760,  6000, FALSE, TRUE),
('Dire Dawa Ras Hotel',      'Dire Dawa',   'Kezira, Dire Dawa',          'Classic hotel with colonial architecture.',               'Hotel',    4.0,  180,  2800, FALSE, TRUE),
('Kuriftu Resort Adama',     'Adama',       'Sodere Springs, Adama',      'Resort near natural hot springs.',                        'Resort',   4.5,  440,  7500, TRUE,  TRUE),
('Harar Walled City Hotel',  'Harar',       'Old Town, Harar',            'Boutique hotel inside the ancient walled city of Harar.', 'Boutique', 4.6,  290,  5500, TRUE,  TRUE)
ON CONFLICT DO NOTHING;

-- Add hotel images for new hotels
INSERT INTO hotel_images (hotel_id, image_url, is_primary, sort_order)
SELECT id, 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800', TRUE, 1 FROM hotels WHERE name='Sheraton Addis' ON CONFLICT DO NOTHING;
INSERT INTO hotel_images (hotel_id, image_url, is_primary, sort_order)
SELECT id, 'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=800', TRUE, 1 FROM hotels WHERE name='Hyatt Regency Addis' ON CONFLICT DO NOTHING;
INSERT INTO hotel_images (hotel_id, image_url, is_primary, sort_order)
SELECT id, 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800', TRUE, 1 FROM hotels WHERE name='Kuriftu Resort Bahir Dar' ON CONFLICT DO NOTHING;
INSERT INTO hotel_images (hotel_id, image_url, is_primary, sort_order)
SELECT id, 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800', TRUE, 1 FROM hotels WHERE name='Haile Resort Hawassa' ON CONFLICT DO NOTHING;
INSERT INTO hotel_images (hotel_id, image_url, is_primary, sort_order)
SELECT id, 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=800', TRUE, 1 FROM hotels WHERE name='Bale Mountain Lodge' ON CONFLICT DO NOTHING;
INSERT INTO hotel_images (hotel_id, image_url, is_primary, sort_order)
SELECT id, 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800', TRUE, 1 FROM hotels WHERE name='Lalibela Lodge' ON CONFLICT DO NOTHING;
INSERT INTO hotel_images (hotel_id, image_url, is_primary, sort_order)
SELECT id, 'https://images.unsplash.com/photo-1445019980597-93fa8acb246c?w=800', TRUE, 1 FROM hotels WHERE name='Capital Hotel Addis' ON CONFLICT DO NOTHING;
INSERT INTO hotel_images (hotel_id, image_url, is_primary, sort_order)
SELECT id, 'https://images.unsplash.com/photo-1455587734955-081b22074882?w=800', TRUE, 1 FROM hotels WHERE name='Gonder Goha Hotel' ON CONFLICT DO NOTHING;
INSERT INTO hotel_images (hotel_id, image_url, is_primary, sort_order)
SELECT id, 'https://images.unsplash.com/photo-1573843981267-be1999ff37cd?w=800', TRUE, 1 FROM hotels WHERE name='Kuriftu Resort Adama' ON CONFLICT DO NOTHING;
INSERT INTO hotel_images (hotel_id, image_url, is_primary, sort_order)
SELECT id, 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800', TRUE, 1 FROM hotels WHERE name='Harar Walled City Hotel' ON CONFLICT DO NOTHING;
INSERT INTO hotel_images (hotel_id, image_url, is_primary, sort_order)
SELECT id, 'https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800', TRUE, 1 FROM hotels WHERE name='Dire Dawa Ras Hotel' ON CONFLICT DO NOTHING;
INSERT INTO hotel_images (hotel_id, image_url, is_primary, sort_order)
SELECT id, 'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800', TRUE, 1 FROM hotels WHERE name='Axum Hotel' ON CONFLICT DO NOTHING;

-- Room types using correct column names (bed_type not description)
INSERT INTO room_types (hotel_id, name, bed_type, price_per_night, max_guests, size_sqm, features, is_available)
SELECT id, 'Standard Room', 'King Bed',   price_per_night * 0.8, 2, 25, ARRAY['Free WiFi','Air Conditioning','TV','Mini Bar'], TRUE FROM hotels WHERE name='Sheraton Addis' ON CONFLICT DO NOTHING;
INSERT INTO room_types (hotel_id, name, bed_type, price_per_night, max_guests, size_sqm, features, is_available)
SELECT id, 'Deluxe Suite',  'King Bed',   price_per_night * 1.5, 3, 55, ARRAY['Free WiFi','AC','TV','Mini Bar','City View','Jacuzzi'], TRUE FROM hotels WHERE name='Sheraton Addis' ON CONFLICT DO NOTHING;
INSERT INTO room_types (hotel_id, name, bed_type, price_per_night, max_guests, size_sqm, features, is_available)
SELECT id, 'Lake View Room','Queen Bed',  price_per_night,       2, 35, ARRAY['Free WiFi','Lake View','Air Conditioning','Balcony'], TRUE FROM hotels WHERE name='Kuriftu Resort Bahir Dar' ON CONFLICT DO NOTHING;
INSERT INTO room_types (hotel_id, name, bed_type, price_per_night, max_guests, size_sqm, features, is_available)
SELECT id, 'Family Villa',  'Twin Beds',  price_per_night * 2.2, 5, 90, ARRAY['Free WiFi','Private Pool','Kitchen','Lake View'], TRUE FROM hotels WHERE name='Kuriftu Resort Bahir Dar' ON CONFLICT DO NOTHING;
INSERT INTO room_types (hotel_id, name, bed_type, price_per_night, max_guests, size_sqm, features, is_available)
SELECT id, 'Lake Suite',    'King Bed',   price_per_night * 1.3, 2, 45, ARRAY['Free WiFi','Lake View','AC','Balcony'], TRUE FROM hotels WHERE name='Haile Resort Hawassa' ON CONFLICT DO NOTHING;
INSERT INTO room_types (hotel_id, name, bed_type, price_per_night, max_guests, size_sqm, features, is_available)
SELECT id, 'Standard Room', 'Double Bed', price_per_night * 0.9, 2, 22, ARRAY['Free WiFi','Air Conditioning','TV'], TRUE FROM hotels WHERE name='Capital Hotel Addis' ON CONFLICT DO NOTHING;
INSERT INTO room_types (hotel_id, name, bed_type, price_per_night, max_guests, size_sqm, features, is_available)
SELECT id, 'Heritage Room', 'Queen Bed',  price_per_night,       2, 28, ARRAY['Free WiFi','AC','Breakfast Included'], TRUE FROM hotels WHERE name='Harar Walled City Hotel' ON CONFLICT DO NOTHING;
INSERT INTO room_types (hotel_id, name, bed_type, price_per_night, max_guests, size_sqm, features, is_available)
SELECT id, 'Forest Cabin',  'Twin Beds',  price_per_night,       2, 30, ARRAY['Free WiFi','Nature View','Fireplace'], TRUE FROM hotels WHERE name='Bale Mountain Lodge' ON CONFLICT DO NOTHING;
INSERT INTO room_types (hotel_id, name, bed_type, price_per_night, max_guests, size_sqm, features, is_available)
SELECT id, 'Standard Room', 'Double Bed', price_per_night,       2, 24, ARRAY['Free WiFi','Air Conditioning','TV'], TRUE FROM hotels WHERE name='Dire Dawa Ras Hotel' ON CONFLICT DO NOTHING;
INSERT INTO room_types (hotel_id, name, bed_type, price_per_night, max_guests, size_sqm, features, is_available)
SELECT id, 'Standard Room', 'Double Bed', price_per_night,       2, 24, ARRAY['Free WiFi','Air Conditioning'], TRUE FROM hotels WHERE name='Axum Hotel' ON CONFLICT DO NOTHING;
INSERT INTO room_types (hotel_id, name, bed_type, price_per_night, max_guests, size_sqm, features, is_available)
SELECT id, 'Standard Room', 'Double Bed', price_per_night,       2, 24, ARRAY['Free WiFi','Air Conditioning'], TRUE FROM hotels WHERE name='Gonder Goha Hotel' ON CONFLICT DO NOTHING;
INSERT INTO room_types (hotel_id, name, bed_type, price_per_night, max_guests, size_sqm, features, is_available)
SELECT id, 'Luxury Room',   'King Bed',   price_per_night * 1.4, 2, 40, ARRAY['Free WiFi','Hot Spring Access','Pool','Garden'], TRUE FROM hotels WHERE name='Kuriftu Resort Adama' ON CONFLICT DO NOTHING;

-- Add amenities for new hotels
INSERT INTO hotel_amenities (hotel_id, amenity)
SELECT id, unnest(ARRAY['Free WiFi','Swimming Pool','Restaurant','Gym','Spa','Airport Shuttle','Parking','24/7 Room Service'])
FROM hotels WHERE name='Sheraton Addis' ON CONFLICT DO NOTHING;
INSERT INTO hotel_amenities (hotel_id, amenity)
SELECT id, unnest(ARRAY['Free WiFi','Swimming Pool','Restaurant','Business Center','Conference Room','Parking'])
FROM hotels WHERE name='Hyatt Regency Addis' ON CONFLICT DO NOTHING;
INSERT INTO hotel_amenities (hotel_id, amenity)
SELECT id, unnest(ARRAY['Free WiFi','Lake View','Restaurant','Boat Tours','Fishing','Garden','Parking'])
FROM hotels WHERE name='Kuriftu Resort Bahir Dar' ON CONFLICT DO NOTHING;
INSERT INTO hotel_amenities (hotel_id, amenity)
SELECT id, unnest(ARRAY['Free WiFi','Swimming Pool','Restaurant','Lake View','Garden','Parking'])
FROM hotels WHERE name='Haile Resort Hawassa' ON CONFLICT DO NOTHING;
INSERT INTO hotel_amenities (hotel_id, amenity)
SELECT id, unnest(ARRAY['Free WiFi','Restaurant','Nature Walks','Wildlife Viewing','Parking'])
FROM hotels WHERE name='Bale Mountain Lodge' ON CONFLICT DO NOTHING;
INSERT INTO hotel_amenities (hotel_id, amenity)
SELECT id, unnest(ARRAY['Free WiFi','Restaurant','Tour Guide','Historic Site Access','Parking'])
FROM hotels WHERE name='Lalibela Lodge' ON CONFLICT DO NOTHING;
INSERT INTO hotel_amenities (hotel_id, amenity)
SELECT id, unnest(ARRAY['Free WiFi','Hot Springs','Swimming Pool','Restaurant','Garden','Parking'])
FROM hotels WHERE name='Kuriftu Resort Adama' ON CONFLICT DO NOTHING;
INSERT INTO hotel_amenities (hotel_id, amenity)
SELECT id, unnest(ARRAY['Free WiFi','Restaurant','Cultural Tours','Historic City Access','Parking'])
FROM hotels WHERE name='Harar Walled City Hotel' ON CONFLICT DO NOTHING;
INSERT INTO hotel_amenities (hotel_id, amenity)
SELECT id, unnest(ARRAY['Free WiFi','Restaurant','Airport Shuttle','Parking','24/7 Front Desk'])
FROM hotels WHERE name='Capital Hotel Addis' ON CONFLICT DO NOTHING;
INSERT INTO hotel_amenities (hotel_id, amenity)
SELECT id, unnest(ARRAY['Free WiFi','Restaurant','Parking','24/7 Front Desk'])
FROM hotels WHERE name='Dire Dawa Ras Hotel' ON CONFLICT DO NOTHING;
INSERT INTO hotel_amenities (hotel_id, amenity)
SELECT id, unnest(ARRAY['Free WiFi','Restaurant','Parking','Tour Guide'])
FROM hotels WHERE name='Axum Hotel' ON CONFLICT DO NOTHING;
INSERT INTO hotel_amenities (hotel_id, amenity)
SELECT id, unnest(ARRAY['Free WiFi','Restaurant','Parking','Historical Tours'])
FROM hotels WHERE name='Gonder Goha Hotel' ON CONFLICT DO NOTHING;

-- Final count
SELECT 'cities' AS tbl, COUNT(*) FROM cities
UNION ALL SELECT 'hotels', COUNT(*) FROM hotels
UNION ALL SELECT 'room_types', COUNT(*) FROM room_types
UNION ALL SELECT 'hotel_images', COUNT(*) FROM hotel_images
UNION ALL SELECT 'hotel_amenities', COUNT(*) FROM hotel_amenities;
