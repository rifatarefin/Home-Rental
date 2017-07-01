INSERT INTO PRODUCTS VALUES ('P1234', 'iPhone 6s',
                      'Apple iPhone 6s smartphone with 4.00-inch 640x1136 display and 8-megapixel rear camera','500','Apple','Smartphone','New',450,0,false);

INSERT INTO PRODUCTS VALUES ('P1235', 'Dell Inspiron',
                     'Dell Inspiron 14-inch Laptop (Black) with 3rd Generation Intel Core processors',
                     700,'Dell','Laptop','New',1000,0,false);

INSERT INTO PRODUCTS VALUES ('P1236', 'Nexus 7',
                     'Google Nexus 7 is the lightest 7 inch tablet With a quad-core Qualcomm Snapdragon� S4 Pro processor',
                      300,'Google','Tablet','New',1000,0,false);
INSERT INTO USERS VALUES ('john', 'pa55word',1);
INSERT INTO USERS VALUES ('admin', 'root123', 1);

INSERT INTO USER_ROLE VALUES (DEFAULT ,'john','ROLE_USER');
INSERT INTO USER_ROLE VALUES (DEFAULT ,'admin','ROLE_ADMIN');
INSERT INTO USER_ROLE VALUES (DEFAULT ,'admin', 'ROLE_USER');

INSERT INTO ADD VALUES (DEFAULT ,'Apartment for Rent',5678,'John','Residential',
                    'Rent','Dhanmondi','Dhaka','Road 3/4',25000,1340,3,2,FILE_READ('/home/rifat/Pictures/pic/18155836_10154589741593157_8705498974745257520_o.jpg'));

INSERT INTO ADD VALUES (DEFAULT ,'Flat for Rent',5679,'Smith','Residential',
                    'Rent','Gulshan','Dhaka','Road 4/5',28000,1400,4,3,FILE_READ('/home/rifat/Pictures/pic/17966030_10154549452768157_1983993495729644372_o.jpg') );

INSERT INTO ADD VALUES (DEFAULT ,'Commercial Space for Rent',5680,'Mark','Commercial',
                    'Rent','Banani','Dhaka','Road 3/A',50000,2000,NULL ,NULL,FILE_READ('/home/rifat/Pictures/pic/18194702_10154589029303157_174319158851028638_n.jpg') );

INSERT INTO ADD VALUES (DEFAULT ,'Duplex Flat for Sale',5670,'Roger', 'Residential',
                             'Sale', 'Sylhet', 'Sylhet', 'ABC Road',15000000, 2000, 5,4,FILE_READ('/home/rifat/Pictures/pic/18252189_1151006505004353_6266071961596592128_n.jpg'));

