# from torch.utils.tensorboard import SummaryWriter

import torch

torch.cuda.is_available()  # cuda是否可用
torch.version.cuda  # cuda版本

print(torch.backends.cudnn.is_available(), 'cudnn')
# torch.backends.cudnn.is_available()  # cudnn是否可用
torch.backends.cudnn.version()

import torch

print('torch版本：', torch.__version__)
print('cuda是否可用：', torch.cuda.is_available())

torch.cuda.is_available()  # cuda是否可用
print('cuda版本：', torch.version.cuda)  # cuda版本

print('cudnn是否可用', torch.backends.cudnn.is_available())
# torch.backends.cudnn.is_available()  # cudnn是否可用
print('cudnn版本：', torch.backends.cudnn.version())

import torch.utils
import torch.utils.cpp_extension

print('torch.utils.cpp_extension.CUDA_HOME位置：', torch.utils.cpp_extension.CUDA_HOME)
