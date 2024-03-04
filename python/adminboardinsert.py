import cx_Oracle
import csv
 
# Oracle 연결 정보 설정
connection = cx_Oracle.connect("scott/tiger@127.0.0.1:1521/xe")

# 커서 생성
cursor = connection.cursor()

# CSV 파일 경로 설정
csv_file_path = "./static/data/abinsert.csv"

# CSV 파일을 열고, 각 행의 데이터를 출력합니다.
with open(csv_file_path, 'r', newline='', encoding='utf-8') as csv_file:
    csv_reader = csv.DictReader(csv_file)



    for row in csv_reader:
        ADBOARDTITLE = row['ADBOARDTITLE']
        ADBOARDCOMENT = row['ADBOARDCOMENT']
        ADBOARDIMAGE = row['ADBOARDIMAGE']




        # HOTELNUM을 시퀀스에서 가져와서 할당
        ADBOARDNUM = cursor.execute("SELECT adboard_seq.NEXTVAL FROM dual").fetchone()[0]

        # HOTELCOMENT를 파라미터로 전달하여 쿼리 실행
        cursor.execute("""
            INSERT INTO ADBOARD(
                ADBOARDNUM, MEMNUM, ADBOARDTITLE, ADBOARDCOMENT, ADBOARDIMAGE, INSERTDATE, 
                UPDATEDATE, DELETEYN 
            ) VALUES (
                :1, '관리자', :2, :3, :4, SYSDATE, SYSDATE, 'Y'  
            )
        """, (ADBOARDNUM, ADBOARDTITLE, ADBOARDCOMENT, ADBOARDIMAGE))





# 변경 내용을 저장
connection.commit()

# 연결 및 커서 닫기
cursor.close()
connection.close()
