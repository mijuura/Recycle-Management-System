create database RECYCLE;
show databases;
use RECYCLE;
show tables;

drop table COLLECTION;
drop table  WASTE;
drop table MATERIAL;
drop table DISPOSAL;
drop table TRANSACTION;
drop table USER;
drop table PARTNER;
drop table BRANCH;
drop table SERVICE;
drop table staff;

CREATE TABLE USER 
( 
    User_ID varchar(20) not null primary key, 
    User_Name varchar(100), 
    User_PhoneNo varchar(15), 
    User_Email varchar(100) 
); 

CREATE TABLE COLLECTION
(
    Collection_ID varchar(10) not null primary key,
    Collection_Date date,
    Collection_Area varchar(20)
);

-- Add an index on the Collection_ID column
CREATE INDEX idx_collection_id ON COLLECTION (Collection_ID);

CREATE TABLE WASTE
(
    Waste_ID varchar(20) not null primary key,
    Waste_Quantity int,
    Waste_Weight decimal (6,2),
    Collection_ID varchar(20),
    User_ID varchar(20),
    foreign key (Collection_ID) references COLLECTION(Collection_ID),
    foreign key (User_ID) references USER(User_ID)
);

CREATE TABLE TRANSACTION 
( 
    Transaction_ID varchar(10) not null primary key, 
    Transaction_Ref varchar(30), 
    Transaction_Date date, 
    Transaction_Point int,
    User_ID varchar(20),
    foreign key (user_ID) references USER(user_ID) 
); 

CREATE TABLE BRANCH
(
    Branch_ID varchar(20) not null primary key,
    Branch_Address varchar(200),
    Branch_Email varchar(100),
    Branch_Contact varchar(20),
    Branch_LicenseNo varchar(20)
);

-- Add an index on the Branch_ID column
CREATE INDEX idx_branch_id ON BRANCH (Branch_ID);

CREATE TABLE DISPOSAL 
( 
    Disposal_ID varchar(20), 
    Disposal_Method varchar(50), 
    Disposal_Description varchar(50), 
    Disposal_Code varchar(20), 
    Branch_ID varchar(20), 
    foreign key (Branch_ID) references BRANCH(Branch_ID) 
);

-- Add an index on the Disposal_ID column
CREATE INDEX idx_disposal_id ON DISPOSAL (Disposal_ID);

CREATE TABLE MATERIAL
( 
    Disposal_ID VARCHAR(20), 
    FOREIGN KEY (Disposal_ID) REFERENCES DISPOSAL(Disposal_ID), 
    Collection_ID VARCHAR(20),
    FOREIGN KEY (Collection_ID) REFERENCES COLLECTION(Collection_ID), 
    Material_Name VARCHAR(100), 
    Material_Type VARCHAR(50) 
);

CREATE TABLE PARTNER 
(
    Partner_ID varchar(20) not null primary key,
    Partner_Name varchar(20),
    Partner_Location varchar(100),
    Partner_Investment decimal (4,2),
    Branch_ID varchar(20),
    foreign key (Branch_ID) references BRANCH(Branch_ID)
);

create table SERVICE  
( 
	Service_ID varchar(20) not null primary key, 
	Service_type varchar(100), 
	Service_Tracking varchar(20), 
	Service_Date date, 
    User_ID  varchar(20),
	foreign key (User_ID) references USER(User_ID) 
); 

Create table STAFF 
( 
   Staff_ID varchar(10) not null primary key, 
   Staff_Name varchar(50), 
   Staff_Shift varchar(20), 
   Staff_Attendance int, 
   Branch_ID varchar(20),
   foreign key (Branch_ID) references BRANCH(Branch_ID) 
); 

