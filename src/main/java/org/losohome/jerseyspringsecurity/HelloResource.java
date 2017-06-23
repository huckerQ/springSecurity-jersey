package org.losohome.jerseyspringsecurity;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.transaction.annotation.Transactional;

@Path("/hello")
@Transactional
public class HelloResource {

	@GET
	@Path("/hu")
	public String say() {
		return ("Hello !");
	}

	@GET
	@Path("/jump")
	public void jump(@Context HttpServletRequest req, @Context HttpServletResponse res) {
		try {
			res.sendRedirect(req.getContextPath() + "/index.html");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@GET
	@Path("{name}")
	@Produces("text/plain")
	// 返回client的数据类型
	public String change(@PathParam("name") String name) {
		return ("Hello " + name + "~");

	}

	@POST
	@Path("/user")
	@Secured("ROLE_USER")
	// security
	public String sayHelloFromUser(@FormParam("name") String name) {
		SecurityContext secCtx = SecurityContextHolder.getContext();
		Authentication auth = secCtx.getAuthentication();
		String userName = "";
		if (auth.getPrincipal() instanceof UserDetails) {
			// UserDetails 中包含了用户信息
			userName = ((UserDetails) auth.getPrincipal()).getUsername();
		} else {
			userName = auth.getPrincipal().toString();
		}
		return ("Hello " + name + "~ , I am " + userName);
	}

	@POST
	@Path("/admin")
	@Secured("ROLE_ADMIN")
	public String sayHelloFromAdmin(@FormParam("name") String name) {
		return ("Hello " + name + "~ , I am ADMIN");
	}

}
