<?php
//商家模块
namespace app\admin\controller;
use think\Controller;
class Order extends  Base
{
    //订单管理
    private  $obj;
    public function _initialize() {
        $this->obj = model("Order");
    }
    /**
     * 正常的商户列表
     * @return mixed
     */
    public function index() {
        $userArrs[]="";
        $dealArrs[]="";
        $data = $this->obj->getByOrderStatus(1);
        
        //获取用户信息
        $users= model("User")->getNormalUsers();
        foreach($users as $user) {
        	$userArrs[$user->id] = $user->username;
        }
        //获取商品信息
        $deals= model("deal")->getAllDeals();
        foreach($deals as $deal) {
        	$dealArrs[$deal->id] = $deal->name;
        }
        return $this->fetch('', [
            'data' => $data,
            'userArrs'=>$userArrs,
            'dealArrs'=>$dealArrs
        ]);
    }
   
    
      /**
     * 被删除的订单列表
     * @return mixed
     */
    public function dellist() {
        $data = $this->obj->getByOrderStatus(-1);
        $userArrs[]="";
        $dealArrs[]="";
        //获取用户信息
        $users= model("User")->getNormalUsers();
        foreach($users as $user) {
        	$userArrs[$user->id] = $user->username;
        }
        //获取商品信息
        $deals= model("deal")->getAllDeals();
        foreach($deals as $deal) {
        	$dealArrs[$deal->id] = $deal->name;
        }
        return $this->fetch('', [
            'data' => $data,
            'userArrs'=>$userArrs,
            'dealArrs'=>$dealArrs
        ]);
      
    }
    
  
}
