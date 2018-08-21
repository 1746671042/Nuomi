<?php
namespace app\admin\controller;
use think\Controller;
class City extends  Base
{
    private  $obj;
    public function _initialize() {
        $this->obj = model("City");
    }
    public function index()
    {
//        return $this->fetch();
        $parentId = input('get.parent_id', 0, 'intval');
        $citys = $this->obj->getNormalCitysByParentId($parentId);
        return $this->fetch('',[
            'citys'=>$citys,
        ]);
    }

    public function add() {
        $citys = $this->obj->getNormalCitysByParentId();
        return $this->fetch('', [
            'citys'=> $citys,
        ]);
    }

    public function save() {
        /**
         * 做下严格判定
         */
        if(!request()->isPost()) {
            $this->error('请求失败');
        }
  
        $data = input('post.');
        //dump($data);exit;
        //halt($data);
        //echo 12;exit;
        ///$data['status'] = 10; 
        //debug('begin');
        $validate = validate('City');
        $data['name'] = htmlentities($data['name']);
        if(!$validate->scene('add')->check($data)) {
            $this->error($validate->getError());
        }
        
        if(!empty($data['id'])) {
            return $this->update($data);
        }
        //debug('end');
        //echo debug('begin', 'end','m');exit;

        // 把$data 提交model层
        $res = $this->obj->add($data);
        if($res) {
            $this->success('新增成功');
        }else {
            $this->error('新增失败');
        }
    }

    /**
     * 编辑页面
     */
    public function edit($id=0) {
        if(intval($id) < 1) {
            $this->error('参数不合法');
        }
        $city = $this->obj->get($id);
        $citys = $this->obj->getNormalCitysByParentId();
//        dump($city->name);
//        dump($citys);
        return $this->fetch('', [
            'city'=> $city,
            'citys' => $citys,
        ]);
    }

    public function update($data) {
        $res =  $this->obj->save($data, ['id' => intval($data['id'])]);
        if($res) {
            $this->success('更新成功');
        } else {
            $this->error('更新失败');
        }
    }

    // 排序逻辑
    public function listorder($id, $listorder) {
        $res = $this->obj->save(['listorder'=>$listorder], ['id'=>$id]);
        if($res) {
            //会返回一个信息  code msg  等，在common.js 中能够获取到状态码code 为1 是成功
            $this->result($_SERVER['HTTP_REFERER'], 1, 'success');
        }else {
            $this->result($_SERVER['HTTP_REFERER'], 0, '更新失败');
        }
    }

    // 修改状态
    /*public function status() {
        $data = input('get.');
        $validate = validate('Category');
        if(!$validate->scene('status')->check($data)) {
            $this->error($validate->getError());
        }

        $res = $this->obj->save(['status'=>$data['status']], ['id'=>$data['id']]);
        if($res) {
            $this->success('状态更新成功');
        }else {
            $this->error('状态更新失败');
        }

    }*/

}
