pragma solidity ^0.4.16;
pragma experimental "v0.5.0";
pragma experimental "ABIEncoderV2";

import {Math} from "../../src/math/Math.sol";
import {STLTest} from "../STLTest.sol";

contract MathTest is STLTest {
    using Math for *;

    uint constant UINT_ZERO = 0;
    uint constant UINT_ONE = 1;
    uint constant UINT_TWO = 2;
    uint constant UINT_ONES = ~uint(0);

    int constant INT_ZERO = 0;
    int constant INT_ONE = 1;
    int constant INT_TWO = 2;
    int constant INT_MINUS_ONE = -1;
    int constant INT_MAX = int(2**255 - 1);
    int constant INT_MIN = int(2**255);
}


contract TestMathExactAddUint is MathTest {

    uint constant TEST_VAL_1 = 937659378456935;
    uint constant TEST_VAL_2 = 23457722001;

    function testImpl() internal {
        uint x = UINT_ZERO;
        uint y = UINT_ZERO;
        assert(x.exactAdd(y) == UINT_ZERO);
        x = UINT_ZERO;
        y = TEST_VAL_1;
        assert(x.exactAdd(y) == y);
        x = TEST_VAL_1;
        y = UINT_ZERO;
        assert(x.exactAdd(y) == x);
        x = TEST_VAL_1;
        y = TEST_VAL_2;
        assert(x.exactAdd(y) == y.exactAdd(x));
        assert(x.exactAdd(y) == x + y);
    }
}


contract TestMathExactAddUintThrowsOverflow is MathTest {
    function testImpl() internal {
        uint x = UINT_ONES;
        uint y = UINT_ONE;
        x.exactAdd(y);
    }
}

contract TestMathExactSubUint is MathTest {

    uint constant TEST_VAL_1 = 937659378456935;
    uint constant TEST_VAL_2 = 23457722001;

    function testImpl() internal {
        uint x = UINT_ZERO;
        uint y = UINT_ZERO;
        assert(x.exactSub(y) == UINT_ZERO);
        x = TEST_VAL_1;
        y = UINT_ZERO;
        assert(x.exactSub(y) == x);
        x = TEST_VAL_1;
        y = TEST_VAL_2;
        assert(x.exactSub(y) == x - y);
    }
}

contract TestMathExactSubUintThrowsUnderflow is MathTest {
    function testImpl() internal {
        uint x = 3;
        uint y = 5;
        x.exactSub(y);
    }
}


contract TestMathExactMulUint is MathTest {

    uint constant TEST_VAL_1 = 937659378456935;
    uint constant TEST_VAL_2 = 23457722001;

    function testImpl() internal {
        uint x = UINT_ZERO;
        uint y = UINT_ZERO;
        assert(x.exactMul(y) == UINT_ZERO);
        x = UINT_ZERO;
        y = TEST_VAL_1;
        assert(x.exactMul(y) == UINT_ZERO);
        x = TEST_VAL_1;
        y = UINT_ZERO;
        assert(x.exactMul(y) == UINT_ZERO);
        x = UINT_ONE;
        y = UINT_ONE;
        assert(x.exactMul(y) == UINT_ONE);
        x = UINT_ONE;
        y = TEST_VAL_1;
        assert(x.exactMul(y) == y);
        x = TEST_VAL_1;
        y = UINT_ONE;
        assert(x.exactMul(y) == x);
        x = TEST_VAL_1;
        y = TEST_VAL_2;
        assert(x.exactMul(y) == y.exactMul(x));
        assert(x.exactMul(y) == x * y);
    }
}


contract TestMathExactMulUintThrowsOverflow is MathTest {
    function testImpl() internal {
        uint x = UINT_ONES;
        uint y = UINT_TWO;
        x.exactMul(y);
    }
}


contract TestMathExactAddInt is MathTest {

    int constant TEST_VAL_1 = 937659378456935;
    int constant TEST_VAL_2 = 23457722001;
    int constant TEST_VAL_1N = -937659378456935;
    int constant TEST_VAL_2N = -23457722001;

    function testImpl() internal {
        int x = INT_ZERO;
        int y = INT_ZERO;
        assert(x.exactAdd(y) == INT_ZERO);
        x = INT_ZERO;
        y = TEST_VAL_1;
        assert(x.exactAdd(y) == y);
        x = INT_ZERO;
        y = TEST_VAL_1N;
        assert(x.exactAdd(y) == y);
        x = TEST_VAL_1;
        y = INT_ZERO;
        assert(x.exactAdd(y) == x);
        x = TEST_VAL_1N;
        y = INT_ZERO;
        assert(x.exactAdd(y) == x);
        x = TEST_VAL_1;
        y = TEST_VAL_2;
        assert(x.exactAdd(y) == y.exactAdd(x));
        assert(x.exactAdd(y) == x + y);
        x = TEST_VAL_1;
        y = TEST_VAL_1N;
        assert(x.exactAdd(y) == y.exactAdd(x));
        assert(x.exactAdd(y) == INT_ZERO);
        x = INT_MIN;
        y = INT_MAX;
        assert(x.exactAdd(y) == INT_MINUS_ONE);
    }
}


contract TestMathExactAddIntThrowsOverflow is MathTest {
    function testImpl() internal {
        int x = INT_MAX;
        int y = INT_ONE;
        x.exactAdd(y);
    }
}


contract TestMathExactAddIntThrowsUnderflow is MathTest {
    function testImpl() internal {
        int x = INT_MIN;
        int y = INT_MINUS_ONE;
        x.exactAdd(y);
    }
}


