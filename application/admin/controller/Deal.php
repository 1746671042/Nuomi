<?php
namespace app\admin\controller;
use think\Controller;
class Deal extends  Base
{
    //商品团购提交审核
    private  $obj;
    public function _initialize() {
        $this->obj = model("Deal");
    }

    public function index() {
    	$data = input('get.');
    	$sdata = [];
        //；‘判断时间 开始时间>结束时间
    	if(!empty($data['start_time']) && !empty($data['end_time']) && strtotime($data['end_time']) > strtotime($data['start_time'])) {
    		$sdata['create_time'] = [
                    //gt  代表大于  lt 小于
    			['gt', strtotime($data['start_time'])],
    			['lt', strtotime($data['end_time'])],
    		];
    	}
    	if(!empty($data['category_id'])) {
    		$sdata['category_id'] = $data['category_id'];
    	}
    	if(!empty($data['city_id'])) {
    		$sdata['city_id'] = $data['city_id'];
    	}
    	if(!empty($data['name'])) {
    		$sdata['name'] = ['like', '%'.$data['name'].'%'];
    	}
        //获取分类
    	$cityArrs = $categoryArrs = [];
        $categorys = model("Category")->getNormalCategoryByParentId();
        //转换
        foreach($categorys as $category) {
        	$categoryArrs[$category->id] = $category->name;
        }
        //获取城市
        $citys = model("City")->getNormalCitys();
        foreach($citys as $city) {
        	$cityArrs[$city->id] = $city->name;
        }
        
        $deals = $this->obj->getNormalDeals($sdata);
        return $this->fetch('', [
        	'categorys' => $categorys,
        	'citys' => $citys,
        	'deals' => $deals,
                //搜索完成后返回给搜索的默认值
        	'category_id' => empty($data['category_id']) ? '' : $data['category_id'],
        	'city_id' => empty($data['city_id']) ? '' : $data['city_id'],
        	'start_time' => empty($data['start_time']) ? '' : $data['start_time'],
        	'end_time' => empty($data['end_time']) ? '' : $data['end_time'],
        	'name' => empty($data['name']) ? '' : $data['name'],
        	'categoryArrs' => $categoryArrs,
        	'cityArrs' => $cityArrs,
        ]);
    }

    public function apply() {
        $data = input('get.');
        $sdata = [];
        if(!empty($data['start_time']) && !empty($data['end_time']) && strtotime($data['end_time']) > strtotime($data['start_time'])) {
            $sdata['create_time'] = [
                ['gt', strtotime($data['start_time'])],
                ['lt', strtotime($data['end_time'])],
            ];
        }
        if(!empty($data['category_id'])) {
            $sdata['category_id'] = $data['category_id'];
        }
        if(!empty($data['city_id'])) {
            $sdata['city_id'] = $data['city_id'];
        }
        if(!empty($data['name'])) {
            $sdata['name'] = ['like', '%'.$data['name'].'%'];
        }
        $cityArrs = $categoryArrs = [];
        $categorys = model("Category")->getNormalCategoryByParentId();
        foreach($categorys as $category) {
            $categoryArrs[$category->id] = $category->name;
        }

        $citys = model("City")->getNormalCitys();
//        var_dump($citys);
        foreach($citys as $city) {
            $cityArrs[$city->id] = $city->name;
        }
//        var_dump($cityArrs);
        $deals = $this->obj->getApplyDeals($sdata);
        return $this->fetch('', [
            'categorys' => $categorys,
            'citys' => $citys,
            'deals' => $deals,
            'category_id' => empty($data['category_id']) ? '' : $data['category_id'],
            'city_id' => empty($data['city_id']) ? '' : $data['city_id'],
            'start_time' => empty($data['start_time']) ? '' : $data['start_time'],
            'end_time' => empty($data['end_time']) ? '' : $data['end_time'],
            'name' => empty($data['name']) ? '' : $data['name'],
            'categoryArrs' => $categoryArrs,
            'cityArrs' => $cityArrs,
        ]);
    }
    
    
    
    
    public function edit($id=0){
        if(intval($id) < 1) {
            $this->error('参数不合法');
        }
         //获取一级城市的数据
        $citys = model('City')->getNormalCitysByParentId();
        //获取一级栏目的数据
        $categorys = model('Category')->getNormalCategoryByParentId();
        $deal = $this->obj->get($id);
        $city_id = $deal->city_id;
        $category_id = $deal->category_id;
        return $this->fetch('', [
            'categorys'=> $categorys,
            'citys' => $citys,
            'deal'=>$deal,
            'city_id' => empty($city_id) ? '' : $city_id,
            'category_id' => empty($category_id) ? '' : $category_id,
        ]);
    }
    
    
    // 修改状态
    public function status() {
        $data = input('get.');
//        var_dump($data);
        $res = $this->obj->save(['status'=>$data['status']], ['id'=>$data['id']]);
        if($res) {
            $this->success('状态更新成功');
        }else {
            $this->error('状态更新失败');   
        }

    }
    
    
    //团购商品删除/下架
     public function dellist() {
//        $deals = $this->obj->getDelDeals();
//        var_dump($deals);
//        return $this->fetch('', [
//        	'deals' => $deals,
//        ]);
        $data = input('get.');
    	$sdata = [];
        //；‘判断时间 开始时间>结束时间
    	if(!empty($data['start_time']) && !empty($data['end_time']) && strtotime($data['end_time']) > strtotime($data['start_time'])) {
    		$sdata['create_time'] = [
                    //gt  代表大于  lt 小于
    			['gt', strtotime($data['start_time'])],
    			['lt', strtotime($data['end_time'])],
    		];
    	}
    	if(!empty($data['category_id'])) {
    		$sdata['category_id'] = $data['category_id'];
    	}
    	if(!empty($data['city_id'])) {
    		$sdata['city_id'] = $data['city_id'];
    	}
    	if(!empty($data['name'])) {
    		$sdata['name'] = ['like', '%'.$data['name'].'%'];
    	}
        //获取分类
    	$cityArrs = $categoryArrs = [];
        $categorys = model("Category")->getNormalCategoryByParentId();
        //转换
        foreach($categorys as $category) {
        	$categoryArrs[$category->id] = $category->name;
        }
        //获取城市
        $citys = model("City")->getNormalCitys();
        foreach($citys as $city) {
        	$cityArrs[$city->id] = $city->name;
        }
        
        $deals = $this->obj->getDelDeals($sdata);
        return $this->fetch('', [
        	'categorys' => $categorys,
        	'citys' => $citys,
        	'deals' => $deals,
                //搜索完成后返回给搜索的默认值
        	'category_id' => empty($data['category_id']) ? '' : $data['category_id'],
        	'city_id' => empty($data['city_id']) ? '' : $data['city_id'],
        	'start_time' => empty($data['start_time']) ? '' : $data['start_time'],
        	'end_time' => empty($data['end_time']) ? '' : $data['end_time'],
        	'name' => empty($data['name']) ? '' : $data['name'],
        	'categoryArrs' => $categoryArrs,
        	'cityArrs' => $cityArrs,
        ]);
        
        
    }
    

}
