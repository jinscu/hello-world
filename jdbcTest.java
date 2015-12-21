package package1;
//���и��ļ���Ҫ���ص���ojdbc.jar��
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class jdbcTest {

	public static void main(String[] args) {
		Connection conection = null;
		ResultSet rs = null;
		Statement st = null;
		InputStream inputStream = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@192.168.1.77:1521:soadevp";
			// mydbΪ���ݿ��SID
			String user = "KLYW";
			String password = "KLYW";
			conection = DriverManager.getConnection(url, user, password);
			String sql = "SELECT * FROM FND_ATM_ATTACHMENT";
			st = conection.createStatement();
			rs = st.executeQuery(sql);

			while (rs.next()) {
				if (rs.getString("file_name") != null
						&& rs.getString("file_name").length() != 0) {
					System.out.println(rs.getInt("attachment_id"));
					java.sql.Blob blob = rs.getBlob("content");// ��ȡBlog�ֶ�
					inputStream = blob.getBinaryStream();// ����ֽ���
					FileOutputStream file = new FileOutputStream(
							"D://CONTENT//" + rs.getString("file_name"));
					byte[] b = new byte[1024];
					int i = 0;
					while ((i = inputStream.read(b)) > 0) {
						file.write(b, 0, i);
					}
					
					file.close();
				} else {
					System.out.println("����û���ļ����� "+rs.getInt("attachment_id"));
					continue;
				}
			}
			System.out.print("over!!!");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (st != null)
					st.close();
				if (conection != null)
					conection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if (inputStream != null) {
				try {
					inputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				inputStream = null;
			}

		}
	}

}
