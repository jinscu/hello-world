/*    */ package com.klsw.szca.action;
/*    */ 
/*    */ import com.szca.caau.webservice.service.SZCASafeService;
/*    */ import com.szca.caau.webservice.service.SZCASafeServiceService;
/*    */ import java.io.IOException;
/*    */ import java.io.PrintWriter;
/*    */ import javax.servlet.ServletConfig;
/*    */ import javax.servlet.ServletException;
/*    */ import javax.servlet.http.HttpServlet;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;
/*    */ import org.json.JSONObject;
/*    */ import sun.misc.BASE64Decoder;
/*    */ 
/*    */ public class EncryptDataAction extends HttpServlet
/*    */ {
/*    */   private static final long serialVersionUID = 1L;
/*    */   ServletConfig config;
/*    */ 
/*    */   public void init(ServletConfig config)
/*    */     throws ServletException
/*    */   {
/* 23 */     this.config = config;
/*    */   }
/*    */ 
/*    */   public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception
/*    */   {
/* 28 */     response.setContentType("text/html; charset=utf-8");
/* 29 */     JSONObject json = new JSONObject();
/* 30 */     PrintWriter out = response.getWriter();
/*    */     try {
/* 32 */       String sSymmKey = request.getParameter("key");
/* 33 */       String sEncryptedData = request.getParameter("datas");
/*    */ 
/* 35 */       BASE64Decoder decoder = new BASE64Decoder();
/*    */ 
/* 37 */       SZCASafeServiceService ss = new SZCASafeServiceService();
/* 38 */       SZCASafeService service = ss.getSZCASafeServicePort();
/* 39 */       String result = "";
/* 40 */       if ((sSymmKey != null) && (!sSymmKey.equals("")))
/* 41 */         result = service.szcaWSSymDecodeString(sEncryptedData, 
/* 42 */           sSymmKey);
/*    */       else {
/* 44 */         result = service.szcaWSDecryptString(sEncryptedData);
/*    */       }
/* 46 */       if ((result.equals("E403")) || (result.equals("E404"))) {
/* 47 */         request.setAttribute("result", "fail");
/* 48 */         json.put("result", "fail");
/*    */       } else {
/* 50 */         String re = new String(decoder.decodeBuffer(result));
/* 51 */         String sDecryptedData = re;
/* 52 */         request.setAttribute("result", "success");
/* 53 */         request.setAttribute("decryptedData", sDecryptedData);
/* 54 */         json.put("result", "success");
/* 55 */         json.put("decryptedData", sDecryptedData);
/*    */       }
/* 57 */       json.write(out);
/* 58 */       out.flush();
/* 59 */       out.close();
/*    */     } catch (Exception e) {
/* 61 */       e.printStackTrace();
/* 62 */       request.setAttribute("result", "fail");
/* 63 */       json.put("result", "fail");
/*    */     }
/*    */   }
/*    */ 
/*    */   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
/*    */   {
/*    */     try {
/* 70 */       execute(request, response);
/*    */     } catch (Exception e) {
/* 72 */       e.printStackTrace();
/*    */     }
/*    */   }
/*    */ 
/*    */   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
/*    */   {
/* 78 */     doPost(req, resp);
/*    */   }
/*    */ 
/*    */   public void destroy() {
/* 82 */     super.destroy();
/*    */   }
/*    */ }

/* Location:           E:\KLSW\HAP\webRoot\WEB-INF\lib\szca.jar
 * Qualified Name:     com.klsw.szca.action.EncryptDataAction
 * JD-Core Version:    0.6.2
 */