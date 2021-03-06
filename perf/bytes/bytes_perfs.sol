pragma solidity ^0.4.16;
pragma experimental "v0.5.0";
pragma experimental "ABIEncoderV2";

import {Bytes} from "../../src/bytes/Bytes.sol";
import {STLPerf} from "../STLPerf.sol";


contract BytesPerf is STLPerf {
    using Bytes for *;
}


contract PerfBytesEqualsOneWordSuccess is BytesPerf {
    function perf() public payable returns (uint) {
        bytes memory bts = new bytes(32);
        uint gasPre = msg.gas;
        Bytes.equals(bts, bts);
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesEqualsTenWordsSuccess is BytesPerf {
    function perf() public payable returns (uint) {
        bytes memory bts = new bytes(320);
        uint gasPre = msg.gas;
        Bytes.equals(bts, bts);
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesEqualsHalfWordSuccess is BytesPerf {
    function perf() public payable returns (uint) {
        bytes memory bts = new bytes(16);
        uint gasPre = msg.gas;
        Bytes.equals(bts, bts);
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesEqualsDifferentLengthFail is BytesPerf {
    function perf() public payable returns (uint) {
        bytes memory bts1 = new bytes(0);
        bytes memory bts2 = new bytes(1);
        uint gasPre = msg.gas;
        Bytes.equals(bts1, bts2);
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesEqualsOneWordFail is BytesPerf {
    function perf() public payable returns (uint) {
        bytes memory bts1 = new bytes(32);
        bytes memory bts2 = hex"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
        uint gasPre = msg.gas;
        Bytes.equals(bts1, bts2);
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesEqualsRef is BytesPerf {
    function perf() public payable returns (uint) {
        bytes memory bts = hex"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
        uint gasPre = msg.gas;
        Bytes.equalsRef(bts, bts);
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesCopyOneWord is BytesPerf {
    function perf() public payable returns (uint) {
        bytes memory bts = new bytes(32);
        uint gasPre = msg.gas;
        bts.copy();
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesCopyTenWords is BytesPerf {
    function perf() public payable returns (uint) {
        bytes memory bts = new bytes(320);
        uint gasPre = msg.gas;
        bts.copy();
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesCopyEmpty is BytesPerf {
    function perf() public payable returns (uint) {
        bytes memory bts = new bytes(0);
        uint gasPre = msg.gas;
        bts.copy();
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesSubstrOneWord is BytesPerf {
    function perf() public payable returns (uint) {
        bytes memory bts = new bytes(35);
        uint gasPre = msg.gas;
        bts.substr(3);
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesSubstrWithLengthOneWord is BytesPerf {
    function perf() public payable returns (uint) {
        bytes memory bts = new bytes(35);
        uint gasPre = msg.gas;
        bts.substr(2, 32);
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesConcatTwoWords is BytesPerf {
    function perf() public payable returns (uint) {
        bytes memory bts = new bytes(32);
        uint gasPre = msg.gas;
        bts.concat(bts);
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesConcatTenWords is BytesPerf {
    function perf() public payable returns (uint) {
        bytes memory bts = new bytes(160);
        uint gasPre = msg.gas;
        bts.concat(bts);
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesConcatEmpty is BytesPerf {
    function perf() public payable returns (uint) {
        bytes memory bts = new bytes(0);
        uint gasPre = msg.gas;
        bts.concat(bts);
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesBytes32Substr is BytesPerf {
    function perf() public payable returns (uint) {
        bytes32 b32 = 0;
        uint gasPre = msg.gas;
        b32.substr(3);
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesBytes32SubstrWithLength is BytesPerf {
    function perf() public payable returns (uint) {
        bytes32 b32 = 0;
        uint gasPre = msg.gas;
        b32.substr(2, 21);
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesBytes32ToBytes is BytesPerf {
    function perf() public payable returns (uint) {
        bytes32 b32 = 0x10203040;
        uint gasPre = msg.gas;
        b32.toBytes();
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesBytes32ToBytesWithLength is BytesPerf {
    function perf() public payable returns (uint) {
        bytes32 b32 = 0x10203040;
        uint gasPre = msg.gas;
        b32.toBytes(4);
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesAddressToBytes is BytesPerf {
    function perf() public payable returns (uint) {
        address addr = 0;
        uint gasPre = msg.gas;
        addr.toBytes();
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesUintToBytes is BytesPerf {
    function perf() public payable returns (uint) {
        uint n = 0x10203040;
        uint gasPre = msg.gas;
        n.toBytes();
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesUintToBytesWithBitsize is BytesPerf {
    function perf() public payable returns (uint) {
        uint n = 0x10203040;
        uint gasPre = msg.gas;
        n.toBytes(64);
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesBooleanToBytes is BytesPerf {
    function perf() public payable returns (uint) {
        uint gasPre = msg.gas;
        true.toBytes();
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}

contract PerfBytesBytes32HighestByteSetLow is BytesPerf {
    function perf() public payable returns (uint) {
        bytes32 b32 = bytes32("a");
        uint gasPre = msg.gas;
        b32.highestByteSet();
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesBytes32HighestByteSetHigh is BytesPerf {
    function perf() public payable returns (uint) {
        bytes32 b32 = bytes32(0x01);
        uint gasPre = msg.gas;
        b32.highestByteSet();
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesBytes32LowestByteSetLow is BytesPerf {
    function perf() public payable returns (uint) {
        bytes32 b32 = bytes32("a");
        uint gasPre = msg.gas;
        b32.lowestByteSet();
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesBytes32LowestByteSetHigh is BytesPerf {
    function perf() public payable returns (uint) {
        bytes32 b32 = bytes32(0x01);
        uint gasPre = msg.gas;
        b32.lowestByteSet();
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesUintHighestByteSetLow is BytesPerf {
    function perf() public payable returns (uint) {
        uint gasPre = msg.gas;
        uint(1).highestByteSet();
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesUintHighestByteSetHigh is BytesPerf {
    function perf() public payable returns (uint) {
        uint n = (uint(1) << 255);
        uint gasPre = msg.gas;
        n.highestByteSet();
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesUintLowestByteSetLow is BytesPerf {
    function perf() public payable returns (uint) {
        uint gasPre = msg.gas;
        uint(1).lowestByteSet();
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}


contract PerfBytesUintLowestByteSetHigh is BytesPerf {
    function perf() public payable returns (uint) {
        uint n = (uint(1) << 255);
        uint gasPre = msg.gas;
        n.lowestByteSet();
        uint gasPost = msg.gas;
        return gasPre - gasPost;
    }
}