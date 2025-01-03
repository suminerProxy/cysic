module.exports = {
    apps: [
        {
            name: 'cysic',
            script: './start.sh',
            interpreter: '/bin/bash',
            watch: true, // 监控文件变更，自动重启
            //exec_mode: 'cluster',   // 启用集群模式
            //instances: 'max',       // 自动根据 CPU 核心数启动最大实例
            //max_memory_restart: '32G',  // 设置内存限制，当达到此限制时自动重启
        },
    ],
};