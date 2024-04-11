RPC_MAIN="127.0.0.1:8545"
bn=$(cast block-number --rpc-url=${RPC_MAIN})
echo "当前区块高度:$bn"
cast block $bn  --json --rpc-url=$RPC_MAIN

#查询交易
#cast tx 0x20e7dda515f04ea6a787f68689e27bcadbba914184da5336204f3f36771f59f0 --rpc-url=$RPC 

#cast receipt 0x20e7dda515f04ea6a787f68689e27bcadbba914184da5336204f3f36771f59f0 --rpc-url=$RPC

# 只获取logs

#cast receipt 0x20e7dda515f04ea6a787f68689e27bcadbba914184da5336204f3f36771f59f0 logs --rpc-url=$RPC


#函数名转字节
#cast sig "swapExactTokensForTokens(uint256,uint256,address[],address,uint256)"
# cast 4byte <SELECTOR> 解析交易的名称
#cast 4byte 0x38ed1739

#交易解码
# 获得calldata
#cast tx 0x20e7dda515f04ea6a787f68689e27bcadbba914184da5336204f3f36771f59f0 input --rpc-url=$RPC

# 可以通过该方法decode交易的数据，类似etherscan中的decode方法
# cast pretty-calldata <CALLDATA>
#cast pretty-calldata 0x38ed173900000000000000000000000000000000000000000000000332ca1b67940c000000000000000000000000000000000000000000000000000416b4849e6ba1475000000000000000000000000000000000000000000000000000000000000000a00000000000000000000000009c0649d7325990d98375f7864ea167b5eadcd46a00000000000000000000000000000000000000000000000000000000634d91c1000000000000000000000000000000000000000000000000000000000000000200000000000000000000000097be09f2523b39b835da9ea3857cfa1d3c660cbb0000000000000000000000001bbf25e71ec48b84d773809b4ba55b6f4be946fb

#模拟运行
# Usage: cast run --rpc-url <URL> <TXHASH>

#cast run 0x20e7dda515f04ea6a787f68689e27bcadbba914184da5336204f3f36771f59f0

#新建账户
# 新建一个账号
# cast wallet new [OUT_DIR] 
#cast wallet new

# 新建一个keystore的账号，带有密码
# cast wallet new <PATH>
#cast wallet new  ~/Downloads

#账户签名
# 两种方法都可以使用签名，第一种载入刚才生成的keystore私钥，第二种直接输入自己的私钥。
#cast wallet sign <MESSAGE> --keystore=<PATH> 
#cast wallet sign <MESSAGE> -i

#账户验证
#cast wallet verify --address <ADDRESS> <MESSAGE> <SIGNATURE> 

#获取合约
cast etherscan-source <contract address>

cast etherscan-source 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2 --etherscan-api-key='key'

#下载合约
#cast etherscan-source -d <path>
# 我这里已经将$WETH的地址写入环境变量，如果没写入的，可以写成合约地址
cast etherscan-source $WETH -d ~/Downloads


调用合约
调用 WETH合约的balanceOf方法,查看0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2账号的余额

#cast call [OPTIONS] [TO] [SIG] [ARGS]... [COMMAND] --rpc-url=$RPC

cast call $WETH "balanceOf(address)" 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2 --rpc-url=$RPC

# 输出
# 0x0000000000000000000000000000000000000000000000230d12770f2845219c

# 格式化输出 在参数后面加一个返回值的格式

cast call $WETH "balanceOf(address)(uint256)" 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2 --rpc-url=$RPC

# 输出
# 646577988758891995548
解析ABI
可以根据ABI反向解析出solidity代码

# cast interface [OPTIONS] <PATH_OR_ADDRESS>
cast interface ./weth.abi
编码解码
cast --to-hex 

cast --to-dec 

cast --to-unit 

cast --to-wei 

cast --to-rlp 

cast --from-rlp

tips
设置ETH_RPC_URL
将环境变量的ETH_RPC_URL设置为 --rpc-url 你就不需要在每个命令行后面增加 --rpc-url=$RPC_MAIN 我这里直接设置为主网

设置ETHERSCAN_API_KEY
设置ETHERSCAN_API_KEY环境变量可以直接代替 --etherscan-api-key
加上 --json 可以格式化输出

cast block 15769241 --json --rpc-url=$RPC_MAIN