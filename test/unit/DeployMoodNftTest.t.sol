// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test{
      DeployMoodNft public deployer;


      function setUp() public {
        deployer = new DeployMoodNft();
      }

      function testConvertSvgToImageURI() public view {
        string memory expectedURI = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIj48dGV4dCB4PSIwIiB5PSIxNSIgZmlsbD0icmVkIj4gSW0gaGFwcHkgZm9yIG15IHByb2dyZXNzIDwvdGV4dD48L3N2Zz4=";
        string memory svg = '<svg xmlns="http://www.w3.org/2000/svg" width="500" height="500"><text x="0" y="15" fill="red"> Im happy for my progress </text></svg>';

        assert(keccak256(abi.encodePacked(expectedURI)) == keccak256(abi.encodePacked(deployer.svgToImageURI(svg))));
      }
}