@echo off
setlocal

:: 获取当前脚本所在的目录
set "currentDir=%~dp0"

:: 获取上一级目录路径
for %%A in ("%currentDir%..") do set "parentDir=%%~fA"

:: 定义源文件夹路径（上一级目录中的web文件夹）
set "sourceFolder=%parentDir%\web"

:: 检查源文件夹是否存在
if not exist "%sourceFolder%" (
    echo 错误：找不到源文件夹 "%sourceFolder%"
    pause
    exit /b 1
)

:: 复制web文件夹中的所有内容到当前目录
echo 正在从 "%sourceFolder%" 复制文件到 "%currentDir%"...
xcopy /E /I /Y "%sourceFolder%\*" "%currentDir%"

echo 复制完成！
pause