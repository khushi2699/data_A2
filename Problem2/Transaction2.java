import java.sql.*;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class Transaction2 implements Runnable {

    private String threadName;
    HashMapLocks hashMapLocksT2 = new HashMapLocks();
    ConcurrentHashMap<String, String> hm2 = new ConcurrentHashMap<String, String>();

    Transaction2(String name, ConcurrentHashMap hashMapLocks) {
        this.threadName = name;
        System.out.println("Starting transaction: " + threadName);
        this.hm2 = hashMapLocks;
    }

    @Override
    public void run() {
        try {
            acquirelock(hm2);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        operations();
        releaselock();
    }

    public void acquirelock(ConcurrentHashMap hashMapLocks) throws InterruptedException {
        if(hashMapLocks.get("Students") == null) {
            if (hashMapLocks.containsKey("Students") && hashMapLocks.containsValue("T1")) {
                System.out.println("T2: Students table is locked by Transaction 1");
            } else {
                hashMapLocks.put("Students", "T2");
                System.out.println("T2: Holds Students");
            }
        }
        else {
            System.out.println("T2: Students table is locked by Transaction 1");
        }
        if(hashMapLocks.get("Programs") == null) {
            if (hashMapLocks.containsKey("Programs") && hashMapLocks.containsValue("T1")) {
                System.out.println("T2: Programs table is locked by Transaction 1");
            } else {
                hashMapLocks.put("Programs", "T2");
                System.out.println("T2: Holds Programs");
            }
        }
        else {
            System.out.println("T2: Programs table is locked by Transaction 1");
        }

        if(hashMapLocks.get("Departments") == null) {
            if (hashMapLocks.containsKey("Departments") && hashMapLocks.containsValue("T1")) {
                System.out.println("T2: Departments table is locked by Transaction 1");
            } else {
                System.out.println("T2: Holds Departments");
                hashMapLocks.put("Departments", "T2");
            }
        }
        else {
            System.out.println("T2: Departments table is locked by Transaction 1");
        }
    }

    public void operations(){
        String user = "root";
        String password = "12345678";
        String databaseName = "a1p11";
        String url = "jdbc:mysql://localhost:3306/" + databaseName;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection transaction = DriverManager.getConnection(url, user, password);
            transaction.setAutoCommit(false);

            if(hm2.get("Students").equals("T2")){
                System.out.println("T2 In students");
                PreparedStatement statement1 = transaction.prepareStatement("SELECT * FROM students");
                ResultSet result = statement1.executeQuery();
            PreparedStatement statement2 = transaction.prepareStatement(
                    "UPDATE students set student_name = 'Khushi Hiren Shah' where student_banner_id = 1");
            statement2.executeUpdate();
            transaction.commit();
            }

            if(hm2.get("Departments").equals("T2")){
                System.out.println("T2 In departments");
                PreparedStatement statement3 = transaction.prepareStatement(
                    "UPDATE departments set head_of_department = 'Robert Hawkey' where department_id = 1"
            );
            statement3.executeUpdate();
            transaction.commit();
            }

            if(hm2.get("Programs").equals("T2")){
                System.out.println("T2 In Programs");
            PreparedStatement statement4 = transaction.prepareStatement(
                    "DELETE FROM programs where program_id = 2"
            );
            statement4.executeUpdate();
            transaction.commit();

            PreparedStatement statement5 = transaction.prepareStatement(
                    "UPDATE programs set program_requirements = 'Masters' where program_id = 1"
            );
            statement5.executeUpdate();
            transaction.commit();
            }
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
    }

    public void releaselock(){
        if(hm2.get("Students").equals("T2")) {
            hm2.put("Students","");
            System.out.println("Lock on Students table is released by T2");
        }
        if(hm2.get("Departments").equals("T2")) {
            hm2.put("Departments","");
            System.out.println("Lock on Departments table is released by T2");
        }
        if(hm2.get("Programs").equals("T2")) {
            hm2.put("Programs","");
            System.out.println("Lock on Programs table is released by T2");
        }
    }
}