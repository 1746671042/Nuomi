<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------



/**
 * @param $url
 * @param int $type 0 get  1 post
 * @param array $data
 */
function doCurl($url, $type=0, $data=[]) {
    $ch = curl_init(); // 初始化
    // 设置选项
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);  //成功只返回结果，没有内容
    curl_setopt($ch, CURLOPT_HEADER,0);

    if($type == 1) {
        // post
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    }

    //执行并获取内容
    $output = curl_exec($ch);
    // 释放curl句柄
    curl_close($ch);
    return $output;
}
/**
 * 通用的分页样式
 * @param $obj
 */
function pagination($obj) {
    if(!$obj) {
        return '';
    }
    // 优化的方案（获取url 参数）
    $params = request()->param();
    return '<div class="cl pd-5 bg-1 bk-gray mt-20 tp5-o2o">'.$obj->appends($params)->render().'</div>';
}


// 商户入驻申请的文案
function bisRegister($status) {
    if($status == 1) {
        $str = "入驻申请成功";
    }elseif($status == 0) {
        $str = "待审核，审核后平台方会发送邮件通知，请关注邮件";

    }elseif($status == 2) {
        $str = "非常抱歉，您提交的材料不符合条件，请重新提交";
    }else {
        $str = "该申请已被删除";
    }
    return $str;
}


// 团购商品（用户）状态 
function DealStatus($status) {
    if($status == 0) {
        $str = "<span class='label label-danger radius'>待审</span>";
    }elseif($status ==1) {
        $str = "<span class='label label-success radius'>通过</span>";
    }elseif($status ==-1){
        $str = "<span class='label label-error radius'>未通过</span>";
    }else{
        $str = "<span class='label label-error radius'>已下架/已删除</span>";
    }
    return $str;
}


function getSeCityName($path) {
    if(empty($path)) {
        return '';
    }
    if(preg_match('/,/', $path)) {
        $cityPath = explode(',', $path);
        $cityId = $cityPath[1];
    }else {
        $cityId = $path;
    }

    $city = model('City')->get($cityId);
    return $city->name;
}

function countLocation($ids) {
    if(!$ids) {
        return 1;
    }

    if(preg_match('/,/', $ids)) {
        $arr = explode(',', $ids);
        return count($arr);
    }
}

// 设置订单号
function setOrderSn() {
    list($t1, $t2) = explode(' ', microtime());
    //echo $t1."<br />";
    //echo $t2."<br/>";exit;
    $t3 = explode('.', $t1*10000);
    return $t2.$t3[0].(rand(10000, 99999));
}


//是否总店
function is_main($status) {
    if($status == 1) {
        $str = "<span class='label label-success radius'>Yes</span>";
    }else {
        $str = "<span class='label label-danger radius'>NO</span>";
    }
    return $str;
}

// 应用公共文件
function status($status) {
    if($status == 1) {
        $str = "<span class='label label-success radius'>正常</span>";
    }elseif($status ==0) {
        $str = "<span class='label label-danger radius'>待审</span>";
    }else {
        $str = "<span class='label label-danger radius'>已删除/下架</span>";
    }
    return $str;
}
// 门店状态
function locationstuats($status) {
    if($status == 1) {
        $str = "<span class='label label-success radius'>正常</span>";
    }elseif($status ==0) {
        $str = "<span class='label label-danger radius'>待审</span>";
    }else {
        $str = "<span class='label label-danger radius'>未通过</span>";
    }
    return $str;
}
// 订单状态
function order_status($status) {
    if($status == 1) {
        $str = "<span class='label label-success radius'>订单已创建成功</span>";
    }elseif($status ==0) {
        $str = "<span class='label label-danger radius'>订单未创建成功</span>";
    }else {
        $str = "<span class='label label-danger radius'>异常</span>";
    }
    return $str;
}
// 支付状态
function pay_status($status) {
    if($status == 1) {
        $str = "<span class='label label-success radius'>已支付</span>";
    }elseif($status ==0) {
        $str = "<span class='label label-danger radius'>未支付</span>";
    }else {
        $str = "<span class='label label-danger radius'>支付失败</span>";
    }
    return $str;
}
