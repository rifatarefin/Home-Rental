

INSERT INTO USERS VALUES ('admin', 'root123', 1, DEFAULT );
INSERT INTO USERS VALUES ('john', 'pa55word',1,5678 );
INSERT INTO USERS VALUES ('smith', 'pa55word', 1, 5679);
INSERT INTO USERS VALUES ('mark', 'pa55word', 1, 5680);
INSERT INTO USERS VALUES ('roger', 'pa55word', 1, 5670);


INSERT INTO USER_ROLE VALUES (DEFAULT ,'john','ROLE_USER');
INSERT INTO USER_ROLE VALUES (DEFAULT ,'admin','ROLE_ADMIN');
INSERT INTO USER_ROLE VALUES (DEFAULT ,'admin', 'ROLE_USER');
INSERT INTO USER_ROLE VALUES (DEFAULT ,'smith','ROLE_USER');
INSERT INTO USER_ROLE VALUES (DEFAULT ,'mark','ROLE_USER');
INSERT INTO USER_ROLE VALUES (DEFAULT ,'roger','ROLE_USER');


INSERT INTO ADD VALUES (DEFAULT ,'Apartment for Rent', 101, 5678,'John','Residential',
                    'Rent','Dhanmondi','Dhaka','Road 3/4',25000,1340,3,2,FILE_READ('/home/rifat/Pictures/pic/18155836_10154589741593157_8705498974745257520_o.jpg'));

INSERT INTO ADD VALUES (DEFAULT ,'Flat for Rent', 102, 5679,'Smith','Residential',
                    'Rent','Gulshan','Dhaka','Road 4/5',28000,1400,4,3,FILE_READ('/home/rifat/Pictures/pic/17966030_10154549452768157_1983993495729644372_o.jpg') );

INSERT INTO ADD VALUES (DEFAULT ,'Commercial Space for Rent', 103, 5680,'Mark','Commercial',
                    'Rent','Banani','Dhaka','Road 3/A',50000,2000,0 , 0,FILE_READ('/home/rifat/Pictures/pic/18194702_10154589029303157_174319158851028638_n.jpg') );

INSERT INTO ADD VALUES (DEFAULT ,'Duplex Flat for Sale', 104, 5670,'Roger', 'Residential',
                             'Sale', 'Sylhet', 'Sylhet', 'ABC Road',15000000, 2000, 5,4,FILE_READ('/home/rifat/Pictures/pic/18252189_1151006505004353_6266071961596592128_n.jpg'));

