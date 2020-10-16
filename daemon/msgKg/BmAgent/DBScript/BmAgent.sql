/********************************************************************
 * ORACLE 테이블 스키마 생성
 ********************************************************************/

-- 카카오 알림톡/친구톡 전송 요청 테이블
CREATE TABLE BM_REQUEST (
	MSG_ID                 VARCHAR2(30) NOT NULL,   /* 메시지 일련번호 (메시지에 대해 고유한 값이어야 함), SMS/LMS 즉시발송 시 일련번호 길이는 20byte로 등록 */
	SVC_ID                 VARCHAR2(12) NOT NULL,   /* 서비스ID */
	YELLOW_ID              VARCHAR2(40) NOT NULL,   /* 옐로우ID */
	SEND_MSG_KIND          VARCHAR2(2) NOT NULL,    /* 전송 메시지 타입 (AT:알림톡, FT:친구톡, FP:친구톡이미지, SS:SMS즉시발송, SL:LMS즉시발송) */
	PHONE_NO               VARCHAR2(16) NOT NULL,   /* 사용자 휴대폰번호 (국가코드82 포함, 하이픈'-' 제외) */
	TEMP_ID                VARCHAR2(30),            /* 템플릿아이디 (알림톡일 경우 필수) */
	MESSGE                 VARCHAR2(2000) NOT NULL, /* 메시지 */
	ADVERTISEMENT_YN       VARCHAR2(1),             /* 광고여부 (Y, N) */
	RESERVE_DT             VARCHAR2(14) NOT NULL,   /* 알림톡 예약발송을 위한 시간 값(YYYYMMDDHH24MISS :: 00000000000000 : 즉시전송, 20170314120000 : 예약전송) */
	IMAGE_URL              VARCHAR2(300),           /* 이미지URL (친구톡 이미지 전송시 사용) */
	IMAGE_LINK             VARCHAR2(300),           /* 이미지연결URL (친구톡 이미지 전송시 사용) */
	SWITCH_SEND_DIV        VARCHAR2(1),             /* 비즈메시지로 전송 실패시 메시지 전환 발송 구분 (S:SMS , L:LMS, N:미사용) - 미입력시 default:'N' 처리 */
	SEND_PHONE_NO          VARCHAR2(16),            /* 전환발송 발신자번호 (하이픈'-' 제외) */
	RECV_PHONE_NO          VARCHAR2(16),            /* 전환발송 수신자번호 (휴대폰 번호, 국가코드82 제외, 하이픈'-' 제외) */
	SMS_MESSAGE            VARCHAR2(90),            /* SMS(단문) 전송시 메시지 */
	LMS_TITLE              VARCHAR2(20),            /* LMS 전송 제목 */
	LMS_MESSAGE            VARCHAR2(2000),          /* LMS 전송 메시지 */
	BUTTON_TYPE            VARCHAR2(15),            /* 버튼타입Array (WL : 웹링크, AL:앱링크, DS:배송조회, BK:봇키워드, MD:메시지전달) 예) WL,AL,DS */
	BUTTON_ORDER           VARCHAR2(10),            /* 버튼순서Array 예) 1,2,3 */
	BUTTON_NAME            VARCHAR2(505),           /* 버튼명Array 예) 버튼1,버튼2,버튼3 */
	BUTTON_OPT1            VARCHAR2(1005),          /* URL_MobileArray (http://호스트, https://호스트), ios_Scheme (ios_Scheme://호스트, ios_Scheme://호스트) */
	BUTTON_OPT2            VARCHAR2(1005),          /* URL_PcArray (http://호스트, https://호스트), Android_Scheme (Android_Scheme://호스트, Android_Scheme://호스트) */
	BUTTON_OPT3            VARCHAR2(1005),          /* 모바일환경에서 이동할 WebURL */
	BUTTON_OPT4            VARCHAR2(1005),          /* PC 환경에서 이동할 PC URL */
	REQ_TIME               VARCHAR2(14)             /* BM_REQUEST 등록 시간 (YYYYMMDDHH24MISS) */
);

