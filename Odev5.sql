-- 1-Tüm filmleri film adı ve dili ile birlikte  listeleyiniz.
-- hint:film ve language tablolarını kullanınız.

select * from film
union
select * from language

-- 2-Ödeme miktarı ve müşteri adıyla birlikte en yüksek ödeme yapan müşteriyi bulunuz.
-- hint:payment ve customer tablolarını kullanınız.

-- 3-Tüm kategorilerin isimlerini ve kategoriye ait film sayısını birlikte  listeleyiniz.
-- hint:category,film_category tablolarını kullanınız.

-- 4-customer_id'ye göre en çok film kiralayan müşterilerin ad-soyad ve kiraladığı film sayısını birlikte listeleyiniz.
-- hint:customer,rental tablolarını kullanınız.