insert into USER values 
('U001', 'John Smith', '123-450-7880', 'jsmith@gmail.com'), 
('U002', 'Jean Paul', '987-614-3200', 'pauljean@yahoo.com'), 
('U003','Nasha Arman', '015-123-4037', 'nasrman@gmail.com'), 
('U004','Joe Viviene', '111-224-3038', 'viviejoe@gmail.com'), 
('U005','Eva David', '014-555-6460', 'evadavid@gmail.com'), 
('U006','Hisyam Mahmood', '017-881-9099', 'mhisyam@yahoo.com'), 
('U007','Sophie Kim', '888-777-6869', 'sophkim@yahoo.com'), 
('U008','Dania Faizal', '019-111-2321', 'daniafzl@gmail.com'), 
('U009','Harith Ezra', '013-444-5755', 'hariezra@gmail.com'), 
('U010','Khairi Arsyad', '010-999-4868', 'khairy@yahoo.com');
select * from USER;

Insert into TRANSACTION values 
('TRXID001', 'REF001TX', '2023-01-15', 150, 'U001'), 
('TRXID002', 'REF002TX', '2023-02-11', 200, 'U002'), 
('TRXID003', 'REF003TX', '2023-03-20', 75, 'U003'), 
('TRXID004', 'REF004TX', '2023-04-27', 120, 'U004'), 
('TRXID005', 'REF005TX', '2023-05-23', 250, 'U005'), 
('TRXID006', 'REF006TX', '2023-06-03', 100, 'U006'), 
('TRXID007', 'REF007TX', '2023-07-10', 180, 'U007'), 
('TRXID008', 'REF008TX', '2023-08-23', 90, 'U008'), 
('TRXID009', 'REF009TX', '2023-09-19', 85, 'U009'), 
('TRXID010', 'REF010TX', '2023-10-24', 160, 'U010');
select *from TRANSACTION;

Insert into COLLECTION values 
('CA40' ,'2023-01-08', 'Temerloh'), 
('CA41' ,'2023-02-28', 'Banting'), 
('CA42' ,'2023-03-08', 'Kemaman'), 
('CA43' ,'2023-04-28', 'Bentong'), 
('CA44' ,'2023-05-08', 'Tampin'), 
('CA45' ,'2023-06-28', 'Nilai'), 
('CA46' ,'2023-07-08', 'Jasin'), 
('CA47' ,'2023-08-28', 'Rawang'), 
('CA48' ,'2023-09-08', 'Muar'), 
('CA49' ,'2023-10-28', 'Gambang'), 
('CA50' ,'2023-11-08', 'Baling'), 
('CA51' ,'2023-12-28', 'Tumpat');
select * from COLLECTION;

insert into WASTE values
('WD45', 1, 0.52, 'CA40', 'U001'),
('WD46', 2, 3.45, 'CA41', 'U002'),
('WD47', 3, 3.21, 'CA42', 'U003'),
('WD48', 3, 6.97, 'CA43', 'U004'),
('WD49', 2, 5.23, 'CA44', 'U005'),
('WD50', 2, 4.08, 'CA45', 'U006'),
('WD51', 7, 3.22, 'CA46', 'U007'),
('WD52', 4, 2.11, 'CA47', 'U008'),
('WD53', 5, 1.76, 'CA48', 'U009'),
('WD54', 1, 0.23, 'CA49', 'U010'),
('WD55', 2, 10.09, 'CA49', 'U007'),
('WD56', 4, 3.89, 'CA47', 'U009'),
('WD57', 7, 15.92, 'CA46', 'U005'),
('WD58', 1, 2.99, 'CA40', 'U006'),
('WD59', 1, 4.23, 'CA40', 'U003');
select * from WASTE;

