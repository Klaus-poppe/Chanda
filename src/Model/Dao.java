package Model;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import Model.Image;

public class Dao {
	private int noOfRecords;
	String sql;
	Context ctx;
	DataSource ds;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public ArrayList<Image> get(int offset, int noOfRecords ,String min , String max) throws SQLException, IOException {
		Image all = null;
		ArrayList<Image> gallery = new ArrayList<Image>();
		sql = "select SQL_CALC_FOUND_ROWS * from products limit "
                + offset + ", " + noOfRecords;
		 try{

		    	ctx=new InitialContext();
				ds=(DataSource)ctx.lookup("java:comp/env/jdbc/conPool");
				con=DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				all = new Image();
				int pid = rs.getInt(1);
				String name = rs.getString(2);
				String category = rs.getString(3);
				String description = rs.getString(4);
				String price = rs.getString(5);
				String  base64Image = rs.getString(6);
				all.setPid(pid);
				all.setName(name);
				all.setCategory(category);
				all.setDescription(description);
				all.setPrice(price);
				all.setBase64image(base64Image);
				if(min == "" && max == "") 
					min="0";max="100000";
				if(Integer.parseInt(price) <= Integer.parseInt(max) && Integer.parseInt(price) >= Integer.parseInt(min))
				gallery.add(all);
			}
			rs.close();
			rs = ps.executeQuery("SELECT FOUND_ROWS()");
			if(rs.next())
                this.noOfRecords = rs.getInt(1);
			con.close();
			
		}