-- 카카오 알림톡/친구톡 전송 요청 결과 테이블
CREATE TABLE BM_REQUEST_RESULT (
	MSG_ID                 VARCHAR2(30) NOT NULL,   /* 메시지 일련번호 (메시지에 대해 고유한 값이어야 함), SMS/LMS 즉시발송 시 일련번호 길이는 20byte로 등록 */
	SVC_ID                 VARCHAR2(12) NOT NULL,   /* 서비스ID */
	YELLOW_ID              VARCHAR2(40) NOT NULL,   /* 옐로우ID */
	SEND_MSG_KIND          VARCHAR2(2) NOT NULL,    /* 전송 메시지 타입 (AT:알림톡, FT:친구톡, FP:친구톡이미지) */
	PHONE_NO               VARCHAR2(16) NOT NULL,   /* 사용자 전화번호 (국가코드82 포함) */
	TEMP_ID                VARCHAR2(30),            /* 템플릿아이디(알림톡일 경우 필수) */
	MESSGE                 VARCHAR2(2000) NOT NULL, /* 메시지 */
	ADVERTISEMENT_YN       VARCHAR2(1),             /* 광고여부 (Y, N) */
	RESERVE_DT             VARCHAR2(14) NOT NULL,   /* 알림톡 예약발송을 위한 시간 값(YYYYMMDDHH24MISS :: 00000000000000 : 즉시전송, 20170314120000 : 예약전송) */
	IMAGE_URL              VARCHAR2(300),           /* 이미지URL (친구톡 이미지 전송시 사용) */
	IMAGE_LINK             VARCHAR2(300),           /* 이미지연결URL (친구톡 이미지 전송시 사용) */
	SWITCH_SEND_DIV        VARCHAR2(1),             /* 비즈메시지로 전송 실패시 메시지 전환 발송 구분 (S:SMS , L:LMS, N:미사용) - 미입력시 default :'N' 처리 */
	SEND_PHONE_NO          VARCHAR2(16),            /* 전환발송 발신자번호 */
	RECV_PHONE_NO          VARCHAR2(16),            /* 전환발송 수신자번호 (핸드폰 번호) */
	SMS_MESSAGE            VARCHAR2(90),            /* SMS(단문) 전송시 메시지 */
	LMS_TITLE              VARCHAR2(20),            /* LMS 전송 제목 */
	LMS_MESSAGE            VARCHAR2(2000),          /* LMS 전송 메시지 */
	BUTTON_TYPE            VARCHAR2(15),            /* 버튼타입Array (WL : 웹링크, AL:앱링크, DS:배송조회, BK:봇키워드, MD:메시지전달) 예) WL,AL,DS */
	BUTTON_ORDER           VARCHAR2(10),            /* 버튼순서Array 예) 1,2,3 */
	BUTTON_NAME            VARCHAR2(505),           /* 버튼명Array 예) 버튼1,버튼2,버튼3 */
	BUTTON_OPT1            VARCHAR2(1005),          /* URL_MobileArray (http://호스트, https://호스트), ios_Scheme (ios_Scheme://호스트, ios_Scheme://호스트) */
	BUTTON_OPT2            VARCHAR2(1005),          /* URL_PcArray (http://호스트, https://호스트), Android_Scheme (Android_Scheme://호스트, Android_Scheme://호스트) */
	BUTTON_OPT3            VARCHAR2(1005),          /* 모바일환경에서 이동할 WebURL */
	BUTTON_OPT4            VARCHAR2(1005),          /* PC 환경에서 이동할 PC URL */
	ACK_YN                 VARCHAR2(1) NOT NULL,    /* 전송API 응답여부 */
	RESULT_CODE            VARCHAR2(4),             /* 결과코드(정상 == 0000 에러 != 0000) */
	RESULT_MSG             VARCHAR2(100),           /* 결과메시지 */
	RESULT_REG_DTM         VARCHAR2(14),            /* 결과등록시간 */
	RESULT_MSG_KIND        VARCHAR2(2),             /* 결과메시지종류 (AT:알림톡, FT:친구톡, FP:친구톡 이미지) */
	RESULT_MSG_SEQ_NO      VARCHAR2(30),            /* 결과모빌거래번호 */
	SWITCH_RESULT_MSG_KIND VARCHAR2(2),             /* 전환발송 구분 (SS:SMS, SL:LMS) */
	SWITCH_RESULT_CODE     VARCHAR2(2),             /* 전환발송 결과코드 */
	SWITCH_RESULT_MSG      VARCHAR2(100),           /* 전환발송 결과메시지 */
	REQ_TIME               VARCHAR2 (14),           /* BM_REQUEST 등록 시간 (YYYYMMDDHH24MISS) */
	SEND_TIME              VARCHAR2 (14),           /* 발송 요청 시간 (YYYYMMDDHH24MISS) */
	RECV_TIME              VARCHAR2 (14)            /* 발송 응답 시간 (YYYYMMDDHH24MISS) */
);

