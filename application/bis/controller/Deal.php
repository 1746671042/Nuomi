<?php
namespace app\bis\controller;
use think\Controller;
class Deal extends  Base
{
    
    private  $obj;
    public function _initialize() {
        $this->obj = model("Deal");
    }
    /**
     * @return mixed 商户中心的 deal列表页面 小伙伴自行完成
     */
    public function index()
    {
//        return "户中心的 deal列表页面 小伙伴自行完成";
        $deal = $this->obj->all();
        return $this->fetch('', [
            'deal' => $deal,
        ]);
    }

    public function  add() {
        $bisId = $this->getLoginUser()->bis_id;
        if(request()->isPost()) {
            // 走插入逻辑
            $data = input('post.');
           
            // 严格校验提交的数据， tp5 validate 小伙伴自行完成，
            $validate = validate('Deal');
            $data['name'] = htmlentities($data['name']);
            if(!$validate->scene('add')->check($data)) {
                $this->error($validate->getError());
            }
            $location = model('BisLocation')->get($data['location_ids'][0]);
            $deals = [
                'bis_id' => $bisId,
                'name' => $data['name'],
                'image' => $data['image'],
                'category_id' => $data['category_id'],
                'se_category_id' => empty($data['se_category_id']) ? '' : implode(',', $data['se_category_id']),
                'city_id' => $data['city_id'],
                'location_ids' => empty($data['location_ids']) ? '' : implode(',', $data['location_ids']),
                'start_time' => strtotime($data['start_time']),
                'end_time' => strtotime($data['end_time']),
                'total_count' => $data['total_count'],
                'origin_price' => $data['origin_price'],
                'current_price' => $data['current_price'],
                'coupons_begin_time' => strtotime($data['coupons_begin_time']),
                'coupons_end_time' => strtotime($data['coupons_end_time']),
                'notes' => $data['notes'],
                'description' => $data['description'],
                'bis_account_id' => $this->getLoginUser()->id,
                'xpoint' => $location->xpoint,
                'ypoint' => $location->ypoint,
            ];

            $id = model('Deal')->add($deals);
            if($id) {
                $this->success('添加成功', url('deal/index'));
            }else {
                $this->error('添加失败');
            }

        }else {
            //获取一级城市的数据
            $citys = model('City')->getNormalCitysByParentId();
            //获取一级栏目的数据
            $categorys = model('Category')->getNormalCategoryByParentId();
            $bislocations = model('BisLocation')->getNormalLocationByBisId($bisId);
            return $this->fetch('', [
                'citys' => $citys,
                'categorys' => $categorys,
                'bislocations' => model('BisLocation')->getNormalLocationByBisId($bisId),
            ]);
        }
    }
    
    
    
     public function detail() {
        $bisId = $this->getLoginUser()->bis_id;
        //获取一级城市的数据
        $citys = model('City')->getNormalCitysByParentId();
        //获取一级栏目的数据
        $categorys = model('Category')->getNormalCategoryByParentId();
        $bislocations = model('BisLocation')->getNormalLocationByBisId($bisId);
        $id = input('get.id');
        if(empty($id)) {
            return $this->error('ID错误');
        }
        // 获取团购数据
        $DealData = model('Deal')->get($id);
        return $this->fetch('',[
            'citys' => $citys,
            'categorys' => $categorys,
            'bislocations' => model('BisLocation')->getNormalLocationByBisId($bisId),
            'Dealdata'=>$DealData,
        ]);
    }
    
    
      // 下架
    public function low() {
        $data = input('get.');
        // 检验小伙伴自行完成
        /*$validate = validate('Bis');
        if(!$validate->scene('status')->check($data)) {
            $this->error($validate->getError());
        }*/

        $res = $this->obj->save(['status'=>$data['status']], ['id'=>$data['id']]);
        $location = model('BisLocation')->save(['status'=>$data['status']], ['bis_id'=>$data['id'], 'is_main'=>1]);
        $account = model('BisAccount')->save(['status'=>$data['status']], ['bis_id'=>$data['id'], 'is_main'=>1]);
        if($res && $location && $account) {
            // 发送邮件
            // status 1（通过）  status 2（不通过）  status -1（删除）
            // \phpmailer\Email::send($data['email'],$title, $content);
            $this->success('状态更新成功');
        }else {
            $this->error('状态更新失败');   
        }

    }
}
