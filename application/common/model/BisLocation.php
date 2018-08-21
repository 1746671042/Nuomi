<?php
namespace app\common\model;

use think\Model;

class BisLocation extends BaseModel
{

       //获取所有的商家列表
	public function getNormalLocations($data = []) {
                 $data = [
                        'bis_id' => ['in', $data],
                    ];
		$order = ['id'=>'desc'];
                
		$result = $this->where($data)
			->order($order)
			->paginate();
//		echo $this->getLastSql();
		return  $result;
	}
      
    
    
    public function getNormalLocationByBisId($bisId) {
        $data = [
            'bis_id' => $bisId,
            'status' => 1,
        ];

        $result = $this->where($data)
            ->order('id', 'desc')
            ->select();
        return $result;
    }

    public function getNormalLocationsInId($ids) {
        $data = [
            'id' => ['in', $ids],
            'status' => 1,
        ];
        return $this->where($data)
            ->select();
    }

}