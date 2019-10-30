// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   UserDAO.java

package user;

import java.sql.*;

// Referenced classes of package user:
//            User

public class UserDAO
{
	

    public UserDAO()
    {
        try
        {
        	String dbURL = "jdbc:oracle:thin:@211.183.2.63:1521:xe";
			String dbID = "J20191001";
			String dbPassword = "tiger";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    public int login(String mem_id, String mem_pw)
    {
        try{String SQL = "SELECT mem_pw FROM MEMBER WHERE mem_id = ?";
        pstmt = conn.prepareStatement(SQL);
        pstmt.setString(1, mem_id);
        rs = pstmt.executeQuery();
        if(rs.next())
            return !rs.getString(1).equals(mem_pw) ? 0 : 1;
        else
            return -1;
        }catch(Exception e) {
       
        e.printStackTrace();
        return -2;}
    }

    public int join(Username user)
    {
        String SQL = "INSERT INTO MEMBER VALUES (?, ?, ?, ?, ?)";
        try
        {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getMem_id());
            pstmt.setString(2, user.getMem_pw());
            pstmt.setString(3, user.getUserName());
            pstmt.setString(4, user.getUserGender());
            pstmt.setString(5, user.getUserEmail());
            return pstmt.executeUpdate();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return -1;
    }

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
}
