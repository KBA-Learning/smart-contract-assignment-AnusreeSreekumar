// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract Student_Record {
    struct Student {
        uint256 rollnum;
        string name;
        uint256 sem;
        string dept;
        uint256 cgpa;
    }
    address public staffadvisor;

    mapping(uint256 => Student) public student;

    constructor() {
        staffadvisor = msg.sender;
    }

    modifier isStaffAdvisor() {
        require((msg.sender == staffadvisor), "Not Authorized");
        _;
    }

    function setStudent(
        uint256 _rollnum,
        string memory _name,
        uint256 _sem,
        string memory _dept,
        uint256 _cgpa
    ) public isStaffAdvisor {
        student[_rollnum] = Student(_rollnum, _name, _sem, _dept, _cgpa);
    }

    function getStudent(uint256 _rollnum) public view isStaffAdvisor()
        returns (
            uint256,
            string memory,
            uint256,
            string memory,
            uint256
        )
    {
        require((student[_rollnum].rollnum == _rollnum), "Student not present");
        return (
            student[_rollnum].rollnum,
            student[_rollnum].name,
            student[_rollnum].sem,
            student[_rollnum].dept,
            student[_rollnum].cgpa
        );
    }

    function editStudentDtls(
        uint256 _rollnum,
        string memory _name,
        uint256 _sem,
        string memory _dept,
        uint256 _cgpa
    ) public {
        require((student[_rollnum].rollnum == _rollnum), "Student not present");

        if (msg.sender == staffadvisor)
            student[_rollnum] = Student(_rollnum, _name, _sem, _dept, _cgpa);

        else{
            require(
                (student[_rollnum].sem == _sem && keccak256(abi.encodePacked(student[_rollnum].dept)) == keccak256(abi.encodePacked(_dept)) && 
                student[_rollnum].cgpa == _cgpa), "Only authorized to change Student name");
            student[_rollnum].name = _name;
        }
        
    }
}