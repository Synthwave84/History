package ch09;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 */
//	매핑주소
@WebServlet("/Hello")

public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelloServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//    get방식으로 동작하는 메소드
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET방식으로 호출됨.");
		System.out.println("아이디 :" + request.getParameter("userid"));
		System.out.println("비밀번호 :" + request.getParameter("passwd"));
//		db 연동 작업
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	post방식으로 동작하는 메소드
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("POST방식으로 호출됨");
		System.out.println("아이디 :" + request.getParameter("userid"));
		System.out.println("비밀번호 :" + request.getParameter("passwd"));
//		db 연동작업
	}

}