insert into BRANCH values 
('B01','Tapak Pelupusan Sisa Pepejal, 81000, Kulai, Johor', 'tapakkulai.ecoharbour@gmail.com', '07-2230619','BL23032'), 
('B02','Teluk Mengkudu Open Sanitary Landfill, 36110, Teluk Intan, Perak','mengkudusanitary.ecoharbour@gmail.com','05-2282525','BL22098'), 
('B03','Meridian World & Recycling, 08000, Sungai Petani, Kedah','meridiankedah.ecoharbour@outlook.com','04-7027000','BL22075'),  
('B04','UrbanR Recycle+, 43200, Cheras, Kuala Lumpur','urbanrecycyle.ecoharbour@gmail.com','03-2642020','BL21007'), 
('B05','Electronic & E-Waste Recycling, 11060, Air Itam, Pulau Pinang','ewaste.ecoharbour@hotmail.com','04-2629930','BL23045'),  
('B06','Ananerobic Waste Management, 25000, Kuantan, Pahang','anaerobicwaste.ecoharbour@gmail.com','09-7713037','BL23150'), 
('B07','Mega Capital Waste Management, 18000, Kuala Krai, Kelantan','megacapital.ecoharbour@gmail.com','09-2621957','BL22033'), 
('B08','Oakland Commercial Centre, 70000, Seremban, Negeri Sembilan','okland9.ecoharbour@outlook.com','06-5126601','BL21001'),  
('B09','Borneo Waste Industries, 88000, Kota Kinabalu, Sabah','borneowaste.ecoharbour@gmail.com','088-515447','BC22019'), 
('B10','Trienikens (Sarawak), 93000, Kuching, Sarawak','trienikens.ecoharbour@gmail.com', '082-441677','BC23074'); 
select * from BRANCH;

insert into DISPOSAL values  
('DS01','Landfill','Non-hazardous waste','LFD123','B02'),     
('DS02','Incineration','Hazardous waste','INC654','B10'),   
('DS03','Biogas generation','Non-hazardous waste','BIO998','B06'),  
('DS04','Composting','Non-hazardous waste','CMP331','B01'),    
('DS05','Plasma gasification','Non-hazardous waste','PGS643','B07'),   
('DS06','Reuse','Non-hazardous waste','REU321','B04'),   
('DS07','Reduce','Non-hazardous waste','RED234','B04'),   
('DS08','Recycle','Non-hazardous waste','RCL567','B03'),  
('DS09','Hazardous waste stabilization','Hazardous waste','HWS890','B08'),  
('DS10','End-of-life (EOL)','Hazardous waste','EOL432','B05'), 
('DS11','Waste-to-energy (WTE)','Non-hazardous waste','WTE774','B09'),  
('DS12','Land spreading','Non-hazardous waste','LSP390','B01'); 
select * from DISPOSAL;

 Insert into MATERIAL values 
('DS08', 'CA41', 'Plastic Bottle', 'Plastic'), 
('DS07', 'CA43', 'Paper Towel', 'Paper'), 
('DS08', 'CA42', 'Aluminum Can', 'Metal'), 
('DS06', 'CA45', 'Glass Jar', 'Glass'), 
('DS07', 'CA44', 'Cardboard Box', 'Paper'), 
('DS08', 'CA46', 'Steel Wire', 'Metal'), 
('DS04', 'CA40', 'Garden Waste', 'Organic'), 
('DS06', 'CA48', 'Plastic Packaging', 'Plastic'), 
('DS04', 'CA47', 'Food Scraps', 'Organic'), 
('DS03', 'CA49', 'Compostable Bag', 'Organic'), 
('DS08', 'CA50', 'Metallic Jewellery', 'Metal'), 
('DS11', 'CA51', 'Electronic Gadgets', 'Others'), 
('DS09', 'CA47', 'Chemical Waste', 'Others'), 
('DS10', 'CA43', 'Radioactive Material', 'Others'), 
('DS06', 'CA50', 'Glass Bottle', 'Glass'); 
select * from MATERIAL;