		catch (Exception e) {
			System.out.println(e);
		}
		return gallery;
		
	}
	
	public ArrayList<Image> getCategory(int offset, int noOfRecords , String category,String min , String max) throws SQLException, IOException {
		Image all = null;
		ArrayList<Image> gallery = new ArrayList<Image>();
		sql = "select SQL_CALC_FOUND_ROWS * from products where category = ? limit "
                + offset + ", " + noOfRecords;
		 try{

		    	ctx=new InitialContext();
				ds=(DataSource)ctx.lookup("java:comp/env/jdbc/conPool");
				con=DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, category);
				ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				all = new Image();
				int pid = rs.getInt(1);
				String name = rs.getString(2);
				String cat = rs.getString(3);
				String description = rs.getString(4);
				String price = rs.getString(5);
				String  base64Image = rs.getString(6);
				all.setPid(pid);
				all.setName(name);
				all.setCategory(cat);
				all.setDescription(description);
				all.setPrice(price);
				all.setBase64image(base64Image);
				if(min == "" && max == "") 
					min="0";max="100000";
				if(Integer.parseInt(price) <= Integer.parseInt(max) && Integer.parseInt(price) >= Integer.parseInt(min))
				gallery.add(all);
			}
			rs.close();
			rs = ps.executeQuery("SELECT FOUND_ROWS()");
			if(rs.next())
                this.noOfRecords = rs.getInt(1);
			con.close();
			
		}

		catch (Exception e) {
			System.out.println(e);
		}
		return gallery;
		
	}
	
	public ArrayList<Banner> getBanner( int noOfRecords) throws SQLException, IOException {
		Banner all = null;
		ArrayList<Banner> gallery = new ArrayList<Banner>();
		sql = "select SQL_CALC_FOUND_ROWS * from banner limit "
                + noOfRecords;
		 try{

		    	ctx=new InitialContext();
				ds=(DataSource)ctx.lookup("java:comp/env/jdbc/conPool");
				con=DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				all = new Banner();
				String title = rs.getString(2);
				String image = rs.getString(3);
				
				all.setImage(image);
				all.setTitle(title);
				gallery.add(all);
			}
			rs.close();
			con.close();
			
		}

		catch (Exception e) {
			System.out.println(e);
		}
		return gallery;
		
	}
	
	
	public int getNoOfRecords() {
        return noOfRecords;
    }
	
	
	public boolean checkUser(String name,String password) 
    {
     boolean st =false;
     try{

    	ctx=new InitialContext();
		ds=(DataSource)ctx.lookup("java:comp/env/jdbc/conPool");
		con=DBConnection.getConnection();
        sql = "select * from users where (name=? or email=?)and password=?";
        ps = con.prepareStatement (sql);
        ps.setString(1, name);
        ps.setString(2, name);
        ps.setString(3, password);
        rs =ps.executeQuery();
        st = rs.next();
        con.close();
     }catch(Exception e)
     {
         e.printStackTrace();
     }
        return st;                 
 }   
	
	
	public boolean insertUser(User s) {
		boolean result = true ;
		try {
			ctx=new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/conPool");
			con=DBConnection.getConnection();
			sql = "INSERT INTO `users` (`name`,`password`, `email`,`phone`,`address` ) VALUES (?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, s.getName());
			ps.setString(2, s.getPassword());
			ps.setString(3, s.getEmail());
			ps.setString(4, s.getPhone());
			ps.setString(5, s.getAddress());
			ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result = false;
			e.printStackTrace();
		}catch (NamingException e) {
			// TODO Auto-generated catch block
			result = false;
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int selectUser(String name) {
		int id = -1;
		try {
			
			ctx=new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/conPool");
			con=DBConnection.getConnection();
			sql="Select `uid`,`name` from users where name=? or email=?";
			ps = con.prepareStatement(sql);
			ps.setString(1 , name);
			ps.setString(2 , name);
			rs = ps.executeQuery();

			while(rs.next()) {
				id = rs.getInt(1);		
			}

			con.close();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;


	}
	
	
	public boolean insertFeedback(String name,String  phone ,String email , String message) {
		boolean result = true ;
		try {
			ctx=new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/conPool");
			con=DBConnection.getConnection();
			sql = "INSERT INTO `feedback`(`name`, `phone`, `email`, `message`) VALUES (?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, phone);
			ps.setString(3, email);
			ps.setString(4, message);
			ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result = false;
			e.printStackTrace();
		}catch (NamingException e) {
			// TODO Auto-generated catch block
			result = false;
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean insertCart(int uid , int pid) {
		boolean result = true ;
		try {
			ctx=new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/conPool");
			con=DBConnection.getConnection();
			sql = "INSERT INTO `cart`(`uid`, `pid`) VALUES (?,?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, uid );
			ps.setInt(2, pid);
			ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result = false;
			e.printStackTrace();
		}catch (NamingException e) {
			// TODO Auto-generated catch block
			result = false;
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean insertOrder(User u , int pid , int qty , String amount) {
		boolean result = true ;
		try {
			ctx=new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/conPool");
			con=DBConnection.getConnection();
			sql = "INSERT INTO `orders`(`name`, `email`, `phone`, `address`, `pid` , `quantity` ,`amount`) VALUES (?,?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, u.getName() );
			ps.setString(2, u.getEmail() );
			ps.setString(3, u.getPhone() );
			ps.setString(4, u.getAddress() );
			ps.setInt(5, pid);
			ps.setInt(6, qty);
			ps.setString(7, amount);
			ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result = false;
			e.printStackTrace();
		}catch (NamingException e) {
			// TODO Auto-generated catch block
			result = false;
			e.printStackTrace();
		}
		return result;
	}
	
	public User getUser(String name) {
		User s = new User();
		try {
			
			ctx=new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/conPool");
			con=DBConnection.getConnection();
			sql="SELECT `uid`, `name`, `email`, `phone`, `address` FROM `users` WHERE  name = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1 , name);
			rs = ps.executeQuery();

			while(rs.next()) {
				s.setId(rs.getInt(1));	
				s.setName(rs.getString(2));
				s.setEmail(rs.getString(3));
				s.setPhone(rs.getString(4));
				s.setAddress(rs.getString(5));
			}

			con.close();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;


	}
	
	public Image getProduct(int pid) {
		Image s = new Image();
		try {
			String sql;
			Context ctx;
			DataSource ds;
			Connection con;
			PreparedStatement ps;
			ResultSet rs;
			ctx=new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/conPool");
			con=DBConnection.getConnection();
			sql="SELECT `pid`, `name`, `description`, `price`, `image` FROM `products` WHERE pid = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1 , pid);
			rs = ps.executeQuery();

			while(rs.next()) {
				s.setPid(rs.getInt(1));
				s.setName(rs.getString(2));
				s.setDescription(rs.getString(3));
				s.setPrice(rs.getString(4));
				s.setBase64image(rs.getString(5));
			}
			rs.close();
			con.close();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;


	}
	
	public ArrayList<Image> getCart(int uid) {
		Image all = null;
		ArrayList<Image> gallery = new ArrayList<Image>();
		try {
			
			ctx=new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/conPool");
			con=DBConnection.getConnection();
			sql="SELECT `pid` FROM `cart` WHERE uid = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1 , uid);
			rs = ps.executeQuery();

			while(rs.next()) {
				all = this.getProduct(rs.getInt(1));
				gallery.add(all);
			}
			rs.close();
			con.close();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return gallery;


	}

	public Boolean deleteCartItem(int uid, int pid) {
		boolean result=true;
		try {
			ctx=new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/conPool");
			con=DBConnection.getConnection();
			sql = "DELETE FROM `cart` WHERE (uid=? and pid=?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, uid );
			ps.setInt(2, pid);
			ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result = false;
			e.printStackTrace();
		}catch (NamingException e) {
			// TODO Auto-generated catch block
			result = false;
			e.printStackTrace();
		}
		return result;
	}
	
	
}
