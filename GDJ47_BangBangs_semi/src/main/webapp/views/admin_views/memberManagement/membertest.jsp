

<div class="row">                                                                                                             
	<div class="col-lg-12">                                                                                                   
		<form id="searchForm" action="/controller/board/list" method="get">                                                   
			<select name="type">                                                                                              
				<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected':'' }"/> >--</option>                 
                <option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected':'' }"/> >제목</option>                 
                <option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected':'' }"/> >내용</option>                 
                <option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected':'' }"/> >작성자</option>                
                <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected':'' }"/> >제목 or 내용</option>         
                <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected':'' }"/> >제목 or 작성자</option>        
                <option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected':'' }"/> >제목 or 내용 or 작성자</option>
			</select>                                                                                                         
			<input type="text" name="keyword" value="<c:out value="${pageMaker.cri.keyword}"/>" />                            
			<input type="hidden" name="pageNum" value="<c:out value="${pageMaker.cri.pageNum}"/>" />                          
			<input type="hidden" name="amount" value="<c:out value="${pageMaker.cri.amount}"/>" />                            
			<button class="btn btn-default">Search</button>                                                                   
		</form>                                                                                                               
	</div>                                                                                                                    
</div> 


<script type="text/javascript">
$(document).ready(function() { 
	var searchForm = $("#searchForm");                                         
	$("#searchForm button").on("click", function(e) {                          
																			   
		if (!searchForm.find("option:selected").val()) {                       
			alert("검색 종류를 선택하세요");                                             
			return false;                                                      
		}                                                                      
																			   
		if (!searchForm.find("input[name='keyword']").val()) {                 
			alert("키워드를 입력하세요");                                               
			return false;                                                      
		}                                                                      
																			   
		searchForm.find("input[name='pageNum']").val("1");                     
		e.preventDefault();                                                    
																			   
		searchForm.submit();                                                   
	}); /* $("#searchForm button").on("click", function(e) { end*/
	});/* ready end function end */
	</script>    