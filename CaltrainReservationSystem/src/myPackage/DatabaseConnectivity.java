package myPackage;

import java.sql.*;

public class DatabaseConnectivity {
    
	 final String MYSQL_DRIVER = "com.mysql.jdbc.Driver";  
	 Statement st = null;
	 Connection conn = null;
	 ResultSet rs = null;
	 ResultSet rs1 = null;
	 ResultSet rs2 = null;
	 
	 Statement st1 = null;
	 Statement st2 = null;
	 

	 //public int id = 3;
	 

//Method to establish a connection with the database	 
public void databaseConnectivity()
{
  
  try{
      //STEP 2: Register MYSQL driver
      Class.forName(MYSQL_DRIVER);

      //STEP 3: Open a connection
      //System.out.println("Connecting to database...");
      conn = DriverManager.getConnection("jdbc:mysql://localhost/CaltrainReservationSystem?"+"user=root&password=");
      st = conn.createStatement(); 
      st1 = conn.createStatement();
      st2 = conn.createStatement();
  }
    catch(SQLException se){
      //Handle errors for JDBC
      se.printStackTrace();
   }catch(Exception e){
      //Handle errors for Class.forName
      e.printStackTrace();
   }
    
}//end of the method databaseConnectivity()

//Method to verify if a username and password exists in the system database
public boolean isExisting(String uname,String pwd)
{
	try
	{
	String sql;
	
    sql = "select * from Users where user_name = '" + uname +"' and user_password ='"+pwd+"'";
    rs = st.executeQuery(sql);
    //Condition to check an empty result set
    if(!rs.next())
    {
    	return false;
    }
    else
    {
    	return true;
    }
	}
	catch(SQLException e)
	{
		e.printStackTrace();
		return false;
	}
}

//Method to add a new user into the database
public boolean insertUser(String fname,String lname,String uname,String pwd,String addr,String email,String cont,String gend,String bdate)
{

	try
	{
	String sql1;
    sql1 = "insert into Users(first_name,last_name,user_name,user_password,user_address,user_email,user_contact,user_gender,user_birthdate) values('"+fname+"','"+lname+"','"+uname+"','"+pwd+"','"+addr+"','"+email+"','"+cont+"','"+gend+"','"+bdate+"')";
    st.executeUpdate(sql1);
    //if the query runs correctly return true
    return true;
	}
	//return false if there is an error in the query
	catch(SQLException e)
	{
		e.printStackTrace();
		return false;
	}
}

//Method to add security question information for each user
public boolean updateSecurityQuestionsInformation(String un,String q1,String a1,String q2,String a2)
{
	try
	{
	String sql2;
    sql2 = "UPDATE Users SET security_question1 = '"+q1+"',security_answer1 = '"+a1+"',security_question2 = '"+q2+"',security_answer2 = '"+a2+"' WHERE user_name = '"+un+"'";
    st.executeUpdate(sql2);
    //if the query runs correctly return true
    return true;
	}
	//return false if there is an error in the query
	catch(SQLException e)
	{
		e.printStackTrace();
		return false;
	}
}

//Method to check if the provided username exists in the database for password retrieval
public boolean searchUserName(String abc)
{
	try
	{
	String sql3;
	
    sql3 = "select * from Users where user_name = '"+abc+"'";
    rs = st.executeQuery(sql3);
    //Condition to check an empty result set
    if(!rs.next())
    {
    	return false;
    }
    else
    {
    	return true;
    }
	}
	catch(SQLException e)
	{
		e.printStackTrace();
		return false;
	}
}

//Method to return the security questions of the selected user
public String[] returnQuestions()
{
	String arr[] = new String[6];
	try
	{
	String sql4;
	
    sql4 = "select * from Users where user_name = '"+PasswordRetrieval.user_name_fp+"'";
    rs = st.executeQuery(sql4);
    //Condition to check an empty result set
    while(rs.next())
    {
    arr[0] = rs.getString("security_question1");
    arr[1] = rs.getString("security_question2");
    arr[2] = rs.getString("security_answer1");
    arr[3] = rs.getString("security_answer2");
    arr[4] = rs.getString("user_email");
    arr[5] = rs.getString("user_password");
    }
    return arr;
	}
	catch(SQLException e)
	{
		e.printStackTrace();
		return arr;
	}
}

//Method to write a query with San Jose as the source for both weekday and weekend
public String[] querySJSource(String source_selected,String destination_selected,String running_on,int nop)
{
	try
	{
	String sql5;
	String sql6;
	
    sql5 = "SELECT * FROM Caltrain1 INNER JOIN CaltrainDetails ON Caltrain1.caltrain1_id = CaltrainDetails.caltrain1_id WHERE caltrain1_source = 'San Jose' AND cd_destination = '"+destination_selected+"' AND caltrain1_running_on = '"+running_on+"'";
    rs = st.executeQuery(sql5);
    sql6 = "SELECT * FROM Caltrain1 INNER JOIN CaltrainDetails ON Caltrain1.caltrain1_id = CaltrainDetails.caltrain1_id WHERE caltrain1_source = 'San Jose' AND cd_destination = '"+source_selected+"' AND caltrain1_running_on = '"+running_on+"'";
	rs1 = st1.executeQuery(sql6);
    
    //Fetching the number of rows returned by the query
    rs.last();
    int size = rs.getRow();
    String arr_query1[] = new String[size];
    rs.beforeFirst();
    int count1 = 0;
    int count2 = 0;
    //Condition to check an empty result set
    while(rs.next())
    {
    	
    	while(rs1.next())
    	{
    		while(count2==count1)
    		{
    			//enter the full string into the array
    			arr_query1[count1] = rs.getInt("Caltrain1.caltrain1_id")+" "+rs.getString("caltrain1_name")+" departs "+rs1.getString("cd_destination")+" at "+rs1.getInt("cd_arrival")+".00 hrs and arrives "+rs.getString("cd_destination")+" at "+rs.getInt("cd_arrival")+".00 hrs with a total duration of "+((rs.getInt("cd_duration"))-(rs1.getInt("cd_duration")))+".00 hrs with a total cost of "+nop*((rs.getInt("cd_cost"))-(rs1.getInt("cd_cost")))+"$";
    			count2 = count2 + 1;
    		}
    		break;
    	}
    	count1 = count1+1;
    	count2 = count1;
    }
    
    return arr_query1;
    
	}
	catch(SQLException e)
	{
		e.printStackTrace();
		String dummy[] = new String[1];
		dummy[0] = "not running";
		return dummy;
	
	}
}


//Method to write a query with San Francisco as the source for both weekday and weekend
public String[] querySFSource(String source_selected,String destination_selected,String running_on,int nop)
{
	try
	{
	String sql5;
	String sql6;
	
  sql5 = "SELECT * FROM Caltrain1 INNER JOIN CaltrainDetails ON Caltrain1.caltrain1_id = CaltrainDetails.caltrain1_id WHERE caltrain1_source = 'San Francisco' AND cd_destination = '"+destination_selected+"' AND caltrain1_running_on = '"+running_on+"'";
  rs = st.executeQuery(sql5);
  sql6 = "SELECT * FROM Caltrain1 INNER JOIN CaltrainDetails ON Caltrain1.caltrain1_id = CaltrainDetails.caltrain1_id WHERE caltrain1_source = 'San Francisco' AND cd_destination = '"+source_selected+"' AND caltrain1_running_on = '"+running_on+"'";
  rs1 = st1.executeQuery(sql6);
  
  //Fetching the number of rows returned by the query
  rs.last();
  int size = rs.getRow();
  String arr_query1[] = new String[size];
  rs.beforeFirst();
  int count1 = 0;
  int count2 = 0;
  //Condition to check an empty result set
  while(rs.next())
  {
  	
  	while(rs1.next())
  	{
  		while(count2==count1)
  		{
  			//enter the full string into the array
  			arr_query1[count1] = rs.getInt("Caltrain1.caltrain1_id")+" "+rs.getString("caltrain1_name")+" departs "+rs1.getString("cd_destination")+" at "+rs1.getInt("cd_arrival")+".00 hrs and arrives "+rs.getString("cd_destination")+" at "+rs.getInt("cd_arrival")+".00 hrs with a total duration of "+((rs.getInt("cd_duration"))-(rs1.getInt("cd_duration")))+".00 hrs with a total cost of "+nop*((rs.getInt("cd_cost"))-(rs1.getInt("cd_cost")))+"$";
  			count2 = count2 + 1;
  		}
  		break;
  	}
  	count1 = count1+1;
  	count2 = count1;
  }
  
  return arr_query1;
  
	}
	catch(SQLException e)
	{
		e.printStackTrace();
		String dummy[] = new String[1];
		dummy[0] = "not running";
		return dummy;
	
	}
}

//Method to return the available number of seats for a selected train
public int getAvailableSeats(int train_id)
{
	try
	{
	String sql7;
	int avail_seats=0;
	
    sql7 = "SELECT * FROM Caltrain1 WHERE caltrain1_id = '"+train_id+"'";
    rs = st.executeQuery(sql7);
    //Condition to check an empty result set
    while(rs.next())
    {
    	avail_seats = rs.getInt("caltrain1_availability");
    }
    return avail_seats;
	}
	catch(SQLException e)
	{
		e.printStackTrace();
		return 0;
	}
}

//Method to update the train availability
public void updateTrainAvailability(int nop,int train_id)
{
	try
	{
	String sql8;
    sql8 = "UPDATE Caltrain1 SET caltrain1_availability = caltrain1_availability - "+nop+" WHERE caltrain1_id = "+train_id;
    st.executeUpdate(sql8);
    //if the query runs correctly return true
    
	}
	//return false if there is an error in the query
	catch(SQLException e)
	{
		e.printStackTrace();
		
	}
}

//Method to return the first name from the given username
public String returnFirstName(String un)
{
	try
	{
	String sql8;
	String fir_name="";
	
    sql8 = "SELECT * FROM Users WHERE user_name = '"+un+"'";
    rs = st.executeQuery(sql8);
    //Condition to check an empty result set
    while(rs.next())
    {
    	fir_name = rs.getString("first_name");
    }
    return fir_name;
	}
	catch(SQLException e)
	{
		e.printStackTrace();
		return "NULL";
	}
}
//Method to return the last name from the given username
public String returnLastName(String un)
{
	try
	{
	String sql9;
	String las_name = "";
	
    sql9 = "SELECT * FROM Users WHERE user_name = '"+un+"'";
    rs = st.executeQuery(sql9);
    //Condition to check an empty result set
    while(rs.next())
    {
    	las_name = rs.getString("last_name");
    }
    return las_name;
	}
	catch(SQLException e)
	{
		e.printStackTrace();
		return "NULL";
	}
}

//Method to return the name of the train for a selected id
public String returnNameOfTrain(String nn)
{
	try
	{
	String sql10;
	String nn1 = "";
	
    sql10 = "SELECT * FROM Caltrain1 WHERE caltrain1_id = '"+Integer.parseInt(nn)+"'";
    rs = st.executeQuery(sql10);
    //Condition to check an empty result set
    while(rs.next())
    {
    	nn1 = rs.getString("caltrain1_name");
    }
    return nn1;
	}
	catch(SQLException e)
	{
		e.printStackTrace();
		return "NULL";
	}
}

}//end of class DatabaseConnectivity
