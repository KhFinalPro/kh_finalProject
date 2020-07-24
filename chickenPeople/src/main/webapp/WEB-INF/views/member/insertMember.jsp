<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
    <head>
        <title></title>
        <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="/resources/js/addressapi.js"></script>
        <style>
            #memberJoin{
                width: 700px;
                margin: 0 auto;
                margin-top: 200px;
            }
            #logintable{
                margin: 0;
                padding:0;
                width: 700px;
                border-top: 1px solid #444444;
                border-collapse: collapse;
            }
            .ltd {
                border-bottom: 1px solid #444444;
                padding: 10px;
            }
            #lab{
                background-color: #2ac1bc;
                color: black;
                text-align: center;
                padding: 10px;   
            }
            #inp{
               padding: 10px;
               padding-left: 110px;
               padding-right: 100px;
            }
            tr td input{
                border-radius: 5px;
                height: 30px;
                width: 280px;
            }
            #checkAll{
               zoom: 2.0;
            }
           div select{
              height: 30px;
              border-radius: 5px;
              width: 80px;
              float: left;
              margin-left: 3px ;
           }
           #h2{
               margin-left: 20px;
           }
           #h3{
               float: left;
               margin-left: 20px;
           }
           #hh5{
               float:right;
               margin-bottom: 0;
               color: lightgray;
           }
           #agr{
               
               margin-left: 20px;
           }
           .container {
                width: 500px;
                height: 200px;
                overflow: auto;
                border: 1px solid black;
                border-radius: 10px;
            }
            .container::-webkit-scrollbar {
                width: 10px;
            }
            .container::-webkit-scrollbar-thumb {
                background-color: white;
                border-radius: 10px;
                background-clip: padding-box;
                border: 2px solid transparent;
            }
            .container::-webkit-scrollbar-track {
                background-color: black;
                border-radius: 10px;
                box-shadow: inset 0px 0px 5px white;
            }
            input::-webkit-input-placeholder { 
                color: lightgray; 
            }
            
        </style>
    </head>
    <body>
    <jsp:include page="../common/header.jsp"/>
        <form id="memberJoin" method="post" action="memberJoin.do">
            <h2 id="h2">회원가입</h2>
            <table id="logintable">
                <tr>
                    <td id="lab" class="ltd">
                        <label>아이디</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input type="text" id="id" name="id" required placeholder="4글자 이상 12글자 이하 영문자(소문자)와 숫자">
                        <input type="button" id="idChk" value="중복확인" style="width: 70px; background: #2ac1bc; color: white; border: none;">
                        <input type="hidden" value="N" id="checkCheck">
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd">
                        <label>비밀번호</label>
                    </td>
                    <td id="inp" class="ltd"> 
                        <input type="password" id="pwd" name="pwd" required placeholder="6글자 이상 18글자 이하 영문자(소문자)와 숫자">
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd"> 
                        <label>비밀번호 확인</label>
                    </td>
                    <td id="inp" class="ltd"> 
                        <input type="password" id="pwd_check" name="pwd_check" required>
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd">
                        <label>이름</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input type="text" id="name" name="name" required placeholder="한글로 2글자 이상">
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd">
                        <label>이메일</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input type="email" id="email" name="email" required>
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd">
                        <label>휴대폰</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input type="tel" id="tel" name="tel" required placeholder="-제외 하고 입력">
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd">
                    <label>우편번호</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="post" id="post" type="text" readonly="readonly" >
    					<button type="button" style="height: 30px; border-radius: 4px; width: 100px; background: #2ac1bc; color: white; border: none;" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>   
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd">
                        <label>도로명 주소</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr1" id="addr1" type="text" readonly="readonly" />
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd">
                        <label>상세 주소</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input class="form-control" placeholder="상세주소" name="addr2" id="addr2" type="text"  />
                    </td>
                </tr>
            </table>
            <br>
            <h5 id="agr">약관동의</h5>
            <hr>
            <input type="checkbox" id="checkAll">
            <label style="font-size: 18px;">치킨의민족의 모든 약관을 확인하고 동의합니다.</label>
            <label style="font-size: 13px; color: lightgray;">(전체동의, 선택항목도 포함됩니다.)</label>
            <ul>
                <ul>
                    <li style="list-style: none;">
                        <input type="checkbox" id="check1" name = "agree_chk" class="infoBox">
                        <label>(필수)이용약관</label>
                        <lable><a href="memberJoinAgreement.jsp">전체보기</a></lable>
                    </li>
                    <br>
                    <ul>
                        <li style="list-style: none;">
                            <div class="container">
                                <pre>
                                    치킨의민족 이용약관
