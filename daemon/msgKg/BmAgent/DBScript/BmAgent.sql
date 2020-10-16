/********************************************************************
 * ORACLE ���̺� ��Ű�� ����
 ********************************************************************/

-- īī�� �˸���/ģ���� ���� ��û ���̺�
CREATE TABLE BM_REQUEST (
	MSG_ID                 VARCHAR2(30) NOT NULL,   /* �޽��� �Ϸù�ȣ (�޽����� ���� ������ ���̾�� ��), SMS/LMS ��ù߼� �� �Ϸù�ȣ ���̴� 20byte�� ��� */
	SVC_ID                 VARCHAR2(12) NOT NULL,   /* ����ID */
	YELLOW_ID              VARCHAR2(40) NOT NULL,   /* ���ο�ID */
	SEND_MSG_KIND          VARCHAR2(2) NOT NULL,    /* ���� �޽��� Ÿ�� (AT:�˸���, FT:ģ����, FP:ģ�����̹���, SS:SMS��ù߼�, SL:LMS��ù߼�) */
	PHONE_NO               VARCHAR2(16) NOT NULL,   /* ����� �޴�����ȣ (�����ڵ�82 ����, ������'-' ����) */
	TEMP_ID                VARCHAR2(30),            /* ���ø����̵� (�˸����� ��� �ʼ�) */
	MESSGE                 VARCHAR2(2000) NOT NULL, /* �޽��� */
	ADVERTISEMENT_YN       VARCHAR2(1),             /* ������ (Y, N) */
	RESERVE_DT             VARCHAR2(14) NOT NULL,   /* �˸��� ����߼��� ���� �ð� ��(YYYYMMDDHH24MISS :: 00000000000000 : �������, 20170314120000 : ��������) */
	IMAGE_URL              VARCHAR2(300),           /* �̹���URL (ģ���� �̹��� ���۽� ���) */
	IMAGE_LINK             VARCHAR2(300),           /* �̹�������URL (ģ���� �̹��� ���۽� ���) */
	SWITCH_SEND_DIV        VARCHAR2(1),             /* ����޽����� ���� ���н� �޽��� ��ȯ �߼� ���� (S:SMS , L:LMS, N:�̻��) - ���Է½� default:'N' ó�� */
	SEND_PHONE_NO          VARCHAR2(16),            /* ��ȯ�߼� �߽��ڹ�ȣ (������'-' ����) */
	RECV_PHONE_NO          VARCHAR2(16),            /* ��ȯ�߼� �����ڹ�ȣ (�޴��� ��ȣ, �����ڵ�82 ����, ������'-' ����) */
	SMS_MESSAGE            VARCHAR2(90),            /* SMS(�ܹ�) ���۽� �޽��� */
	LMS_TITLE              VARCHAR2(20),            /* LMS ���� ���� */
	LMS_MESSAGE            VARCHAR2(2000),          /* LMS ���� �޽��� */
	BUTTON_TYPE            VARCHAR2(15),            /* ��ưŸ��Array (WL : ����ũ, AL:�۸�ũ, DS:�����ȸ, BK:��Ű����, MD:�޽�������) ��) WL,AL,DS */
	BUTTON_ORDER           VARCHAR2(10),            /* ��ư����Array ��) 1,2,3 */
	BUTTON_NAME            VARCHAR2(505),           /* ��ư��Array ��) ��ư1,��ư2,��ư3 */
	BUTTON_OPT1            VARCHAR2(1005),          /* URL_MobileArray (http://ȣ��Ʈ, https://ȣ��Ʈ), ios_Scheme (ios_Scheme://ȣ��Ʈ, ios_Scheme://ȣ��Ʈ) */
	BUTTON_OPT2            VARCHAR2(1005),          /* URL_PcArray (http://ȣ��Ʈ, https://ȣ��Ʈ), Android_Scheme (Android_Scheme://ȣ��Ʈ, Android_Scheme://ȣ��Ʈ) */
	BUTTON_OPT3            VARCHAR2(1005),          /* �����ȯ�濡�� �̵��� WebURL */
	BUTTON_OPT4            VARCHAR2(1005),          /* PC ȯ�濡�� �̵��� PC URL */
	REQ_TIME               VARCHAR2(14)             /* BM_REQUEST ��� �ð� (YYYYMMDDHH24MISS) */
);

