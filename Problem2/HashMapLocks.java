import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;

public class HashMapLocks {
    ConcurrentHashMap<String, String> locks = new ConcurrentHashMap<String,String>();
}
