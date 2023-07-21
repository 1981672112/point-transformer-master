#!/bin/sh

export PYTHONPATH=./ #导入模块(.py)的寻找位置 # 激活conda的虚拟环境
eval "$(conda shell.bash hook)"
PYTHON=python #设置变量   传入指令： sh tool/train.sh s3dis pointtransformer_repro

TRAIN_CODE=train.py
TEST_CODE=test.py

dataset=$1 # $1=s3dis
exp_name=$2 # $2=pointtransformer_repro
exp_dir=exp/${dataset}/${exp_name} #exp_dir=exp/s3dis/pointtransformer_repro
model_dir=${exp_dir}/model #model_dir=exp/s3dis/pointtransformer_repro/model
result_dir=${exp_dir}/result #result_dir=exp/s3dis/pointtransformer_repro/result
config=config/${dataset}/${dataset}_${exp_name}.yaml # config=config/s3dis/s3dis_pointtransformer_repro.yaml

mkdir -p ${model_dir} ${result_dir} # 创建模型和结果保存的文件夹
mkdir -p ${result_dir}/last
mkdir -p ${result_dir}/best
cp tool/train.sh tool/${TRAIN_CODE} ${config} tool/test.sh tool/${TEST_CODE} ${exp_dir} # 把前面4个文件复制到最后一个目录


now=$(date +"%Y%m%d_%H%M%S") #显示时间
$PYTHON ${exp_dir}/${TRAIN_CODE} \
  --config=${config} \
  save_path ${exp_dir} \
  2>&1 | tee ${exp_dir}/train-$now.log

# python exp/s3dis/pointtransformer_repro/train.py    执行那个脚本
# --config=config/s3dis/s3dis_pointtransformer_repro.yaml 使用的配置文件
# save_path exp_dir=exp/s3dis/pointtransformer_repro     保存路径
# 2>&1 | tee exp/s3dis/pointtransformer_repro/train-时间.log