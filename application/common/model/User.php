<?php
namespace app\common\model;

use think\Model;

class User extends BaseModel
{
    public function add($data = []) {
        // 如果提交的数据不是数组
        if(!is_array($data)) {
            exception('传递的数据不是数组');
        }

        $data['status'] = 0;
        return $this->data($data)->allowField(true)
            ->save();
    }
    
     /**
     * 获取所有用户数据
     * @param $username
     */
    public function getNormalUsers($data=[]) {
        $order=[];
        $result = $this->where($data)
            ->order($order)
            ->paginate();
        return $result;
    }
    
    
    

    /**
     * 根据用户名获取用户信息
     * @param $username
     */
    public function getUserByUsername($username) {
        if(!$username) {
            exception('用户名不合法');
        }

        $data = ['username' => $username];
        return $this->where($data)->find();
    }
    
    
    //总后台获取用户的数据
   public function getByUserStatus($status=0) {
        $order = [
            'id' => 'desc',
        ];

        $data = [
            'status' => $status,
        ];
        $result = $this->where($data)
            ->order($order)
            ->paginate();
        return $result;
    }
    
    
    
      //获取单个用户
   public function getBisByUserOne($id,$status=0) {
        $order = [
            'id' => 'desc',
        ];

        $data = [
            'id'=>$id,
            'status' => $status,
        ];
        $result = $this->where($data)
            ->order($order)
            ->paginate();
        return $result;
    }
}