# 航线雷达静态站点

本目录可以直接发布为 GitHub Pages 站点。网页读取同目录下的 `data.json`；每日资讯更新该文件后，提交并推送到发布分支即可刷新线上内容。

## 文件

- `index.html`：页面和交互
- `data.json`：已核实的航线变动记录，初始为空，不包含模拟资讯
- `.nojekyll`：让 GitHub Pages 直接发布静态文件
- `deploy.ps1`：CloudBase 的备用发布脚本

## GitHub Pages 发布

将本目录内容放在 GitHub 仓库根目录，仓库设为公开；在仓库 **Settings → Pages** 中选择从 `main` 分支的根目录发布。发布后网址为 `https://<用户名>.github.io/<仓库名>/`。分支上的后续提交会触发页面更新。

## 资讯记录格式

在 `records` 数组中追加记录。每条记录至少应包含 `type`、`origin`、`dest`、`region`、`airline`、`mode`、`change`、`date`、`status`、`airport`、`discovered` 和 `url`。`url` 必须指向实际来源；没有可靠依据时不发布为已确认记录。

## 每日更新

每日资讯任务会更新本地 `data.json`。线上 GitHub Pages 只有在变更推送到发布分支后才会刷新，因此需在仓库和 Git 登录配置完成后，将每日更新流程接入提交与推送。
