<?php
namespace app\common\validate;
use think\Validate;
class Bis extends Validate {
    protected $rule = [
        'name|用户名' => 'require|max:25',
        'email|邮箱' => 'email',
        'logo|图标' => 'require',
        'city_id' => 'require',
        'bank_info|银行账号' => 'require|max:19|min:19',//|integer
        'bank_name|开户行名称' => 'require',
        'bank_user|开户人姓名' => 'require',
        'faren|法人' => 'require',
        'faren_tel|法人电话' => 'require',
        'tel|电话'=>'require|max:11|/^1[3-8]{1}[0-9]{9}$/',
        'content'=>'require',
//        登陆校验
        'username'=>'require|max:20|min:6',
        'password'=>'require|max:20|min:6',
    ];

    // 场景设置
    protected  $scene = [
        'add' => ['name', 'email', 'logo', 'city_id', 'bank_info', 'bank_name', 'bank_user', 'faren', 'faren_tel'],
        'location'=>['tel','content'],
        'login'=>['username','password'],
    ];
    
    
    protected  $message=[
        'username.require'=>'用户名不能为空',
        'username.max'=>'用户名长度为6-15位',
        'username.min'=>'用户名长度为6-15位',
        'password.require'=>'密码不能为空',
        'password.max'=>'密码长度为6-15位', 
        'password.min'=>'密码长度为6-15位', 
        'back_info.integer'=>'银行卡账号必须数字',
        'back_info.max'=>'银行卡账号必须为19位',
        'back_info.min'=>'银行卡账号必须为19位',
        
    ];
}