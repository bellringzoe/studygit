# 公共模块/CBB管理需求说明

## 模板文件说明
### "pub_info_template.json"文件说明

此文件是fhnw网站上需要能够管理的cbb信息的内容。
pub信息包含此cbb所有相关信息。对应的，在fhwn网站上应该存在所有相关条目。
pub模块信息的二进制路径允许是svn，也允许是ftp或其他路径
* 部分pub模块体积过大，保存在svn并不合适，例如基础软件部提供的编译链、南研提供的fos平台软件。

### "prj_pub_info_template.json"文件说明
此文件是fhnw上，由项目选择后，可以导出的项目所使用的所有公共模块（CBB）的列表内容。
prj_pub_info文件在项目的演进过程中存在多个版本，随着公共模块的迭代、提交，此文件将
向前滚动。

### 项目模板与公共模块模板文件结构说明
* 两个文件结构保持一致
* pub_info涉及单个pub/cbb文件的描述，对单个pub/cbb模块负责
* prj_pub_info涉及多个cbb文件，导出后作为项目的资源信息文件使用，在项目的滚动过程中不断产生新的版本。该文件随着项目滚动归档。
* 引用内容中每个关键字均有解释，其中
* release表示此cbb有多少个发布版
	tags，表示此发布版的“物理路径”
	info，表示此发布版更新信息
	checked，表示此发布版是否已经经过验证，是正式发布版
	dep，表示此发布版的依赖，如果发布版依赖其他pub/cbb的某个特定版本，需要在这里标出，原则上这里标出的是该发布版的“最小依赖”。
	binary，表示此次更新的源码对应的二进制发布内容，允许有多个版本，对应不同cpu指令集/不同的位宽发布，比如x86系列，可以有i386,i686,x86_64
  

```json
      "name": "cbb名称",
      "description": "cbb内容，功能简介",
      "release": [
        {
          "tags": "svn:path/to/source/tag@r1111",
          "info": "本次更新的信息",
          "checked": "是否已有项目验证,yes/no",
          "dep": [
            {
                "name": "依赖的pub名称1",
                "release": [
                    {
                        "tags":"svn:path/to/source/tag@r3456"
                    }
                ]
            },
            {
                "name": "依赖的pub名称2",
                "release": [
                    {
                        "tags":"svn:path/to/source/tag@r3456"
                    }
                ]
            }
          ],
          "binary": [
            {
              "toolchain": "ppc-release-1",
              "path": "ftp:path/to/binary",
              "install":""
            },
            {
              "toolchain": "ppc64-release-1",
              "path": "ftp:path/to/binary",
              "install":""
            },
            {
              "toolchain": "aarch64-release-1",
              "path": "ftp:path/to/binary",
              "install":""
            }
          ]
        },

```

## 模板文件的使用
* pub_info为fhnw网站内部管理信息，fhnw如何维护相关信息不做限定，仅需要确保所有信息可导出。
* prj_pub_info为fhnw上由项目选定pub模块后，导出的内容。此文件在项目的概念计划阶段cbb与多方案分析阶段导出。
* 由于pub_info中，每个pub模块均有多个版本，每个版本中有多款binary支持，导出prj_pub_info时，项目SE需要与pub/cbb提供方确认二进制版本的支持情况，如果存在二进制版本不支持的，需要提出新的需求。
* prj_pub_info首次导出完成后，即可交付给集成测试部，根据prj_pub_info信息导出项目开发环境。
* pub/cbb更新时，公共模块开发人员在fhnw上提交信息。如果项目开发过程中需要该pub/cbb的更新，则研发人员提交redmin，标注fhnw上相关版本信息。
* 项目根据redmin信息，刷新项目prj_pub_info文件并存档，刷新项目开发环境。
* 项目验证后，形成pub测试报告等相关文件，此时pub可正式发布，在fhnw网站上可走入正式流程，pub_info信息中可标记“已验证”
```
           "checked": "是否已有项目验证,yes/no",
```

## premake说明
* 最简方案，根据“平台”架构，将各cbb获取到当前平台要求的路径下即可。
* premake脚本在编译前做检查，确认当前版本一致性。
* premake后跟随prj_pub_info（其历史版本）切换开发环境（至历史版本）。
