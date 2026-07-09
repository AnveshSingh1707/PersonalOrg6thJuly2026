@IsTest
public class MyIterableTest {
	@IsTest
    public static void testIterableForLoop() {
        List<String> strings = new List<String>{'Hello','World'};
        MyIterable it = new MyIterable(strings);
        for(String value : it) {
            System.debug(value);
        }
    }
}