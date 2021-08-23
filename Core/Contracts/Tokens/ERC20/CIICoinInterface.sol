pragma solidity >=0.7.0 <0.9.0;

interface CII20Interface {
    uint256 external _totalSupply;

    function balanceOf(address account) external virtual view returns(uint256);

    function transfer(address recipet, uint256 amount) external virtual returns(bool);

    function allowance(address owner, uint256 amount) external virtual view returns(uint256);

    function approve(address spender, uint256 amount) virtual external returns(bool);

    function transferFrom(address spender,
                          address recipient,
                          uint256 amount)
                          external returns(bool);

    event Transfer(address indexed_from, 
                   address indexed_to, 
                   uint256 value);

    event Approve(address indexed_from, 
                  address indexed_to, 
                  uint256 value);                    
    
    

}