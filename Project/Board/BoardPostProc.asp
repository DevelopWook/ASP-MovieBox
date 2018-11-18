<%OPTION EXPLICIT
'------------------------게시물 등록 처리-----------------------------------------
'1. 파일 업로드 개체 생성 및 폼 값 저장
'2. INSERT 문 작성
'3. ADO 개체를 이용하여 DB에 질의문 전송
'4. 자료실 목록 페이지로 이동
'---------------------------------------------------------------------------------

'1. 파일 업로드 개체 생성 및 폼 값 저장
'탭스 업로드 개체용 변수와 폼 값을 저장할 변수를 선언
Dim objUp, savePoint, BUName, BUserID, BSubject, BContent, filename, BFileName, BBoardNo, BBoardName, BReplyDepth, BReplyNo, BUserIP, skey, sval, page

'업로드된 파일이 저장될 웹서버 로컬 경로를 지정
savePoint = Server.MapPath("/PDS")

'탭스 업로드 개체 생성
Set objUp = Server.CreateObject("Tabs.Upload")

'저장 경로로 파일 처리 시작
objUp.Start savePoint

'전송된 HTML 폼값을 변수에 저장

	'페이지 정보 확인
	page = 1'objUp.Form("page").value

	'검색 키 정보확인
	skey = objUp.Form("skey").value

	'검색값 정보 확인
	sval = objUp.Form("sval").value
	
	'게시판이름
	BBoardName = objUp.Form("BoardName").value
	
	'이름
	BUName = objUp.Form("BUName").value
	
	'아이디
	BUserID = objUp.Form("BUserID").value
	
	'제목
	BSubject = objUp.Form("BSubject").value
	
	'내용
	BContent = objUp.Form("BContent").value
	
	'게시자IP
	BUserIP = Request.ServerVariables("Remote_Host")
	
	'파일이름
	filename = objUp.Form("file").filename
	
	If filename <> "" Then
		Dim BLocalPath
		BLocalPath = objUp.Form("file").save
		BFileName = Mid(BLocalPath, InStrRev(BLocalPath, "\") + 1)
	End If

Set objUp = Nothing


'2. INSERT 문 작성
'INSERT 문을 저장할 변수 지정
Dim strSQL

'DB 접속을 위한 변수 지정
Dim objDBConn, objRs, strConn, affected

'DB 접속 연결 문자 지정
strConn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"

'Connection 개체 생성하고 DB에 연결
Set objDBConn = Server.CreateObject("ADODB.Connection")
objDBConn.Open strConn

'게시판 번호값 구하기
strSQL = "SELECT MAX(BBoardNo) From Board WHERE BoardName = '" & BBoardName & "'"

set objRs = objDBConn.Execute (strSQL)

If objRs(0) <> 0 Then
	BBoardNo = Int(objRs(0)) + 1
Else
	BBoardNo = 1
End If

Set objRs = Nothing

'전송 받은 정보를 이용하여 질의문 작성
strSQL = "INSERT INTO Board (BoardName, BUserID, BUName, BSubject, BContent, BFileName, BUserIP, BBoardNo) " & _
		 "VALUES ('" & BBoardName	& "', '" & _
					   BUserID		& "', '" & _
					   BUName		& "', '" & _
					   BSubject		& "', '" & _
					   BContent		& "', '" & _
					   BFileName	& "', '" & _
					   BUserIP		& "', " & _
					   BBoardNo		& ")"


'3. ADO 개체를 이용하여 DB에 질의문 전송
'질의문 실행
objDBConn.Execute strSQL, affected, &H00000080 
'반환값 없이 명령어 실행 상수값을 정의한 adovbs.inc 파일을 삽입하지 않아 상수값을 직접 입력함

'Connection 개체 소멸
objDBConn.Close
Set objDBConn = Nothing

'4. 자료실 목록 페이지로 이동
'목록 페이지로 이동
Response.Redirect "BoardList.asp?BoardName=" & BBoardName & "&" & "page="  & page & "&" & "skey="  & skey & "&" & "sval="  & sval
%>