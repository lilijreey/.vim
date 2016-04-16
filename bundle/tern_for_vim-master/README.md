## Installation
在每个项目中添加　.tern-project
在文件中写入加载的配置

{
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

//plugins 是tern 下的插件的引入
这个比无法智能补全，补全靠的是term/defs/ 下面的定义文件
