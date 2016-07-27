CREATE TABLE CATEGORY 
(
	CATEGORY_ID NUMBER(5) CONSTRAINT PK_CATEGORY_ID PRIMARY KEY, 
	NAME VARCHAR2(40)
);

CREATE TABLE BOOK
(
	BOOK_ID VARCHAR2(5) CONSTRAINT PK_BOOK_ID PRIMARY KEY, 
	TITLE VARCHAR2(60), 
	AUTHOR VARCHAR2(60), 
	CATEGORY_ID NOT NULL CONSTRAINT FK_CATEGORY_ID REFERENCES CATEGORY (CATEGORY_ID) ON DELETE CASCADE, 
	CREATED_DATE TIMESTAMP (7), 
	PRICE NUMBER(5,2), 
	IMAGE BLOB, 
	PUBLISHER VARCHAR2(40), 
	STOCK NUMBER(5) DEFAULT 0, 
	DESCRIPTION VARCHAR2(500)
);

CREATE TABLE CUSTOMER 
(
	CUSTOMER_ID NUMBER(5) CONSTRAINT PK_CUSTOMER_ID PRIMARY KEY, 
	PHONE_NUMBER NUMBER(10), 
	LOCATION VARCHAR2(40), 
	FIRST_NAME VARCHAR2(40), 
	LAST_NAME VARCHAR2(40)
);

CREATE TABLE CART 
(
	CART_ID NUMBER(5), 
	BOOK_ID VARCHAR2(5) NOT NULL CONSTRAINT FK_BOOK_ID REFERENCES BOOK (BOOK_ID), 
	CUSTOMER_ID NUMBER(5) NOT NULL CONSTRAINT FK_CUST_ID REFERENCES CUSTOMER (CUSTOMER_ID), 
	STATUS NUMBER(5) NOT NULL,
	QUANTITY NUMBER(5) DEFAULT 0 NOT NULL , 
	CONSTRAINT PK_CART PRIMARY KEY (BOOK_ID, CART_ID)
);

CREATE TABLE BOOK_BILL 
(	
	BILL_ID NUMBER(5) CONSTRAINT PK_BILL_ID PRIMARY KEY, 
	CUSTOMER_ID NUMBER(5) NOT NULL  CONSTRAINT FK_BILL_CUST_ID REFERENCES CUSTOMER (CUSTOMER_ID), 
	TOTAL_PRICE NUMBER(5) DEFAULT 0 	NOT NULL
);

CREATE TABLE BILL_DETAILS 
(	
	BILL_ID NUMBER(5) CONSTRAINT FK_BILL_ID REFERENCES BOOK_BILL (BILL_ID), 
	BOOK_ID VARCHAR2(5) CONSTRAINT FK_BILL_BOOK_ID REFERENCES BOOK (BOOK_ID),
	QUANTITY NUMBER(5) DEFAULT 0 NOT NULL , 
	PRICE NUMBER(5,0),
	CONSTRAINT PK_BILL_DETAILS PRIMARY KEY (BOOK_ID, BILL_ID)
);