-- īī�� �˸���/ģ���� ���� ��û ��� ���̺�
CREATE TABLE BM_REQUEST_RESULT (
	MSG_ID                 VARCHAR2(30) NOT NULL,   /* �޽��� �Ϸù�ȣ (�޽����� ���� ������ ���̾�� ��), SMS/LMS ��ù߼� �� �Ϸù�ȣ ���̴� 20byte�� ��� */
	SVC_ID                 VARCHAR2(12) NOT NULL,   /* ����ID */
	YELLOW_ID              VARCHAR2(40) NOT NULL,   /* ���ο�ID */
	SEND_MSG_KIND          VARCHAR2(2) NOT NULL,    /* ���� �޽��� Ÿ�� (AT:�˸���, FT:ģ����, FP:ģ�����̹���) */
	PHONE_NO               VARCHAR2(16) NOT NULL,   /* ����� ��ȭ��ȣ (�����ڵ�82 ����) */
	TEMP_ID                VARCHAR2(30),            /* ���ø����̵�(�˸����� ��� �ʼ�) */
	MESSGE                 VARCHAR2(2000) NOT NULL, /* �޽��� */
	ADVERTISEMENT_YN       VARCHAR2(1),             /* ������ (Y, N) */
	RESERVE_DT             VARCHAR2(14) NOT NULL,   /* �˸��� ����߼��� ���� �ð� ��(YYYYMMDDHH24MISS :: 00000000000000 : �������, 20170314120000 : ��������) */
	IMAGE_URL              VARCHAR2(300),           /* �̹���URL (ģ���� �̹��� ���۽� ���) */
	IMAGE_LINK             VARCHAR2(300),           /* �̹�������URL (ģ���� �̹��� ���۽� ���) */
	SWITCH_SEND_DIV        VARCHAR2(1),             /* ����޽����� ���� ���н� �޽��� ��ȯ �߼� ���� (S:SMS , L:LMS, N:�̻��) - ���Է½� default :'N' ó�� */
	SEND_PHONE_NO          VARCHAR2(16),            /* ��ȯ�߼� �߽��ڹ�ȣ */
	RECV_PHONE_NO          VARCHAR2(16),            /* ��ȯ�߼� �����ڹ�ȣ (�ڵ��� ��ȣ) */
	SMS_MESSAGE            VARCHAR2(90),            /* SMS(�ܹ�) ���۽� �޽��� */
	LMS_TITLE              VARCHAR2(20),            /* LMS ���� ���� */
	LMS_MESSAGE            VARCHAR2(2000),          /* LMS ���� �޽��� */
	BUTTON_TYPE            VARCHAR2(15),            /* ��ưŸ��Array (WL : ����ũ, AL:�۸�ũ, DS:�����ȸ, BK:��Ű����, MD:�޽�������) ��) WL,AL,DS */
	BUTTON_ORDER           VARCHAR2(10),            /* ��ư����Array ��) 1,2,3 */
	BUTTON_NAME            VARCHAR2(505),           /* ��ư��Array ��) ��ư1,��ư2,��ư3 */
	BUTTON_OPT1            VARCHAR2(1005),          /* URL_MobileArray (http://ȣ��Ʈ, https://ȣ��Ʈ), ios_Scheme (ios_Scheme://ȣ��Ʈ, ios_Scheme://ȣ��Ʈ) */
	BUTTON_OPT2            VARCHAR2(1005),          /* URL_PcArray (http://ȣ��Ʈ, https://ȣ��Ʈ), Android_Scheme (Android_Scheme://ȣ��Ʈ, Android_Scheme://ȣ��Ʈ) */
	BUTTON_OPT3            VARCHAR2(1005),          /* �����ȯ�濡�� �̵��� WebURL */
	BUTTON_OPT4            VARCHAR2(1005),          /* PC ȯ�濡�� �̵��� PC URL */
	ACK_YN                 VARCHAR2(1) NOT NULL,    /* ����API ���俩�� */
	RESULT_CODE            VARCHAR2(4),             /* ����ڵ�(���� == 0000 ���� != 0000) */
	RESULT_MSG             VARCHAR2(100),           /* ����޽��� */
	RESULT_REG_DTM         VARCHAR2(14),            /* �����Ͻð� */
	RESULT_MSG_KIND        VARCHAR2(2),             /* ����޽������� (AT:�˸���, FT:ģ����, FP:ģ���� �̹���) */
	RESULT_MSG_SEQ_NO      VARCHAR2(30),            /* �������ŷ���ȣ */
	SWITCH_RESULT_MSG_KIND VARCHAR2(2),             /* ��ȯ�߼� ���� (SS:SMS, SL:LMS) */
	SWITCH_RESULT_CODE     VARCHAR2(2),             /* ��ȯ�߼� ����ڵ� */
	SWITCH_RESULT_MSG      VARCHAR2(100),           /* ��ȯ�߼� ����޽��� */
	REQ_TIME               VARCHAR2 (14),           /* BM_REQUEST ��� �ð� (YYYYMMDDHH24MISS) */
	SEND_TIME              VARCHAR2 (14),           /* �߼� ��û �ð� (YYYYMMDDHH24MISS) */
	RECV_TIME              VARCHAR2 (14)            /* �߼� ���� �ð� (YYYYMMDDHH24MISS) */
);