contract TestMathExactSubInt is MathTest {

    int constant TEST_VAL_1 = 937659378456935;
    int constant TEST_VAL_2 = 23457722001;
    int constant TEST_VAL_1N = -937659378456935;
    int constant TEST_VAL_2N = -23457722001;

    function testImpl() internal {
        int x = INT_ZERO;
        int y = INT_ZERO;
        assert(x.exactSub(y) == INT_ZERO);
        x = TEST_VAL_1;
        y = INT_ZERO;
        assert(x.exactSub(y) == x);
        x = TEST_VAL_1N;
        y = INT_ZERO;
        assert(x.exactSub(y) == x);
        x = INT_ZERO;
        y = TEST_VAL_1;
        assert(x.exactSub(y) == -y);
        x = INT_ZERO;
        y = TEST_VAL_1N;
        assert(x.exactSub(y) == -y);
        x = TEST_VAL_1;
        y = TEST_VAL_2;
        assert(x.exactSub(y) == -y.exactSub(x));
        assert(x.exactSub(y) == x - y);
        x = TEST_VAL_1;
        y = TEST_VAL_1N;
        assert(x.exactSub(y) == x + x);
    }
}


contract TestMathExactSubIntThrowsOverflow is MathTest {
    function testImpl() internal {
        int x = INT_MAX;
        int y = INT_MINUS_ONE;
        x.exactSub(y);
    }
}


contract TestMathExactSubIntThrowsUnderflow is MathTest {
    function testImpl() internal {
        int x = INT_MIN;
        int y = INT_ONE;
        x.exactSub(y);
    }
}


contract TestMathExactMulInt is MathTest {

    int constant TEST_VAL_1 = 937659378456935;
    int constant TEST_VAL_2 = 23457722001;
    int constant TEST_VAL_1N = -937659378456935;
    int constant TEST_VAL_2N = -23457722001;

    function testImpl() internal {
        int x = INT_ZERO;
        int y = INT_ZERO;
        assert(x.exactMul(y) == INT_ZERO);
        x = INT_ZERO;
        y = TEST_VAL_1;
        assert(x.exactMul(y) == INT_ZERO);
        x = TEST_VAL_1;
        y = INT_ZERO;
        assert(x.exactMul(y) == INT_ZERO);
        x = INT_ONE;
        y = INT_ONE;
        assert(x.exactMul(y) == INT_ONE);
        x = INT_ONE;
        y = TEST_VAL_1;
        assert(x.exactMul(y) == y);
        x = TEST_VAL_1;
        y = INT_ONE;
        assert(x.exactMul(y) == x);
        x = TEST_VAL_1;
        y = TEST_VAL_2;
        assert(x.exactMul(y) == y.exactMul(x));
        assert(x.exactMul(y) == x * y);
        x = TEST_VAL_1;
        y = INT_MINUS_ONE;
        assert(x.exactMul(y) == TEST_VAL_1N);
        x = TEST_VAL_1N;
        y = INT_MINUS_ONE;
        assert(x.exactMul(y) == TEST_VAL_1);
        x = INT_MINUS_ONE;
        y = TEST_VAL_1N;
        assert(x.exactMul(y) == TEST_VAL_1);
    }

}


contract TestMathExactMulIntThrowsOverflow is MathTest {
    function testImpl() internal {
        int x = INT_MAX;
        int y = INT_TWO;
        x.exactMul(y);
    }
}


contract TestMathExactMulIntThrowsUnderflow is MathTest {
    function testImpl() internal {
        int x = INT_MIN;
        int y = INT_TWO;
        x.exactMul(y);
    }
}


contract TestMathExactMulIntThrowsIntMinAndMinusOne is MathTest {
    function testImpl() internal {
        int x = INT_MIN;
        int y = INT_MINUS_ONE;
        x.exactMul(y);
    }
}


contract TestMathExactMulIntThrowsMinusOneAndIntMin is MathTest {
    function testImpl() internal {
        int x = INT_MINUS_ONE;
        int y = INT_MIN;
        x.exactMul(y);
    }
}


contract TestMathExactDivInt is MathTest {

    int constant TEST_VAL_1 = 937659378456935;
    int constant TEST_VAL_2 = 23457722001;
    int constant TEST_VAL_1N = -937659378456935;
    int constant TEST_VAL_2N = -23457722001;

    function testImpl() internal {
        int x = INT_ONE;
        int y = INT_ONE;
        assert(x.exactDiv(y) == INT_ONE);
        x = TEST_VAL_1;
        y = INT_ONE;
        assert(x.exactDiv(y) == TEST_VAL_1);
        x = TEST_VAL_1;
        y = INT_MINUS_ONE;
        assert(x.exactDiv(y) == TEST_VAL_1N);
        x = TEST_VAL_1;
        y = TEST_VAL_2;
        assert(x.exactDiv(y) == x / y);
        x = TEST_VAL_2;
        y = TEST_VAL_1;
        assert(x.exactDiv(y) == INT_ZERO);
        x = TEST_VAL_1N;
        y = INT_MINUS_ONE;
        assert(x.exactDiv(y) == TEST_VAL_1);
    }

}


contract TestMathExactDivIntThrowsIntMinAndMinusOne is MathTest {
    function testImpl() internal {
        int x = INT_MIN;
        int y = INT_MINUS_ONE;
        x.exactMul(y);
    }
}