제1조 (목적)
본 약관은 유한책임회사 딜리버리히어로코리아(이하 “회사”라 함)가 운영하는 치킨의민족 사이트(www.치킨의민족.co.kr) 또는 “요기요” 모바일 애플리케이션에서 제공하는 서비스(이하 “서비스”라 함)를 이용함에 있어 “요기요”와 이용자의 권리, 의무 및 책임 사항을 규정함을 목적으로 합니다.
제2조 (정의)
① “치킨의민족”란 회사가 “서비스”를 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역(이하 “재화 등”이라 함)을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 “요기요”를 운영하는 사업자의 의미로도 사용합니다.
② “치킨의민족서비스”란 회사가 운영하는 사이트나 모바일 애플리케이션을 통해 이용자가 원하는 재화 등을 주문하면, 주문이 완료된 재화 등을 가맹점이 이용자에게 배달하는 서비스를 기본으로 하되, 배달대행, 테이크아웃 등 “요기요” 사이트 및 모바일 애플리케이션 상의 제공 서비스 전체를 의미합니다.
③ “이용자”란 “치킨의민족”에 접속하여 본 약관에 따라 치킨의민족 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
④ “회원”이라 함은 “치킨의민족”에 개인정보를 제공하여 회원등록을 한 자로서, “치킨의민족”의 정보를 지속적으로 제공받으며, “요기요”가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
⑤ “비회원”이라 함은 회원에 가입하지 않고 “치킨의민족”가 제공하는 서비스를 이용하는 자를 말합니다.
⑥ “가맹점”이란 회사와 가맹계약을 맺고 정보통신단말기를 설치하여 회사가 운영하는 치킨의민족서비스에서 재화 등을 공급하는 사업자를 말하며, 회사의 대리인이나 피용자로 간주되지 아니합니다.
⑦ “쿠폰”이란 치킨의민족서비스에서 명시된 금액 혹은 비율만큼 할인을 받을 수 있는 일련의 숫자 및 영문자로 되어 있는 코드를 말합니다.
⑧ 본 약관에서 정의되지 않은 용어는 관련법령이 정하는 바에 따릅니다.
제3조 (약관의 명시와 설명 및 개정)
① “요기요”는 본 약관의 내용과 상호, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편 주소 등), 통신판매업신고번호, 개인정보관리책임자 등을 이용자가 알 수 있도록 “요기요” 쇼핑몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
② “요기요”는 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회 ∙ 배송책임 ∙ 환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
③ “요기요”는 「전자상거래 등에서의 소비자 보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자거래기본법」, 「전자서명법」, 「정보통신망이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자보호법」 등 관련법을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.
④ “요기요”가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 “요기요”의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 “요기요”는 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
⑤ “요기요”가 약관을 개정할 경우에는 개정약관의 효력발생일 이후 회원이 서비스를 이용하는 경우, “요기요”는 회원이 개정약관에 동의한 것으로 봅니다.
⑥ 개정 약관조항은 개정 약관의 적용일자 이후에 체결된 계약에 한하여 적용되는 것을 원칙으로 합니다. 다만, “요기요”가 지정하는 방식에 따라 회원이 동의를 한 경우에는 개정약관 조항이 적용됩니다.
⑦ 변경된 약관에 대한 정보를 알지 못해 발생하는 이용자의 피해는 “요기요”에서 책임지지 않습니다. 단, 회원이 개정 약관에 동의하지 아니할 때에는 회원은 “요기요”에 대하여 회원의 탈퇴 기타 이용계약을 해지할 수 있습니다.
⑧ 본 약관에서 정하지 아니한 사항과 본 약관의 해석에 관하여는 「전자상거래 등에서의 소비자 보호에 관한 법률」, 「약관의 규제에 관한 법률」, 공정거래위원회가 정하는 「전자상거래 등에서의 소비자 보호지침」 및 관계법령 또는 상관례에 따릅니다.
제4조 (서비스의 제공 및 변경, 개별적 중단)
① “요기요”는 다음과 같은 업무를 수행합니다.
1. 재화 등과 관련한 전자상거래 중개 및 배달대행
2. 재화 등 또는 관련 용역에 대한 정보 제공 및 구매계약의 체결
3. 기타 “요기요”가 정하는 업무
② “요기요”는 재화 등의 품절 또는 기술적 사양의 변경 등의 사유가 발생하는 경우 장차 체결되는 계약에 의해 제공할 요기요서비스의 내용을 변경할 수 있으며, 오로지 가맹점의 사정(가맹점의 고의나 과실로 “요기요” 사이트에 재화 등의 메뉴 업데이트가 이루어지지 않는 것을 포함하나 이에 한하지 아니함)으로 인해 해당 관련 서비스의 중단이 불가피한 사정이 있는 경우에는 이미 체결된 계약의 해당 주문 건에 대한 서비스를 개별적으로 중단할 수 있습니다. 위 각 경우에는 변경된 재화 등의 내용 및 제공일자를 명시하여 현재의 재화 등의 내용을 게시한 곳에 즉시 공지합니다.
③ “요기요”가 이용자와 계약을 체결한 서비스의 내용을 전항의 사유로 변경하거나 중단할 경우에는 그 사유를 이용자에게 통지 가능한 연락처(주소, 전자우편, 전화 등)로 즉시 통지합니다.
④ 전항의 경우 “요기요”는 이로 인하여 이용자가 입은 손해를 배상합니다. 단, “요기요”가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
제5조 (서비스의 중지)
① “요기요”는 다음 각 호 중 어느 하나에 해당하는 사유가 발생하는 경우에는 이용자의 서비스 이용을 제한하거나 중지할 수 있습니다.
1. 컴퓨터 등 정보통신설비의 보수점검 ∙ 교체 및 고장
2. 「전기통신사업법」에 규정된 기간통신사업자가 전기통신 서비스를 중지하는 등 통신의 두절
3. 국가비상사태, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 서비스 이용에 지장이 있는 경우
4. 기타 중대한 사유로 인하여 회사가 서비스 제공을 지속하는 것이 부적당하다고 인정하는 경우
② 제1항에 의한 서비스 중지의 경우에는 “요기요”는 제9조에 정한 방법으로 이용자에게 통지합니다.
③ “요기요”는 제1항의 사유로 서비스의 제공이 일시적으로 중지됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “요기요”에 고의 또는 과실이 없는 경우에는 그러하지 아니합니다.
제6조 (회원가입)
① 이용자는 “요기요”가 정한 가입 양식에 따라 회원정보를 기입한 후 본 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
② “요기요”는 제1항과 같은 회원가입 신청에 대하여 승낙함으로써 회원가입계약이 성립하며, 다음 각 호 중 어느 하나에 해당하는 이용자의 회원가입 신청에 대해서는 이를 거부할 수 있습니다.
1. 가입신청자가 본 약관 제9조 제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제9조 제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “요기요”의 회원 재가입 승낙을 얻은 경우에는 예외로 합니다.
2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
3. 기타 회원으로 등록하는 것이 “요기요”의 기술상 현저히 지장이 있다고 판단되는 경우
③ 회원가입계약의 성립시기는 “요기요”의 승낙이 회원에게 도달한 시점으로 합니다.
④ 회원은 제18조 제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 “요기요”에 대하여 그 변경사항을 알려야 합니다.
⑤ 개인정보 보호를 위하여 만 14세 미만 아동의 회원 가입은 제한됩니다.
⑥ 외국인 또는 해외교민은 “회사”가 제공하는 가입조건을 만족할 경우, 가입이 가능합니다.
제7조 (회원의 권리)
① 회원으로 등록하시면 요기요서비스의 모든 메뉴를 제약 없이 사용하실 수 있습니다.
② “요기요”가 제공하는 다양한 생활정보 서비스와 각종 이벤트에 참가할 자격이 주어집니다.
③ 요기요서비스의 최신정보와 혜택 수신을 원하는 경우에는 전자우편/ 서신우편/ 문자메시지/ 앱푸쉬 등의 매체로 받아보실 수 있습니다.
제8조 (서비스 이용요금)
① 회사가 제공하는 서비스는 기본적으로 무료입니다.
② 회사는 유료 서비스 이용요금을 회사와 계약한 전자지불업체에서 정한 방법에 의하거나 회사가 정한 청구서에 합산하여 청구할 수 있습니다.
③ 유료서비스 이용을 통하여 결제된 대금에 대한 취소 및 환불은 회사의 결제 이용약관 등 관계법에 따릅니다.
④ 이용자의 정보도용 및 결제사기로 인한 환불요청 또는 결제자의 개인정보 요구는 법률이 정한 경우 외에는 거절될 수 있습니다.
⑤ 무선 서비스 이용 시 발생하는 데이터 통신료는 별도이며 가입한 각 이동통신사의 정책에 따릅니다. MMS 등으로 게시물을 등록할 경우 발생하는 요금은 이동통신사의 정책에 따릅니다.
제9조 (휴면계정 전환, 회원 탈퇴 및 자격 상실 등)
① “요기요”는 회원이 자신 계정의 마지막 로그인 일시로부터 1년이 초과되는 시점까지 다시 로그인을 하지 않은 경우, 해당 회원의 계정을 휴면계정으로 전환합니다. 또한 전환과 동시에 “요기요” 개인정보처리방침에 따라 해당 회원의 개인정보는 3년 간 보관되며, 해당 기간에 한하여 계정 복구도 가능합니다.
② 회원은 “요기요”에 언제든지 탈퇴를 요청할 수 있으며 “요기요”는 해당 요청을 받는 즉시 회원탈퇴를 처리합니다. 단, 회원 재가입, 임의해지 등을 반복적으로 행함으로써 “요기요”가 제공하는 각종 할인쿠폰, 이벤트 혜택 등의 경제상의 이익을 편법적으로 수취하는 것을 방지하기 위하여 “요기요”는 개인정보처리방침에 따라 해당 회원의 개인정보를 90일 간 보관합니다.
③ “요기요”는 회원이 다음 각 호에 해당되는 경우 별도의 통보절차 없이 회원의 자격을 정지할 수 있습니다.
1. 회원가입 신청이나, 회원정보의 변경 시 허위내용을 작성한 경우
2. 타인의 명의를 임의로 사용하는 경우
3. 타인에게 피해를 주거나 기타 미풍양속을 현저히 저해하는 행위를 한 경우
4. 요기요서비스에 제공되는 정보를 변경 및 수정하는 등 요기요서비스의 정상적인 운영을 고의 또는 중과실로 방해하는 행위를 한 경우
5. 요기요서비스를 이용하여 구입한 재화 등의 대금, 기타 메뉴 몰의 이용에 관련하여 회원이 부담하는 채무를 기일 내에 지급하지 않는 경우
6. “요기요”에 귀속하는 저작권 등 지적재산권을 침해한 경우
7. “요기요”의 명예를 대외적으로 훼손시켰다고 인정되는 경우
8. 기타 “요기요”가 정한 회원가입요건이 미비 되었거나 회원으로서의 자격을 지속시키는 것이 부적절하다고 판단되는 경우
9. 기타 본 약관에 위반한 행위를 한 경우
④ “요기요”가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 본 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.
제10조 (회원에 대한 통지)
① “요기요”가 회원에 대한 통지를 하는 경우, 회원이 “요기요”와 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.
② “요기요”는 불특정다수 회원에 대한 통지의 경우 1주일 이상 “요기요” 게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.
제11조 (“요기요”와 “요기요” 연결 사이트 간의 관계)
① “요기요”는 “요기요” 연결 사이트가 취급하는 재화 등에 대하여 보증책임을 지지 않습니다.
② “요기요”와 “요기요” 연결 사이트는 독자적으로 가맹점을 운영하는 것으로 “요기요”는 “요기요” 연결 사이트와 이용자 간에 행해진 거래에 대하여 어떠한 책임도 지지 않습니다.
제12조 (구매신청)
“요기요” 이용자는 “요기요” 상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “요기요”는 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. 단, 회원인 경우 제2호 내지 제4호의 적용을 제외할 수 있습니다.
1. 재화 등의 검색 및 선택
2. 성명, 주소, 전자우편주소, 전화번호(또는 이동전화번호) 등의 입력
3. 약관내용, 청약철회권이 제한되는 서비스, 배달료 등의 비용부담과 관련한 내용에 대한 확인
4. 본 약관에 동의하고 위 3호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)
5. 재화 등의 구매신청 및 이에 관한 확인 또는 “요기요”의 확인에 대한 동의
6. 결제방법의 선택
제13조 (계약의 성립)
① “요기요”는 다음 각 호에 해당하는 경우 제12조의 구매신청을 승낙하지 않을 수 있습니다.
1. 신청 내용에 허위, 기재누락, 오기가 있는 경우
2. 미성년자가 담배, 주류 등 「청소년보호법」에서 금지하는 재화 등을 구매하는 경우
3. 기타 구매신청에 승낙하는 것이 “요기요” 기술상 현저히 지장이 있다고 판단하는 경우
② “요기요”의 승낙이 제15조 제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.
③ “요기요”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.
④ 미성년자가 제12조의 구매신청을 하는 경우, 법정대리인이 구매 금액에 대한 처분을 사전에 동의한 것으로 간주하여 유효한 구매신청으로 판단합니다. 다만, 이미 재화 등이 조리 또는 배달된 경우를 제외하고, 해당 구매신청에 대하여 법정대리인의 동의가 없는 경우, 미성년자 본인 또는 법정대리인은 해당 구매신청을 취소할 수 있습니다.
제14조 (이용자의 대금지급방법)
“요기요”에서 구매한 재화 등에 대한 대금지급방법은 다음 각 호의 방법 중 가용한 방법으로 할 수 있습니다. 단, “요기요”는 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.
1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체
2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제
3. 온라인무통장입금
4. 전자화폐에 의한 결제
5. 수령 시 대금지급
6. 마일리지 등 “요기요”가 지급한 포인트에 의한 결제
7. “요기요”와 계약을 맺었거나 “요기요”가 인정한 상품권에 의한 결제
8. 기타 전자적 지급 방법에 의한 대금 지급 등
제15조 (주문성공의 통지 및 구매신청 변경 및 취소)
① 이 “요기요” 기술상 현저히 지장이 있다고 판단하는 경우”요기요”는 이용자의 구매신청이 있는 경우, 구매정보가 가맹점에 정확히 전달되면 이용자(또는 회원)와 가맹점에 주문 성공 메시지를 전송하여 통지를 합니다.
② 확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 확인통지를 받은 후 즉시, 직접 “요기요” 연락처로 구매신청 변경 및 취소를 요청할 수 있습니다. 단, 이용자의 귀책사유로 인한 구매신청의 변경 또는 취소는 가맹점의 사정에 따라 받아들여지지 아니할 수 있으며, 이로 인하여 이용자에게 발생하는 손해에 대하여 “요기요”는 고의 또는 과실이 없는 한 책임을 부담하지 않습니다.
③ 신용카드에 의한 결제에 따른 지급의 경우에 신용카드회사가 “요기요”에 대하여 신용카드의 연체, 무효 또는 기타 사유로 인한 지급 불능 등을 통지한 경우, “요기요”는 회원 등 이용자에게 지급방법의 변경 여부 등에 관한 확인을 할 수 있습니다. 회원 등 이용자가 제공한 주소, 전화번호 또는 전자우편 주소를 통하여 이러한 확인에 이르지 못하는 경우, “요기요”는 당해 회원 등 이용자와의 카드결제를 통한 매매계약을 취소할 수 있습니다.
제16조 (배달)
① “요기요”는 이용자의 주문내용 정보와 고객의 결제내역에 대한 정보를 가맹점에 정확히 전달함으로 책임을 다하며, 가맹점이 배달을 완료합니다.
② 가맹점의 배달은 예약주문의 경우는 예약 시간 내에 배달을 완료하고, 실시간 주문의 경우는 재화 등의 주문정보가 전달된 때로부터 1시간 내로 배달을 완료함을 원칙으로 하되, 각 가맹점의 사정에 따라 차이가 있을 수 있습니다.
③ “요기요”는 이용자가 구매한 재화 등이 시간을 초과하여 배달되거나 약속한 시간 내에 배달되지 않음으로 인한 이용자의 손해를 배상할 의무가 없으며 배달지연에 대한 책임은 가맹점에서 집니다.
④ 해당 가맹점의 고의 또는 과실로 약정 배달시간을 초과한 경우에는 그로 인한 이용자의 손해를 해당 가맹점에서 배상합니다.
⑤ 본 조의 내용에도 불구하고 “요기요”가 이용자에게 배달대행 서비스를 제공하는 경우에는 제35조가 우선하여 적용됩니다.
제17조 (환불, 반품 및 교환)
① “요기요”는 이용자가 구매 신청한 재화 등을 부득이 한 사정으로 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고, 이미 대금을 받은 경우에는 대금을 받은 후 3일 이내에 환급절차를 취합니다.
② 다음 각 호의 경우에는 가맹점은 배달된 또는 수령한 재화 등일지라도 재화 등을 반품 받은 날의 다음 영업일 이내에 이용자의 요구에 따라 즉시 환급, 반품 및 교환 조치를 합니다. 다만, 이용자의 환급, 반품 및 교환 요구기한은 재화 등이 배달된 또는 수령한 당일로 한정됩니다.
1. 배달된 또는 수령한 재화 등이 주문내용과 현저히 상이할 경우
2. 배달된 또는 수령한 재화 등이 변질, 손상되었거나 오염되었을 경우
③ 전항에 따라 재화 등의 구매가 취소된 경우 재화 등의 반환에 필요한 일체의 비용은 가맹점이 부담합니다.
④ 이용자가 주문이 최종적으로 완료되기 전에 인터넷 창을 닫는 등의 사용방법을 충분히 숙지하지 못하여 발생하는 주문의 실패에 대해서 “요기요”는 책임지지 않습니다.
제18조 (개인정보보호)
요기요”는 이용자의 개인정보 보호를 위하여 별도의 개인정보처리방침을 마련하였으므로, 구체적인 내용은 해당 개인정보처리방침을 확인하여 주시기 바랍니다.
제19조 (“요기요”의 의무)
① “요기요”는 법령과 본 약관이 금지하거나 공서양속(사회의 일반적 도덕 및 기타 사회의 공공적 질서)에 반하는 행위를 하지 않으며 본 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화 등을 제공하는 데 최선을 다하여야 합니다.
② “요기요”는 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.
③ “요기요”의 재화 등에 대해 “요기요”의 고의 또는 과실로 인하여 「표시·광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시·광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다. 단, 가맹점의 부당한 표시 ∙ 광고행위로 인한 이용자의 손해에 대해서는 “요기요”가 책임을 부담하지 아니합니다.
제20조 (회원의 ID 및 비밀번호에 대한 의무)
① 제18조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.
② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 아니 되며, 회원이 이를 위반하여 발생하는 손해에 대해서는 “요기요”가 책임을 부담하지 아니합니다.
③ 회원이 자신의 ID 및 비밀번호를 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “요기요”에 통보하고 “요기요”의 안내가 있는 경우에는 그에 따라야 합니다.
제21조 (이용자의 의무)
이용자는 다음 행위를 하여서는 안됩니다.
1. 신청 또는 변경 시 허위내용의 등록
2. 타인의 정보 도용
3. “요기요”에 게시된 정보의 변경
4. “요기요”가 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시
5. “요기요” 및 기타 제3자의 저작권 등 지적재산권에 대한 침해
6. “요기요” 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
7. 외설 또는 폭력적인 메시지·화상·음성 기타 공서양속(사회의 일반적 도덕 및 기타 사회의 공공적 질서)에 반하는 정보를 “요기요”에 공개 또는 게시하는 행위
8. 배달된 또는 수령한 재화 등에 대한 맛의 평가와 관련하여 의도적으로 악의적인 게시글을 올리는 행위
제22조 (“요기요”와 “요기요” 연결 사이트 간의 관계)
“요기요”는 “요기요” 연결 사이트가 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증책임을 지지 않는다는 뜻을 “요기요”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증책임을 지지 않습니다.
제23조 (저작권의 귀속 및 이용제한)
① “요기요”가 작성한 저작물에 대한 저작권 기타 지적재산권은 “요기요”에 귀속합니다.
② 게시물에 대한 권리와 책임은 게시자에게 있으며, “요기요”는 게시물에 대한 사용권한을 갖습니다. 이 경우 회사는 저작권법의 내용을 준수하며, 게시자는 언제든지 고객센터 또는 서비스 내 관리기능을 통해 해당 게시물에 대해 삭제, 검색 결과 제외, 비공개 등의 조치를 취할 수 있습니다.
③ “요기요”는 요기요서비스 내 게재 이외의 다른 목적으로 사용할 경우에는 저작권법에 따라 저작물의 이용허락을 받아야 하며, 게시물에 대한 게시자를 반드시 명시해야 됩니다.
④ 이용자는 “요기요”을 이용함으로써 얻은 정보 중 “요기요”에게 지적재산권이 귀속된 정보를 “요기요”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
⑤ “요기요”는 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.
⑥ “요기요”는 이용자의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다. 단, 회사의 귀책사유로 인한 것일 때에는 회사가 정한 바에 따라 이용자가 입은 손해에 대해 조치를 합니다.
⑦ “요기요”는 이용자가 주민등록법을 위반한 명의 도용 및 결제 도용, 저작권법 및 정보통신망 이용촉진 및 정보보호 등에 관한 법률을 위반한 불법통신 및 해킹, 악성프로그램의 배포 등과 같이 관련 법령을 위반한 경우에는 해당 이용자에 대해 즉시 영구이용정지를 할 수 있습니다. 본 항에 따른 영구 이용정지 시 해당 이용자가 보유 중인 이용할인쿠폰 및 기타 혜택 등도 모두 소멸되며, 회사는 이에 대해 별도로 보상하지 않습니다.
제24조 (게시물)
① 회사는 귀하가 작성하는 리뷰 등 게시물(이하 “게시물”이라 함)을 소중하게 생각하며 변조, 훼손, 삭제되지 않도록 최선을 다하여 보호합니다. 다만, 다음 각 호의 어느 하나에 해당하는 게시물에 대해서는 이용자에게 공개적 또는 개별적으로 경고한 후 삭제할 수 있습니다. 단, 상기 경고는 회사의 판단에 따라 생략할 수 있습니다.
1. 스팸(spam)성 게시물(예: 행운의 편지, 특정사이트 또는 가맹점의 광고 등)의 경우
2. 게시물의 내용에 욕설 및 타인 또는 타 가맹점에 대한 비방이 과도하게 포함된 경우
3. 게시물의 내용에 명백한 거짓 사실을 포함하고 있는 경우
4. 타인을 비방할 목적으로 허위 사실을 유포하여 타인의 명예를 훼손하는 글 또는 타 가맹점을 비방하는 게시물의 경우
5. 게시물이 회사 또는 제 3자의 상표권 또는 저작권 등 지적재산권을 침해하는 경우
6. 게시물에 첨부된 사진이 부적절한 경우(사진과 재화 등이 일치하지 않거나 게시물의 내용과 상관 없는 사진이 포함된 경우)
7. 기타 게시판 주제와 관련 없는 내용의 게시물 또는 사회통념 상인 경우
② 회사는 바람직한 게시판 문화를 활성화하기 위하여 동의 없이 타인 또는 타 가맹점의 정보를 게시물에 노출한 경우 또는 게시물에 욕설이 포함된 경우, 문제가 되는 부분을 삭제하거나 기호 등으로 수정할 수 있습니다.
③ 귀하의 게시물은 회사가 홍보나 마케팅 등의 목적을 위하여 별도의 대가지급 없이 이용할 수 있습니다.
④ 다른 주제의 게시판으로 이동 가능한 내용일 경우 해당 게시물에 이동 경로를 밝혀 오해가 없도록 하고 있습니다.
⑤ 근본적으로 게시물에 관련된 제반 권리와 책임은 작성자 개인에게 있습니다. 특히, 해당 게시물이 제3자의 저작권 등 권리를 침해하는 경우, 침해에 대한 모든 법적 책임은 작성자 개인이 집니다. 또한 게시물을 통해 자발적으로 공개된 정보는 보호받기 어려우므로 정보 공개 전에 심사숙고 하시기 바랍니다.
⑥ 귀하가 요기요서비스에서 탈퇴하는 경우, 회사는 귀하의 게시물을 귀하의 별도의 동의 없이 삭제할 수 있습니다. 또한 회사는 필요하다고 판단되는 경우, 해당 게시물을 삭제하지 않고 요기요서비스 내에 그대로 게시하거나 사업적 협력관계에 있는 제3자와 공유할 수 있는 권한을 가집니다.
제25조 (할인쿠폰 서비스)
① 회사는 구매서비스를 이용하는 회원에게 서비스 제공 시 일정 금액 또는 일정 비율을 할인 받을 수 있는 할인 쿠폰을 발급할 수 있습니다. 이 쿠폰은 회사에서 그 사용 대상, 사용 방법, 사용 기간, 할인 금액 등을 정할 수 있습니다. 할인쿠폰의 종류 또는 내용은 회사의 정책에 따라 달라질 수 있습니다.
② 회사는 할인쿠폰의 사용 대상, 사용 방법, 사용 기간, 할인 금액 등을 할인쿠폰 또는 서비스 화면에 별도로 표시하거나 통지합니다.
③ 회원은 할인쿠폰을 회원 본인의 구매에 사용할 수 있는 권한만을 가지며, 어떠한 경우에도 이를 타인에게 실질적으로 매매 또는 양도할 수 없습니다.
④ 할인쿠폰은 현금 및 현금화되는 수단으로 환급될 수 없으며, 할인쿠폰의 사용 기간이 만료되거나 이용계약이 종료되면 소멸합니다.
제26조 (정보의 제공)
① 회사는 서비스 이용에 관한 다양한 정보를 전자우편/ 서신우편/ 문자서비스/ 앱푸쉬 등의 방법으로 회원에게 제공할 수 있으며 회원은 수신을 거부할 수 있습니다.
② 회원이 전항에 의해 수신을 거부하는 경우, 회사는 서비스 이용에 필수적으로 요구되는 정보(예: 관련 규정/정책의 변경 등)를 홈페이지에 공시하는 방법으로 정보의 제공을 갈음할 수 있으며, 회원이 수신을 거부하고 홈페이지에 공시된 정보의 제공을 확인하지 아니함에 따라 발생하는 손해에 대해서 회사는 책임을 부담하지 아니합니다.
제27조 (광고성 정보 전송)
① 회사는 귀하의 명시적인 수신거부의사에 반하여 영리목적의 광고성 정보를 전송하지 않습니다.
② 회사는 귀하가 마케팅 정보 수신동의를 한 경우 마케팅성 매체(전자우편/서신우편/문자서비스/앱푸쉬)의 제목란 및 본문란에 다음 각 호와 같이 귀하가 쉽게 알아 볼 수 있도록 조치합니다.
1. 제목란: (광고)라는 문구를 제목란에 표시하지 않을 수 있으며, 본문란의 주요 내용을 표시합니다.
2. 본문란: 제목란에 표시하지 않은 경우 본문란에 (광고)표시를 하며, 귀하가 수신거부의 의사표시를 할 수 있는 전송자의 명칭, 수신거부 또는 수신동의 철회방법, 전화번호 및 주소를 명시합니다.
3. 귀하가 수신 거부의 의사를 쉽게 표시할 수 있는 방법을 명시합니다.
③ 회사는 재화 등의 정보 안내 등 온라인 마케팅을 위해 광고성 정보를 전자우편 등으로 전송하는 경우 전자우편의 제목란 및 본문란에 다음 각 호와 같이 귀하가 쉽게 알아 볼 수 있도록 조치합니다.
1. 전자우편의 제목란: (광고) 또는 (성인광고)라는 문구를 제목란의 처음에 빈칸 없이 한글로 표시하고 이어서 전자우편 본문란의 주요 내용을 표시합니다.
2. 전자우편의 본문란: 귀하가 수신거부의 의사표시를 할 수 있는 전송자의 명칭, 전자우편주소, 전화번호 및 주소를 명시합니다.
3. 귀하가 수신 거부의 의사를 쉽게 표시할 수 있는 방법을 한글 및 영문으로 각 각 명시합니다. 귀하가 동의를 한 시기 및 내용을 명시합니다.
④ 청소년에게 유해한 정보를 전송하는 경우에는 다음 각 호와 같이 “(성인광고)” 문구를 표시합니다.
1. 본문란에 다음 각 목의 어느 하나에 해당하는 것이 부호/문자/영상 또는 음향의 형태로 표현된 경우(해당 전자우편의 본문란에는 직접 표현 되어있지 아니하더라도 수신자가 내용을 쉽게 확인할 수 있도록 기술적 조치가 되어 있는 경우를 포함한다)에는 해당 전자우편의 제목란에 “(성인광고)” 문구를 표시합니다.
가. 청소년(19세 미만의 자를 말한다. 이하 같습니다)에게 성적인 욕구를 자극하는 선정적인 것이거나 음란한 것
나. 청소년에게 포악성이나 범죄의 충동을 일으킬 수 있는 것
다. 성폭력을 포함한 각종 형태의 폭력행사와 약물의 남용을 자극하거나 미화하는 것
라. 청소년보호법에 의하여 청소년 유해 매체물로 결정 고시된 것
2. 홈페이지를 알리는 경우에는 해당 전자우편의 제목란에 “(성인광고)” 문구를 표시합니다.
제28조 (위치기반서비스의 내용)
“요기요”는 이용자의 위치정보 보호 및 위치기반 서비스 이용을 위하여 별도의 위치기반 서비스 이용약관을 마련하였으므로, 구체적인 내용은 해당 위치기반 서비스 이용약관을 확인하여 주시기 바랍니다.
제29조 (서비스의 해제 · 해지 · 청약철회)
① 회원이 이용 계약을 해지하고자 할 때는 언제든지 “요기요” 홈페이지 상의 회원 탈퇴 신청을 통해 이용계약 해지를 요청할 수 있습니다. 단, 신규가입 후 일정시간 이내에는 서비스 부정이용 방지 등의 사유로 즉시 탈퇴가 제한될 수 있습니다.
② 회사는 회원이 본 약관에서 정한 회원의 의무를 위반한 경우 등 비정상적인 이용 또는 부당한 이용 등을 이유로 회원에게 사전에 고지하고, 계약을 해지할 수 있습니다. 다만, 회원이 현행법 위반 및 고의 또는 중대한 과실로 회사에 손해를 입힌 경우에는 사전 통보 없이 이용계약을 해지할 수 있습니다.
③ 회사는 회원이 원활하게 계약을 해지할 수 있도록 계약 체결 시 사용한 방법에 추가하여 계약 해지의 수단으로서 아래와 같은 방법을 제공합니다.
- 고객센터 전화: [1661-5270]
- 고객센터 팩스: [02-501-6098]
④ 유료서비스를 이용하는 이용고객은 관련법령에 따라 청약을 철회할 수 있습니다.
제30조 (손해배상)
① 회사가 법률 및 본 약관을 위반한 행위로 이용자에게 손해가 발생한 경우 이용자는 회사에 대하여 손해배상 청구를 할 수 있습니다. 이 경우 회사는 고의, 과실이 없음을 입증하지 못 하는 경우 책임을 면할 수 없습니다.
② “요기요”는 이용자와 가맹점 간의 재화 등 구매계약에 대해 중개 서비스를 제공할 뿐이므로, 이용자가 가맹점으로부터 구매하신 재화 등의 품질이나 가맹점의 신뢰도에 대해서는 보증하지 않습니다.
③ “요기요”는 이용자가 가맹점으로부터 구매한 재화 등에 대해 보증하거나 별도의 책임을 지지 않으며, 재화 등과 관련한 일체의 책임은 가맹점에게 있습니다.
④ 회사에게 손해배상을 청구하는 경우에는 청구사유, 청구금액 및 산출근거를 기재하여 서면으로 제출하여야 합니다.
제31조 (면책조항)
① 회사는 전시, 사변 등 국가 비상사태 및 천재지변 기타 이에 준하는 불가항력인 상황으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 대한 책임이 면제됩니다.
② 회사는 기간통신사업자 등 전기통신사업자가 전기통신 서비스를 중지하거나 정상적으로 제공하지 아니하여 손해가 발생한 경우에 대해서 회사의 고의 또는 중대한 과실이 없는 한 책임이 면제됩니다.
③ 회사는 사전에 공지된 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 서비스가 중지되거나 장애가 발생한 경우에 대해서 회사의 고의 또는 중대한 과실이 없는 한 책임이 면제됩니다.
④ 회사는 회원의 귀책사유로 인한 서비스 이용의 중지, 장애 또는 손해가 발생한 경우에 대해서 회사의 고의 또는 중대한 과실이 없는 한 책임이 없습니다.
⑤ 회사는 회원이 서비스를 이용하여 기대하는 수익을 얻지 못하거나 상실한 것에 대하여, 회사의 고의 또는 중대한 과실이 없는 한 책임이 없습니다.
⑥ 회사는 회원이 서비스를 이용하면서 얻은 정보나 자료로 인한 손해 및 타 회원으로 인해 손해가 발생한 경우에 대하여 회사의 고의 또는 중대한 과실이 없는 한 책임을 지지 않습니다.
⑦ 회사는 이용고객의 컴퓨터 오류에 의해 손해가 발생한 경우 또는 회원이 회원정보 또는 전자우편 주소를 부실하게 기재하여 손해가 발생한 경우에 대해서는 회사의 고의 또는 중대한 과실이 없는 한 책임을 부담하지 않습니다.
⑧ 회사는 회원이 서비스에 게재한 게시물 등 각종 정보의 신뢰도, 정확성 등 내용에 대하여 회사의 고의 또는 중대한 과실이 없는 한 책임을 부담하지 않습니다.
⑨ 회사는 사용 기간이 경과한 할인쿠폰, 포인트 등에 대하여 사용권을 보장하지 않습니다.
제32조 (분쟁해결)
① “요기요”는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치 ∙ 운영합니다.
② “요기요”는 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 줍니다.
③ “요기요”와 이용자간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시 ∙ 도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.
④ “요기요”는 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 개인정보분쟁조정위원회에 조정을 신청하거나 방송통신위원회에 재정을 신청할 수 있습니다.
제33조 (재판권 및 준거법)
① “요기요”와 이용자간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 따릅니다.
② “요기요”과 이용자간의 분쟁은 본 약관 및 한국법을 적용합니다.
제34조 (별정통신 서비스에 관한 공지 사항)
① 요기요서비스 중 전화주문 방식에 사용되는 050 개인번호 서비스는 델피콤㈜가 회사와의 제휴를 통하여 제공합니다.
② 050 개인번호 서비스 이용 시, 해당 번호는 이용자의 핸드폰에 해당 공급자의 상호명으로 자동 저장됩니다.
제35조 (배달대행 서비스에 관한 특칙)
① “배달대행 서비스”는 제16조 제1항과 달리 “요기요”가 가맹점을 대신하여 가맹점으로부터 재화 등을 수령하여 이용자에게 배달하는 서비스를 말합니다. “배달대행 서비스”가 제공되는 가맹점, 이용시간 및 배달지역 등 구체적인 서비스의 내용은 가맹점 및 위탁업체의 사정 등에 따라 별도로 정해집니다.
② “요기요”는 이용자에게 배달대행에 따른 배달요금을 부과할 수 있으며, 해당 요금은 배달거리, 배달시간 또는 이에 준하는 사정 등에 따라 결정됩니다. 다만, 가맹점 또는 교통 상황, 날씨, 배달대상 재화 등의 수량 또는 특성 등에 따라 배달요금이 변동될 수 있습니다.
③ 이용자는 배달대행 서비스 이용 시, 주문한 재화 등과 배달대행에 따른 배달요금을 분리하여 결제, 청약철회, 환불 등을 요구할 수 없습니다.
④ 배달대행 서비스 이용 시, 본 약관 제14조 제5호 소정의 결제수단(재화 등 수령 시 현금결제)은 제공되지 않습니다.
⑤ 이용자는 다음 각 호의 귀책사유로 주문한 재화 등을 수령하지 못하더라도 “요기요”에 대해 대금지급 또는 손해배상의 의무가 면제되지 않으며, “요기요”는 전달하지 못한 재화 등을 보관하거나, 재배달 또는 환불하지 아니합니다.
1. 이용자가 배달받을 장소를 이용자의 과실로 잘못 기재한 경우
2. “요기요”가 이용자와 연락하기 위한 합리적인 노력을 다하였음에도 불구하고 이용자와 연락이 되지 않아 객관적으로 재화 등을 전달하기 어려운 경우
⑥ 이용자는 “요기요”에게 배달대행 서비스와 객관적으로 관련없는 요청(담배∙주류 기타 “요기요서비스”로 주문하지 아니한 재화 등의 배달, 또는 쓰레기 처리 등)을 하여서는 안되며, “요기요”는 그러한 이용자의 요청을 거절할 수 있습니다.
⑦ “요기요”가 이용자에게 배달대행 서비스를 제공하더라도, “요기요”의 귀책사유가 있거나 배달 과정에서 발생한 경우를 제외하고는 아래 각 호의 사항에 대하여 “요기요”가 가맹점의 책임을 대신하여 부담하지 아니합니다.
1. 배달된 재화 등의 내용, 수량 등이 이용자의 주문정보와 상이한 경우
2. 재화 등의 제조·조리상 하자
3. 재화 등의 손실·변질·훼손
⑧ “요기요”는 이용자에게 배달대행 서비스 제공 시, 가맹점으로부터 재화 등을 수령한 후 “요기요”의 귀책사유로 인해 이용자에게 배달이 되지 아니하거나(미배달), 재화 등의 훼손 기타 배달사고가 발생한 경우 그에 상응하는 책임을 부담합니다. 본 항에 따른 분쟁이 원만히 해결되지 않는 경우, 「소비자분쟁해결기준」(공정거래위원회 고시)에 따라 해결함을 원칙으로 합니다.
⑨ 본 조항은 “요기요”의 배달대행 서비스에 대한 책임범위를 규정하므로, “요기요”는 본 약관의 다른 규정 등에 따른 가맹점의 책임을 부담하지 않습니다.
부칙
[제1조] 본 약관은 2020년 5월 6일에 개정되었으며, 2020년 5월 14일부터 시행됩니다.
                                </pre>
                              </div>
                        </li>
                    </ul>
                    <br>
                    <li style="list-style: none;">
                        <input type="checkbox" id="check2" name="agree_chk" class="infoBox">
                        <label>(필수)개인정보 수집 및 이용</label>
                        <lable><a href="memberJoinAgreement.jsp">전체보기</a></lable>
                    </li>
                    <br>
                    <ul>
                        <li style="list-style: none;">
                            <div class="container">
                                <pre>
                                    개인정보 수집 및 이용 동의
