USE BluejackJewelry
GO

--[Simulate Sales]
--Customer named vicky padmasari Comes to store and buys three different types of jewelry Green ruby, Blue ruby and Silver
--The customer bought 1 Blue Ruby Necklace, 1 Green Ruby Necklace and 2 Sterling Silver Indonesian Link Bracelet
--The staff who's serving vicky padmasari is Muhammad Malik with the staff code of ST003
--The sales transaction is being held on 22nd December 2022
INSERT INTO MsCustomer VALUES
('CU011', 'Vicky Padmasari', 'Female', 'Vicky.Padmasari@cu.com', 'Edelweiss 51 Street', '081230351414')
INSERT INTO SalesTransaction VALUES
('SL016','ST003','CU011','2022-12-22')
INSERT INTO SalesTransactionDetail VALUES
('SL016','JW010','1'),
('SL016','JW008','1'),
('SL016','JW002','2')
--Because the customer bought 1 Blue Ruby Necklace, 1 Green Ruby Necklace and 2 Sterling Silver Indonesian Link Bracelet the table will be updated as the following jewelries are being bought
UPDATE MsJewelry
SET JewelryStock = JewelryStock - 1
FROM MsJewelry mj
WHERE mj.JewelryID = 'JW010' AND mj.JewelryID = 'JW008'

UPDATE MsJewelry
SET JewelryStock = JewelryStock - 2
FROM MsJewelry mj
WHERE mj.JewelryID = 'JW002'

SELECT * FROM MsJewelry
SELECT * FROM MsCustomer
SELECT * FROM SalesTransaction
SELECT * FROM SalesTransactionDetail

--[Simulate Purchase]
--bluejack jewelry bought 2 types of jewelry, gold and silver, the company purchased 1 Medium Slice Ring in 24k Gold and
--1 Sterling Silver Indonesian Link Bracelet from a vendor named surga jewelry on 23 september 2022
--and served by Ahmad Muhaimin

insert into PurchaseTransaction values
('PU016','ST002','VE001','2022-09-23');

insert into PurchaseTransactionDetail values
('PU016','JW001','1'),
('PU016','JW002','1');

-- because the company purchased 1 Medium Slice Ring in 24k Gold and 1 Sterling Silver Indonesian Link Bracelet, so the stock will increase
update MsJewelry
set JewelryStock=JewelryStock+1
from MsJewelry
where JewelryID = 'JW001' AND JEWELRYID= 'JW002'

SELECT * FROM MsJewelry
SELECT * FROM MsCustomer
SELECT * FROM PurchaseTransaction
SELECT * FROM PurchaseTransactionDetail