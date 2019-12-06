package twentyOnce.mem.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import twentyOnce.mem.dao.MemDao;
import twentyOnce.mem.dto.MemberDto;
import twentyOnce.mem.dto.SaveIdDto;
import twentyOnce.mem.sha256.BCrypt;
import twentyOnce.mem.sha256.SHA256;
import twentyOnce.vis.controller.VController;
import twentyOnce.vis.dto.VisitorDto;

@Controller
@RequestMapping
public class LogController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	VController vcon;
	
	@RequestMapping("/memviews/loginform")
	public String loginform(HttpServletRequest request, Model model) {
		System.out.println("loginform() passing");
		
		SaveIdDto iddto=saveidSearch();
		
		model.addAttribute("iddto", iddto);
		
		return "memviews/loginform";
	}
	
	private SaveIdDto saveidSearch() {
		System.out.println("saveidSearch() passing");
		
		MemDao dao=sqlSession.getMapper(MemDao.class);
		SaveIdDto iddto=dao.saveidSearch();
		
		if (iddto==null) {
			iddto=new SaveIdDto();
			iddto.setCheck("");
		}
		
		return iddto;
	}

	
	@RequestMapping("/memviews/loginproc")
	public String loginproc(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("loginproc() passing");
		
		String reqid=request.getParameter("id");
		String reqpw=request.getParameter("pw");
		
		if (request.getParameter("saveId")!=null) {
			System.out.println("�븘�뵒 ���옣");
			
			saveidDel();
			
			saveidAdd(reqid, reqpw);
			
		} else {
			System.out.println("�븘�뵒 ���옣 �븞 �븿");
			
			saveidDel();
			
		}
		
        MemberDto memdto=memberCheck(reqid);
		
		if (memdto==null) { //媛숈� �븘�씠�뵒媛� �뾾�떎硫�
			
		} else { //�븘�씠�뵒媛� 留욌떎硫�
			
			String salt=memdto.getSalt();
			String pw=memdto.getPw();
			
			//鍮꾨�踰덊샇 �솗�씤(sha256)
			if (pwVerify(reqpw, salt, pw)) { //留욎쓣�븣
				
				session.setAttribute("memdto", memdto);
				VisitorDto visdto=(VisitorDto)session.getAttribute("visdto");	
				visdto.setMemberId(memdto.getId());
				
			}
			
		}
		
		return "frontAfterviews/twfrontAfter";
	}
	
	
	@RequestMapping("/frontAfterviews/twfrontAfter")
	public String twfrontAfter(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("twfrontAfter() passing");
		
		VisitorDto visdto=(VisitorDto)session.getAttribute("visdto");
		//諛⑸Ц �넻怨�
		visdto.setVisitCount(visdto.getVisitCount()+1); //諛⑸Ц�븳 �럹�씠吏� �닔
		vcon.visitUpdate(visdto); //泥� 諛⑸Ц
		
		return "frontAfterviews/twfrontAfter";
	}
	
	private void saveidAdd(String reqid, String reqpw) {
		System.out.println("saveidAdd() passing");
		
		MemDao dao=sqlSession.getMapper(MemDao.class);
		dao.saveidAdd(reqid, reqpw);
	}

	private void saveidDel() {
		System.out.println("saveidDel() passing");
		
		MemDao dao=sqlSession.getMapper(MemDao.class);
		dao.saveidDel();
	}

	private boolean pwVerify(String reqpw, String salt, String pw) {
		System.out.println("pwVerify() passing");
		
		boolean flag=false;
		SHA256 sha=SHA256.getInsatnce();
		
		
		try {
			
			
			String shapw = sha.getSha256(reqpw.getBytes());
			System.out.println("shapw: "+shapw);
			System.out.println("salt: "+salt);
			String cryptpw=BCrypt.hashpw(shapw, salt);
			
			
			if (cryptpw.equals(pw)) {
				System.out.println("鍮꾨쾲 �씪移�");
				
				flag=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}

	private MemberDto memberCheck(String reqid) {
		System.out.println("memberGet() passing");
		
		MemDao dao=sqlSession.getMapper(MemDao.class);
		MemberDto memdto=dao.memberCheck(reqid);
		
		return memdto;
	}
	
	@RequestMapping("/memviews/logout")
	public String logout(HttpServletRequest request, Model model) {
		System.out.println("logout() passing");
		
		request.getSession().invalidate();
		
		return "redirect:/";
	}

	@RequestMapping("/memviews/store_logout")
	public String store_logout(HttpServletRequest request, Model model) {
		System.out.println("store_logout() passing");
		
		request.getSession().invalidate();
		
		return "redirect:/stoviews/list";
	}
	
}
