<?php

namespace app\Common\model;

use think\Model;

class City extends Model
{
    //
    protected  $autoWriteTimestamp = true;
    public function add($data) {
        $data['status'] = 1;
        //$data['create_time'] = time();
        $result =  $this->save($data);
        //echo $this->getLastSql();exit;
        return $result;
    }

    public function getNormalCitysByParentId($parentId=0) {
        $data = [
            'status' => 1,
            'parent_id' => $parentId,
        ];

        $order = [
            'listorder'=>'desc',
            'id' => 'desc',
        ];

        return $this->where($data)
            ->order($order)
            ->paginate();
    }
    //获取二级城市
    public function getNormalCitys() {
        $data = [
            'status' => 1,
            'parent_id' => ['gt', 0],
        ];

        $order = ['id'=>'desc'];

        return $this->where($data)
            ->order($order)
            ->select();

    }
}
