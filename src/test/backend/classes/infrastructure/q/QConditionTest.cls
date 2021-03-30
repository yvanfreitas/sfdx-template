/**
* QConditionTest is used to test QCondition logic
* @author  Jean-Philippe Monette
* @since   2017-04-21
*/
@isTest
private class QConditionTest {

	@isTest
	static void testEqualsString() {
		String segment = new QCondition('Name').equalsTo('Jean-Philippe Monette').build();
		System.assertEquals('Name = \'Jean-Philippe Monette\'', segment, 'It should output an equal condition.');
	}

	@isTest
	static void testEqualsInteger() {
		String segment = new QCondition('Age').equalsTo(5).build();
		System.assertEquals('Age = 5', segment, 'It should output an equal integer condition.');
	}

	@isTest
	static void testNotEquals() {
		String segment = new QCondition('Name').notEqualsTo('Jean-Philippe Monette').build();
		System.assertEquals('Name != \'Jean-Philippe Monette\'', segment, 'It should output a not equal condition.');
	}

	@isTest
	static void testIsLessThan() {
		String segment = new QCondition('Age').isLessThan(5).build();
		System.assertEquals('Age < 5', segment, 'It should output a less than condition.');
	}

	@isTest
	static void testIsLessOrEquals() {
		String segment = new QCondition('Age').isLessOrEquals(5).build();
		System.assertEquals('Age <= 5', segment, 'It should output a less or equal condition.');
	}

	@isTest
	static void testIsGreaterThan() {
		String segment = new QCondition('Age').isGreaterThan(5).build();
		System.assertEquals('Age > 5', segment, 'It should output a greather than condition.');
	}

	@isTest
	static void testIsGreaterOrEquals() {
		String segment = new QCondition('Age').isGreaterOrEquals(5).build();
		System.assertEquals('Age >= 5', segment, 'It should output a greater or equal condition.');
	}

	@isTest
	static void testIsLike() {
		String segment = new QCondition('Name').isLike('%Acme%').build();
		System.assertEquals('Name LIKE \'%Acme%\'', segment, 'It should output a LIKE condition.');
	}

	@isTest
	static void testIsIn() {
		List<String> names = new List<String>{'John', 'Jane'};
		String segment = new QCondition('Name').isIn(names).build();
		System.assertEquals('Name IN (\'John\', \'Jane\')', segment, 'It should output an IN condition.');
	}

    @isTest
    static void testIsInSetString() {
        Set<String> names = new Set<String>{'John', 'Jane'};
        String segment = new QCondition('Name').isIn(names).build();
        System.assertEquals('Name IN (\'John\', \'Jane\')', segment);
    }

    @isTest
    static void testIsInSetId() {
        Set<Id> ids = new Set<Id>{'5008A000006w6paQAA', '5008A000006w6pbQAA'};
        String segment = new QCondition('Id').isIn(ids).build();
        System.assertEquals('Id IN (\'5008A000006w6paQAA\', \'5008A000006w6pbQAA\')', segment);
    }

    @isTest
    static void testIsInWithNumbers() {
        List<Integer> numbers = new List<Integer>{1, 2}; 
        String segment = new QCondition('Number').isIn(numbers).build(); 
        System.assertEquals('Number IN (1, 2)', segment);
    }

	@isTest
	static void testIsNotIn() {
		List<String> names = new List<String>{'John', 'Jane'};
		String segment = new QCondition('Name').isNotIn(names).build();
		System.assertEquals('Name NOT IN (\'John\', \'Jane\')', segment, 'It should output a NOT IN condition.');
	}

	@isTest
	static void testIncludes() {
		List<String> markets = new List<String>{'APAC', 'EMEA'};
		String segment = new QCondition('Market').includes(markets).build();
		System.assertEquals('Market INCLUDES (\'APAC\', \'EMEA\')', segment, 'It should output an INCLUDES condition.');
	}

	@isTest
	static void testExcludes() {
		List<String> markets = new List<String>{'APAC', 'EMEA'};
		String segment = new QCondition('Market').excludes(markets).build();
		System.assertEquals('Market EXCLUDES (\'APAC\', \'EMEA\')', segment, 'It should output a EXCLUDES condition.');
	}

	@isTest
	static void testIsNull() {
		String segment = new QCondition('Name').isNull().build();
		System.assertEquals('Name = null', segment, 'It should output an IS NULL condition.');
	}

	@isTest
	static void testIsNotNull() {
		String segment = new QCondition('Name').isNotNull().build();
		System.assertEquals('Name != null', segment, 'It should output a IS NOT NULL condition.');
	}

	@isTest
    static void testFormatDate() {
        Date dt = Date.parse('5/5/2005');
        String segment = new QCondition('SomeDate').isLessThan(dt).build();
        System.assertEquals('SomeDate < 2005-05-05', segment);
    }

    @isTest
    static void testFormatDateTime() {
        DateTime dt = Date.parse('5/5/2005');
        String segment = new QCondition('SomeDate').isLessThan(dt).build();
        String expectedResult = 'SomeDate < 2005-05-05T00:00:00.0' + dt.formatGmt('Z');
        System.assertEquals(expectedResult, segment);
    }

}