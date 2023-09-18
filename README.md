# TomatoCMS

## 必读说明：

TomatoCMS是根据PbootCMS进行二次开发，优化后台使用体验，并且集成很多常用、实用的功能。适合建站公司及个人工作室使用，可以直接商用、不限制使用站点数量。

**系统采用域名授权机制，且授权仍然遵守PbootCMS官方的规定，强烈推荐使用万能码！**

## 不同之处：

首先，TomatoCMS是根据pbootcms进行二次开发的，同时也借鉴了不同开发者的经验结合自身对seo的理解，对原来的部分功能进行修正或是增强，亦或是新增原cms不具备的功能。

### 1.安装方式

#### 1.1采用sqlite数据库

发布的源码默认采用sqlite数据库，放入PHP（7.1+）空间即可直接使用。 

#### 1.2采用Mysql数据库

##### 1.2.1 手动安装模式

请导入目录下数据库文件/static/backup/sql/xxx.sql，同时请注意使用最新日期名字的脚本文件，并修改config/database数据库连接文件信息。

系统后台默认访问路径：http://ip/admin.php   账号：admin   密码：123456，

##### 1.2.2 自动安装模式

将代码包中文件上传到空间（或是服务器上），通过域名访问后台，默认访问路径：http://ip/admin.php  系统会自行检测是否安装，若是没有安装则会进行跳转到安装界面，按照需要填写好数据库信息及授权码信息即可。

###  2.升级说明：

* 使用后台在线升级（推荐）：

支持跨版本升级，会自动升级数据库及代码文件。

* 使用全包升级：

支持跨版本升级，保留config、data、static、template目录，其余全部用新版替换， 同时如果涉及到的中间版本有升级数据库，需要使用群文件数据库脚本升级数据库。

[^注意]: 不建议进行跨版本升级，强烈推荐使用后台进行在线升级

### 3.新增功能

3.1、后台登录页面美化

## 共同之处：

* 系统采用高效、简洁、强悍的模板标签，只要懂HTML就可快速开发企业网站；
* 系统采用PHP语言开发，使用自主研发的高速多层开发框架及缓存技术；
* 系统默认采用sqlite轻型数据库，放入PHP空间即可直接使用，可选mysql等数据库，满足各类存储需求；
* 系统采用响应式管理后台，满足各类设备随时管理的需要；
* 系统支持后台在线升级，满足系统及时升级更新的需要；
* 系统支持内容模型、多语言、自定义表单、筛选、多条件搜索、小程序、APP等功能；
* 系统支持多种URL模式及模型、栏目、内容自定义地址名称，满足各类网站推广优化的需要。

###  简单到想哭的模板标签：
```
1、全局标签示意：
{pboot:sitetitle} 站点标题 
{pboot:sitelogo} 站点logo

2、列表页标签示意：
{pboot:list num=10 order=date}
	<p><a href="[list:link]">[list:title]</a></p>
{/pboot:list}

3、内容页标签示意：
{content:title} 标题
{content:subtitle}副标题
{content:author} 作者
{content:source} 来源

更多简单到想哭的标签请参考开发手册...

```

###  主要功能：
* 支持自定义模板
* 支持站点信息后台配置
* 支持无限极栏目
* 支持自定义内容模型
* 支持自定义内容字段
* 支持专题单页内容
* 支持列表内容管理
* 支持内容复制移动
* 支持自定义栏目地址
* 支持自定义内容地址
* 支持多语言区域建站
* 支持手机独立模板
* 支持手机版域名绑定
* 支持首页分页
* 支持页面SEO优化
* 支持在线留言
* 支持幻N组灯片轮播
* 支持友情链接
* 支持自定义表单
* 支持多条件筛选
* 支持多条件搜索
* 支持验证码开关
* 支持留言发送到多邮箱
* 支持API对接
* 支持小程序/APP开发
* 支持Ajax远程获取数据
* 支持自定义标签
* 支持全站伪静态
* 支持前端动态缓存
* 支持系统角色管理
* 支持完整角色权限管理
* 支持多用户在线管理
* 支持系统日志功能
* 支持数据库在线管理
* 支持后台在线升级
* 支持自定义URL模式




##  授权声明：
授权方式及要求与PbootCMS保持一致。

##  联系我们：
QQ：2461933260
