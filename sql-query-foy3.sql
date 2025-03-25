SELECT c.ad, c.soyad, c.maas
FROM calisanlar c
JOIN birimler b ON c.calisan_birim_id = b.birim_id
WHERE b.birim_ad IN ('Yazılım', 'Donanım');

SELECT ad, soyad, maas
FROM calisanlar
WHERE maas = (SELECT MAX(maas) FROM calisanlar);

SELECT b.birim_ad, COUNT(c.calisan_id) AS calisan_sayisi
FROM birimler b
LEFT JOIN calisanlar c ON b.birim_id = c.calisan_birim_id
GROUP BY b.birim_ad;


SELECT u.unvan_calisan, COUNT(u.unvan_calisan_id) AS calisan_sayisi
FROM unvan u
GROUP BY u.unvan_calisan
HAVING COUNT(u.unvan_calisan_id) > 1;

SELECT ad, soyad, maas
FROM calisanlar
WHERE maas BETWEEN 50000 AND 100000;

SELECT c.ad, c.soyad, b.birim_ad, u.unvan_calisan, i.ikramiye_ucret
FROM calisanlar c
JOIN birimler b ON c.calisan_birim_id = b.birim_id
JOIN unvan u ON c.calisan_id = u.unvan_calisan_id
JOIN ikramiye i ON c.calisan_id = i.ikramiye_calisan_id;

SELECT c.ad, c.soyad, u.unvan_calisan
FROM calisanlar c
JOIN unvan u ON c.calisan_id = u.unvan_calisan_id
WHERE u.unvan_calisan IN ('Yönetici', 'Müdür');

SELECT c.ad, c.soyad, c.maas, c.calisan_birim_id
FROM calisanlar c
WHERE c.maas = (
    SELECT MAX(c2.maas)
    FROM calisanlar c2
    WHERE c2.calisan_birim_id = c.calisan_birim_id
);