-- 카카오 알림톡/친구톡 전송 요청 테이블 UNIQUE INDEX
CREATE UNIQUE INDEX PK_BM_REQUEST ON BM_REQUEST (MSG_ID);

-- 카카오 알림톡/친구톡 전송 요청 테이블 PRIMARY KEY
ALTER TABLE BM_REQUEST ADD CONSTRAINT PK_BM_REQUEST PRIMARY KEY (MSG_ID);

-- 카카오 알림톡/친구톡 전송 요청 결과 테이블 NON-UNIQUE INDEX
CREATE INDEX IX_BM_REQUEST_RESULT ON BM_REQUEST_RESULT (MSG_ID);

/********************************************************************
 * MSSQL 테이블 스키마 생성
 ********************************************************************/

-- 카카오 알림톡/친구톡 전송 요청 테이블
CREATE TABLE BM_REQUEST (
	MSG_ID           VARCHAR(30) NOT NULL,   /* 메시지 일련번호 (메시지에 대해 고유한 값이어야 함), SMS/LMS 즉시발송 시 일련번호 길이는 20byte로 등록 */
	SVC_ID           VARCHAR(12) NOT NULL,   /* 서비스ID */
	YELLOW_ID        VARCHAR(40) NOT NULL,   /* 옐로우ID */
	SEND_MSG_KIND    VARCHAR(2) NOT NULL,    /* 전송 메시지 타입 (AT:알림톡, FT:친구톡, FP:친구톡이미지, SS:SMS즉시발송, SL:LMS즉시발송) */
	PHONE_NO         VARCHAR(16) NOT NULL,   /* 사용자 휴대폰번호 (국가코드82 포함, 하이픈'-' 제외) */
	TEMP_ID          VARCHAR(30),            /* 템플릿아이디 (알림톡일 경우 필수) */
	MESSGE           VARCHAR(2000) NOT NULL, /* 메시지 */
	ADVERTISEMENT_YN VARCHAR(1),             /* 광고여부 (Y, N) */
	RESERVE_DT       VARCHAR(14) NOT NULL,   /* 알림톡 예약발송을 위한 시간 값(YYYYMMDDHH24MISS :: 00000000000000 : 즉시전송, 20170314120000 : 예약전송) */
	IMAGE_URL        VARCHAR(300),           /* 이미지URL (친구톡 이미지 전송시 사용) */
	IMAGE_LINK       VARCHAR(300),           /* 이미지연결URL (친구톡 이미지 전송시 사용) */
	SWITCH_SEND_DIV  VARCHAR(1),             /* 비즈메시지로 전송 실패시 메시지 전환 발송 구분 (S:SMS , L:LMS, N:미사용) - 미입력시 default:'N' 처리 */
	SEND_PHONE_NO    VARCHAR(16),            /* 전환발송 발신자번호 (하이픈'-' 제외) */
	RECV_PHONE_NO    VARCHAR(16),            /* 전환발송 수신자번호 (휴대폰 번호, 국가코드82 제외, 하이픈'-' 제외) */
	SMS_MESSAGE      VARCHAR(90),            /* SMS(단문) 전송시 메시지 */
	LMS_TITLE        VARCHAR(20),            /* LMS 전송 제목 */
	LMS_MESSAGE      VARCHAR(2000),          /* LMS 전송 메시지 */
	BUTTON_TYPE      VARCHAR(15),            /* 버튼타입Array (WL : 웹링크, AL:앱링크, DS:배송조회, BK:봇키워드, MD:메시지전달) 예) WL,AL,DS */
	BUTTON_ORDER     VARCHAR(10),            /* 버튼순서Array 예) 1,2,3 */
	BUTTON_NAME      VARCHAR(505),           /* 버튼명Array 예) 버튼1,버튼2,버튼3 */
	BUTTON_OPT1      VARCHAR(1005),          /* URL_MobileArray (http://호스트, https://호스트), ios_Scheme (ios_Scheme://호스트, ios_Scheme://호스트) */
	BUTTON_OPT2      VARCHAR(1005),          /* URL_PcArray (http://호스트, https://호스트), Android_Scheme (Android_Scheme://호스트, Android_Scheme://호스트) */
	BUTTON_OPT3      VARCHAR(1005),          /* 모바일환경에서 이동할 WebURL */
	BUTTON_OPT4      VARCHAR(1005),          /* PC 환경에서 이동할 PC URL */
	REQ_TIME         VARCHAR(14)             /* BM_REQUEST 등록 시간 (YYYYMMDDHH24MISS)*/
);

