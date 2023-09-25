USE BluejackJewelry
GO

-- [Query to answer the 10 cases]
--1
SELECT mv.VendorID, mv.VendorName, ms.StaffName, [Total Transaction] = COUNT(DISTINCT pt.TransactionID)
FROM MsVendor mv JOIN PurchaseTransaction pt
ON mv.VendorID = pt.VendorID JOIN MsStaff ms
ON ms.StaffID = pt.StaffID
WHERE MONTH(pt.TransactionDate) = '06' AND mv.VendorName LIKE '% %'
GROUP BY mv.VendorID, mv.VendorName, ms.StaffName

--2
SELECT mjt.JewelryTypeName, [Total Price] = CONVERT(varchar,SUM(mj.JewelrySalesPrice * std.Quantity)) + ' USD'
FROM MsJewelryType mjt JOIN MsJewelry mj
ON mjt.JewelryTypeID = mj.JewelryTypeID JOIN SalesTransactionDetail std
ON std.JewelryID = mj.JewelryID
WHERE mjt.JewelryTypeName IN ('ruby', 'diamond')
GROUP BY mjt.JewelryTypeName
Having SUM(mj.JewelrySalesPrice * mj.JewelryStock) > 40000

--3
SELECT [Date] = CONVERT(VARCHAR, st.SalesDate, 107), mc.CustomerName, [TotalJewelry] = COUNT(DISTINCT std.JewelryID), [TotalQuantity] = SUM(std.Quantity)
FROM SalesTransaction st JOIN MsCustomer mc
ON st.CustomerID = mc.CustomerID JOIN SalesTransactionDetail std
ON std.SalesID = st.SalesID
WHERE LEN(mc.CustomerName) > 10 AND DATEPART(MONTH, st.SalesDate) = 09
GROUP BY CONVERT(VARCHAR, st.SalesDate, 107), mc.CustomerName

--4
select ms.StaffID, StaffName, JewelryName, TotalJewelry= sum(Quantity),
totalprice = cast(sum(JewelryPurchasePrice*Quantity) as varchar) + ' USD'
from MsJewelry mj join PurchaseTransactionDetail ptd on ptd.JewelryID=mj.JewelryID
join PurchaseTransaction pt on pt.TransactionID=ptd.TransactionID
join MsStaff ms on ms.StaffID=pt.StaffID
where StaffGender = 'Male'
group by ms.StaffID, StaffName, JewelryName
having sum(Quantity)>=2
order by sum(JewelryPurchasePrice*Quantity) desc

--5
SELECT distinct CustomerName, CustomerEmail, CustomerAddress, JewelryName, [Jewelry Weight]= cast(JewelryWeight as varchar)
+' gram'
FROM MsJewelry MJ JOIN SalesTransactionDetail TD ON MJ.JewelryID=TD.JewelryID JOIN SalesTransaction ST
ON TD.SalesID=ST.SalesID JOIN MsCustomer MC ON MC.CustomerID=ST.CustomerID,
	(
	SELECT MAXPRICE=MAX(JewelrySalesPrice)
	FROM MsJewelry MJ
	) MAX1
where JewelrySalesPrice=MAXPRICE and CustomerAddress like'%i%'
order by CustomerName asc

--6
select distinct VendorName, VendorEmail, JewelryName, [JewelryPurchasePrice]= 
'USD '+ cast(JewelryPurchasePrice as varchar)
from  MsJewelry mj join PurchaseTransactionDetail pd on pd. JewelryID=mj.JewelryID
join PurchaseTransaction pt on pt.TransactionID=pd.TransactionID join
MsVendor mv on mv.VendorID=pt.VendorID,
	(
	select minimumharga= min (JewelryPurchasePrice)
	from MsJewelry
	) min1
 where JewelryPurchasePrice=minimumharga and VendorName like '%n%'

 --7 
 select [StaffID]= REPLACE ( mst.StaffID , 'ST' , 'Staff' ), StaffName
 , JewelryName, totalprice = cast (sum(JewelryPurchasePrice*Quantity) as varchar)+' USD'
 from MsJewelry mj join PurchaseTransactionDetail pd on pd. JewelryID=mj.JewelryID
join PurchaseTransaction pt on pt.TransactionID=pd.TransactionID join MsStaff mst
on pt.StaffID=mst.StaffID,
 (
 select averagepurchase= avg(Quantity)
 from MsJewelry mj join PurchaseTransactionDetail pd on pd. JewelryID=mj.JewelryID
join PurchaseTransaction pt on pt.TransactionID=pd.TransactionID join MsStaff mst
on pt.StaffID=mst.StaffID
) avg1
where Quantity>averagepurchase and datename(day,TransactionDate)%2!=0
group by  REPLACE ( mst.StaffID , 'ST' , 'Staff' ), StaffName
 , JewelryName
 order by StaffName asc


 --8
 select mf.StaffID, [StaffName]= UPPER(mf.StaffName), st.SalesID,TotalPrice=
 cast (sum(mj.JewelrySalesPrice*std.Quantity) as varchar) +' USD'
 from MsJewelry mj join SalesTransactionDetail std on mj.JewelryID=
		 std.JewelryID join SalesTransaction st on std.SalesID=st.SalesID
		 join MsStaff mf on mf.StaffID=st.StaffID,
	(
	select [avgtot] = avg(sumtot)
	from 
		(select mf.StaffID,sumtot= sum(mj.JewelrySalesPrice*std.Quantity)
		 from MsJewelry mj join SalesTransactionDetail std on mj.JewelryID=
		 std.JewelryID join SalesTransaction st on std.SalesID=st.SalesID
		 join MsStaff mf on mf.StaffID=st.StaffID
		group by mf.StaffID
		 )sumtotal
		)avgtotal
	where StaffName like '%o%' 
	group by mf.StaffID,UPPER(mf.StaffName), st.SalesID, avgtot
	having sum(mj.JewelrySalesPrice*std.Quantity)>avgtotal.avgtot
ORDER BY sum(mj.JewelrySalesPrice*std.Quantity) DESC

	--9
	GO 
	CREATE VIEW [viewStaffSales] 
	AS
	select mf.StaffID, [StaffName]= LOWER(StaffName), StaffEmail, [TotalJewelrySold]=
	count(DISTINCT(JEWELRYID)), [Average Quantity]= avg(std.Quantity)
	from SalesTransactionDetail std join SalesTransaction st on std.SalesID=st.SalesID
	join MsStaff mf on mf.StaffID=st.StaffID
	where StaffName not like '% %' and len(StaffName)>5
	group by  mf.StaffID, LOWER(StaffName), StaffEmail 

	SELECT*
	FROM viewStaffSales

	--10
	go
	CREATE VIEW viewVendorPurchase
	as
	SELECT mv.VendorID, VendorName,VendorEmail,VendorAddress,[TotalJewelry]=count(distinct JewelryID), 
	[Average Quantity]=avg(pd.Quantity)
	FROM PurchaseTransactionDetail pd join PurchaseTransaction pt on pt.TransactionID=pd.TransactionID
	join MsVendor mv on mv.VendorID=pt.VendorID
	where SUBSTRING ( VendorAddress ,PATINDEX ( '%[0-9]%', VendorAddress) , 1 )%2=1 
	group by mv.VendorID, VendorName,VendorEmail,VendorAddress
	HAVING COUNT(pd.TransactionID)>1

	select *
	from viewVendorPurchase