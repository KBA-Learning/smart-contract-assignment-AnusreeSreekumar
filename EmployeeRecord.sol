// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract EmployeeRecord{

    struct Employee{
        string name;
        string dept;
        string desgtn;
        uint256 salary;
    }

    Employee emp;

    function setEmployeeDtls(string memory _name, string memory _dept, string memory _desgtn, uint256 _salary) public{

        emp.name = _name;
        emp.dept = _dept;
        emp.desgtn = _desgtn;
        emp.salary = _salary;
    }

    function getEmployeeDtls() public view returns(string memory, string memory, string memory, uint256){
        return (emp.name, emp.dept, emp.desgtn, emp.salary);
    }

    function payEmployee() public payable {

        
    }
}