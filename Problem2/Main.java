import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        HashMapLocks hashMapLocks = new HashMapLocks();

        Transaction1 t1 = new Transaction1("Transaction 1",hashMapLocks.locks);
        Thread transaction1 = new Thread(t1);

        Transaction2 t2 = new Transaction2("Transaction 2",hashMapLocks.locks);
        Thread transaction2 = new Thread(t2);

        transaction1.start(); // starting the transaction 1
        transaction2.start(); // stating the transaction 2
    }
}