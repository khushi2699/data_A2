import java.sql.*;
import java.util.HashMap;

public class Main {
    public static void main(String[] args) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {

        //Declaring a GDD over here, considering HashMap as GDD
        HashMap<String, String> hashMap = new HashMap<String, String>();
        hashMap.put("amenities","local");
        hashMap.put("events","local");
        hashMap.put("park","local");
        hashMap.put("rules","remote");
        hashMap.put("visitors","remote");

        String user = "root";
        String password = "12345678";
        String databaseName = "a2_distB00923816";
        String url = "jdbc:mysql://localhost:3306/" + databaseName;
        String url_remote = "jdbc:mysql://34.172.135.144/" + databaseName;

        //Database connection (local and remote)
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection transaction = DriverManager.getConnection(url, user, password);
        Connection transaction_remote = DriverManager.getConnection(url_remote,user,password);
        transaction.setAutoCommit(false);
        transaction_remote.setAutoCommit(false);

        //Setting profile for local db
        PreparedStatement prof = transaction.prepareStatement(
                "Set profiling = 1"
        );
        prof.execute();

        //Setting profile for remote db
        PreparedStatement prof_remote = transaction_remote.prepareStatement(
                "Set profiling = 1"
        );
        prof_remote.execute();

        // starting the transaction.
        System.out.println("Start transaction");

        if(hashMap.get("amenities").equals("local")){
            PreparedStatement statement1 = transaction.prepareStatement(
                    "select * from amenities"); //select1
            ResultSet result = statement1.executeQuery();
        } //amenities

        if(hashMap.get("events").equals("local")){
            PreparedStatement statement2 = transaction.prepareStatement(
                    "update events set event_name = 'blood donation' where event_id = 1"); //update1
            statement2.executeUpdate();
            transaction.commit();
        } //events

        if(hashMap.get("park").equals("local")){
            PreparedStatement statement3 = transaction.prepareStatement(
                    "update park set park_area = 3000 where park_id = 1"); //update2
            statement3.executeUpdate();
            transaction.commit();
        } //park

        if(hashMap.get("rules").equals("remote")){
            PreparedStatement statement3 = transaction_remote.prepareStatement(
                    "select * from rules"); ///select2
            ResultSet result = statement3.executeQuery();
        } //rules

        if(hashMap.get("visitors").equals("remote")){
            PreparedStatement statement3 = transaction_remote.prepareStatement(
                    "update visitors set visitor_name = 'Honey Shah' where visitor_id = 1"); //update3
            statement3.executeUpdate();
            transaction_remote.commit();
        } //visitors

        //show profile for local
        PreparedStatement showprof = transaction.prepareStatement("show profiles");
        ResultSet result = showprof.executeQuery();
        System.out.println("Execution time of local database");
        while(result.next()){
            System.out.print("ID: " + result.getString("Query_ID"));
            System.out.print("\t");
            System.out.println("Duration: "+result.getString("Duration") );
            System.out.print("\t");
            System.out.println("Query: "+result.getString("Query"));
        }

        //show profile for remote
        PreparedStatement showprof_remote = transaction_remote.prepareStatement("show profiles");
        ResultSet result_remote = showprof_remote.executeQuery();
        System.out.println("Execution time of remote database");

        while(result_remote.next()){
            System.out.print("ID: " + result_remote.getString("Query_ID"));
            System.out.print("\t");
            System.out.println("Duration: "+result_remote.getString("Duration") );
            System.out.print("\t");
            System.out.println("Query: "+result_remote.getString("Query"));
        }
    }
}