#!/bin/bash
# 获取所有本地模型的名称（排除表头，取第一列）
models=$(ollama list | awk 'NR>1 {print $1}')

# 循环拉取每个模型
for model in $models; do
    echo -e "\n=== 更新模型：$model ==="
    ollama pull "$model"
done

echo -e "\n所有模型更新完成！"