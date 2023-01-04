#cs
AUTOIT PROGRAM
Run ('notepad')
WinWaitActive('Untitled - Notepad')
Send('Welcome to J2team')
*Kiểu dữ liệu:
1.number(số)
2.String(chuỗi)- nháy kép hoặc nháy đơn
số nằm trong nháy thì cũng là chuỗi
Trong nháy mà có nháy thì x2 nháy vào hoặc trong nháy kép thì ngoài nháy đơn và ngược lại
3.Boolean(logic)
True or false
số 0 là false còn khác 0 thì sẽ là true
4.Binary(nhị phân)
các byte biểu diện hệ thập lục phân trong 1 biến chuỗi
0x616263
Pointer(con trỏ)
*Biến( Variables)
Mỗi biến bắt đầu bằng dolla: $username,$myEmail...
thêm tùy chọn Autosetoption('mustdeclarevars' 1))
Hằng:Chính là 1 biến nhưng k được thay đổi giá trị sau khi khai báo
Const $Author = 'Venus'
Hằng thì ko được ghi đè, có thể dùng để ghi tên tác giả, cấu hình của chương trình,...
Mảng:Là một biến có nhiều dữ liệu, nhiều phần tử
#include <Array.au3>
Global $member = [1,2,3]
Global $member[] = [1,2,3]
Global $member = [123,'venus',True]
MsgBox(0,0,$member[*] Dùng để lấy phần tử thứ * trong mảng, bắt đầu từ 0
*Macro
Biến được định nghĩa trước bởi autoit cung cấp khả năng truy cập vào các thông tin của hệ thống
Chỉ có thể đọc chứ không ghi đè được
bắt đầu bằng @
Global $path = @ScriptFullPath
MsgBox(0,0,$path)
*Toán tử
là công cụ dùng để thực hiện các phép tình chức năng
1.Toán tử gán giá trị
Global $a = 1
Global $b = 'J2team'
2 Toán tử nối giá trị: &
Global $username = 'Venus'
$username = $username & '-PhamDucDat'
MsgBox(0 ,0 ,$username)
3. Toán tử toán học: +_*/^
Global $sum = 3^2
MsgBox(0,0, $sum)
4. Toán tử so sánh
Global $a = 'ddd', $b = 'ddd'
Global $compare = $a == $b
<> : so sánh khác
>= <= lớn hơn nhỏ hơn bằng
MsgBox(0,0, $compare)
5. Toán tử logic and or not
&& And
|| Or
! Not
6. Toán tử điều kiện
Global $result = (điều kiện)?(Gía trị khi điều kiện đúng) : ( Gía trị khi điều kiện sai)
* Câu điều kiện
1. if ....then
....
else
if < điều kiện> then
thực hiện điều gì đó nếu điều kiện đúng
EndIf
Global $username = 'admin'
Global $password = '121212111'
If $username == 'Venus' And $password == '12121212' Then
	MsgBox (0,'comfirm', 'Đăng nhập thành công')
ElseIf $username == 'admin' And $password == '121212' Then
	MsgBox (0,0, 'Đã đăng nhập vào tài khoản admin')
Else
	MsgBox (0,'comfirm', 'Tên người dùng hoặc mật khẩu không chính xác')
EndIf
2. select case
select
	case< điều kiện >
		thực hiện điều gì đó nếu điều kiện đúng
..
Endselect
(***)Khi nào dùng ifelse và khi nào dùng select:
if else thì dùng để kiểm tra khi có ít điều kiện
select gùng khi có rất nhiều trường hợp kiểm tra n case
Global $username = 'admin'
Global $password = '121212'
Select
	Case $username == 'Venus' And $password == '12121212'
		MsgBox (0,0, 'Đăng nhập thành công')
	Case $username == 'admin' And $password == '121212'
		MsgBox (0,0, 'Đã đăng nhập vào trang quản trị')
	Case Else
		MsgBox (0,0, 'Tên người dùng hoặc mật khẩu không chính xác')
		;thực hiện điều gì đó nếu các điều kiện trên điều sai
EndSelect
3. switch case
Phân biệt switch vs select
là switch có thể kiểm tra được khoảng giá trị
Local $sMsg = ""

Switch @HOUR
        Case 6 To 11
                $sMsg = "Good Morning"
        Case 12 To 17
                $sMsg = "Good Afternoon"
        Case 18 To 21
                $sMsg = "Good Evening"
        Case Else
                $sMsg = "What are you still doing up?"
EndSwitch
MsgBox(0,"",$sMsg)
4. ternary
<Điều kiện>?<Gía trị khi điều kiện đúng : Gía trị khi điều kiện sai>
Cũng tương tự if else nhưng gọn hơn.
MsgBox(0,0, @HOUR > 24 ? 'Good morning' : 'Good evening')
*Vòng lặp
1. For ... next
Global $color = ['red', 'black', 'green', 'yellow']
;~ For $i = 0 To 9 Step 1
;~ 	;các câu lệnh mà bạn muốn thự hiện
;~ 	ConsoleWrite($i & '.Hello' & @CRLF)
;~ Next
;~ --step là nhảy bao nhiêu bước và có thể nhảy âm
;~ và phải đổi số từ to đến nhỏ
For $i = 0 To 3
	ConsoleWrite($color[$i] & @CRLF)
Next
2. While... Wend
Global $member = ['Juno_okyo','James','K-20','Killer','Neo','Hackerz','Viet Thao', 'Su' ]
Global $i = 0
While $i < 8
	ConsoleWrite($i & '.' & $member[$i] & @CRLF)
	$i+=1
WEnd
Global $password
While $password <> '12345678'
	$password = InputBox('Đăng nhập','Vui lòng nhập mật khẩu:')
WEnd
;Câu lệnh ngoài vòng lặp sẽ được thực thi
MsgBox(0, 'Thông báo', 'Đăng nhập thành công')

3. Do... until
Global $member = ['Juno_okyo','James','K-20','Killer','Neo','Hackerz','Viet Thao', 'Su' ]
Global $i = 0
Do
	ConsoleWrite($member[$i] & @CRLF)
	$i += 1
Until $i = 8
Global $member = ['Juno_okyo','James','K-20','Killer','Neo','Hackerz','Viet Thao', 'Su' ]
Global $i = 0
Do
	;Thực hiện các câu lệnh sau cho đến khi i đến 8
	MsgBox(0,'Info','Gía trị hiện tại của i là:' & $i)
	$i += 1
Until $i = 8
Global $password
Do
	$password = InputBox ('Đăng nhập', 'Vui lòng nhập mật khẩu')
	;các câu lệnh muốn thực hiện cho đến khi điều kiện chưa đúng
Until $password == '123123123'
;câu lệnh ngoài vòng lặp
MsgBox(0, 'Thông báo',' Đăng nhập thành công!')

4. For ,... In ....Next
Khi làm việc với các phần tử trong mảng
Global $members = ['Juno_okyo','James','K-20','Killer','Neo','Hackerz','Viet Thao', 'Su' ]
For $cac_thanh_vien In $members
	ConsoleWrite($cac_thanh_vien & @CRLF)
Next
Global $colors = ['red', 'black', 'green', 'yellow']
For $color In $colors
	;Làm gì đó với $color
	ConsoleWrite($color & @CRLF)
Next
*Hàm
Là một đoạn mã có thể được gọi từ chương trình để thực hiện một chức năng nào đó
Có 2 loại hàm:
***Hàm dựng sẵn:
MsgBox(0, 'Info', 'Hello world!')
ConsoleWrite('Hello J2TEAM')
ClipPut('Hello Venus')
: ChipPut lưu dữ liệ vào bộ nhớ tạm để paste
***Hàm định nghĩa bởi người dùng được khai báo bằng mệnh đề Function và endFunction
;Hàm này không có tham số và không trả về dữ  liệu
Func main()
	;trong này là tập hợp các câu lệnh mà hàm sẽ thực thi
	Run('notepad')
	Sleep(2000)
	Send('From j2team with love')
EndFunc
main()
;Đây là hàm có tham số và không trả về dữ liệu
Func sayHello($name)
	MsgBox(0, 'Info', 'Hello ' & $name)
EndFunc
sayHello('Juno_okyo')
;Đây là 1 hàm có tham số và có trả về dữ liệu
Func caculator($a,$b)
	Return $a + $b
EndFunc
Global $result = caculator (10,16)
MsgBox(0, 'Kết quả là:', $result)
;Đây là hàm không có tham số nhưng có trả về dữ liệu
Func getYear()
	Return 'Năm nay là năm: ' & @YEAR
EndFunc
MsgBox(0, 'Info', getYear())
*** Hàm trả về dữ liệu sẽ có return
Các hàm có thể chấp nhận tham số và trả về theo yêu cầu
* Phạm vi của biến
Global có thể truy cập được từ mọi vị trí trong chương trình
Local trong function thì chỉ có thể truy cập được từ bên trong hàm
Global $a = 1234 ;phạm vi toàn bộ chương trình
Func test()
	Local $b = 5678 ; phạm vi local nội bộ hàm
	Return 'Gía trị của biến a :' & $a & @CRLF & 'Gía trị của biến b là: ' & $b
EndFunc
MsgBox(0, 'Info', 'Gía trị của $b là : ' & $a)
Mẹo: Nếu khai báo biến thì nếu biến trong hàm, câu điều kiện,... thì khai báo local, còn ngoài thì khai báo global
* Chú thích và chỉ thị trong autoit
Mọi dòng chú thích đều được trình biên dịch bỏ qua
Dùng dấu ; hoặc đoạn #cs và #ce
Có thể dùng để tạo phần mô tả author cho chương trình
Chỉ thị nói cho autoit biết chương trình hoạt động theo cách nào đó
Bắt đầu bằng dấu #
#NoTrayIcon ;không hiện icon dưới tasbar khi run
#RequireAdmin ; chạy dưới quyền quản trị viên
MsgBox(0, 0, 'Hello')
Tra chỉ thị bằng cách nhấn F1 tìm directives
#include ; tác dụng định nghĩa thư viện
#include <Array.au3>
Global $color = ['red', 'blue', 'green']
_ArrayDisplay($color)
Có thể khai báo thêm thư viện :
;Khai báo và lưu vào 1 file tên myArray.au3
Func _ArrayShow($array)
	For $element In $array
		ConsoleWrite($element & @CRLF)
	Next
EndFunc
;Gọi về
#include <myArray.au3>
Global $color = ['red', 'blue', 'green']
_ArrayShow($color)
Nếu thu viên arrayShow năm ngoài thư mục vs file gọi về thì phải dẫn đường dẫn tuyệt đối

#ce
MsgBox(0, 'Welcome', 'Hello world')







































