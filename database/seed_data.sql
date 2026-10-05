-- ── CITIES TABLE ─────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS cities (
    id         SERIAL       PRIMARY KEY,
    name       VARCHAR(100) NOT NULL UNIQUE,
    region     VARCHAR(100) NOT NULL DEFAULT '',
    is_active  BOOLEAN      NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

-- ── SEED ETHIOPIAN CITIES ─────────────────────────────────────────────
INSERT INTO cities (name, region) VALUES
('Addis Ababa',  'Addis Ababa City Administration'),
('Dire Dawa',    'Dire Dawa City Administration'),
('Bahir Dar',    'Amhara'),
('Hawassa',      'Sidama'),
('Mekelle',      'Tigray'),
('Gondar',       'Amhara'),
('Jimma',        'Oromia'),
('Adama',        'Oromia'),
('Harar',        'Harari'),
('Arba Minch',   'SNNPR'),
('Axum',         'Tigray'),
('Lalibela',     'Amhara')
ON CONFLICT (name) DO NOTHING;

-- ── SEED FEATURED HOTELS ─────────────────────────────────────────────
INSERT INTO hotels (name, city, address, description, type, rating, review_count, price_per_night, is_featured, is_active)
VALUES
('Sheraton Addis',           'Addis Ababa', 'Taitu St, Addis Ababa',      'Luxury 5-star hotel in the heart of Addis Ababa with world-class amenities.',     'Luxury',   4.8, 1240, 12000, TRUE,  TRUE),
('Hyatt Regency Addis',      'Addis Ababa', 'Africa Ave, Addis Ababa',    'Modern 5-star hotel offering spectacular city views and premium services.',        'Luxury',   4.7,  980, 10500, TRUE,  TRUE),
('Kuriftu Resort Bahir Dar', 'Bahir Dar',   'Lake Tana Shore, Bahir Dar', 'Stunning lakeside resort on Lake Tana with traditional Ethiopian architecture.',   'Resort',   4.9,  650,  8500, TRUE,  TRUE),
('Haile Resort Hawassa',     'Hawassa',     'Hawassa Lake, Hawassa',       'Beautiful lakeside resort with stunning views of Lake Hawassa and lush gardens.',  'Resort',   4.6,  520,  7000, TRUE,  TRUE),
('Axum Hotel',               'Axum',        'Main St, Axum',               'Comfortable hotel near the famous Axum obelisks and ancient ruins.',               'Standard', 4.2,  310,  3500, FALSE, TRUE),
('Gonder Goha Hotel',        'Gondar',      'Fasilides St, Gondar',        'Historic hotel close to Gondar castles with traditional decor and great food.',    'Standard', 4.3,  420,  4000, FALSE, TRUE),
('Bale Mountain Lodge',      'Arba Minch',  'Nechisar National Park',      'Eco-lodge inside Nechisar National Park with amazing wildlife viewing.',           'Resort',   4.7,  280,  9500, TRUE,  TRUE),
('Lalibela Lodge',           'Lalibela',    'Rock Church Area, Lalibela',  'Boutique lodge steps from the famous rock-hewn churches of Lalibela.',             'Boutique', 4.5,  390,  6500, TRUE,  TRUE),
('Capital Hotel Addis',      'Addis Ababa', 'Bole Rd, Addis Ababa',        'Modern business hotel in Bole district, close to Bole International Airport.',    'Business', 4.4,  760,  6000, FALSE, TRUE),
('Dire Dawa Ras Hotel',      'Dire Dawa',   'Kezira, Dire Dawa',           'Classic hotel in the heart of Dire Dawa with colonial architecture and gardens.',  'Standard', 4.0,  180,  2800, FALSE, TRUE),
('Kuriftu Resort Adama',     'Adama',       'Sodere Springs, Adama',       'Resort near natural hot springs with beautiful gardens and outdoor pools.',        'Resort',   4.5,  440,  7500, TRUE,  TRUE),
('Harar Walled City Hotel',  'Harar',       'Old Town, Harar',             'Boutique hotel inside the ancient walled city of Harar, a UNESCO heritage site.', 'Boutique', 4.6,  290,  5500, TRUE,  TRUE)
ON CONFLICT DO NOTHING;

-- ── SEED HOTEL IMAGES ────────────────────────────────────────────────
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

-- ── SEED ROOM TYPES ──────────────────────────────────────────────────
INSERT INTO room_types (hotel_id, name, description, price_per_night, max_guests, size_sqm, features, is_available)
SELECT id, 'Standard Room', 'Comfortable standard room with all essentials.', price_per_night * 0.8, 2, 25, '{"Free WiFi","Air Conditioning","TV","Mini Bar"}', TRUE FROM hotels WHERE name='Sheraton Addis' ON CONFLICT DO NOTHING;
INSERT INTO room_types (hotel_id, name, description, price_per_night, max_guests, size_sqm, features, is_available)
SELECT id, 'Deluxe Suite', 'Spacious suite with city views and premium amenities.', price_per_night * 1.5, 3, 55, '{"Free WiFi","Air Conditioning","TV","Mini Bar","City View","Jacuzzi"}', TRUE FROM hotels WHERE name='Sheraton Addis' ON CONFLICT DO NOTHING;
INSERT INTO room_types (hotel_id, name, description, price_per_night, max_guests, size_sqm, features, is_available)
SELECT id, 'Lake View Room', 'Beautiful room with panoramic Lake Tana views.', price_per_night, 2, 35, '{"Free WiFi","Lake View","Air Conditioning","Balcony"}', TRUE FROM hotels WHERE name='Kuriftu Resort Bahir Dar' ON CONFLICT DO NOTHING;
INSERT INTO room_types (hotel_id, name, description, price_per_night, max_guests, size_sqm, features, is_available)
SELECT id, 'Family Villa', 'Large villa perfect for families with private pool.', price_per_night * 2.2, 5, 90, '{"Free WiFi","Private Pool","Kitchen","Lake View","Air Conditioning"}', TRUE FROM hotels WHERE name='Kuriftu Resort Bahir Dar' ON CONFLICT DO NOTHING;
INSERT INTO room_types (hotel_id, name, description, price_per_night, max_guests, size_sqm, features, is_available)
SELECT id, 'Lake Suite', 'Gorgeous suite overlooking Lake Hawassa.', price_per_night * 1.3, 2, 45, '{"Free WiFi","Lake View","Air Conditioning","Balcony","Room Service"}', TRUE FROM hotels WHERE name='Haile Resort Hawassa' ON CONFLICT DO NOTHING;
INSERT INTO room_types (hotel_id, name, description, price_per_night, max_guests, size_sqm, features, is_available)
SELECT id, 'Standard Room', 'Clean and comfortable standard room.', price_per_night * 0.9, 2, 22, '{"Free WiFi","Air Conditioning","TV"}', TRUE FROM hotels WHERE name='Capital Hotel Addis' ON CONFLICT DO NOTHING;
INSERT INTO room_types (hotel_id, name, description, price_per_night, max_guests, size_sqm, features, is_available)
SELECT id, 'Heritage Room', 'Unique room with traditional Harari decor.', price_per_night, 2, 28, '{"Free WiFi","Air Conditioning","Historic Views","Breakfast Included"}', TRUE FROM hotels WHERE name='Harar Walled City Hotel' ON CONFLICT DO NOTHING;

-- ── SEED AMENITIES ───────────────────────────────────────────────────
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

-- ── VERIFY ───────────────────────────────────────────────────────────
SELECT 'cities' AS tbl, COUNT(*) FROM cities
UNION ALL SELECT 'hotels', COUNT(*) FROM hotels
UNION ALL SELECT 'room_types', COUNT(*) FROM room_types
UNION ALL SELECT 'hotel_images', COUNT(*) FROM hotel_images
UNION ALL SELECT 'hotel_amenities', COUNT(*) FROM hotel_amenities;
