// 连接以太坊节点，server 为 Ganache 的 RPC SERVER，复制粘贴过来即可
server = "HTTP://127.0.0.1:8545"
web3 = new Web3(new Web3.providers.HttpProvider(server));
// 要使用智能合约，必须先从区块链中获取到合约实例，获取合约实例需要合约的 ABI 和合约的地址
abi =[
	{
		"constant": false,
		"inputs": [],
		"name": "reset",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "bytes32[]",
				"name": "_candidatesList",
				"type": "bytes32[]"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"constant": false,
		"inputs": [
			{
				"internalType": "bytes32",
				"name": "candidate",
				"type": "bytes32"
			}
		],
		"name": "voteForCandidate",
		"outputs": [
			{
				"internalType": "bool",
				"name": "",
				"type": "bool"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"name": "candidatesList",
		"outputs": [
			{
				"internalType": "bytes32",
				"name": "",
				"type": "bytes32"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "check_remain",
		"outputs": [
			{
				"internalType": "bool",
				"name": "",
				"type": "bool"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"internalType": "bytes32",
				"name": "candidate",
				"type": "bytes32"
			}
		],
		"name": "totalVotesFor",
		"outputs": [
			{
				"internalType": "uint8",
				"name": "",
				"type": "uint8"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"internalType": "bytes32",
				"name": "candidate",
				"type": "bytes32"
			}
		],
		"name": "validCandidate",
		"outputs": [
			{
				"internalType": "bool",
				"name": "",
				"type": "bool"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"internalType": "bytes32",
				"name": "",
				"type": "bytes32"
			}
		],
		"name": "voteList",
		"outputs": [
			{
				"internalType": "bool",
				"name": "",
				"type": "bool"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"internalType": "bytes32",
				"name": "",
				"type": "bytes32"
			}
		],
		"name": "voteRecieved",
		"outputs": [
			{
				"internalType": "uint8",
				"name": "",
				"type": "uint8"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	}
];
address = '0x9b9422410A4865250FC12416D923cAB12BD2b79A';
// 通过 ABI 和地址获取已部署的合约对象
VotingContract = web3.eth.contract(abi, address);
contractInstance = VotingContract.at(address);
candidates = { "Alice": "candidate1", "Bob": "candidate2", "Cary": "candidate3" }
candidates_strToBytes32 = {
    "candidate1": "0x63616e6469646174653100000000000000000000000000000000000000000000",
    "candidate2": "0x63616e6469646174653200000000000000000000000000000000000000000000",
    "candidate3": "0x63616e6469646174653300000000000000000000000000000000000000000000"
}
// 投票按钮的回调函数
function voteForCandidate() {
    _candidatesList = $("#candidate").val();
    contractInstance.voteForCandidate(candidates_strToBytes32[candidates[_candidatesList]], {
        from:
            web3.eth.accounts[0]
    }, function () {
        let div_id = candidates[_candidatesList];
        $("#" + div_id).html(contractInstance.totalVotesFor.call(candidates_strToBytes32[div_id]).toString());
    });
}
// 页面初始化渲染
$(document).ready(function () {
    _candidatesList = Object.keys(candidates);
    for (var i = 0; i < _candidatesList.length; i++) {
        let name = _candidatesList[i];
        let val = contractInstance.totalVotesFor.call(candidates_strToBytes32[candidates[name]]).toString()
        $("#" + candidates[name]).html(val);
    }
});
//获胜者
function winner(){
	var candidate1=document.getElementById("candidate1");
	var candidate1Data=candidate1.innerText||candidate1.textContent;
	var candidate2=document.getElementById("candidate2");
	var candidate2Data=candidate2.innerText||candidate2.textContent;
	var candidate3=document.getElementById("candidate3");
	var candidate3Data=candidate3.innerText||candidate3.textContent;
    if(candidate1Data>=candidate2Data && candidate1Data>=candidate3Data){
    	document.getElementById("winner").innerHTML="Alice";
		document.getElementById("totalVotes").innerText=candidate1Data;
	}
	else if(candidate2Data>=candidate1Data && candidate2Data>=candidate3Data){
   		document.getElementById("winner").innerHTML="Bob";
		document.getElementById("totalVotes").innerText=candidate2Data;
	}
	else if(candidate3Data>=candidate1Data && candidate3Data>=candidate2Data){
		document.getElementById("winner").innerHTML="cary";
		document.getElementById("totalVotes").innerText=candidate3Data;
	}
    
}


    



function reset() {
    contractInstance.reset({
        from:
            web3.eth.accounts[0]
    }, function () {
        
    });
}