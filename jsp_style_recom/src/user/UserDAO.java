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
        	String dbURL = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
			String dbID = "scott";
			String dbPassword = "tiger";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    public int login(String userID, String userPassword)
    {
        try{String SQL = "SELECT userPassword FROM USERNAME WHERE userID = ?";
        pstmt = conn.prepareStatement(SQL);
        pstmt.setString(1, userID);
        rs = pstmt.executeQuery();
        if(rs.next())
            return !rs.getString(1).equals(userPassword) ? 0 : 1;
        else
            return -1;
        }catch(Exception e) {
       
        e.printStackTrace();
        return -2;}
    }

    public int join(Username user)
    {
        String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
        try
        {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUserID());
            pstmt.setString(2, user.getUserPassword());
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
