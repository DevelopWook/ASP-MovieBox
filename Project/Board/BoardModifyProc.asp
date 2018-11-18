<%OPTION EXPLICIT
'---------------------------게시물 수정 처리--------------------------------------
'1. 탭스 업로드 개체 생성하고 파일 처리 시작하기
'2. 전송 정보 확인
'3. 파일 변경이 있을 경우 기존 파일 삭제하고 변경된 파일 저장하기
'4. 변경된 정보를 DB로 저장
'5. 사용된 개체 소멸
'6. 게시물 상세 보기 페이지로 이동
'---------------------------------------------------------------------------------


'2. 전송 정보 확인
Dim BSubject, BContent, existingfile, file, bid, boardname, page, skey, sval
BSubject = Request("BSubject")
BContent = Request("BContent")
existingfile = Request("existingfile")
'file = Request("")
bid = Request("bid")
boardname = Request("boardname")
page = Request("page")
skey = Request("skey")
sval = Request("sval")

'3. 파일 변경이 있을 경우 기존 파일 삭제하고 변경된 파일 저장하기
If file <> "" Then
	Dim objFSO, filePath, filename
	Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
	filePath = savePoint & "\" & existingFile
	If objFSO.FileExists(filePath) Then
		objFSO.DeleteFile(filePath)
	End If
	filename = objUp.Form("file").save
	filename = Mid(filename, InStrRev(filename, "\")+1)
Else 
	filename = existingfile
End If

'4. 변경된 정보를 DB로 저장
Dim strConn, strSQL, objDBConn
strConn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"

strSQL = "UPDATE Board SET	BSubject = '" & BSubject & "', " & _
						   "BContent = '" & BContent & "', " & _
						   "BFileName = '" & filename & "' " & _
	     "WHERE bid = " & bid

Set objDBConn = Server.CreateObject("ADODB.connection")
objDBConn.Open strConn

objDBConn.Execute strSQL

'5. 사용된 개체 소멸
'Set objUp = Nothing
objDBConn.Close
'Set objUp = Nothing

'6. 게시물 상세 보기 페이지로 이동
Response.Redirect "/Board/BoardViewDetail.asp?boardname=" & boardname & "&bid=" & bid & "&page=" & page & "&skey=" & skey & "&sval=" & sval
%>