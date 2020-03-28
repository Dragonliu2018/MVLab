## 论文摘要
　　U-Net是比较早的使用全卷积网络(即网络中没有全连接操作)进行语义分割的算法之一，论文中使用包含压缩路径和扩展路径的对称U形结构在当时非常具有创新性，且一定程度上影响了后面若干个分割网络的设计，该网络的名字也是取自其U形形状。<br>
　　由于训练集只有30张训练样本，作者使用了数据扩充的方法增加了样本数量。并且作者指出任意的弹性形变对训练非常有帮助。<br>
　　缺点：有效卷积增加了模型设计的难度和普适性；目前很多算法直接采用了same卷积，这样也可以免去Feature Map合并之前的裁边操作；其通过裁边的形式和Feature Map并不是对称的，个人感觉采用双线性插值的效果应该会更好。[引自](https://zhuanlan.zhihu.com/p/43927696)

## 算法框架

![图1 U-Net网络结构图](https://cdn.jsdelivr.net/gh/Dragonliu2018/FigureBed@master/img/u-net-architecture.png
)
## 代码实现
[作者源码](https://lmb.informatik.uni-freiburg.de/people/ronneber/u-net/)

[码1](https://github.com/yihui-he/u-net)

[码2](https://github.com/minoring/unet)
