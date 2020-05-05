#!/bin/bash
if [ ! -n "$1" ]
then
    echo "Invalid project path!"
else
    # 新项目路径
    app_path=$1
    app_name=${app_path##*/}
    # 脚本执行路径
    temp_path=$(cd `dirname $0`; pwd)
    echo "Start create flutter app ... ${app_name}"
    # 创建flutter项目
    flutter create $app_path
    # 复制模板的lib、images到项目目录
    echo "Copy template lib and images to project ... ${app_name}"
    cp -rf "${temp_path}/lib" "${app_path}/"
    cp -rf "${temp_path}/images" "${app_path}/"
    # 将lib里面代码包含flutter_app_template的字符串替换为项目名
    echo "Replace template project name..."
    sed -i "" "s/flutter_app_template/${app_name}/g" `grep -rl "flutter_app_template" ${app_path}/lib/`
    # 将pubspec.yaml的dependencies中插入依赖
    echo "Add dependencies..."
    sed -i "" -e "25a\\"$'\n'"\ \ dio: ^2.1.13" ${app_path}/pubspec.yaml
    sed -i "" -e "26a\\"$'\n'"\ \ shared_preferences: 0.5.3+4" ${app_path}/pubspec.yaml
    sed -i "" -e "27a\\"$'\n'"\ \ provider: ^3.1.0" ${app_path}/pubspec.yaml
    # 去掉images的注释
    sed -i "" "s/#\ assets:/assets:/g" ${app_path}/pubspec.yaml
    sed -i "" "s/#\ \ -\ images\/a_dot_burr.jpeg/\ \ -\ images\/login\//g" ${app_path}/pubspec.yaml
    sed -i "" "s/#\ \ -\ images\/a_dot_ham.jpeg/\ /g" ${app_path}/pubspec.yaml
    # 拉取依赖
    cd ${app_path}
    flutter pub get
    echo "Finish! Enjoy your app!"
fi
