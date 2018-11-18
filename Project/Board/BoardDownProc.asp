<%OPTION EXPLICIT
'---------------------------업로드된 파일 다운로드--------------------------------
'1. 파일 다운로드 처리에 필요한 변수 정의
'2. 전송된 정보 확인
'3. 내려받기 횟수 업데이트
'4. DB 연결 개체 소멸
'5. 파일 다운로드 처리
'6. 탭스 다운로드 개체 소멸 후 내려받기 창 닫기
'---------------------------------------------------------------------------------

'1. 파일 다운로드 처리에 필요한 변수 정의
Dim objDown, strConn, strSQL, objDBConn, objRs, bid, pWebPath, fileName, boardname

'2. 전송된 정보 확인
bid = Request("bid")
boardname = Request("boardname")
filename = Request("filename")

'3. 내려받기 횟수 업데이트
strConn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
strSQL = "UPDATE Board SET BDownNo = BDownNo+1 WHERE bid = " & bid
Set objDBConn = Server.CreateObject("ADODB.Connection")
objDBConn.Open strConn
objDBConn.Execute strSQL

'4. DB 연결 개체 소멸
objDBConn.Close
Set objDBConn = Nothing

'5. 파일 다운로드 처리
Set objDown = Server.CreateObject("TABS.Download")
objDown.FilePath = server.MapPath("/pds/" & fileName)
objDown.FileName = fileName
objDown.MimeType = "application/x-zip-compressed"  '강제 다운로드를 위해 웹브라우저가 인식못하는 마임타입 설정
objDown.TransferFile true

'6. 탭스 다운로드 개체 소멸 후 내려받기 창 닫기
Set objDown = Nothing
%>