$(document).ready(function() {

  // 1차 카테고리 오버
  // $("1차 카테고리 태그를 참조하는 선택자").on();
  $("div#category_menu li a").on("mouseover", function(e) {
    e.preventDefault(); // a 태그의 링크 기능을 취소
    console.log("1차 카테고리 오버");

    // 선택한 1차 카테고리 코드
    let sel_first_category = $(this);
    let cg_code = $(this).data("cg_code")
    // console.log("1차 카테고리 코드" + cg_code);
    // return;

    let url = '/category/secondCategory/'+ cg_code;
      $.getJSON(url, function (category) {
        
        // console.log(category);

        let str = '<ul class="nav justify-content-center" id="second_category">';
        for (let i=0; i<category.length; i++) {
            str += '<li class="nav-item">';
            str +=  '<a class="nav-link active" href="#" data-cg_code="'+ category[i].cg_code +'" data-cg_name="' + category[i].cg_name +'">'+ category[i].cg_name + '</a>';
            str += '</li>'
        }
        str+= '</ul>';
        
        // console.log(str);
        sel_first_category.parent().parent().next().remove();
        sel_first_category.parent().parent().after(str);
      });

    });

    // 2차 카테고리 선택 시
    // [중요] 동적으로 생성된 태그를 jquery에서 직접 선택자로 접근 불가능함.
    // [중요]  // $("정적태그 참조 선택자").on("click","동적 태그를 참조하는 선택자", function () {});
    // 2차 카테고리 선택 시 생성되는 생성자는 동적 태그(생성되는) 태그라 이벤트를 다르게 걸어야한다.
    $("div#category_menu").on("click","ul#second_category li a", function (e) {
      console.log("2차 카테고리 작업");
      let cg_code = $(this).data("cg_code");
      let cg_name = $(this).data("cg_name");
      
      
      // 현재 파일이 jsp일 경우 아래처럼 사용하면 ${cg_code} 를 변수로 인식하는 것이 아니라, jsp의 el문버브올 서버에서 동작이 된다. 주의
      // 권장 = 백틱을 작은따옴표로 , 그리고 변수로 가져다써야한다. 
		location.href = `/user/product/pro_list?cg_code=${cg_code}&cg_name=${cg_name}`;
		
  
      
      // https://travelpark.tistory.com/30
      // 한글이나 특수문자를 서버에 보낼 때 오류가 나는 경우.
      // 인코딩 과정을 통하여 보내 처리 할 수 있다.
      location.href = `/user/product/pro_list?cg_code=${cg_code}&cg_name=${cg_name}`;

    })
  });