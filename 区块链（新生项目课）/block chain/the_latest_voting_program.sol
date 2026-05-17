// SPDX-License-Identifier: MIT
pragma solidity ^0.5.3;

contract Voting {
    //构造函数，合约的拥有者是信息的发出人
    //老大哥
    // address public contractOwner;

    //一个候选人列表，存储候选人的address
    bytes32[] public candidatesList;

    // //投票人地址名单
    // address[] public votersList;

    //统计每位候选人收到投票的情况，键是地址，值是票数
    mapping(bytes32 => uint8) public voteRecieved;

    //记录每一位投票人给哪些人投过票，已经投过的人不能重复投
    mapping(bytes32 => bool) public voteList;

    //胜利者和胜利者的得票数
    // bytes32 public winner_address;
    // uint public winnerVotes;

    //枚举类型，定义了三种投票的状态-未开始，进行中，完成
    // enum votingStatus {
    //     NotStarted,
    //     Running,
    //     Completed
    // }

    //投票状态
    // votingStatus public status;

    //投票的次数，最多三次
    uint remain = 3;

    // modifier OnlyOwner() {
    //     if (msg.sender == contractOwner) {
    //         _;
    //     }
    // }

    //构造函数，合约的拥有者是信息的发出人
    constructor(bytes32[] memory _candidatesList) public {
        // for(uint i=0;i<_candidatesList.length;i++)
        // {
        //     candidatesList.push(_candidatesList[i]);
        //     voteRecieved[_candidatesList[i]] = 0; //初始化每个候选人的得票数为0
        // }
        // contractOwner = msg.sender; //msg.sender是合约部署人的地址，因此msg.sender是合约拥有者的地址。
        candidatesList=_candidatesList;
        remain = 3;
     }

    //改变投票的状态，如果投票状态不是“完成”或“进行中”，则将状态设置为“进行中”，否则将状态设置为“完成”。
    // function setStatus()  public OnlyOwner {
    //     if (
    //         status != votingStatus.Completed && status != votingStatus.Running
    //     ) {
    //         status = votingStatus.Running;
    //     } else {
    //         status = votingStatus.Completed;
    //     }
    // }
    
    //检查是否还有票数
    function check_remain() public view returns (bool) {
        if (remain > 0) {
            return true;
        } else {
            return false;
        }
    }

    //投票
    function voteForCandidate(bytes32 candidate) public returns (bool){
        require(check_remain(), "Your number of votes has been exhausted!");
        voteList[candidate] = true;
        voteRecieved[candidate] += 1;
        remain--;
        return true;
    }

    //返回票数
    function totalVotesFor(bytes32 candidate) public view  returns (uint8) {
        require(validCandidate(candidate));
        return voteRecieved[candidate];
    }

    //后选人是否存在
    function validCandidate(bytes32 candidate) public view returns (bool) {
        for (uint8 i = 0; i < candidatesList.length; i++) {
            if (candidatesList[i] == candidate) return true;
        }    
        return false;
    }

    // refresh
    function reset() public {
        remain = 3;
        for(uint i = 0;i < candidatesList.length; i++){
            voteList[candidatesList[i]] = false;
        }    
    }
}
