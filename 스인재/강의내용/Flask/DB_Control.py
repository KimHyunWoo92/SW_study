import cx_Oracle

# DB연결
def db_conn(user_name,passward,dsn):
    try:
        #연결객체 생성
        conn = cx_Oracle.connect(user_name,passward,dsn)
        #연결객체에 커서 객체를 생성
        cur = conn.cursor()
        print("DB연결 성공")
    except cx_Oracle.DatabaseError as e:
        print("DB연결 실패")

    #다른함수에서 사용하도록 cur,conn return    
    return conn, cur

# DB연결 종료
def db_disconn(conn, cur):
    cur.close()
    conn.close()
    print("DB연동 종료")

# 테이블생성
def create_tbl(conn,cur,query):
    try :
        cur.execute(query)
        conn.commit()
        print("테이블 생성")
    except cx_Oracle.DatabaseError as e :
        print("테이블 생성 실패")
        print(e)
        

# 데이터 저장
# t_name : 테이블명
# dic : 입력 데이터를 저장하고 있는 딕셔너리
def insert_data(conn,cur,t_name,dic):

    query = f"insert into {t_name} values ("
    
    # 딕셔너리에 저장된 데이터의 수에 맞게 저장 데이터를 설정하는 query문
    # 딕셔너이에서 키값들을 하나씩 읽어와서 쿼리문을 작성
    # dic = {"id":"a1111","pw":"12345","name":"홍길동"}
    # -> insert into Login_tbl2 values (:id,:pw,:name)
    for key in dic.keys():
        query += f":{key},"

    # 마지막 (,)를 제거하고, )를 추가
    # > :id,:pw,:name)
    query = query.rstrip(",")
    query += ")"

    try :
        cur.execute(query, dic)
        conn.commit()
        print("데이터 저장 성공")
    except cx_Oracle.DatabaseError as e:
        print("저장 실패")
        print(e)
        
# 전체 데이터 검색
def search_all(cur,t_name):
    query = f"select * from {t_name}"

    try:
        cur.execute(query)
        return cur.fetchall()
    except cx_Oracle.DatabaseError as e:
        print("검색 실패")
        print(e)

# 1개 데이터 검색
def search_one(cur,t_name,col,val):
    query = f"select * from {t_name} where {col}='{val}'"
    
    try:
        cur.execute(query)
        return cur.fetchone()

    except cx_Oracle.DatabaseError as e:
        print("검색 실패")
        print(e)



# 데이터 수정
def update_data(conn,cur,t_name,dic,col,val):
    #update login_tbl2 set
    query = f"update {t_name} set "
    
    #id=:id, pw=:pw, name=:name,
    for key in dic.keys():
        query+=f"{key}=:{key},"

    #id=:id, pw=:pw, name=:name
    query = query.rstrip(',')
    
    # where col='val'
    query += f" where {col}='{val}'"

    try:
        cur.execute(query,dic)
        conn.commit()
        print("수정 완료")        

    except cx_Oracle.DatabaseError as e:
        print("수정 실패")
        print(e)

# 데이터삭제

def delete_data(conn,cur,t_name,col,val):
    query = f"delete from {t_name} where {col}='{val}'"
    
    try:
        cur.execute(query)
        conn.commit()
        print("삭제 성공")
    except cx_Oracle.DatabaseError as e:
        print("삭제 실패")
        print(e)