-- īī�� �˸���/ģ���� ���� ��û ���̺� UNIQUE INDEX
CREATE UNIQUE INDEX PK_BM_REQUEST ON BM_REQUEST (MSG_ID);

-- īī�� �˸���/ģ���� ���� ��û ���̺� PRIMARY KEY
ALTER TABLE BM_REQUEST ADD CONSTRAINT PK_BM_REQUEST PRIMARY KEY (MSG_ID);

-- īī�� �˸���/ģ���� ���� ��û ��� ���̺� NON-UNIQUE INDEX
CREATE INDEX IX_BM_REQUEST_RESULT ON BM_REQUEST_RESULT (MSG_ID);

/********************************************************************
 * MSSQL ���̺� ��Ű�� ����
 ********************************************************************/

-- īī�� �˸���/ģ���� ���� ��û ���̺�
CREATE TABLE BM_REQUEST (
	MSG_ID           VARCHAR(30) NOT NULL,   /* �޽��� �Ϸù�ȣ (�޽����� ���� ������ ���̾�� ��), SMS/LMS ��ù߼� �� �Ϸù�ȣ ���̴� 20byte�� ��� */
	SVC_ID           VARCHAR(12) NOT NULL,   /* ����ID */
	YELLOW_ID        VARCHAR(40) NOT NULL,   /* ���ο�ID */
	SEND_MSG_KIND    VARCHAR(2) NOT NULL,    /* ���� �޽��� Ÿ�� (AT:�˸���, FT:ģ����, FP:ģ�����̹���, SS:SMS��ù߼�, SL:LMS��ù߼�) */
	PHONE_NO         VARCHAR(16) NOT NULL,   /* ����� �޴�����ȣ (�����ڵ�82 ����, ������'-' ����) */
	TEMP_ID          VARCHAR(30),            /* ���ø����̵� (�˸����� ��� �ʼ�) */
	MESSGE           VARCHAR(2000) NOT NULL, /* �޽��� */
	ADVERTISEMENT_YN VARCHAR(1),             /* ������ (Y, N) */
	RESERVE_DT       VARCHAR(14) NOT NULL,   /* �˸��� ����߼��� ���� �ð� ��(YYYYMMDDHH24MISS :: 00000000000000 : �������, 20170314120000 : ��������) */
	IMAGE_URL        VARCHAR(300),           /* �̹���URL (ģ���� �̹��� ���۽� ���) */
	IMAGE_LINK       VARCHAR(300),           /* �̹�������URL (ģ���� �̹��� ���۽� ���) */
	SWITCH_SEND_DIV  VARCHAR(1),             /* ����޽����� ���� ���н� �޽��� ��ȯ �߼� ���� (S:SMS , L:LMS, N:�̻��) - ���Է½� default:'N' ó�� */
	SEND_PHONE_NO    VARCHAR(16),            /* ��ȯ�߼� �߽��ڹ�ȣ (������'-' ����) */
	RECV_PHONE_NO    VARCHAR(16),            /* ��ȯ�߼� �����ڹ�ȣ (�޴��� ��ȣ, �����ڵ�82 ����, ������'-' ����) */
	SMS_MESSAGE      VARCHAR(90),            /* SMS(�ܹ�) ���۽� �޽��� */
	LMS_TITLE        VARCHAR(20),            /* LMS ���� ���� */
	LMS_MESSAGE      VARCHAR(2000),          /* LMS ���� �޽��� */
	BUTTON_TYPE      VARCHAR(15),            /* ��ưŸ��Array (WL : ����ũ, AL:�۸�ũ, DS:�����ȸ, BK:��Ű����, MD:�޽�������) ��) WL,AL,DS */
	BUTTON_ORDER     VARCHAR(10),            /* ��ư����Array ��) 1,2,3 */
	BUTTON_NAME      VARCHAR(505),           /* ��ư��Array ��) ��ư1,��ư2,��ư3 */
	BUTTON_OPT1      VARCHAR(1005),          /* URL_MobileArray (http://ȣ��Ʈ, https://ȣ��Ʈ), ios_Scheme (ios_Scheme://ȣ��Ʈ, ios_Scheme://ȣ��Ʈ) */
	BUTTON_OPT2      VARCHAR(1005),          /* URL_PcArray (http://ȣ��Ʈ, https://ȣ��Ʈ), Android_Scheme (Android_Scheme://ȣ��Ʈ, Android_Scheme://ȣ��Ʈ) */
	BUTTON_OPT3      VARCHAR(1005),          /* �����ȯ�濡�� �̵��� WebURL */
	BUTTON_OPT4      VARCHAR(1005),          /* PC ȯ�濡�� �̵��� PC URL */
	REQ_TIME         VARCHAR(14)             /* BM_REQUEST ��� �ð� (YYYYMMDDHH24MISS)*/
);

