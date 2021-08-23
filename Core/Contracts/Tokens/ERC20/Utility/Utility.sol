pragma solidity >=0.7.0 <0.9.0; 

abstract contract Utitlity{
    function msgSender() internal view virtual returns (address){
        return msg.sender;
    }

    function msgData() internal view virtual returns (bytes calldata){
        return msg.data;
    }
}