<?php
namespace app\common\model;

use think\Model;

class Admin extends Model
{
    protected  $autoWriteTimestamp = true;
    //方法在basemodel
    public function updateById($data, $id) {
        // allowField 过滤data数组中非数据表中的数据
        return $this->allowField(true)->save($data, ['id'=>$id]);
    }
    
    
    public function add($data = []) {
        // 如果提交的数据不是数组
        if(!is_array($data)) {
            exception('传递的数据不是数组');
        }

        $data['status'] = 1;
        return $this->data($data)->allowField(true)
            ->save();
    }

    /**
     * 根据用户名获取用户信息
     * @param $username
     */
    public function getadminByadminname($username) {
        if(!$username) {
            exception('用户名不合法');
        }

        $data = ['username' => $username];
        return $this->where($data)->find();
    }
    
    
    //总后台获取用户的数据
   public function getByadminStatus($status=0) {
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
   public function getBisByadminOne($id,$status=0) {
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
    
    
    //总后台管理员管理
    
    
}