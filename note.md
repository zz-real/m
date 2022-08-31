# 1：创建项目
 dfx new myapp --no-frontend
 
# 2：部署
dfx deploy

# 3：调用方法
dfx canister call myapp_backend greet '("World")'

# 4：添加首页内容hello world
cat > src/myapp_frontend/assets/index.html
<html><body><h1>Hello World!</h1></body></html>

# 5:指定使用cycles发布
 dfx deploy --network=ic --with-cycles=1000000000000

# 6:停止
dfx canister --network=ic stop --all

# 7:删除并回收cycles
dfx canister --network=ic delete --all