<?php
namespace app\admin\controller;
use think\Controller;
class Index extends  Base
{
    public function index()
    {
        return $this->fetch();
    }
    public function test() {
    print_r(\Map::getLngLat('河北省保定市茂业中心'));
             return 'singwa';
    }
    public function map() {
        return \Map::statixcimage('河北省保定市茂业中心');
    }
    
    public function welcome() {
//        \phpmailer\Email::send("2552698596@qq.com",'test','糯米官网测试');
//        return "邮件发送成功!";
        return "欢迎来到o2o后台!";
    }
}
