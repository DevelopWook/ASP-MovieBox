<%OPTION EXPLICIT%>
<!--#include virtual="/inc/adovbs.inc"-->
<%
'---------------------------게시판 기능 수정 처리---------------------------------
'1. 전송된 정보를 변수에 저장
'2. DB 연결 개체 생성하고 DB와 연결
'3. UPDATE 질의문 생성
'4. DB에 질의문 전송
'5. 게시판 목록 페이지로 이동
'---------------------------------------------------------------------------------
'1. 전송된 정보를 변수에 저장
Dim TBoardName, TFileUpEnable, TBoardDesc, TReplyEnable, TaddOnEnable, TAccessLevel

TBoardName = Request("TBoardName")
TBoardDesc = Request("TBoardDesc")
TReplyEnable = Request("TReplyEnable")
TAccessLevel = Request("TAccessLevel")

'2. DB 연결 개체 생성하고 DB와 연결
Dim objDBConn, strSQL, affected
Set objDBConn = Server.CreateObject("ADODB.Connection")
objDBConn.Open ("Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99")

'3. UPDATE 질의문 생성
strSQL = "UPDATE BoardType SET TBoardName = '" & TBoardName & "', " & _
						   "TBoardDesc = '" & TBoardDesc & "', " & _
						   "TReplyEnable = " & TReplyEnable & ", " & _
						   "TAccessLevel = '" & TAccessLevel & "' " & _
							"WHERE TBoardName = '" & TBoardName & "'"

'4. DB에 질의문 전송
objDBConn.Execute strSQL, affected, adExecuteNoRecords
objDBConn.Close
Set objDBConn = Nothing

'5. 게시판 목록 페이지로 이동
If affected Then
	Response.Write "<script>alert('게시판 기능 수정을 완료했습니다.');location.href='./BrdTypeList.asp';</script>"
Else
	Response.Write "<script>alert('게시판 기능 수정이 실패했습니다.');history.back();</script>"
End If 
%>