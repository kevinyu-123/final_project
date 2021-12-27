/**
 * 		
 */
 
 <script language="javascript">
var oTbl;
//Row 추가
function insRow() {
  oTbl = document.getElementById("addTable");
  var oRow = oTbl.insertRow();
  oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
  var oCell = oRow.insertCell();

  //삽입될 Form Tag
  var frmTag = "<input type=text name=addText style='width:100%; height:35px;'> ";
  frmTag += "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand'>";
  oCell.innerHTML = frmTag;
}
//Row 삭제
function removeRow() {
  oTbl.deleteRow(oTbl.clickedRowIndex);
}

var oTbl2;
//Row 추가
function insRow2() {
  oTbl2 = document.getElementById("addTable2");
  var oRow2 = oTbl2.insertRow();
  oRow2.onmouseover=function(){oTbl2.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
  var oCell2 = oRow2.insertCell();

  //삽입될 Form Tag
  var frmTag2 = "<input type=text name=addText2 style='width:100%; height:35px;'> ";
  frmTag2 += "<input type=button value='삭제' onClick='removeRow2()' style='cursor:hand'>";
  oCell2.innerHTML = frmTag2;
}
//Row 삭제
function removeRow2() {
  oTbl2.deleteRow(oTbl2.clickedRowIndex);
}

function frmCheck()
{
  var frm = document.form;
  
  var recipe = "";
  var ingredients = "";
  
  for( var i = 0; i <= frm.elements.length - 1; i++ ){
     if( frm.elements[i].name == "addText")
     {
         if( !frm.elements[i].value ){
             alert("텍스트박스에 값을 입력하세요!");
             frm.elements[i].focus();
	 		return;
          }
          recipe += frm.elements[i].value + "/";	<!-- + "\n" -->
      }
   }
         document.getElementById("recipe").value = recipe;
         
  for( var i = 0; i <= frm.elements.length - 1; i++ ){
     if( frm.elements[i].name == "addText2")
     {
         if( !frm.elements[i].value ){
             alert("텍스트박스에 값을 입력하세요!");
             frm.elements[i].focus();
	 		return;
          }
         ingredients += frm.elements[i].value + "/";	<!-- + "\n" -->
      }
   }
         document.getElementById("ingredients").value = ingredients;
         
        var form = document.form;
        form.submit();
 }
 
 function cookTime() {
	 var cookTime = document.getElementsByName('cookTime');
	 var cookTimeChoice; // 여기에 선택된 radio 버튼의 값이 담기게 된다.
	 for(var i=0; i<cookTime.length; i++) {
	     if(cookTime[i].checked) {
	    	 cookTimeChoice = cookTime[i].value;
	     }
	 }
 }

</script>