-- 카카오 알림톡/친구톡 전송 요청 결과 테이블
CREATE TABLE BM_REQUEST_RESULT (
	MSG_ID                 VARCHAR(30) NOT NULL,   /* 메시지 일련번호 (메시지에 대해 고유한 값이어야 함), SMS/LMS 즉시발송 시 일련번호 길이는 20byte로 등록 */
	SVC_ID                 VARCHAR(12) NOT NULL,   /* 서비스ID */
	YELLOW_ID              VARCHAR(40) NOT NULL,   /* 옐로우ID */
	SEND_MSG_KIND          VARCHAR(2) NOT NULL,    /* 전송 메시지 타입 (AT:알림톡, FT:친구톡, FP:친구톡이미지) */
	PHONE_NO               VARCHAR(16) NOT NULL,   /* 사용자 전화번호 (국가코드82 포함) */
	TEMP_ID                VARCHAR(30),            /* 템플릿아이디(알림톡일 경우 필수) */
	MESSGE                 VARCHAR(2000) NOT NULL, /* 메시지 */
	ADVERTISEMENT_YN       VARCHAR(1),             /* 광고여부 (Y, N) */
	RESERVE_DT             VARCHAR(14) NOT NULL,   /* 알림톡 예약발송을 위한 시간 값(YYYYMMDDHH24MISS :: 00000000000000 : 즉시전송, 20170314120000 : 예약전송) */
	IMAGE_URL              VARCHAR(300),           /* 이미지URL (친구톡 이미지 전송시 사용) */
	IMAGE_LINK             VARCHAR(300),           /* 이미지연결URL (친구톡 이미지 전송시 사용) */
	SWITCH_SEND_DIV        VARCHAR(1),             /* 비즈메시지로 전송 실패시 메시지 전환 발송 구분 (S:SMS , L:LMS, N:미사용) - 미입력시 default :'N' 처리 */
	SEND_PHONE_NO          VARCHAR(16),            /* 전환발송 발신자번호 */
	RECV_PHONE_NO          VARCHAR(16),            /* 전환발송 수신자번호 (핸드폰 번호) */
	SMS_MESSAGE            VARCHAR(90),            /* SMS(단문) 전송시 메시지 */
	LMS_TITLE              VARCHAR(20),            /* LMS 전송 제목 */
	LMS_MESSAGE            VARCHAR(2000),          /* LMS 전송 메시지 */
	BUTTON_TYPE            VARCHAR(15),            /* 버튼타입Array (WL : 웹링크, AL:앱링크, DS:배송조회, BK:봇키워드, MD:메시지전달) 예) WL,AL,DS */
	BUTTON_ORDER           VARCHAR(10),            /* 버튼순서Array 예) 1,2,3 */
	BUTTON_NAME            VARCHAR(505),           /* 버튼명Array 예) 버튼1,버튼2,버튼3 */
	BUTTON_OPT1            VARCHAR(1005),          /* URL_MobileArray (http://호스트, https://호스트), ios_Scheme (ios_Scheme://호스트, ios_Scheme://호스트) */
	BUTTON_OPT2            VARCHAR(1005),          /* URL_PcArray (http://호스트, https://호스트), Android_Scheme (Android_Scheme://호스트, Android_Scheme://호스트) */
	BUTTON_OPT3            VARCHAR(1005),          /* 모바일환경에서 이동할 WebURL */
	BUTTON_OPT4            VARCHAR(1005),          /* PC 환경에서 이동할 PC URL */
	ACK_YN                 VARCHAR(1) NOT NULL,    /* 전송API 응답여부 */
	RESULT_CODE            VARCHAR(4),             /* 결과코드(정상 == 0000 에러 != 0000) */
	RESULT_MSG             VARCHAR(100),           /* 결과메시지 */
	RESULT_REG_DTM         VARCHAR(14),            /* 결과등록시간 */
	RESULT_MSG_KIND        VARCHAR(2),             /* 결과메시지종류 (AT:알림톡, FT:친구톡, FP:친구톡 이미지) */
	RESULT_MSG_SEQ_NO      VARCHAR(30),            /* 결과모빌거래번호 */
	SWITCH_RESULT_MSG_KIND VARCHAR(2),             /* 전환발송 구분 (SS:SMS, SL:LMS) */
	SWITCH_RESULT_CODE     VARCHAR(2),             /* 전환발송 결과코드 */
	SWITCH_RESULT_MSG      VARCHAR(100),           /* 전환발송 결과메시지 */
	REQ_TIME               VARCHAR(14),            /* BM_REQUEST 등록 시간 (YYYYMMDDHH24MISS)*/
	SEND_TIME              VARCHAR(14),            /* 발송 요청 시간 (YYYYMMDDHH24MISS)*/
	RECV_TIME              VARCHAR(14)             /* 발송 응답 시간 (YYYYMMDDHH24MISS)*/
);