-- īī�� �˸���/ģ���� ���� ��û ��� ���̺�
CREATE TABLE BM_REQUEST_RESULT (
	MSG_ID                 VARCHAR(30) NOT NULL,   /* �޽��� �Ϸù�ȣ (�޽����� ���� ������ ���̾�� ��), SMS/LMS ��ù߼� �� �Ϸù�ȣ ���̴� 20byte�� ��� */
	SVC_ID                 VARCHAR(12) NOT NULL,   /* ����ID */
	YELLOW_ID              VARCHAR(40) NOT NULL,   /* ���ο�ID */
	SEND_MSG_KIND          VARCHAR(2) NOT NULL,    /* ���� �޽��� Ÿ�� (AT:�˸���, FT:ģ����, FP:ģ�����̹���) */
	PHONE_NO               VARCHAR(16) NOT NULL,   /* ����� ��ȭ��ȣ (�����ڵ�82 ����) */
	TEMP_ID                VARCHAR(30),            /* ���ø����̵�(�˸����� ��� �ʼ�) */
	MESSGE                 VARCHAR(2000) NOT NULL, /* �޽��� */
	ADVERTISEMENT_YN       VARCHAR(1),             /* ������ (Y, N) */
	RESERVE_DT             VARCHAR(14) NOT NULL,   /* �˸��� ����߼��� ���� �ð� ��(YYYYMMDDHH24MISS :: 00000000000000 : �������, 20170314120000 : ��������) */
	IMAGE_URL              VARCHAR(300),           /* �̹���URL (ģ���� �̹��� ���۽� ���) */
	IMAGE_LINK             VARCHAR(300),           /* �̹�������URL (ģ���� �̹��� ���۽� ���) */
	SWITCH_SEND_DIV        VARCHAR(1),             /* ����޽����� ���� ���н� �޽��� ��ȯ �߼� ���� (S:SMS , L:LMS, N:�̻��) - ���Է½� default :'N' ó�� */
	SEND_PHONE_NO          VARCHAR(16),            /* ��ȯ�߼� �߽��ڹ�ȣ */
	RECV_PHONE_NO          VARCHAR(16),            /* ��ȯ�߼� �����ڹ�ȣ (�ڵ��� ��ȣ) */
	SMS_MESSAGE            VARCHAR(90),            /* SMS(�ܹ�) ���۽� �޽��� */
	LMS_TITLE              VARCHAR(20),            /* LMS ���� ���� */
	LMS_MESSAGE            VARCHAR(2000),          /* LMS ���� �޽��� */
	BUTTON_TYPE            VARCHAR(15),            /* ��ưŸ��Array (WL : ����ũ, AL:�۸�ũ, DS:�����ȸ, BK:��Ű����, MD:�޽�������) ��) WL,AL,DS */
	BUTTON_ORDER           VARCHAR(10),            /* ��ư����Array ��) 1,2,3 */
	BUTTON_NAME            VARCHAR(505),           /* ��ư��Array ��) ��ư1,��ư2,��ư3 */
	BUTTON_OPT1            VARCHAR(1005),          /* URL_MobileArray (http://ȣ��Ʈ, https://ȣ��Ʈ), ios_Scheme (ios_Scheme://ȣ��Ʈ, ios_Scheme://ȣ��Ʈ) */
	BUTTON_OPT2            VARCHAR(1005),          /* URL_PcArray (http://ȣ��Ʈ, https://ȣ��Ʈ), Android_Scheme (Android_Scheme://ȣ��Ʈ, Android_Scheme://ȣ��Ʈ) */
	BUTTON_OPT3            VARCHAR(1005),          /* �����ȯ�濡�� �̵��� WebURL */
	BUTTON_OPT4            VARCHAR(1005),          /* PC ȯ�濡�� �̵��� PC URL */
	ACK_YN                 VARCHAR(1) NOT NULL,    /* ����API ���俩�� */
	RESULT_CODE            VARCHAR(4),             /* ����ڵ�(���� == 0000 ���� != 0000) */
	RESULT_MSG             VARCHAR(100),           /* ����޽��� */
	RESULT_REG_DTM         VARCHAR(14),            /* �����Ͻð� */
	RESULT_MSG_KIND        VARCHAR(2),             /* ����޽������� (AT:�˸���, FT:ģ����, FP:ģ���� �̹���) */
	RESULT_MSG_SEQ_NO      VARCHAR(30),            /* �������ŷ���ȣ */
	SWITCH_RESULT_MSG_KIND VARCHAR(2),             /* ��ȯ�߼� ���� (SS:SMS, SL:LMS) */
	SWITCH_RESULT_CODE     VARCHAR(2),             /* ��ȯ�߼� ����ڵ� */
	SWITCH_RESULT_MSG      VARCHAR(100),           /* ��ȯ�߼� ����޽��� */
	REQ_TIME               VARCHAR(14),            /* BM_REQUEST ��� �ð� (YYYYMMDDHH24MISS)*/
	SEND_TIME              VARCHAR(14),            /* �߼� ��û �ð� (YYYYMMDDHH24MISS)*/
	RECV_TIME              VARCHAR(14)             /* �߼� ���� �ð� (YYYYMMDDHH24MISS)*/
);

