<?php
namespace app\admin\validate;
use think\Validate;

class AdminLogin extends Validate {
    protected  $rule = [
        ['Aname', 'require|max:20|min:6', '管理员名称不能为空|管理员名称长度不符|管理员名称长度不符'],
        ['password', 'require|max:20|min:6', '管理员密码不能为空|管理员密码长度不符|管理员名称长度不符'], 
    ];

    /**场景设置**/
    protected  $scene = [
        'login' => ['Aname', 'password'],// 添加
    ];
}