-- 카카오 알림톡/친구톡 전송 요청 테이블 UNIQUE INDEX
CREATE UNIQUE INDEX PK_BM_REQUEST ON BM_REQUEST (MSG_ID);

-- 카카오 알림톡/친구톡 전송 요청 테이블 PRIMARY KEY
ALTER TABLE BM_REQUEST ADD CONSTRAINT PK_BM_REQUEST PRIMARY KEY (MSG_ID);

-- 카카오 알림톡/친구톡 전송 요청 결과 테이블 NON-UNIQUE INDEX
CREATE INDEX IX_BM_REQUEST_RESULT ON BM_REQUEST_RESULT (MSG_ID);

/********************************************************************
 * MYSQL 테이블 스키마 생성
 ********************************************************************/

-- 카카오 알림톡/친구톡 전송 요청 테이블
CREATE TABLE BM_REQUEST (
	MSG_ID           VARCHAR(30) NOT NULL,   /* 메시지 일련번호 (메시지에 대해 고유한 값이어야 함), SMS/LMS 즉시발송 시 일련번호 길이는 20byte로 등록 */
	SVC_ID           VARCHAR(12) NOT NULL,   /* 서비스ID */
	YELLOW_ID        VARCHAR(40) NOT NULL,   /* 옐로우ID */
	SEND_MSG_KIND    VARCHAR(2) NOT NULL,    /* 전송 메시지 타입 (AT:알림톡, FT:친구톡, FP:친구톡이미지, SS:SMS즉시발송, SL:LMS즉시발송) */
	PHONE_NO         VARCHAR(16) NOT NULL,   /* 사용자 휴대폰번호 (국가코드82 포함, 하이픈'-' 제외) */
	TEMP_ID          VARCHAR(30),            /* 템플릿아이디 (알림톡일 경우 필수) */
	MESSGE           VARCHAR(2000) NOT NULL, /* 메시지 */
	ADVERTISEMENT_YN VARCHAR(1),             /* 광고여부 (Y, N) */
	RESERVE_DT       VARCHAR(14) NOT NULL,   /* 알림톡 예약발송을 위한 시간 값(YYYYMMDDHH24MISS :: 00000000000000 : 즉시전송, 20170314120000 : 예약전송) */
	IMAGE_URL        VARCHAR(300),           /* 이미지URL (친구톡 이미지 전송시 사용) */
	IMAGE_LINK       VARCHAR(300),           /* 이미지연결URL (친구톡 이미지 전송시 사용) */
	SWITCH_SEND_DIV  VARCHAR(1),             /* 비즈메시지로 전송 실패시 메시지 전환 발송 구분 (S:SMS , L:LMS, N:미사용) - 미입력시 default:'N' 처리 */
	SEND_PHONE_NO    VARCHAR(16),            /* 전환발송 발신자번호 (하이픈'-' 제외) */
	RECV_PHONE_NO    VARCHAR(16),            /* 전환발송 수신자번호 (휴대폰 번호, 국가코드82 제외, 하이픈'-' 제외) */
	SMS_MESSAGE      VARCHAR(90),            /* SMS(단문) 전송시 메시지 */
	LMS_TITLE        VARCHAR(20),            /* LMS 전송 제목 */
	LMS_MESSAGE      VARCHAR(2000),          /* LMS 전송 메시지 */
	BUTTON_TYPE      VARCHAR(15),            /* 버튼타입Array (WL : 웹링크, AL:앱링크, DS:배송조회, BK:봇키워드, MD:메시지전달) 예) WL,AL,DS */
	BUTTON_ORDER     VARCHAR(10),            /* 버튼순서Array 예) 1,2,3 */
	BUTTON_NAME      VARCHAR(505),           /* 버튼명Array 예) 버튼1,버튼2,버튼3 */
	BUTTON_OPT1      VARCHAR(1005),          /* URL_MobileArray (http://호스트, https://호스트), ios_Scheme (ios_Scheme://호스트, ios_Scheme://호스트) */
	BUTTON_OPT2      VARCHAR(1005),          /* URL_PcArray (http://호스트, https://호스트), Android_Scheme (Android_Scheme://호스트, Android_Scheme://호스트) */
	BUTTON_OPT3      VARCHAR(1005),          /* 모바일환경에서 이동할 WebURL */
	BUTTON_OPT4      VARCHAR(1005),          /* PC 환경에서 이동할 PC URL */
	REQ_TIME         VARCHAR(14)             /* BM_REQUEST 등록 시간 (YYYYMMDDHH24MISS) */
);

