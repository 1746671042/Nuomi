<?php
namespace app\admin\validate;
use think\Validate;

class User extends Validate {
    protected  $rule = [
        ['id', 'require|in:-1,0,1', 'id不能为空|参数格式不正确'],
        ['status', 'number|in:-1,0,1,2','状态必须是数字|状态范围不合法'],
    ];

    /**场景设置**/
    protected  $scene = [
        'status' => ['name', 'status'],// 修改状态
      
    ];
}