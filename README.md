## 1. 编译
登录 https://katacoda.com/courses/ubuntu/playground

```
$ git clone https://github.com/yu3peng/gpushare-scheduler-extender.git && cd gpushare-scheduler-extender
$ IMAGE=yu3peng/gpushare-scheduler-extender:v0.1.0 && docker build . -t "${IMAGE}"
```

## 2. 部署
登录 https://katacoda.com/courses/kubernetes/playground

```
$ kubectl apply -f https://raw.githubusercontent.com/yu3peng/gpushare-scheduler-extender/master/extender.yaml
```
