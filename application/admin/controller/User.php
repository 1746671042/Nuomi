<?php
//会员模块
namespace app\admin\controller;
use think\Controller;
class User extends  Base
{
    private  $obj;
    public function _initialize() {
        $this->obj = model("User");
    }
    /**
     * 正常的会员列表
     * @return mixed
     */
    public function index() {
        $User = $this->obj->getByUserStatus(1);
        return $this->fetch('', [
            'user' => $User,
        ]);
    }
    /**
     * 会员申请列表
     * @return mixed
     */
    public function apply() {
        $data = $this->obj->getByUserStatus(0);
        return $this->fetch('', [
            'data' => $data,
        ]);
    }

    public function detail() {
        $data = input('get.');
        if(empty($data['id'])) {
            return $this->error('ID错误');
        }
        $data = $this->obj->getBisByUserOne($data['id'],$data['status']);
        return $this->fetch('',[
            'data' => $data,
        ]);
    }

    // 修改状态
    public function status() {
        $data = input('get.');
//        var_dump($data);exit;
        // 检验小伙伴自行完成
        $validate = validate('User');
        if(!$validate->scene('status')->check($data)) {
            $this->error($validate->getError());
        }
        $data = $this->obj->save(['status'=>$data['status']], ['id'=>$data['id']]);
        if($data) {
            $this->success('状态更新成功');
        }else {
            $this->error('状态更新失败');   
        }

    }
    
    
    
      /**
     * 被删除的会员列表
     * @return mixed
     */
    public function dellist() {
        $data = $this->obj->getByUserStatus(2);
        return $this->fetch('', [
            'data' => $data,
        ]);
    }
    
     /**
     * 未通过的会员列表
     * @return mixed
     */
    public function refer() {
        $data = $this->obj->getByUserStatus(-1);
        return $this->fetch('', [
            'data' => $data,
        ]);
    }
}
