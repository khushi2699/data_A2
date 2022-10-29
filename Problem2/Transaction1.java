import javax.crypto.spec.PSource;
import java.sql.*;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class Transaction1 implements Runnable{

    private String threadName;
    HashMapLocks hashMapLocksT1 = new HashMapLocks();
    ConcurrentHashMap<String , String> hm = new ConcurrentHashMap<String, String>();

    Transaction1(String name, ConcurrentHashMap hashMapLocks){
        this.threadName = name;
        System.out.println("Starting transaction: "+threadName);
        this.hm = hashMapLocks;
    }

    @Override
    public void run() {
        try {
            acquirelock(hm);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        operations();
        releaselock();
    }

    public void acquirelock(ConcurrentHashMap hashMapLocks) throws InterruptedException {

        if(hashMapLocks.get("Departments") == null)
        {
            if(hashMapLocks.containsKey("Departments") && hashMapLocks.containsValue("T2"))
            {
                System.out.println("T1: Departments table is locked by Transaction 2");
            }
            else {
                hashMapLocks.put("Departments", "T1");
                System.out.println("T1: Holds Departments");
            }
        }
        else {
            System.out.println("T1: Departments table is locked by Transaction 2");
        }
        if(hashMapLocks.get("Programs") == null) {
            if (hashMapLocks.containsKey("Programs") && hashMapLocks.containsValue("T2")) {
                System.out.println("T1: Programs table is locked by Transaction 2");
            } else {
                hashMapLocks.put("Programs", "T1");
                System.out.println("T1: Holds Programs");
            }
        }
        else {
            System.out.println("T1: Programs table is locked by Transaction 2");
        }

        if(hashMapLocks.get("Students") == null) {
            if (hashMapLocks.containsKey("Students") && hashMapLocks.containsValue("T2")) {
                System.out.println("T1: Students table is locked by Transaction 2");
            } else {
                System.out.println("T1: Holds Students");
                hashMapLocks.put("Students", "T1");
            }
        }
        else {
            System.out.println("T1: Students table is locked by Transaction 2");
        }
    }

    public void operations(){

//        System.out.println("Printing final hashmap");
//
//        Iterator it = hashMapLocks.entrySet().iterator();
//        while(it.hasNext()){
//            Map.Entry pair = (Map.Entry)it.next();
//            System.out.println("Key" + pair.getKey() + "Value"+ pair.getValue());
//        }
//
//        System.out.println("Printing finish");

        String user = "root";
        String password = "12345678";
        String databaseName = "a1p11";
        String url = "jdbc:mysql://localhost:3306/" + databaseName;

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection transaction = DriverManager.getConnection(url,user,password);
            transaction.setAutoCommit(false);

            if(hm.get("Students").equals("T1")){
                System.out.println("T1 In Students");
                PreparedStatement statement1 = transaction.prepareStatement("SELECT * FROM students");
                ResultSet result = statement1.executeQuery();
                while(result.next()) {
                    System.out.print(result.getString("student_banner_id"));
                    System.out.print(result.getString("student_name"));
                }
                PreparedStatement statement2 = transaction.prepareStatement(
                    "UPDATE students set student_name = 'Khushi Shah' where student_banner_id = 1");
                statement2.executeUpdate();
                transaction.commit();
            }

            if(hm.get("Departments").equals("T1")) {
                System.out.println("T1 In departments");
                PreparedStatement statement3 = transaction.prepareStatement(
                    "UPDATE departments set head_of_department = 'Smith Chokshi' where department_id = 1"
                );
                statement3.executeUpdate();
                transaction.commit();
            }

            if(hm.get("Programs").equals("T1")) {
                System.out.println("T1 In programs");
                PreparedStatement statement4 = transaction.prepareStatement(
                    "DELETE FROM programs where program_id = 3"
                );
                statement4.executeUpdate();
                transaction.commit();

                PreparedStatement statement5 = transaction.prepareStatement(
                    "UPDATE programs set program_requirements = 'Masters' where program_id = 2"
                );
                statement5.executeUpdate();
                transaction.commit();
            }
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
    }

    public void releaselock(){
        if(hm.get("Students").equals("T1")) {
            hm.put("Students","");
            System.out.println("Lock on Students table is released by T1");
        }
        if(hm.get("Departments").equals("T1")) {
            hm.put("Departments","");
            System.out.println("Lock on Departments table is released by T1");
        }
        if(hm.get("Programs").equals("T1")) {
            hm.put("Programs","");
            System.out.println("Lock on Programs table is released by T1");
        }
    }
}