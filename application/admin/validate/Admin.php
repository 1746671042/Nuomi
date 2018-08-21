<?php
namespace app\admin\validate;
use think\Validate;

class Admin extends Validate {
    protected  $rule = [
        ['Aname', 'require|min:6|max:20', '管理员名称不能为空|管理员名称不合法'],
        ['password', 'require|min:6|max:20','密码不能为空|密码长度不符合规范'],
        ['parent_id', 'require|integer','父id不能为空|父id不合法'],
        ['email', 'require|email','邮箱不能为空|邮箱格式不正确'],
        ['mobile', 'require|max:11|/^1[3-8]{1}[0-9]{9}$/','电话号码不能为空|电话号码格式不正确'],
        ['status', 'require|integer','状态不能为空|状态格式不正确'],
    ];

    /**场景设置**/
    protected  $scene = [
        'add' => ['Aname', 'password','parent_id','email',''
            . 'mobile','status'],// 修改状态
      
    ];
}