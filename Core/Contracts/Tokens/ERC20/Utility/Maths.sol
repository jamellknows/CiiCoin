// solidity maths file 
pragma solidity >=0.7.0 <0.9.0; 

library Math {
    
    function additon(uint256 a, uint256 b) internal pure returns(uint256){
        return a + b;
    }

    function subtraction(uint256 a, uint256 b) internal pure returns(uint256){
        return a - b;
    }

    function multiplication(uint256 a, uint256 b) internal pure returns(uint256){
        return a * b;
    }

    function division(uint256 a, uint256 b) internal pure returns(uint256){
        return a / b;
    }


    
}