1. 개인정보의 수집 ∙ 이용
①회원 가입 시 수집하는 개인정보의 범위
회사의 회원제 서비스 이용을 위해 수집 ∙ 이용하는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 목적 변경 시 별도의 동의를 받는 등 필요한 조치를 이행합니다.
구분	개인정보 수집 · 이용 목적	개인정보 수집 · 이용 항목
회원 가입 및 관리	회원 가입의사 확인, 회원제 서비스 이용을 위한 제한적 본인확인, 불만 처리 등 원활한 의사소통 경로의 확보, 서비스 부정이용 방지, 계약이행을 위한 각종 고지 ∙ 통지 ∙ 안내, 통계 ∙ 분석	[e-mail 가입]
(필수) 이메일 주소, 비밀번호, 휴대전화번호
(선택) 닉네임
[SNS 회원가입 - 네이버]
(필수) 이메일 주소, 휴대전화번호
(선택) 별명, 생일, 성별, 연령대
[SNS 회원가입 – 카카오톡]
(필수) 이메일 주소, 휴대전화번호
(선택) 닉네임, 생일, 연령대, 성별
서비스 이용 시 자동생성되는 정보	서비스 부정이용 방지, 개인정보유효기간제 적용	서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 주소, 기기고유번호(디바이스 아이디 또는 IMEI)
2. 개인정보 보유 ∙ 이용 기간
① 회사는 이용자로부터 개인정보 수집 시에 동의 받은 보유 · 이용기간 내에서 개인정보를 처리·보유합니다.
a. 회원 정보: 회원탈퇴 후 90 일까지
② 1 년 간 회원의 서비스 이용 기록이 없는 경우, 『정보통신망 이용촉진 및 정보보호등에 관한 법률』 제 29 조에 근거하여 회원에게 사전 통지하고 개인정보를 별도로 분리하여 휴면 계정 전환일로부터 4 년 간 보유합니다.
③ 회원 탈퇴 또는 회원 자격 정지 후 회원 재가입, 임의 해지 등을 반복적으로 행하여 회사가 제공하는 할인쿠폰, 이벤트 혜택 등으로 경제상의 이익을 취하거나 이 과정에서 명의를 무단으로 사용하는 등 편법 행위 또는 불법행위를 하는 회원을 차단하고자 회사는 회원 탈퇴 후 90 일 간 회원의 정보를 보유합니다.
                                </pre>
                            </div>
                        </li>
                    </ul>
                    <br>
                    <li style="list-style: none;">
                        <input type="checkbox" id="check3" name="agree_chk" class="infoBox" >
                        <label>(필수)14세 이상입니다. *회원가입은 만 14세 이상부터 가능합니다.</label>
                    </li>
                    <br>
                    <li style="list-style: none;">
                        <input type="checkbox" id="check4" value="N" name="alarm_YN" class="infoBox">
                        <label>(선택)정보/이벤트 메일 수신에 동의합니다.</label>
                    </li>
                    <br>
                    <li style="list-style: none;">
                        <input type="checkbox" id="check5" value="N" name="agree_chk" class="infoBox">
                        <label>(선택)정보/이벤트 SMS 수신에 동의합니다.</label>
                    </li>
                    <br>
                    <dev style="font-size: 10px; color: lightgray;">*선택 약관 미동의시 포인트, 할인 혜택 등 추가 정보 수신 불가</dev>
                </ul>
            </ul>
            <br><br><br><br><br>
            <div style="text-align: center;">
                <input type="submit" value="회원가입" id="submit_btn" style="width: 90px; height: 40px; color: white; background: #2ac1bc; border-radius: 7px;" onclick="check();">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <input type="button" value="취소" id="cancel" onclick=cancle(); style="width: 90px; height: 40px; color: black; background-color: #2ac1bc; border-radius: 7px;">
            </div>
            
        </form>
        <%@ include file="../common/footer.jsp"%>
    </body>
    
    <script>
	    function execPostCode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	               var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
	               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                   extraRoadAddr += data.bname;
	               }
	               // 건물명이 있고, 공동주택일 경우 추가한다.
	               if(data.buildingName !== '' && data.apartment === 'Y'){
	                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	               }
	               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	               if(extraRoadAddr !== ''){
	                   extraRoadAddr = ' (' + extraRoadAddr + ')';
	               }
	               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	               if(fullRoadAddr !== ''){
	                   fullRoadAddr += extraRoadAddr;
	               }
	
	               // 우편번호와 주소 정보를 해당 필드에 넣는다.
	               console.log(data.zonecode);
	               console.log(fullRoadAddr);
	               
	               
	               $("[name=post]").val(data.zonecode);
	               $("[name=addr1]").val(fullRoadAddr);
	               
	               /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
	               document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
	               document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
	           }
	        }).open();
	    }
	    
	    

	    $("#idChk").on("click",function(){
	    	if($("#id").val()==""){
	    		alert("아이디를 입력해주세요");
	    	}else{
	    	$.ajax({
	    		url : "idChk.do",
	    		type : "post",
	    		dataType:"json",
	    		data : {"id" : $("#id").val()},
	    		success : function(data){
	    			if(data == 1){
	    				alert("중복된 아이디입니다.");
	    			}else if(data==0){
	    				$("#idChk").attr("value", "중복확인");
	    				alert("사용가능한 아이디입니다.");
	    			}
	    		}
	    	})
	    	}
	    })
    </script>
    
</html>