INSERT INTO PARTNER VALUES
('AA220', 'Wright Greenwork', '433 South Wright St. Delavan, Wisconsin. United States', 8.44, 'B01'),
('AA221', 'The Eco Company', ' No 2, Jalan Hang Tuah, Kuala Lumpur, Malaysia', 5.34, 'B02'),
('AA222', 'Clean Up AZ', '16000 N Civic Center Plaza Surprise,USA', 9.34, 'B03'),
('AA223', 'Meridian Waste', '13524 Nw Industrial Dr Bridgeton, MO 63044 United States', 12.20, 'B04'),
('AA224', 'Junk Takers', 'Jalan Persiaran Multimedia, I-City, Seksyen 7, 40000 Shah Alam, Selangor, Malaysia', 1.19, 'B05'),
('AA225', 'Rad Recyclers', 'G-3A, Kanvas Retail @ Prima 15, Cyberjaya, 63000 Cyberjaya, Selangor, Malaysia', 5.94, 'B06'),
('AA226', 'Recycle Clear', 'Cannon Business Park, Gough Rd, Bilston WV14 8XR, United Kingdom', 3.92, 'B07'),
('AA227', 'Pulp Processors', '28 Kaki Bukit Industrial Terrace, Singapore', 14.23, 'B08'),
('AA228', 'Westy Eco Solution', 'Jl. Ciputat Raya No.79, RT.5/RW.6, Jakarta, Indonesia', 11.09, 'B09'),
('AA229', 'Center Greenworks', 'No.230, Jalan KIP 7, Taman Perindustrian KIP,Kuala Lumpur, Malaysia', 9.23, 'B10'),
('AA300', 'Air Green', '3B/1 Tran Hung Dao Street, Ward 3,, Phường 3, Phú Yên, Vietnam', 4.99, 'B01'),
('AA301', 'Care EcoRecycle', '36 Sungei Kadut Street 1 Singapore', 6.98, 'B02'),
('AA302', 'WasteTakers', '14 Jalan Permatang Pasir 71150 Linggi Negri Sembilan', 0.34, 'B03'),
('AA303', 'DumpCare', 'Lot 717, Batu 5 1/2, Jalan Kuala Pilah, Paroi, 70400 Seremban Negeri Sembilan', 0.78, 'B03'),
('AA304', 'GreenProcess', '201 Provincial Road/901 County Road West 50 Mi, Lanzhou, Gansu', 1.92, 'B04'),
('AA305', 'Meridian Clear', 'Zhongchuan Avenue South 100 Meters, Lanzhou, Gansu', 1.02, 'B05'),
('AA306', 'GreenDump', '1 Jalan Industri Semambu 25300 Kuantan Pahang', 4.09, 'B06');
select * from PARTNER;

insert into SERVICE values 
('SV002', 'J&T', '61830107', '2023-05-21', 'U004'), 
('SV008', 'DHL', '02146290', '2023-05-19', 'U004'), 
('SV010', 'POSLAJU', '91072629', '2023-07-15', 'U002'), 
('SV003', 'EXPRESS', '62963928', '2023-07-03', 'U008'), 
('SV005', 'EXPRESS', '53251800', '2023-10-07', 'U009'), 
('SV001', 'J&T', '01738910', '2023-10-18', 'U003'), 
('SV007', 'CITY LINK', '63820648', '2023-08-25', 'U001'), 
('SV009', 'DHL', '23792076', '2023-04-01', 'U005'), 
('SV004', 'J&T', '76281932', '2023-03-14', 'U002'), 
('SV006', 'CITY LINK', '52729321', '2023-02-22', 'U006'), 
('SV011', 'FLASH', '63I26259', '2023-11-16', 'U007'), 
('SV012', 'FLASH', '12345678', '2023-11-28', 'U010'); 
select* from SERVICE; 

Insert into STAFF values 
('SS001', 'ZARIF', 6, 308, 'B02'),
('SS002', 'JENIFER', 8, 350, 'B09'),
('SS003', 'LAILI', 4, 301, 'B01'),
('SS004', 'MAISARAH', 6, 355, 'B05'),
('SS005', 'MIKHAEL', 7, 300, 'B07'),
('SS006', 'PUTERI', 6, 310, 'B03'),
('SS007', 'HUSNA', 5, 308, 'B08'),
('SS008', 'SHAHRIL', 7, 312, 'B06'),
('SS009', 'BATRISYIA', 8, 330, 'B10'),
('SS010', 'FAIZAL', 4, 359, 'B04');
select* from STAFF;

desc COLLECTION;
desc WASTE;
desc MATERIAL;
desc DISPOSAL;
desc TRANSACTION;
desc USER;
desc PARTNER;
desc BRANCH;
desc SERVICE;
desc STAFF;

-- ALTER---

alter table STAFF 
add Staff_Contact int; 
set sql_safe_updates = 0; 

update STAFF 
set Staff_Contact = '0145422906' 
where Staff_Name='Zarif'; 

update STAFF 
set Staff_Contact = '0114866245' 
where Staff_Name='Jenifer'; 