-- īī�� �˸���/ģ���� ���� ��û ���̺� UNIQUE INDEX
CREATE UNIQUE INDEX PK_BM_REQUEST ON BM_REQUEST (MSG_ID);

-- īī�� �˸���/ģ���� ���� ��û ���̺� PRIMARY KEY
ALTER TABLE BM_REQUEST ADD CONSTRAINT PK_BM_REQUEST PRIMARY KEY (MSG_ID);

-- īī�� �˸���/ģ���� ���� ��û ��� ���̺� NON-UNIQUE INDEX
CREATE INDEX IX_BM_REQUEST_RESULT ON BM_REQUEST_RESULT (MSG_ID);

/********************************************************************
 * MYSQL ���̺� ��Ű�� ����
 ********************************************************************/

-- īī�� �˸���/ģ���� ���� ��û ���̺�
CREATE TABLE BM_REQUEST (
	MSG_ID           VARCHAR(30) NOT NULL,   /* �޽��� �Ϸù�ȣ (�޽����� ���� ������ ���̾�� ��), SMS/LMS ��ù߼� �� �Ϸù�ȣ ���̴� 20byte�� ��� */
	SVC_ID           VARCHAR(12) NOT NULL,   /* ����ID */
	YELLOW_ID        VARCHAR(40) NOT NULL,   /* ���ο�ID */
	SEND_MSG_KIND    VARCHAR(2) NOT NULL,    /* ���� �޽��� Ÿ�� (AT:�˸���, FT:ģ����, FP:ģ�����̹���, SS:SMS��ù߼�, SL:LMS��ù߼�) */
	PHONE_NO         VARCHAR(16) NOT NULL,   /* ����� �޴�����ȣ (�����ڵ�82 ����, ������'-' ����) */
	TEMP_ID          VARCHAR(30),            /* ���ø����̵� (�˸����� ��� �ʼ�) */
	MESSGE           VARCHAR(2000) NOT NULL, /* �޽��� */
	ADVERTISEMENT_YN VARCHAR(1),             /* ������ (Y, N) */
	RESERVE_DT       VARCHAR(14) NOT NULL,   /* �˸��� ����߼��� ���� �ð� ��(YYYYMMDDHH24MISS :: 00000000000000 : �������, 20170314120000 : ��������) */
	IMAGE_URL        VARCHAR(300),           /* �̹���URL (ģ���� �̹��� ���۽� ���) */
	IMAGE_LINK       VARCHAR(300),           /* �̹�������URL (ģ���� �̹��� ���۽� ���) */
	SWITCH_SEND_DIV  VARCHAR(1),             /* ����޽����� ���� ���н� �޽��� ��ȯ �߼� ���� (S:SMS , L:LMS, N:�̻��) - ���Է½� default:'N' ó�� */
	SEND_PHONE_NO    VARCHAR(16),            /* ��ȯ�߼� �߽��ڹ�ȣ (������'-' ����) */
	RECV_PHONE_NO    VARCHAR(16),            /* ��ȯ�߼� �����ڹ�ȣ (�޴��� ��ȣ, �����ڵ�82 ����, ������'-' ����) */
	SMS_MESSAGE      VARCHAR(90),            /* SMS(�ܹ�) ���۽� �޽��� */
	LMS_TITLE        VARCHAR(20),            /* LMS ���� ���� */
	LMS_MESSAGE      VARCHAR(2000),          /* LMS ���� �޽��� */
	BUTTON_TYPE      VARCHAR(15),            /* ��ưŸ��Array (WL : ����ũ, AL:�۸�ũ, DS:�����ȸ, BK:��Ű����, MD:�޽�������) ��) WL,AL,DS */
	BUTTON_ORDER     VARCHAR(10),            /* ��ư����Array ��) 1,2,3 */
	BUTTON_NAME      VARCHAR(505),           /* ��ư��Array ��) ��ư1,��ư2,��ư3 */
	BUTTON_OPT1      VARCHAR(1005),          /* URL_MobileArray (http://ȣ��Ʈ, https://ȣ��Ʈ), ios_Scheme (ios_Scheme://ȣ��Ʈ, ios_Scheme://ȣ��Ʈ) */
	BUTTON_OPT2      VARCHAR(1005),          /* URL_PcArray (http://ȣ��Ʈ, https://ȣ��Ʈ), Android_Scheme (Android_Scheme://ȣ��Ʈ, Android_Scheme://ȣ��Ʈ) */
	BUTTON_OPT3      VARCHAR(1005),          /* �����ȯ�濡�� �̵��� WebURL */
	BUTTON_OPT4      VARCHAR(1005),          /* PC ȯ�濡�� �̵��� PC URL */
	REQ_TIME         VARCHAR(14)             /* BM_REQUEST ��� �ð� (YYYYMMDDHH24MISS) */
);

