INSERT INTO `vehicule` (modele, prix, carac, quantite, image) VALUES
    ("Scenic", 30, '{"marque": "Renault", "couleur": "Gris", "boite": "Manuelle", "moteur": "Essence", "nbPlaces": "5", "nbPortes": "5"}', 11, "https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/renault-grand-scenic-5d-silber-2018.png"),
    ("Kodiaq", 37, '{"marque": "Skoda", "couleur": "Blanc", "boite": "Manuelle", "moteur": "Essence", "nbPlaces": "5", "nbPortes": "5"}', 4, "https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/skoda-kodiaq-5d-weiss-2017-1.png"),
    ("5008", 50,'{"marque": "Peugeot", "couleur": "Gris", "boite": "Manuelle", "moteur": "Essence", "nbPlaces": "7", "nbPortes": "5"}', 6, "https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/peugeot-5008-5d-grau-2017.png"),
    ("X5 xDrive", 130, '{"marque": "BMW", "couleur": "Blanc", "boite": "Automatique", "moteur": "Hybride", "nbPlaces": "5", "nbPortes": "5"}', 3, "https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/bmw-x5-5d-weiss-2018.png"),
    ("Rover Sport HSE", 120, '{"marque": "Range", "couleur": "Rouge", "boite": "Automatique", "moteur": "Essence", "nbPlaces": "5", "nbPortes": "4"}', 4, "https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/land-rover-range-rover-hse-sport-rot-2016.png"),
    ("F-Type cabrio", 180, '{"marque": "Jaguar", "couleur": "Gris", "boite": "Automatique", "moteur": "Hybride", "nbPlaces": "2", "nbPortes": "2"}', 2, "https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/jaguar-f-type-cabrio-2d-silber-2014.png"),
    ("Panamera", 190, '{"marque": "Porsche", "couleur": "Noir", "boite": "Automatique", "moteur": "Essence", "nbPlaces": "5", "nbPortes": "4"}', 0, "https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/porsche-panamera-4d-schwarz-2014.png"),
    ("AMG GT C Roadster", 170, '{"marque": "Mercedes", "couleur": "Gris", "boite": "Automatique", "moteur": "Essence", "nbPlaces": "2", "nbPortes": "2"}', 1, "https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/mb-gt-amg-2d-weiss-2017.png"),
    ("Fortwo", 20, '{"marque": "Smart", "couleur": "Gris", "boite": "Automatique", "moteur": "Electrique", "nbPlaces": "2", "nbPortes": "2"}', 15, "https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/smart-for-two-cabrio-grau-offen-2017-elektro.png"),
    ("Cabriolet", 50, '{"marque": "Mini", "couleur": "Gris", "boite": "Manuelle", "moteur": "Electrique", "nbPlaces": "4", "nbPortes": "2"}', 8, "https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/mini-cooper-cabrio-2d-weiss-offen-2018.png"),
    ("M340", 60, '{"marque": "BMW", "couleur": "Noir", "boite": "Automatique", "moteur": "Hybride", "nbPlaces": "5", "nbPortes": "5"}', 11, "https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/bmw-M340i-4d-schwarz-2019.png");

INSERT INTO user (nom, num_user, password, email) VALUES
    ('admin', 'admin', 'o9199t20VucA7fWYY9+IMZpb89HG+JZjLeWjiilrpho=', 'admin@gmail.com'),
    ('Jean', '101', 'OIVUmQUF76S95OK9S4EjkPeWAdV5EhCWEv8h+I/WL8s=', 'jean_neymar@gmail.com'),
    ('Alex', '102', 'FeEVbY0pdx1XQv3mTi+B5gieGaexx12B0ezm1EGrcLQ=', 'alex_terrieur@gmail.com'),
    ('Alain', '103', 'oM/3ITqeJmJGzvNXVu1Rq8ntTPD6/a6WaZrw1hhfL7E=', 'alain_parfait@gmail.com'),
    ('Mehdi', '104', 'o2nESreCUxaI4zlPH5wzlveZ+w1b/X1vt5HlRSBg0MY=', 'mehdi_cament@gmail.com'),
    ('Sacha', '105', 'mibhNqcQpjk/qBB1bxUXUwvJh4fqfwWar/GVLVdEQsQ=', 'sacha_touille@gmail.com'),
    ('Lena', '105', '3mT8jbyTFpfwldE6GBycIdHDas6e3/u2cWwnleWMjao=', 'lena_rines@gmail.com'),
    ('Eve', '106', 'nkwh0+UTX28pwUEQ1C13WdhVPSLbgpkqWNr4n22U1QY=', 'eve_rest@gmail.com'),
    ('Lucie', '107', 'luBk94ny091sDLfE72OfquOJSKC13+mSSeXtMKoG5bM=', 'lucie_fer@gmail.com'),
    ('Jacques', '108', 'HRvx4ggYGFknfpt4VJytHE96HAx3qboAI/d8B1Sj93Y=', 'jacques_ouzi@gmail.com'),
    ('Guy', '109', '/lTlYwsbRLgeThRPmVqwecPGJkwo2IxJLT+rG+GORms=', 'guy_mauve@gmail.com'),
    ('Terry', '110', '4eByo7UDR98XU1YJIBYdmKyqdLJKT4OUIGCF4CSGBj4=', 'terry_golo@gmail.com');

INSERT INTO facture (id_user, id_vehic, date_d, date_f, montant, payee) VALUES
    ('101', '2', '2020-09-20 10:01:00', '2020-10-20 10:01:00', 1100, '0'),
    ('102', '2', '2020-01-15 11:12:00', '2020-04-15 10:01:00', 3330, '1'),
    ('103', '3', '2020-09-25 17:25:00', '2020-09-30 17:25:00', 300, '0'),
    ('104', '6', '2020-06-12 16:21:00', '2020-06-22 16:21:00', 1800, '1'),
    ('105', '4', '2020-10-10 12:10:00', '2020-10-25 12:10:00', 1950, '0'),
    ('106', '1', '2020-05-20 11:12:00', '2020-10-20 11:12:00', 4500, '1'),
    ('107', '1', '2020-02-08 09:23:00', '2020-05-08 09:23:00', 2700, '1'),
    ('102', '3', '2020-07-26 14:35:00', '2020-09-11 14:35:00', 2250, '1'),
    ('108', '7', '2020-09-25 15:18:00', '2020-10-25 15:18:00', 5700, '0'),
    ('109', '8', '2020-06-50 11:05:00', '2020-06-20 11:05:00', 2550, '1');