update STAFF 
set Staff_Contact = '0106654371' 
where Staff_Name='Laili'; 

update STAFF 
set Staff_Contact = '0106051360' 
where Staff_Name='Maisarah'; 

update STAFF 
set Staff_Contact = '0196951351' 
where Staff_Name='Mikhael'; 

update STAFF 
set Staff_Contact = '0131952270' 
where Staff_Name='Puteri'; 

update STAFF 
set Staff_Contact = '0149654382' 
where Staff_Name='Husna'; 

update STAFF 
set Staff_Contact = '0124650381' 
where Staff_Name='Shahril'; 

update STAFF 
set Staff_Contact = '0199054273' 
where Staff_Name='Batrisyia'; 

update STAFF 
set Staff_Contact = '0115954373' 
where Staff_Name='Faizal'; 

select*from staff;

-- UPDATE--

UPDATE STAFF 
SET Staff_Shift = 8 
WHERE Staff_Name = 'Zarif'; 

UPDATE STAFF 
SET Staff_Shift = 10 
WHERE Staff_Name = 'Jenifer'; 

select*from staff;

-- DELETE--

SELECT * FROM STAFF WHERE Staff_Name= 'SHAHRIL'; 
DELETE FROM STAFF WHERE Staff_Name = 'SHAHRIL'; 
INSERT INTO STAFF (Staff_ID, Staff_Name, Staff_Shift, Staff_AttEndance, Branch_ID, Staff_Contact) 
VALUES ('SS011', 'KHAIRIL', '7', '340', 'B05', '0112468105'); 
select*from staff;

-- WHERE/HAVING/GROUP BY/AND/OR/ BETWEEN / LIKE/ORDER BY --

-- 1)
SELECT User_ID, Transaction_Ref, Transaction_Point 
FROM TRANSACTION 
WHERE Transaction_Point > 100  
AND Transaction_Date > '2023-05-01'; 

-- 2)
SELECT DISTINCT P.Partner_ID, P.Partner_Name, B.Branch_ID, 
B.Branch_Address
FROM PARTNER P, BRANCH B
WHERE P.Branch_ID = B.Branch_ID
AND P.Partner_Name LIKE '%GREEN%';

-- 3)
SELECT Collection_Area, SUM(Waste_Quantity) AS 'Total Waste Quantity' 
FROM COLLECTION c, WASTE w 
WHERE c.Collection_ID = w.Collection_ID 
GROUP BY Collection_Area; 


-- AGGREGATE FUNCTION: MIN, MAX, AVG, COUNT, SUM

-- 1)
SELECT Waste_Quantity, min(Waste_Quantity),
max(Waste_Quantity), avg(Waste_Quantity)
FROM Waste
GROUP BY Waste_Quantity;

-- 2)
SELECT Partner_ID, SUM(Partner_Investment) AS Total_Investment
FROM PARTNER
GROUP BY Partner_ID
HAVING Total_Investment > 5;


-- 3)
SELECT Material_Type, COUNT(Material_Name) AS 'Total Material'
FROM MATERIAL
GROUP BY Material_Type;


-- JOINT TABLES (COMPLEX QUERIES)

-- 1)
select u.User_Name, u.User_PhoneNo, t.Transaction_Date, 
t.Transaction_Ref, t.Transaction_Point
from user u, transaction t
where u.User_ID=t.User_ID and 
t.Transaction_Date between '2023-01-01' and 
'2023-03-31' and t.Transaction_Point>100;

-- 2)
SELECT u.user_name, w.waste_quantity, c.collection_area
FROM user u, waste w, collection c
where u.user_id = w.user_id and w.collection_id = c.collection_id
and u.user_id IN (
    SELECT u.user_id
    where  u.user_id = w.user_id
    GROUP BY u.user_id
    HAVING SUM(w.waste_quantity) > 5
);

-- 3)
select c.Collection_Area, w.Waste_Weight
from collection c, waste w
where c.Collection_ID= w.Collection_ID and 
w.Waste_Weight >(select avg(Waste_Weight)from waste)
order by w.Waste_Weight asc;

