<?php
namespace app\common\model;

use think\Model;

class Bis extends BaseModel
{
    /**
     * 保存商户信息bis_user
     * @param 
     */
    //方法在Basemodel 中
//    protected $autoWriteTimestamp=true;
//    public function add($data) {
//       $data['status']=0;
//       $this->save($data);
//       return $this->id;
//    }
    
     /**
     * 通过状态获取商家数据
     * @param $status
     */
    public function getBisByStatus($status=0) {
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
}