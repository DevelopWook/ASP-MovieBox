<%OPTION EXPLICIT
'--------------------게시판 등록 처리 페이지--------------------------------------
'1. 전송된 정보 변수에 저장
'2. DB 연결 개체 생성하고 DB에 연결
'3. 동일한 이름의 게시판이 있는지 확인
'4. DB에 게시판 등록을 위한 질의문 작성
'5. DB에 질의문을 전송
'6. 게시판 등록이 완료되면 게시판 목록 페이지로 이동
'---------------------------------------------------------------------------------

'1. 전송된 정보 변수에 저장
Dim TBoardName, TBoardDesc,TFileUpEnable,  TReplyEnable, TAccessLevel

TBoardName = Request("TBoardName")
TBoardDesc = Request("TBoardDesc")
TReplyEnable = Request("TReplyEnable")
TFileUpEnable = Request("TFileUpEnable")
TAccessLevel = Request("TAccessLevel")

'2. DB 연결 개체 생성하고 DB에 연결
Dim objDBConn, strSQL, strConn, affected
Set objDBConn = Server.CreateObject("ADODB.Connection")
strConn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
objDBConn.Open strConn

strSQL = "SELECT * FROM BoardType WHERE TBoardName = '" & TBoardName & "'"
objDBConn.Execute strSQL, affected
'3. 동일한 이름의 게시판이 있는지 확인
If affected <> 0 Then
	Response.Write "<script>alert('이미 같은 이름의 게시판이 생성되어 있습니다.\n게시판 등록에 실패했습니다.');history.back();</script>"
	Response.End
End If

'4. DB에 게시판 등록을 위한 질의문 작성
strSQL = "INSERT INTO BoardType (TBoardName, TBoardDesc, TReplyEnable, TFileUpEnable,  TAccessLevel) " & _
		 "VALUES ('" & TBoardname & "', '" & _
					   TBoardDesc & "', " & _
					   TReplyEnable & ", " & _
					   TFileUpEnable & ", '" & _
					   TAccessLevel & "')"

'5. DB에 질의문을 전송
objDBConn.Execute strSQL
objDBConn.Close
Set objDBConn = Nothing
	
'6. 게시판 등록이 완료되면 게시판 목록 페이지로 이동
Response.Redirect "BrdTypeList.asp"
%>