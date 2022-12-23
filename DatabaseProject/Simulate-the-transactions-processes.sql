-- Staff membeli Laptop ke Vendor dengan data seperti berikut : 
INSERT INTO [Purchase]
VALUES  ('PU016','VE001','ST001', '2021-01-27'),
        ('PU017','VE002','ST002', '2021-02-30'),
        ('PU018','VE003','ST003', '2021-03-05'),
INSERT INTO [PurchaseDetail]
VALUES  ('PU016','LA003', 2),
        ('PU017','LA002', 3),
        ('PU018','LA001', 1),
-- Staff menjual Laptop ke Customer kira-kira sebulan setelahnya dengan data seperti berikut : 
INSERT INTO [Transactions]
VALUES  ('TR016','ST001','CU001','2021-02-27'),
        ('TR017','ST002','CU002','2021-03-30'),
        ('TR018','ST003','CU003','2021-04-05'),
INSERT INTO [TransactionDetail]
VALUES  ('TR016','LA002',2),
        ('TR017','LA003',1),
        ('TR018','LA001',1),