-- 카카오 알림톡/친구톡 전송 요청 결과 테이블
CREATE TABLE BM_REQUEST_RESULT (
	MSG_ID                 VARCHAR(30) NOT NULL,   /* 메시지 일련번호 (메시지에 대해 고유한 값이어야 함), SMS/LMS 즉시발송 시 일련번호 길이는 20byte로 등록 */
	SVC_ID                 VARCHAR(12) NOT NULL,   /* 서비스ID */
	YELLOW_ID              VARCHAR(40) NOT NULL,   /* 옐로우ID */
	SEND_MSG_KIND          VARCHAR(2) NOT NULL,    /* 전송 메시지 타입 (AT:알림톡, FT:친구톡, FP:친구톡이미지) */
	PHONE_NO               VARCHAR(16) NOT NULL,   /* 사용자 전화번호 (국가코드82 포함) */
	TEMP_ID                VARCHAR(30),            /* 템플릿아이디(알림톡일 경우 필수) */
	MESSGE                 VARCHAR(2000) NOT NULL, /* 메시지 */
	ADVERTISEMENT_YN       VARCHAR(1),             /* 광고여부 (Y, N) */
	RESERVE_DT             VARCHAR(14) NOT NULL,   /* 알림톡 예약발송을 위한 시간 값(YYYYMMDDHH24MISS :: 00000000000000 : 즉시전송, 20170314120000 : 예약전송) */
	IMAGE_URL              VARCHAR(300),           /* 이미지URL (친구톡 이미지 전송시 사용) */
	IMAGE_LINK             VARCHAR(300),           /* 이미지연결URL (친구톡 이미지 전송시 사용) */
	SWITCH_SEND_DIV        VARCHAR(1),             /* 비즈메시지로 전송 실패시 메시지 전환 발송 구분 (S:SMS , L:LMS, N:미사용) - 미입력시 default :'N' 처리 */
	SEND_PHONE_NO          VARCHAR(16),            /* 전환발송 발신자번호 */
	RECV_PHONE_NO          VARCHAR(16),            /* 전환발송 수신자번호 (핸드폰 번호) */
	SMS_MESSAGE            VARCHAR(90),            /* SMS(단문) 전송시 메시지 */
	LMS_TITLE              VARCHAR(20),            /* LMS 전송 제목 */
	LMS_MESSAGE            VARCHAR(2000),          /* LMS 전송 메시지 */
	BUTTON_TYPE            VARCHAR(15),            /* 버튼타입Array (WL : 웹링크, AL:앱링크, DS:배송조회, BK:봇키워드, MD:메시지전달) 예) WL,AL,DS */
	BUTTON_ORDER           VARCHAR(10),            /* 버튼순서Array 예) 1,2,3 */
	BUTTON_NAME            VARCHAR(505),           /* 버튼명Array 예) 버튼1,버튼2,버튼3 */
	BUTTON_OPT1            VARCHAR(1005),          /* URL_MobileArray (http://호스트, https://호스트), ios_Scheme (ios_Scheme://호스트, ios_Scheme://호스트) */
	BUTTON_OPT2            VARCHAR(1005),          /* URL_PcArray (http://호스트, https://호스트), Android_Scheme (Android_Scheme://호스트, Android_Scheme://호스트) */
	BUTTON_OPT3            VARCHAR(1005),          /* 모바일환경에서 이동할 WebURL */
	BUTTON_OPT4            VARCHAR(1005),          /* PC 환경에서 이동할 PC URL */
	ACK_YN                 VARCHAR(1) NOT NULL,    /* 전송API 응답여부 */
	RESULT_CODE            VARCHAR(4),             /* 결과코드(정상 == 0000 에러 != 0000) */
	RESULT_MSG             VARCHAR(100),           /* 결과메시지 */
	RESULT_REG_DTM         VARCHAR(14),            /* 결과등록시간 */
	RESULT_MSG_KIND        VARCHAR(2),             /* 결과메시지종류 (AT:알림톡, FT:친구톡, FP:친구톡 이미지) */
	RESULT_MSG_SEQ_NO      VARCHAR(30),            /* 결과모빌거래번호 */
	SWITCH_RESULT_MSG_KIND VARCHAR(2),             /* 전환발송 구분 (SS:SMS, SL:LMS) */
	SWITCH_RESULT_CODE     VARCHAR(2),             /* 전환발송 결과코드 */
	SWITCH_RESULT_MSG      VARCHAR(100),           /* 전환발송 결과메시지 */
	REQ_TIME               VARCHAR(14),            /* BM_REQUEST 등록 시간 (YYYYMMDDHH24MISS)*/
	SEND_TIME              VARCHAR(14),            /* 발송 요청 시간 (YYYYMMDDHH24MISS) */
	RECV_TIME              VARCHAR(14)             /* 발송 응답 시간 (YYYYMMDDHH24MISS) */
);

-- 카카오 알림톡/친구톡 전송 요청 테이블 UNIQUE INDEX
CREATE UNIQUE INDEX PK_BM_REQUEST ON BM_REQUEST (MSG_ID);

-- 카카오 알림톡/친구톡 전송 요청 테이블 PRIMARY KEY
ALTER TABLE BM_REQUEST ADD CONSTRAINT PK_BM_REQUEST PRIMARY KEY (MSG_ID);

-- 카카오 알림톡/친구톡 전송 요청 결과 테이블 NON-UNIQUE INDEX
CREATE INDEX IX_BM_REQUEST_RESULT ON BM_REQUEST_RESULT (MSG_ID);
