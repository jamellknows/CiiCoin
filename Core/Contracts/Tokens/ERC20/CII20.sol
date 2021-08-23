pragma solidity >=0.7.0 <0.9.0;

import "CII20Interface.sol";
import "../Utility/Utility.sol";
import "../Utility/Maths.sol";

contract CII20 is CII20Interface, Utility {

    mapping(address => uint256) private _balances;

    mapping(address => mapping(address => uint256)) private _allowances;

    address private OWNER = msgSender();
    
    string private _name;

    string private _symbol;

    uint8 public _decimals = 18; 

    constructor(string memory name_, string memory symbol_){
        _name = name_;
        _symbol = symbol_;
    }

    function name() public view virtual returns(string memory){
        return _name;
    }

    function symbol() public view view virtual returns (string memory) {
        return _symbol;
    }

    function totalSupply() public view virtual returns(uint256){
        return _totalSupply;
    }

    function balanceOf(address account) public view virtual override returns(uint256){
        return _balances[account];
    }

    function transfer(address recipient, uint256 amount) public virtual override returns(bool){
        TRANSFER(msgSender(), recipient, amount)
        return true;
    }

    function allowance(address owner, address spender) public view virtual override returns(uint256){
        return ALLOWANCE[owner][spender];
    } 

    function approve(address spender, uint256 amount) public virtual override returns(bool){
    
        APPROVE(msgSender(), spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public virtual overrride returns(bool){
        TRANSFER(sender, recipient, amount);

        uint256 currentAllowance = _allowances[sender][msgSender()];

        require(currentAllowance >= amount, "Transfer amount exceeds allowance");

        unchecked{
            APPROVE(sender, msgSender(), currentAllowance-amount)
        }

        return true; 

    }

    function increaseAllowance(address spender, uint256 addedValue) public virtual returns(bool){
        APPROVE(msgSender(), spender, _allowances[msgSender()][spender] + addedValue);

        return true;
    }

    function decreaseAllowance(address spender, uint256 addedValue) public virtual returns(bool){
        uint256 currentAllowance = _allowances[msgSender()];
        require(currentAllowance >= subtractedValue, "Decreased Allowance must not exceed Current Allowance");
        unchecked{
            APPROVE(msgSender(), spender, currentAllowance-subtractedValue);
        }
        return true; 
    }

    function TRANSFER(address sender, address recipient, uint256 amount) internal virtual {
        require(sender != address(0), "Cannot transfer tokens from the 0 address");
        require(recipient != address(0), "Cannot send tokens to the 0 address");

        BEFORETOKENTRANSFER(sender, recipient, amount);

        uint256 senderBalance = _balances[sender];
        require(senderBalance >= amount, "Sender Balance must exceed the transfer amount");
        unchecked{
            _balances[sender] = senderBalance-amount;
        }
        _balances[recipient] += amount;
        emit Transfer(sender, recipient, amount);

        AFTERTOKENTRANSFER( sender, recipient, amount);      
    }

    function MINT(address account, uint256 amount) internal virtual{
        require(account == address(0), "The mint adress must be the 0x0 address"); // experiment 
        BEFORETOKENTRANSFER(address(0), account, amount);

        _totalSupply += amount;

        _balances[account] += amount; 

    }

    function APPROVE(address owner, address spender, uint256 amount) internal virtual{
        require(owner != address(0), "Cannot approve transation to send from the 0x0 address");
        require(spender != address(0), "Cannot approve transaction to send to the 0x0 address");

        ALLOWANCES[owner][sender] = amount;
        event Aproval(owner, spender, amount);
    }

    function beforeTokenTransfer(address from, address to, uint256 amount) internal virtual{
        // This is a function that has no purpose
        //probbaly write something here like a check 

    }

    function afterTokenTransfer(address from, address to, uint256 amount) internal virtual {
        // This is a function with no purpose
    }

    function TRANSFERTOZERO(uint256 amount) external virtual {
        require(msgSender() != address(this));

        _balances[address(this)] = amount;

        beforeTokenTransfer(msgSender(), address(this), amount);

        emit Transfer( msgSender(), address(this), amount);


    }

    function TRANSFERFROMZERO(address recipient, uint256 amount) internal virtual {
        require(msgSender() == address(this))
        require(recipient != address(this))
    }






   

    

   

}