INSERT INTO `vehicule` (modele, prix, diponible, carac, quantite, image) VALUES
    ("Scenic", 30, 0, '{"marque": "Renault", "couleur": "Gris", "boite": "Manuelle", "moteur": "Essence", "nbPlaces": "5", "nbPortes": "5"}', 11, "https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/renault-grand-scenic-5d-silber-2018.png"),
    ("Kodiaq", 37, 0, '{"marque": "Skoda", "couleur": "Blanc", "boite": "Manuelle", "moteur": "Essence", "nbPlaces": "5", "nbPortes": "5"}', 4, "/img/voitures/skoda-kodiaq-55664.png"),
    ("5008", 50, 0,'{"marque": "Peugeot", "couleur": "Gris", "boite": "Manuelle", "moteur": "Essence", "nbPlaces": "7", "nbPortes": "5"}', 6, "https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/peugeot-5008-5d-grau-2017.png"),
    ("X5 xDrive", 130, 0, '{"marque": "BMW", "couleur": "Blanc", "boite": "Automatique", "moteur": "Hybride", "nbPlaces": "5", "nbPortes": "5"}', 3, "https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/bmw-x5-5d-weiss-2018.png"),
    ("Rover Sport HSE", 120, 0, '{"marque": "Range", "couleur": "Rouge", "boite": "Automatique", "moteur": "Essence", "nbPlaces": "5", "nbPortes": "4"}', 4, "https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/land-rover-range-rover-hse-sport-rot-2016.png"),
    ("F-Type cabrio", 180, 0, '{"marque": "Jaguar", "couleur": "Gris", "boite": "Automatique", "moteur": "Hybride", "nbPlaces": "2", "nbPortes": "2"}', 2, "https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/jaguar-f-type-cabrio-2d-silber-2014.png"),
    ("Panamera", 190, 1, '{"marque": "Porsche", "couleur": "Noir", "boite": "Automatique", "moteur": "Essence", "nbPlaces": "5", "nbPortes": "4"}', 0, "https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/porsche-panamera-4d-schwarz-2014.png"),
    ("AMG GT C Roadster", 170, 0, '{"marque": "Mercedes", "couleur": "Gris", "boite": "Automatique", "moteur": "Essence", "nbPlaces": "2", "nbPortes": "2"}', 1, "https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/mb-gt-amg-2d-weiss-2017.png"),
    ("Fortwo", 20, 0, '{"marque": "Smart", "couleur": "Gris", "boite": "Automatique", "moteur": "Electrique", "nbPlaces": "2", "nbPortes": "2"}', 15, "https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/smart-for-two-cabrio-grau-offen-2017-elektro.png"),
    ("Cabriolet", 50, 0, '{"marque": "Mini", "couleur": "Gris", "boite": "Manuelle", "moteur": "Electrique", "nbPlaces": "4", "nbPortes": "2"}', 8, "https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/mini-cooper-cabrio-2d-weiss-offen-2018.png"),
    ("M340", 60, 0, '{"marque": "BMW", "couleur": "Noir", "boite": "Automatique", "moteur": "Hybride", "nbPlaces": "5", "nbPortes": "5"}', 11, "https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/bmw-M340i-4d-schwarz-2019.png");
    ("Modele S", 63, 0, '{"marque": "Tesla", "couleur": "bleu", "boite": "Automatique", "moteur": "electrique", "nbPlaces": "5", "nbPortes": "5"}', 4, "/img/voitures/TeslaModele-S-5fab00b35241.jpeg");

INSERT INTO user (nom, num_user, password, email) VALUES
    ('admin', 'admin', '$2y$13$N4cenjkG2zZItYdeVYiDoO/htJxG0pitgl34FEVLTTHnypKkaifx.', 'admin@gmail.com'),
    ('Jean', '101', '$2y$13$U63dZXqNLx5MWhsHuk5WU.W403HTIUrHGtAabfM8aiNjKb9D9TzSS', 'jean_neymar@gmail.com'),
    ('Alex', '102', '$2y$13$6GjD75Y.5nlkou3kesdjEeKrnVd227xqhugUXMmtIGixDnmpaeahG', 'alex_terrieur@gmail.com'),
    ('Alain', '103', '$2y$13$6GjD75Y.5nlkou3kesdjEeKrnVd227xqhugUXMmtIGixDnmpaeahG', 'alain_parfait@gmail.com'),
    ('Mehdi', '104', '$2y$13$6GjD75Y.5nlkou3kesdjEeKrnVd227xqhugUXMmtIGixDnmpaeahG', 'mehdi_cament@gmail.com'),
    ('Sacha', '105', '$2y$13$6GjD75Y.5nlkou3kesdjEeKrnVd227xqhugUXMmtIGixDnmpaeahG', 'sacha_touille@gmail.com'),
    ('Lena', '105', '$2y$13$6GjD75Y.5nlkou3kesdjEeKrnVd227xqhugUXMmtIGixDnmpaeahG', 'lena_rines@gmail.com'),
    ('Eve', '106', '$2y$13$6GjD75Y.5nlkou3kesdjEeKrnVd227xqhugUXMmtIGixDnmpaeahG', 'eve_rest@gmail.com'),
    ('Lucie', '107', '$2y$13$6GjD75Y.5nlkou3kesdjEeKrnVd227xqhugUXMmtIGixDnmpaeahG', 'lucie_fer@gmail.com'),
    ('Jacques', '108', '$2y$13$6GjD75Y.5nlkou3kesdjEeKrnVd227xqhugUXMmtIGixDnmpaeahG', 'jacques_ouzi@gmail.com'),
    ('Guy', '109', '$2y$13$6GjD75Y.5nlkou3kesdjEeKrnVd227xqhugUXMmtIGixDnmpaeahG', 'guy_mauve@gmail.com'),
    ('Terry', '110', '$2y$13$6GjD75Y.5nlkou3kesdjEeKrnVd227xqhugUXMmtIGixDnmpaeahG', 'terry_golo@gmail.com');

INSERT INTO facture (id_user, id_vehic, date_d, date_f, montant, payee) VALUES
    ('101', '2', '2020-09-20 10:01:00', '2020-10-20 10:01:00', 1100, '0'),
    ('102', '2', '2020-01-15 11:12:00', '2020-04-15 10:01:00', 3330, '1'),
    ('103', '3', '2020-09-25 17:25:00', '2020-09-30 17:25:00', 300, '0'),
    ('102', '6', '2020-06-12 16:21:00', '2020-06-22 16:21:00', 1800, '1'),
    ('105', '4', '2020-10-10 12:10:00', '2020-10-25 12:10:00', 1950, '0'),
    ('102', '1', '2020-05-20 11:12:00', '2020-10-20 11:12:00', 4500, '1'),
    ('107', '1', '2020-02-08 09:23:00', '2020-05-08 09:23:00', 2700, '1'),
    ('102', '3', '2020-07-26 14:35:00', '2020-09-11 14:35:00', 2250, '1'),
    ('108', '7', '2020-09-25 15:18:00', '2020-10-25 15:18:00', 5700, '0'),
    ('109', '8', '2020-06-05 11:05:00', '2020-06-20 11:05:00', 2550, '1');