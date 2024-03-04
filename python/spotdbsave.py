import cx_Oracle
import csv
 
# Oracle 연결 정보 설정
connection = cx_Oracle.connect("scott/tiger@127.0.0.1:1521/xe")

# 커서 생성
cursor = connection.cursor()

# CSV 파일 경로 설정
csv_file_path = "./static/data/gyeonggi_total.csv"

# CSV 파일을 열고, 각 행의 데이터를 출력합니다.
with open(csv_file_path, 'r', newline='', encoding='utf-8') as csv_file:
    csv_reader = csv.DictReader(csv_file)



    for row in csv_reader:
        TRIPNAME = row['TRIPNAME']
        TRIPCATALOGUE = row['TRIPCATALOGUE']
        TRIPCOMENT = row['TRIPCOMENT']
        TRIPREGION = row['TRIPREGION']
        TRIPIMAGE = row['TRIPIMAGE']



        
        # SPOTNUM을 시퀀스에서 가져와서 할당
        spot_num = cursor.execute("SELECT TRIPNUM_SEQ.NEXTVAL FROM DUAL").fetchone()[0]
        
        '''
        # 여행 번호 생성
        cursor.execute("""
            SELECT 'S' || LPAD(NVL(MAX(TO_NUMBER(SUBSTR(TRIPNUM, 2))), 0) + 1, 4, '0') AS CHABUM FROM TRIP
        """)
        tripnum_result = cursor.fetchone()
        spot_num = tripnum_result[0]
        '''

        # INSERT
        cursor.execute("""
            INSERT INTO TRIP (
                TRIPNUM, TRIPNAME, TRIPCATALOGUE, TRIPCOMENT, TRIPREGION, TRIPIMAGE, 
                INSERTDATE, UPDATEDATE, DELETEYN, SPOTHIT
            ) VALUES (
                :1, :2, :3, :4, :5, :6, SYSDATE, SYSDATE, 'Y', 0
            )
        """, (spot_num, TRIPNAME, TRIPCATALOGUE, TRIPCOMENT, TRIPREGION, TRIPIMAGE,))





# 변경 내용을 저장
connection.commit()

# 연결 및 커서 닫기
cursor.close()
connection.close()
