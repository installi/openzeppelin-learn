# 合约名称 - 中文描述(abstract)
## 构造函数参数详解
* string memory uri_ - Token的URI

## 所有父类合约
Context, ERC165, IERC1155, IERC1155MetadataURI

## 实例化

    tk = await ERC1155Example.deployed()

## 所有PUBLIC函数
### setApprovalForAll(address operator,bool approved) | 0xa22cb465
### 转帐授权 - 授权所有币 (如果授权为True，则被授权方永久拥有授权)

    tk.setApprovalForAll("0xca883B683DB7184b6aA01CD025E2c95a5f47E7cf",true)

### safeTransferFrom(address from,address to,uint256 id,uint256 amount,bytes memory data)
### 转帐 - 单币(其中data参数随机传一个bytes值) | 0xf242432a

    tk.safeTransferFrom("0x85278E1B28032285cc17011Aa5f3999ecc2c978d","0xFe4301E291750a71597aE0085e60618DBe85f392","2","1","0x96de9dfbeb7cb99a208ade7e765a3e89a9ce57917dc6249a2845e0fd2a782cee")

### safeBatchTransferFrom(address from,address to,uint256[] ids,uint256[] amounts,bytes memory data)
### 转帐 - 多币(其中data参数随机传一个bytes值) | 0x2eb2c2d6

    tk.safeBatchTransferFrom("0x85278E1B28032285cc17011Aa5f3999ecc2c978d","0xFe4301E291750a71597aE0085e60618DBe85f392",[0,1],["1000000000000000000", "1000000000000000000"],"0x96de9dfbeb7cb99a208ade7e765a3e89a9ce57917dc6249a2845e0fd2a782cee")
    
## 所有VIEW函数
### balanceOf(address account,uint256 id)
### 查询余额 - 根据币ID | 0x00fdd58e
### 返回值: uint256

    tk.balanceOf("0xFe4301E291750a71597aE0085e60618DBe85f392","2")

### balanceOf(address[] accounts,uint256[] ids)
### 查询余额 - 多币 | 0x4e1273f4
### 返回值: uint256[]

    tk.balanceOfBatch(["0x85278E1B28032285cc17011Aa5f3999ecc2c978d", "0x85278E1B28032285cc17011Aa5f3999ecc2c978d"],[0, 2])

### isApprovedForAll(address account,address operator)
### 查询是否授权 | 0xe985e9c5
### 返回值: bool

    tk.isApprovedForAll("0x85278E1B28032285cc17011Aa5f3999ecc2c978d", "0x85278E1B28032285cc17011Aa5f3999ecc2c978d")

### uri(uint256)
### 获取TOKEN的URI(所有的TOKEN都是同一个URI)
### 返回值: string

## 其它需注意函数
* _setURI(string memory newuri) - 修改Token的URI
* _mint(address account, uint256 id, uint256 amount, bytes memory data) - 铸币
* _mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data) - 批量铸币
* _burn(address account, uint256 id, uint256 amount) - 销毁
* _burnBatch(address account, uint256[] memory ids, uint256[] memory amounts) - 批量销毁

### _beforeTokenTransfer(address operator,address from,address to,uint256[] memory ids,uint256[] memory amounts,bytes memory data)
### 交易前特殊处理 - 如需可重载

### _doSafeTransferAcceptanceCheck(address operator,address from,address to,uint256 id,uint256 amount,bytes memory data)
### 该函数还未整理

### _doSafeBatchTransferAcceptanceCheck(address operator,address from,address to，uint256[] memory ids,uint256[] memory amounts,bytes memory data)
### 该函数还未整理

### _asSingletonArray(uint256 element)
### 该函数还未整理