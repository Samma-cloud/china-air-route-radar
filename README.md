# 航线雷达静态站点

本目录可以直接发布为 GitHub Pages 站点。网页读取同目录下的 `data.json`；每日资讯更新该文件后，提交并推送到发布分支即可刷新线上内容。

## 文件

- `index.html`：页面和交互
- `data.json`：有公开来源的航线变化事件；历史开航记录不代表当前仍在运营
- `network.json`：可核验的航司公开班期样本、中国民航局全国航班量、国内货运许可航司名单及中国邮政运能采购口径；这些数据层含义不同，不合并成完整执飞班表
- `.nojekyll`：让 GitHub Pages 直接发布静态文件
- `deploy.ps1`：CloudBase 的备用发布脚本

## GitHub Pages 发布

本项目已发布在公开仓库 [Samma-cloud/china-air-route-radar](https://github.com/Samma-cloud/china-air-route-radar)，网站地址为 <https://samma-cloud.github.io/china-air-route-radar/>。GitHub Pages 从 `main` 分支根目录发布；推送后会触发网站更新。

## 资讯记录格式

在 `records` 数组中追加事件。每条记录至少应包含 `type`、`origin`、`dest`、`region`、`airline`、`mode`、`change`、`date`、`status`、`airport`、`discovered` 和 `sources`。`date` 是航线实际首班/开航或变动日期，`discovered` 是入库日期，`sourcePublished` 是来源发布日期。官方公告作为主要事实依据；飞常准（VariFlight，<https://www.variflight.com/cn/home>）和 Flightradar24（<https://www.flightradar24.com/data/>）用于发现和交叉核验运行线索。单次航迹不能单独证明航线变动，频次变化须比较相同日期范围的样本并写明限制。

`network.json` 单独保存公开班期样本和全国航班量统计。班表需记录来源、检查日期、适用范围和班期；不要把单一航司样本展示成全国完整网络。中国民航局许可名单只代表航线经营许可，不是航班时刻；中国邮政公开采购中的 7,664 条计划是非固定散舱运能需求，不是 7,664 个固定执飞班次，也不能据此判断由哪家航司承运。只有航司发布或授权数据源可核验的班期才进入 `routes`。仅使用公开可访问或已获授权的数据，不绕过登录或订阅限制。公告计划和当前执行应分开标注。

当前可公开核验的完整班表并不存在一个免费、统一的全国下载源。民航局公布航班量和许可范围，但不公开这 12 家货运许可航司的逐航班、逐周时刻；航班管理/航班数据库提供商的路线和时刻数据通常需要账号/API授权。要实现全国各航司完整班表，需接入已授权的商业数据接口或用户提供的合法数据导出，再由服务器端定时生成静态 JSON（不能把密钥放进公开网页）。

## 每日更新

每日资讯任务每天北京时间 09:00 检查来源，并更新 `data.json` 和公开班期样本 `network.json`。本地 Git 已连接 `origin/main`，GitHub 登录已配置；有更新时提交并推送即可刷新网站。只发布有来源依据的变化；没有可靠依据时不添加记录。
