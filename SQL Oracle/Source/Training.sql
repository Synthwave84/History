-- 1-2 ¿¹Á¦

CREATE TABLE CLIENTINFORM (
USER_ID         VARCHAR2(10)  CONSTRAINT PK_CLIENTINFORM    PRIMARY KEY,
PASSWD          VARCHAR2(10)                                NOT NULL,
NAME            VARCHAR2(10)                                NOT NULL,
REGIST_NO       VARCHAR2(14)  CONSTRAINT UQ_CLIENTINFORM    NOT NULL UNIQUE,                               
EMAIL           VARCHAR2(20),
TELEPHONE       VARCHAR2(13)                                NOT NULL,
ADDRESS         VARCHAR2(40),
BUYCASH         NUMBER(9)     DEFAULT 0,
TIMESTAMP       DATE                                        DEFAULT SYSDATE

);



CREATE TABLE PRODUCT_CONTROL (
PRODUCT_CODE    VARCHAR2(10)  CONSTRAINT PK_PRODUCT_CONTROL  PRIMARY KEY,
PRODUCT_NAME    VARCHAR2(20)                                 NOT NULL,
STANDARD        VARCHAR2(20),
UNIT            VARCHAR2(10),
UNIT_PRICE      NUMBER(7)                                    NOT NULL,
LEFT_QTY        NUMBER(5)                                    NOT NULL,
COMPANY         VARCHAR2(20),
IMAGENAME       VARCHAR2(20),
INFO            VARCHAR2(50),
DEFAULT_INFO    VARCHAR2(255)
);

CREATE TABLE BUCKETLIST (
ORDER_NO        VARCHAR2(10)    CONSTRAINT PK_BUCKETLIST    PRIMARY KEY,
ORDER_ID        VARCHAR2(10)    CONSTRAINT FK_BUCKETLIST    REFERENCES CLIENTINFORM(USER_ID),
PRODUCT_CODE    VARCHAR2(10)    CONSTRAINT FK_BUC_PR_CODE   REFERENCES PRODUCT_CONTROL(PRODUCT_CODE),
ORDER_QTY       NUMBER(3)                                   NOT NULL,
ORDER_DATE      DATE            DEFAULT SYSDATE
);

CREATE TABLE ORDER_CHECK (
ORDER_NO        VARCHAR2(10)    CONSTRAINT PK_ORDER_CHECK   PRIMARY KEY,
ORDER_ID        VARCHAR2(10)                                NOT NULL,
PRODUCT_CODE    VARCHAR2(10)                                NOT NULL,
ORDER_QTY       NUMBER(3)                                   NOT NULL,
CSEL            VARCHAR2(10),
CMONEY          NUMBER(9),
CDATE           DATE            DEFAULT SYSDATE,
MDATE           DATE            DEFAULT SYSDATE,
GUBUN           VARCHAR2(10)
);

CREATE TABLE BOARD_FREE (
B_ID            NUMBER(5)       CONSTRAINT PK_BRD_FREE      PRIMARY KEY,
B_NAME          VARCHAR2(20)                                NOT NULL,
B_PWD           VARCHAR2(20)                                NOT NULL,
B_EMAIL         VARCHAR2(20)                                NOT NULL,
B_TITLE         VARCHAR2(80)                                NOT NULL,
B_CONTENT       VARCHAR2(2000)                              NOT NULL,
B_DATE          DATE            DEFAULT SYSDATE,
B_HIT           NUMBER(5)       DEFAULT 0,
B_IP            VARCHAR2(15)

);


