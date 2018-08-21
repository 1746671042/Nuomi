<?php
namespace app\admin\controller;
use think\Controller;

class Base extends  Controller {
    //验证登陆
    public $account;
    public function _initialize() {
        // 判定用户是否登录
        $isLogin = $this->isLogin();
        if(!$isLogin) {
            return $this->redirect(url('login/index'));
        }
    }

    //判定是否登录
    public function isLogin() {
        // 获取sesssion
        $admin = $this->getLoginUser();
        
        if($admin && $admin->id) {
            return true;  
        }
        return false;

    }

    public function getLoginUser() {
        if(!$this->account) {
            $this->account = session('AdminCount', '', 'admin');
        }
        return $this->account;
    }
    
    
    

    public function status() {
        // 获取值
        $data = input('get.');
        // 利用tp5 validate 去做严格检验  id  status
        if(empty($data['id'])) {
            $this->error('id不合法');
        }
        if(!is_numeric($data['status'])) {
            $this->error('status不合法');
        }

        // 获取控制器
        $model = request()->controller();
        //echo $model;exit;
        $res = model($model)->save(['status'=>$data['status']], ['id'=>$data['id']]);
        if($res) {
            $this->success('更新成功');
        }else {
            $this->error('更新失败');
        }
    }

    // 排序功能 也放到 base
}