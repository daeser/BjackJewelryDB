USE BluejackJewelry
GO

INSERT INTO MsStaff VALUES
('ST001','ManikGalih','Male','ManikGalih@st.com','Melati 4 Street','081282739456'),
('ST002','Ahmad Muhaimin','Male','AhmadMuhauimin@st.com','Mawar 1 Street','081212345678'),
('ST003','Muhammad Malik','Male','MuhammadMalik@st.com','Anggrek 2 Street','081297451678'),
('ST004','Raihan Bilal','Male','RaihanBilal@st.com','Kamboja 3 Street','081257189349'),
('ST005','Putri Maharani','Female','PutriMaharani@st.com','Asoka 9 Street','081273849102'),
('ST006','Fathonah Winarsih','Female','fthonahw@st.com','Lily 13 Street','081283651789'),
('ST007','Audry Annasy','Female','AudryAnnasy@st.com','Amarilis 19 Street','081274819273'),
('ST008','Aisyah Azzahra','Female','AisyahAzzahra@st.com','Kemuning 7 Street','081297358791'),
('ST009','Dwi Lestari','Female','D.Lestari@st.com','Kembang 6 Street','081293781945'),
('ST010','RozakAgus','Male','Rozak Agus@st.com','Lavender 15 Street','081294817590')

INSERT INTO MsCustomer VALUES
('CU001', 'Azlan Rauf','Male','AzlanRauf@cu.com','Bougenville 4 Street','081283947189'),
('CU002', 'Edward Matthew', 'Male', 'EdwardMatthew@cu.com', 'Rafflesia 9 Street', '081283947189'),
('CU003', 'Rizki Akbar', 'Male', 'RizkiAkbar@cu.com', 'Aster 3 Street', '081273849165'),
('CU004', 'Feri Andhika', 'Male', 'FeriAndhika@cu.com', 'Matahari 6 Street', '081284561839'),
('CU005', 'Wahyu Andrian', 'Male', 'WahyuAndrian@cu.com', 'Kecombrang 12 Street', '08123845901'),
('CU006', 'Erza Odelia', 'Female', 'EzraOdelia@cu.com', 'Sakura 7 Street', '08125910340'),
('CU007', 'Sherina Isabella', 'Female', 'SherinaIsabella@cu.com', 'Popi 43 Street', '081234889014'),
('CU008', 'Fatonah Winarsih', 'Female', 'Fatonah.Winarsih@cu.com', 'Kaliko 81 Street', '081209183748'),
('CU009', 'Alika Yolanda', 'Female', 'Alika.Yolanda@cu.com', 'Teratai 33 Street', '081233467802'),
('CU010', 'Wirda Puspita', 'Female', 'Wirda.Puspita@cu.com', 'Tulip 94 Street', '081250021925')

insert into MsVendor values 
('VE001','surga jewelry','surgajewelry@ve.com','tanahbaru 1 street','081397652232'),
('VE002','myprivatejewelry','myjewelry@ve.com','srengseng 9 street','081397688632'),
('VE003','goodjewel','goodjewel@ve.com','kukusan 2 street','081934652232'),
('VE004','cheapngoodjewelry','cheapjewelry@ve.com','jonggol 7 street','081392222232'),
('VE005','queenjewelry','queenjewelry2ve.com','pamulang 4 street','087654652232'),
('VE006','jewelryoffuture','future.jew@ve.com','ragunan 3 street','08101277232'),
('VE007','oceoanofjewelry','oceanjewelry@ve.com','kemang 1 street','081397600654'),
('VE008','source n jewelry','source.jewel@ve.com','cinere 5 street','081227652232'),
('VE009','lord jewelry','lordjewelry@ve.com','cibubur 3 street','081932934567'),
('VE010','distributor n jewelry','jewel.dist@ve.com','pejaten 9 street','082397652239')

INSERT INTO MsJewelryType values 
('JT001','Gold'),
('JT002','Silver'),
('JT003','Diamond'),
('JT004','Bronze'),
('JT005','Pearl'),
('JT006','White Gold'),
('JT007','Ruby'),
('JT008','Green Ruby'),
('JT009','Black Diamond'),
('JT010','Blue Ruby')