-- īī�� �˸���/ģ���� ���� ��û ��� ���̺�
CREATE TABLE BM_REQUEST_RESULT (
	MSG_ID                 VARCHAR(30) NOT NULL,   /* �޽��� �Ϸù�ȣ (�޽����� ���� ������ ���̾�� ��), SMS/LMS ��ù߼� �� �Ϸù�ȣ ���̴� 20byte�� ��� */
	SVC_ID                 VARCHAR(12) NOT NULL,   /* ����ID */
	YELLOW_ID              VARCHAR(40) NOT NULL,   /* ���ο�ID */
	SEND_MSG_KIND          VARCHAR(2) NOT NULL,    /* ���� �޽��� Ÿ�� (AT:�˸���, FT:ģ����, FP:ģ�����̹���) */
	PHONE_NO               VARCHAR(16) NOT NULL,   /* ����� ��ȭ��ȣ (�����ڵ�82 ����) */
	TEMP_ID                VARCHAR(30),            /* ���ø����̵�(�˸����� ��� �ʼ�) */
	MESSGE                 VARCHAR(2000) NOT NULL, /* �޽��� */
	ADVERTISEMENT_YN       VARCHAR(1),             /* ������ (Y, N) */
	RESERVE_DT             VARCHAR(14) NOT NULL,   /* �˸��� ����߼��� ���� �ð� ��(YYYYMMDDHH24MISS :: 00000000000000 : �������, 20170314120000 : ��������) */
	IMAGE_URL              VARCHAR(300),           /* �̹���URL (ģ���� �̹��� ���۽� ���) */
	IMAGE_LINK             VARCHAR(300),           /* �̹�������URL (ģ���� �̹��� ���۽� ���) */
	SWITCH_SEND_DIV        VARCHAR(1),             /* ����޽����� ���� ���н� �޽��� ��ȯ �߼� ���� (S:SMS , L:LMS, N:�̻��) - ���Է½� default :'N' ó�� */
	SEND_PHONE_NO          VARCHAR(16),            /* ��ȯ�߼� �߽��ڹ�ȣ */
	RECV_PHONE_NO          VARCHAR(16),            /* ��ȯ�߼� �����ڹ�ȣ (�ڵ��� ��ȣ) */
	SMS_MESSAGE            VARCHAR(90),            /* SMS(�ܹ�) ���۽� �޽��� */
	LMS_TITLE              VARCHAR(20),            /* LMS ���� ���� */
	LMS_MESSAGE            VARCHAR(2000),          /* LMS ���� �޽��� */
	BUTTON_TYPE            VARCHAR(15),            /* ��ưŸ��Array (WL : ����ũ, AL:�۸�ũ, DS:�����ȸ, BK:��Ű����, MD:�޽�������) ��) WL,AL,DS */
	BUTTON_ORDER           VARCHAR(10),            /* ��ư����Array ��) 1,2,3 */
	BUTTON_NAME            VARCHAR(505),           /* ��ư��Array ��) ��ư1,��ư2,��ư3 */
	BUTTON_OPT1            VARCHAR(1005),          /* URL_MobileArray (http://ȣ��Ʈ, https://ȣ��Ʈ), ios_Scheme (ios_Scheme://ȣ��Ʈ, ios_Scheme://ȣ��Ʈ) */
	BUTTON_OPT2            VARCHAR(1005),          /* URL_PcArray (http://ȣ��Ʈ, https://ȣ��Ʈ), Android_Scheme (Android_Scheme://ȣ��Ʈ, Android_Scheme://ȣ��Ʈ) */
	BUTTON_OPT3            VARCHAR(1005),          /* �����ȯ�濡�� �̵��� WebURL */
	BUTTON_OPT4            VARCHAR(1005),          /* PC ȯ�濡�� �̵��� PC URL */
	ACK_YN                 VARCHAR(1) NOT NULL,    /* ����API ���俩�� */
	RESULT_CODE            VARCHAR(4),             /* ����ڵ�(���� == 0000 ���� != 0000) */
	RESULT_MSG             VARCHAR(100),           /* ����޽��� */
	RESULT_REG_DTM         VARCHAR(14),            /* �����Ͻð� */
	RESULT_MSG_KIND        VARCHAR(2),             /* ����޽������� (AT:�˸���, FT:ģ����, FP:ģ���� �̹���) */
	RESULT_MSG_SEQ_NO      VARCHAR(30),            /* �������ŷ���ȣ */
	SWITCH_RESULT_MSG_KIND VARCHAR(2),             /* ��ȯ�߼� ���� (SS:SMS, SL:LMS) */
	SWITCH_RESULT_CODE     VARCHAR(2),             /* ��ȯ�߼� ����ڵ� */
	SWITCH_RESULT_MSG      VARCHAR(100),           /* ��ȯ�߼� ����޽��� */
	REQ_TIME               VARCHAR(14),            /* BM_REQUEST ��� �ð� (YYYYMMDDHH24MISS)*/
	SEND_TIME              VARCHAR(14),            /* �߼� ��û �ð� (YYYYMMDDHH24MISS) */
	RECV_TIME              VARCHAR(14)             /* �߼� ���� �ð� (YYYYMMDDHH24MISS) */
);

-- īī�� �˸���/ģ���� ���� ��û ���̺� UNIQUE INDEX
CREATE UNIQUE INDEX PK_BM_REQUEST ON BM_REQUEST (MSG_ID);

-- īī�� �˸���/ģ���� ���� ��û ���̺� PRIMARY KEY
ALTER TABLE BM_REQUEST ADD CONSTRAINT PK_BM_REQUEST PRIMARY KEY (MSG_ID);

-- īī�� �˸���/ģ���� ���� ��û ��� ���̺� NON-UNIQUE INDEX
CREATE INDEX IX_BM_REQUEST_RESULT ON BM_REQUEST_RESULT (MSG_ID);
