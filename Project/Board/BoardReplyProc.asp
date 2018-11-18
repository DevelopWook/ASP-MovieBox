<%OPTION EXPLICIT
<!-- #include virtual="/inc/adovbs.inc" -->
'------------------------게시물 등록 처리-----------------------------------------
'1. 파일 업로드 개체 생성 및 폼 값 저장
'2. INSERT 문 작성
'3. ADO 개체를 이용하여 DB에 질의문 전송
'4. 자료실 목록 페이지로 이동
'---------------------------------------------------------------------------------

'전송된 HTML 폼값을 변수에 저장
Dim BUName, BUserID, BSubject, BContent, filename, BFileName, BBoardNo, BBoardName, BUserIP, BReplyDepth, BReplyNo, skey, sval, page

	'페이지 정보 확인
	page = Request("page")

	'검색 키 정보확인
	skey = Request("skey")

	'검색값 정보 확인
	sval = Request("sval")
	
	'답글 순서 정보 확인
	BReplyNo = Request("BReplyNo")
	
	'답글 깊이 정보 확인
	BReplyDepth = 1'Request("BReplyDepth")
	
	'게시판 번호 정보 확인
	BBoardNo = Request("BBoardNo")
	
	'게시판이름
	BBoardName = Request("BBoardName")
	
	'이름
	BUName = Request("BUName")
	
	'아이디
	BUserID = Request("BUserID")
	
	'제목
	BSubject = Request("BSubject")
	
	'내용
	BContent = Request("BContent")
	
	'게시자IP
	BUserIP = Request.ServerVariables("Remote_Host")
	
	'파일이름
	'filename = objUp.Form("file").filename
	
	'If filename <> "" Then
	'	Dim BLocalPath
	'	BLocalPath = objUp.Form("file").save
	'	BFileName = Mid(BLocalPath, InStrRev(BLocalPath, "\") + 1)
	'End If

'Set objUp = Nothing


'2. INSERT 문 작성
'DB 접속을 위한 변수 지정
Dim objDBConn, objRs, strConn, strSQL, affected

'DB 접속 연결 문자 지정
strConn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"

'Connection 개체 생성하고 DB에 연결
Set objDBConn = Server.CreateObject("ADODB.Connection")
objDBConn.Open strConn

'기존 답변 게시물 재정열 업데이트
strSQL = "UPDATE Board SET BReplyNo = BReplyNo + 1 WHERE BBoardNo = " & BBoardNo & " AND BReplyNo > " & BReplyNo
					  
objDBConn.Execute strSQL


'저장할 답글의 답변 깊이와 답변글번호 지정
BReplyNo = BReplyNo + 1
BReplyDepth = BReplyDepth + 1

'전송받은 정보를 이용하여 질의문 작성
strSQL = "INSERT INTO Board (BoardName, BUserID, BUName, BSubject, BContent, BFileName, BUserIP, BBoardNo, BReplyDepth, BReplyNo) " & _
		 "VALUES ('자유게시판', '" & _
					   BUserID		& "', '" & _
					   BUName		& "', '" & _
					   BSubject		& "', '" & _
					   BContent		& "', '" & _
					   BFileName	& "', '" & _
					   BUserIP		& "', " & _
					   BBoardNo		& ", " & _
					   BReplyDepth	& ", " & _
					   BReplyNo		& ")"


'3. ADO 개체를 이용하여 DB에 질의문 전송
'DB에 답글을 등록하는 INSERT 질의문 실행
objDBConn.Execute strSQL, affected', &H00000080 
'반환값 없이 명령어 실행 상수값을 정의한 adovbs.inc 파일을 삽입하지 않아 상수값을 직접 입력함

'Connection 개체 소멸
objDBConn.Close
Set objDBConn = Nothing

'4. 자료실 목록 페이지로 이동
'목록 페이지로 이동
Response.Redirect "BoardList.asp?BoardName=" & BBoardName & "&" & "page="  & page & "&" & "skey="  & skey & "&" & "sval="  & sval
%>