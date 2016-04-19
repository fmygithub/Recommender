import org.junit.Test;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by fengmengyang on 2016/4/17.
 * desc:
 */
public class CharToInt {
    @Test
    public void test() {
        char str = 'A';
        List<String> stringList = new LinkedList<>();
        for (int i = 0; i< 26; i++) {
            stringList.add(str + "");
            str = (char)((int)str + 1);
        }
        System.out.println(stringList);
    }
}
