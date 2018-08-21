<?php
namespace app\index\controller;
use think\Controller;
use think\Request;
class User extends Controller
{
    public function login()
    {
        //return [1,2];
        // 获取session
        $user = session('o2o_user','', 'o2o');
        if($user && $user->id) {
           $this->redirect(url('index/index'));
        }
        return $this->fetch();
    }
    public function register()
    {
        if(request()->isPost()){
            $request = Request::instance();
            $data = input('post.');
            //调用tp 自带方法自动校验验证码，，verifycode 为你输入的字段值
            if(!captcha_check($data['verifycode'])) {
                // 校验失败
                $this->error('验证码不正确');
            }
            //严格校验 tp5 validate
            $validate = validate('User');
            if(!$validate->scene('register')->check($data)) {
                $this->error($validate->getError());
            }
            if($data['password'] != $data['repassword']) {
                $this->error('两次输入的密码不一样');
            }
            // 自动生成 密码的加盐字符串
            $data['code'] = mt_rand(100, 10000);
            $data['password'] = md5($data['password'].$data['code']);
            $data['last_login_ip'] =$request->ip();
            $data['last_login_time'] =time();
            //$data = 12;// test
            try {
                $res = model('User')->add($data);
            }catch (\Exception $e) {
                $this->error($e->getMessage());
            }
            
            if($res) {
                $this->success('注册成功',url('user/login'));
            }else{
                $this->error('注册失败');
            }

        }else {
            return $this->fetch();
        }
        //QLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry 'singwa' for key 'username'

    }

    public function logincheck() {
        //判定
        if(!request()->isPost()) {
           $this->error('提交不合法');
        }
        $data = input('post.');
        //严格检验 tp5 validate
        $validate = validate('User');
        if(!$validate->scene('login')->check($data)) {
            $this->error($validate->getError());
        }
        try {
            $user = model('User')->getUserByUsername($data['username']);
        }catch (\Exception $e){
            $this->error($e->getMessage());
        }
        ///print_r($user);

        if(!$user || $user->status != 1) {
            $this->error('该用户不存在或审核中');
        }
        // 判定密码是否合理
        if(md5($data['password'].$user->code) != $user->password) {
            $this->error('密码不正确');
        }

        // 登录成功
        model('User')->updateById(['last_login_time'=>time()], $user->id);

        //把用户信息记录到session
        session('o2o_user', $user, 'o2o');

        $this->success('登录成功', url('index/index'));

    }

    public function logout() {
        session(null, 'o2o');
        $this->redirect(url('user/login'));
    }
}