INSERT INTO MsJewelry VALUES
('JW001','JT001', 'Medium Slice Ring in 24k Gold','531','7500','7700','7'),
('JW002','JT002', 'Sterling Silver Indonesian Link Bracelet','655','3500','3700','5'),
('JW003','JT003', 'Diamond by the Field','542','6300','6500','2'),
('JW004','JT004','Hammer Bronze Bracelet','583','2300','2500','15'),
('JW005','JT005','Culture Pearl Necklace','173','4500','4700','7'),
('JW006','JT006','Ring in White gold','589','7600','8100','5'),
('JW007','JT007','Ruby Earrings','349','8000','9500','4'),
('JW008','JT008','Green Ruby Necklace','583','7600','8200','4'),
('JW009','JT009','Iced Out Black Diamond Chains','726','10000','12500','1'),
('JW010','JT010','Blue Ruby Necklace','539','9300','10500','2')

INSERT INTO PurchaseTransaction VALUES
('PU001','ST001','VE001','2022-01-20'),
('PU002','ST002','VE001','2022-02-21'),
('PU003','ST007','VE002','2022-03-22'),
('PU004','ST005','VE002','2022-04-23'),
('PU005','ST005','VE003','2022-05-24'),
('PU006','ST010','VE004','2022-06-25'),
('PU007','ST010','VE004','2022-07-26'),
('PU008','ST004','VE005','2022-08-27'),
('PU009','ST006','VE006','2022-09-28'),
('PU010','ST008','VE007','2022-10-29'),
('PU011','ST009','VE008','2022-11-30'),
('PU012','ST003','VE009','2022-12-02'),
('PU013','ST003','VE009','2022-06-03'),
('PU014','ST002','VE010','2022-03-07'),
('PU015','ST007','VE010','2022-04-12')


INSERT INTO PurchaseTransactionDetail VALUES
('PU001','JW001','2'),
('PU001','JW002','3'),
('PU002','JW001','5'),
('PU002','JW002','3'),
('PU003','JW002','2'),
('PU003','JW004','4'),
('PU004','JW003','2'),
('PU004','JW004','4'),
('PU005','JW003','1'),
('PU006','JW004','1'),
('PU006','JW007','2'),
('PU007','JW005','1'),
('PU008','JW005','2'),
('PU008','JW006','4'),
('PU009','JW005','4'),
('PU009','JW006','3'),
('PU010','JW007','2'),
('PU010','JW005','3'),
('PU011','JW007','2'),
('PU011','JW004','4'),
('PU012','JW008','6'),
('PU013','JW009','1'),
('PU014','JW009','1'),
('PU014','JW004','6'),
('PU015','JW010','3'),
('PU015','JW001','3')

-- JW 1 = 10
-- JW 2 = 8
-- JW 3 = 3
-- JW 4 = 19
-- JW 5 = 10
-- JW 6 = 7
-- JW 7 = 6
-- JW 8 = 6
-- JW 9 = 2
-- JW 10 = 3

INSERT INTO SalesTransaction VALUES
('SL001','ST002','CU001','2022-01-21'),
('SL002','ST001','CU002','2022-02-23'),
('SL003','ST005','CU003','2022-03-24'),
('SL004','ST007','CU002','2022-04-25'),
('SL005','ST007','CU003','2022-06-12'),
('SL006','ST004','CU001','2022-05-30'),
('SL007','ST004','CU004','2022-07-02'),
('SL008','ST010','CU007','2022-08-05'),
('SL009','ST008','CU006','2022-09-10'),
('SL010','ST006','CU005','2022-10-20'),
('SL011','ST003','CU008','2022-11-25'),
('SL012','ST009','CU010','2022-12-24'),
('SL013','ST009','CU009','2022-06-11'),
('SL014','ST007','CU006','2022-03-21'),
('SL015','ST002','CU010','2022-04-27')

INSERT INTO SalesTransactionDetail VALUES
('SL001','JW001','1'),
('SL001','JW002','1'),
('SL002','JW001','1'),
('SL002','JW002','1'),
('SL003','JW002','1'),
('SL003','JW004','2'),
('SL004','JW003','2'),
('SL004','JW004','1'),
('SL005','JW003','1'),
('SL006','JW004','1'),
('SL006','JW007','2'),
('SL007','JW005','1'),
('SL008','JW005','1'),
('SL008','JW006','1'),
('SL009','JW005','1'),
('SL009','JW006','2'),
('SL010','JW007','2'),
('SL010','JW005','1'),
('SL011','JW007','1'),
('SL011','JW004','1'),
('SL012','JW008','1'),
('SL013','JW009','1'),
('SL014','JW009','1'),
('SL014','JW004','1'),
('SL015','JW010','1'),
('SL015','JW001','1')