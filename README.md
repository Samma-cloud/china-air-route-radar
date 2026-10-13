# 航线雷达静态站点

本目录可以直接发布为 GitHub Pages 站点。网页读取同目录下的 `data.json`；每日资讯更新该文件后，提交并推送到发布分支即可刷新线上内容。

## 文件

- `index.html`：页面和交互
- `data.json`：有公开来源的航线变化记录；首批数据为历史开航事件，不代表当前仍在运营
- `.nojekyll`：让 GitHub Pages 直接发布静态文件
- `deploy.ps1`：CloudBase 的备用发布脚本

## GitHub Pages 发布

本项目已发布在公开仓库 [Samma-cloud/china-air-route-radar](https://github.com/Samma-cloud/china-air-route-radar)，网站地址为 <https://samma-cloud.github.io/china-air-route-radar/>。GitHub Pages 从 `main` 分支根目录发布；推送后会触发网站更新。

## 资讯记录格式

在 `records` 数组中追加记录。每条记录至少应包含 `type`、`origin`、`dest`、`region`、`airline`、`mode`、`change`、`date`、`status`、`airport`、`discovered` 和 `sources`。`date` 是航线实际首班/开航日期，`discovered` 是该记录加入数据库的日期，`sourcePublished` 是来源发布日期；`sources` 中的链接应指向航司、机场或其他可靠来源。公告中计划的班期不能直接当作当前班期，状态应说明是否经过近期复核。

## 每日更新

每日资讯任务每天北京时间 09:00 检查来源，并更新 `data.json`。本地 Git 已连接 `origin/main`，GitHub 登录已配置；有更新时提交并推送即可刷新网站。只发布有来源依据的变化；没有可靠依据时不添加记录。
