## Installation
在每个项目中添加　.tern-project
在文件中写入加载的配置

{
    "ecmaVersion":5 ,//指定语言版
	"libs": [
		"browser",
		"bower_components/three.js"
	],
	"loadEagerly": [
		"importantfile.js"
	],
	"plugins": {
		"requirejs": {
			"baseURL": "./",
			"paths": {}
		}
	}
}

libs 里面的都是defs目录下的json扩展API, 也是环境
不一定需要

"loadEagerly": []
  强制每次加载

plugins: 是加载tern的插件
   加载路径既可以是项目root,也可以是tern的plugin

tern 插件
* tern-node-express


//plugins 是tern 下的插件的引入
这个比无法智能补全，补全靠的是term/defs/ 下面的定义文件
