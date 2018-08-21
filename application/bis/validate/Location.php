<?php
namespace app\bis\validate;
use think\Validate;

class Location extends Validate {
    protected  $rule = [
        ['name', 'require|max:1000', '分店名称必须传递|分类名不能超过10个字符'],
        ['city_id', 'require', '城市信息不完整'],
        ['se_city_id', 'require', '城市信息不完整'],
        ['logo', 'require', '缩略图不能为空'],
        ['category_id', 'require', '分类不能为空'],
        ['se_category_id', 'require', '子类不能为空'],
        ['address','require','地址不能为空'],
        ['tel', 'require|phone','联系电弧不能为空|电话格式不正确'],
        ['open_time', 'require|integer','营业时间不能为空'],
        ['content', 'require','门店介绍不能为空'],
    ];

    /**场景设置**/
    protected  $scene = [
        'add' => ['name', 'city_id','category_id','se_city_id','logo','open_time','se_category_id','content','tel'],// 添加
    ];
}