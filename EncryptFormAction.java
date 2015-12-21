/*     */ package com.klsw.szca.action;
/*     */ 
/*     */ import aurora.database.service.DatabaseServiceFactory;
/*     */ import aurora.service.http.WebContextInit;
/*     */ import com.szca.caau.webservice.service.EncryptForm;
/*     */ import com.szca.caau.webservice.service.SZCASafeService;
/*     */ import com.szca.caau.webservice.service.SZCASafeServiceService;
/*     */ import java.io.BufferedReader;
/*     */ import java.io.IOException;
/*     */ import java.io.InputStream;
/*     */ import java.io.PrintStream;
/*     */ import java.io.PrintWriter;
/*     */ import java.io.Reader;
/*     */ import java.sql.Connection;
/*     */ import java.sql.ResultSet;
/*     */ import java.sql.SQLException;
/*     */ import java.sql.Statement;
/*     */ import java.util.HashMap;
/*     */ import java.util.Map;
/*     */ import java.util.Scanner;
/*     */ import java.util.Set;
/*     */ import javax.servlet.ServletConfig;
/*     */ import javax.servlet.ServletContext;
/*     */ import javax.servlet.ServletException;
/*     */ import javax.servlet.http.HttpServlet;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import javax.servlet.http.HttpServletResponse;
/*     */ import javax.sql.DataSource;
/*     */ import oracle.sql.CLOB;
/*     */ import org.json.JSONException;
/*     */ import org.json.JSONObject;
/*     */ import sun.misc.BASE64Decoder;
/*     */ import uncertain.composite.CompositeMap;
/*     */ import uncertain.core.UncertainEngine;
/*     */ 
/*     */ public class EncryptFormAction extends HttpServlet
/*     */ {
/*     */   private static final long serialVersionUID = 1L;
/*     */   String target_table;
/*     */   ServletConfig config;
/*     */   UncertainEngine uncertainEngine;
/*     */   CompositeMap gompositeMap;
/*     */   DatabaseServiceFactory databaseServiceFactory;
/*     */ 
/*     */   public void init(ServletConfig config)
/*     */     throws ServletException
/*     */   {
/*  51 */     super.init(config);
/*  52 */     this.config = config;
/*     */ 
/*  54 */     this.target_table = config.getInitParameter("table");
/*  55 */     System.out.println(this.target_table);
/*  56 */     ServletContext context = config.getServletContext();
/*  57 */     this.uncertainEngine = WebContextInit.getUncertainEngine(context);
/*  58 */     this.databaseServiceFactory = new DatabaseServiceFactory(this.uncertainEngine);
/*     */   }
/*     */ 
/*     */   public Map<String, String> arrangement(String str) {
/*  62 */     String[] array = str.split(";");
/*  63 */     Map list = new HashMap();
/*  64 */     String preName = "";
/*  65 */     for (int i = 0; i < array.length; i++) {
/*  66 */       int index = array[i].indexOf(":");
/*  67 */       if (index > 0) {
/*  68 */         String name = array[i].split(":")[0].trim();
/*  69 */         String value = array[i].split(":")[1];
/*  70 */         list.put(name, value);
/*  71 */         preName = name;
/*     */       } else {
/*  73 */         String value = (String)list.get(preName);
/*  74 */         value = value + array[i] + ";";
/*  75 */         list.put(preName, value);
/*     */       }
/*     */     }
/*  78 */     return list;
/*     */   }
/*     */ 
/*     */   public void putJson(Map<String, String> map, JSONObject json) throws JSONException {
/*  82 */     Set key = map.keySet();
/*  83 */     for (int j = 0; j < map.size(); j++) {
/*  84 */       String name = key.toArray()[j].toString();
/*  85 */       String value = (String)map.get(name);
/*  86 */       json.put(name, value);
/*  87 */       System.out.println(name + ":" + value);
/*     */     }
/*     */   }
/*     */ 
/*     */   public void putRequest(Map<String, String> map, HttpServletRequest request) {
/*  92 */     Set key = map.keySet();
/*  93 */     for (int j = 0; j < map.size(); j++) {
/*  94 */       String name = key.toArray()[j].toString();
/*  95 */       String value = (String)map.get(name);
/*  96 */       request.setAttribute(name, value);
/*     */     }
/*     */   }
/*     */ 
/*     */   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
/*     */   {
/* 102 */     response.setContentType("text/html; charset=utf-8");
/* 103 */     JSONObject json = new JSONObject();
/* 104 */     PrintWriter out = response.getWriter();
/* 105 */     String encryptFormCode = request.getParameter("code");
/* 106 */     String id = request.getParameter("id");
/*     */     try {
/* 108 */       Connection connection = this.databaseServiceFactory.getDataSource().getConnection();
/* 109 */       EncryptForm ef = new EncryptForm(connection, encryptFormCode);
/* 110 */       ef.setDecryptedDataId(id);
/* 111 */       Statement smSeq = connection.createStatement();
/* 112 */       String sql = ef.getDecryptedDataSql();
/* 113 */       String keyColumn = ef.getKeyColumn();
/* 114 */       String encryptFormColumn = ef.getEncryptFormColumn();
/*     */ 
/* 116 */       ResultSet rs = smSeq.executeQuery(sql);
/* 117 */       String sSymmKey = "";
/* 118 */       String sEncryptedData = "";
/* 119 */       if (rs.next()) {
/* 120 */         InputStream st = rs.getBinaryStream(encryptFormColumn);
/* 121 */         sEncryptedData = streamToString(st);
/* 122 */         if ((keyColumn != null) && (!keyColumn.equals(""))) {
/* 123 */           sSymmKey = rs.getString(keyColumn).toString();
/*     */         }
/*     */       }
/*     */ 
/* 127 */       BASE64Decoder decoder = new BASE64Decoder();
/* 128 */       SZCASafeServiceService ss = new SZCASafeServiceService();
/* 129 */       SZCASafeService service = ss.getSZCASafeServicePort();
/* 130 */       String result = "";
/* 131 */       if ((sSymmKey != null) && (!sSymmKey.equals("")))
/* 132 */         result = service.szcaWSSymDecodeString(sEncryptedData, 
/* 133 */           sSymmKey);
/*     */       else {
/* 135 */         result = service.szcaWSDecryptString(sEncryptedData);
/*     */       }
/* 137 */       if ((result.equals("E403")) || (result.equals("E404"))) {
/* 138 */         request.setAttribute("result", "fail");
/* 139 */         json.put("result", "fail");
/*     */       } else {
/* 141 */         String re = new String(decoder.decodeBuffer(result));
/* 142 */         String sDecryptedData = re;
/* 143 */         Map map = arrangement(sDecryptedData);
/* 144 */         putRequest(map, request);
/* 145 */         request.setAttribute("result", "success");
/* 146 */         putJson(map, json);
/* 147 */         json.put("result", "success");
/*     */       }
/*     */     } catch (Exception e) {
/* 150 */       e.printStackTrace();
/* 151 */       request.setAttribute("result", "fail" + e.getMessage());
/*     */       try {
/* 153 */         json.put("result", "fail");
/*     */       } catch (JSONException e1) {
/* 155 */         e1.printStackTrace();
/*     */       }
/*     */     } finally {
/*     */       try {
/* 159 */         json.write(out);
/*     */       } catch (JSONException e) {
/* 161 */         e.printStackTrace();
/*     */       }
/* 163 */       out.flush();
/* 164 */       out.close();
/*     */     }
/*     */   }
/*     */ 
/*     */   public String streamToString(InputStream st) throws SQLException, IOException {
/* 169 */     String reString = "";
/* 170 */     Scanner scanner = new Scanner(st, "UTF-8");
/* 171 */     reString = scanner.useDelimiter("\n").next();
/* 172 */     return reString;
/*     */   }
/*     */ 
/*     */   public String ClobToString(CLOB clob) throws SQLException, IOException {
/* 176 */     String reString = "";
/* 177 */     Reader is = clob.getCharacterStream();
/* 178 */     BufferedReader br = new BufferedReader(is);
/* 179 */     String s = br.readLine();
/* 180 */     StringBuffer sb = new StringBuffer();
/* 181 */     while (s != null) {
/* 182 */       sb.append(s);
/* 183 */       s = br.readLine();
/*     */     }
/* 185 */     reString = sb.toString();
/* 186 */     return reString;
/*     */   }
/*     */ 
/*     */   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
/*     */   {
/* 191 */     doPost(req, resp);
/*     */   }
/*     */   public void destroy() {
/* 194 */     super.destroy();
/*     */   }
/*     */ }

/* Location:           E:\KLSW\HAP\webRoot\WEB-INF\lib\szca.jar
 * Qualified Name:     com.klsw.szca.action.EncryptFormAction
 * JD-Core Version:    0.6.2
 */