// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./RockPaperScissors.sol";

contract TestRockPaperScissors {
    RockPaperScissors public gameContract;

    constructor(address _gameContractAddress) {
        gameContract = RockPaperScissors(_gameContractAddress);
    }

    function testCreateGame() public payable {
        gameContract.createGame{value: msg.value}();
    }

    function testJoinGame(uint256 gameId) public payable {
        gameContract.joinGame{value: msg.value}(gameId);
    }

    function testMakeMove(uint256 gameId, RockPaperScissors.Move move) public {
        gameContract.makeMove(gameId, move);
    }

    function testFullGame() public payable {
        // Player 1 creates a game
        testCreateGame{value: 1 ether}();

        // Player 2 joins the game
        testJoinGame{value: 1 ether}(0);

        // Player 1 makes a move
        testMakeMove(0, RockPaperScissors.Move.Rock);

        // Player 2 makes a move
        testMakeMove(0, RockPaperScissors.Move.Paper);
    }
}