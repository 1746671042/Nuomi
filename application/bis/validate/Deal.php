<?php
namespace app\bis\validate;
use think\Validate;

class Deal extends Validate {
    protected  $rule = [
        ['name', 'require|max:1000', '城市名必须传递|分类名不能超过10个字符'],
        ['city_id', 'require', '城市信息不完整'],
        ['category_id', 'require|integer', '分类必须选择|分类信息不合法'],
        ['location_ids[]', 'require', '门店信息不能为空'],
        ['image', 'require', '缩略图不能为空'],
        ['start_time', 'require', '团购开始时间必须传递'],
        ['end_time','require','团购结束时间不能为空'],
        ['total_count', 'require|integer','库存数不能为空|库存不合法'],
        ['origin_price', 'require|number','原价不能为空|原价必须为数字'],
        ['current_price', 'require|integer','团购价不能为空|团购价必须为整数'],
        ['coupons_begin_time', 'require','消费券生效日期不能为空'],
        ['coupons_end_time', 'require','消费券结束日期不能为空'],
        ['description', 'require','团购描述不能为空'],
        ['notes', 'require','购买须知不能为空'],
    ];

    /**场景设置**/
    protected  $scene = [
        'add' => ['name', 'city_id','category_id','location_ids[]','image','start_time','end_time','total_count','total_count','origin_price','current_price','coupons_begin_time','coupons_end_time','description','notes'],// 添加
    ];
}