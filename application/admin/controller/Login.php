<?php
namespace app\admin\controller;
use think\Request;
use think\Controller;
class Login extends Controller
{
	public function index()
        {
            if(request()->isPost()) {
                //登录的逻辑
                //获取相关的数据
                $data = input('post.');
                // 通过用户名 获取 用户相关信息
                // 严格的判定
                $validate = validate('AdminLogin');
                if(!$validate->scene('login')->check($data)) {
                    $this->error($validate->getError());
                }
                
                 //调用tp 自带方法自动校验验证码，，verifycode 为你输入的字段值
                if(!captcha_check($data['verifycode'])) {
                    // 校验失败
                    $this->error('验证码不正确');
                }
                
                $admin = model('Admin')->get(['Aname'=>$data['Aname']]);
                if(!$admin || $admin->status !=1 ) {
                    $this->error('管理员不存在，或管理员未被审核通过');
                }
                if($admin->password != md5($data['password'].$admin->code)) {
                    $this->error('密码不正确');
                }
                model('admin')->updateById(['last_login_time'=>time()], $admin->id);
                // 保存用户信息 admin是作用域
                session('AdminCount', $admin, 'admin'); 
                
                return $this->success('登录成功', url('admin/index/index'));


            }else {
                // 获取session
                $account = session('AdminCount', '', 'admin');
                if($account && $account->id) {
                    return $this->redirect(url('admin/index/index'));
                }
                return $this->fetch();
            }
           
        }

    public function logout() {
        // 清除session
        session(null, 'admin');
        // 跳出
        $this->redirect('admin/login/index');
    }
    
    
    public function info(){
        //获取当前管理员信息
        $AdminInfo = $this->getLoginUser();
        var_dump($AdminInfo);
        return $this->fetch('',['AdminInfo'=>$AdminInfo]);
    }
   
}