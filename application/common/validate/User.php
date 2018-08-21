<?php
namespace app\common\validate;
use think\Validate;
class User extends Validate {
    protected $rule = [
        'username|用户名' => 'require|max:25|min:6',
        'email|邮箱' => 'email',
        'mobile|手机号' => 'require|max:11|/^1[3-8]{1}[0-9]{9}$/',
        'password|密码' => 'require|max:25|min:6',
    ];

    // 场景设置
    protected  $scene = [
        'register' => ['username', 'email', 'password','mobile', 'repassword'],
        'login'=>['username','password'],
    ];
    
    
    protected  $message=[
        'username.require'=>'用户名不能为空',
        'username.max'=>'用户名长度为6-15位',
        'username.min'=>'用户名长度为6-15位',
        'mobile.require'=>'手机号不能为空',
        'mobile.max'=>'手机号长度不符',
        'password.require'=>'密码不能为空',
        'password.max'=>'密码长度为6-15位', 
        'password.min'=>'密码长度为6-15位', 
        
    ];
}