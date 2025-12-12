# 获取所有本地模型的名称（排除表头）
$models = ollama list | Select-Object -Skip 1 | ForEach-Object { ($_ -split '\s+')[0] }

# 循环拉取每个模型（自动更新）
foreach ($model in $models) {
    Write-Host "`n=== 更新模型：$model ==="
    ollama pull $model
}

Write-Host "`n所有模型更新完成！"