<?php
//会员模块
namespace app\admin\controller;
use think\Controller;
use think\Request;
class Admin extends  Base
{
//    总后台管理员管理
    private  $obj;
    public function _initialize() {
        $this->obj = model("Admin");
    }
    /**
     * 正常的管理员列表
     * @return mixed
     */
    public function index() {
        $data = $this->obj->getByadminStatus(1);
        return $this->fetch('', [
            'data' => $data,
        ]);
    }
    /**
     * 管理员申请列表
     * @return mixed
     */
    public function apply() {
        $data = $this->obj->getByadminStatus(0);
        return $this->fetch('', [
            'data' => $data,
        ]);
    }

    public function detail() {
        $data = input('get.');
        if(empty($data['id'])) {
            return $this->error('ID错误');
        }
        $data = $this->obj->getBisByadminOne($data['id'],$data['status']);
        return $this->fetch('',[
            'data' => $data,
        ]);
    }

    // 修改状态
    public function status() {
        $data = input('get.');
//        var_dump($data);exit;
        // 检验小伙伴自行完成
//        $validate = validate('admin');
//        if(!$validate->scene('status')->check($data)) {
//            $this->error($validate->getError());
//        }
        $data = $this->obj->save(['status'=>$data['status']], ['id'=>$data['id']]);
        if($data) {
            $this->success('状态更新成功');
        }else {
            $this->error('状态更新失败');   
        }

    }
    /**
     * 增加管理员
     * @return mixed
     */
    public function add() {
        if(request()->isPost()){
            $request = Request::instance();
            $data = input('post.');
            // 自动生成 密码的加盐字符串
            $Admin = model('Admin')->get(['Aname'=>$data['Aname']]);
            if($Admin){
                return $this->error('管理员已存在');
            }else{
                $data['status'] =1;
                $data['parent_id'] =$this->getLoginUser()->id;
                $data['last_login_ip'] =$request->ip();
                $data['last_login_time'] =time();

                $validate = validate('Admin');
                if(!$validate->scene('status')->check($data)) {
                    $this->error($validate->getError());
                }

                $data['code'] = mt_rand(100, 10000);
                $data['password'] = md5($data['password'].$data['code']);
                $data = Model("admin")->add($data);
            }
            if($data) {
                $this->success('增加成功','admin/index');
            }else {
                $this->error('增加失败');   
            }
        }else{
            return $this->fetch();
        }
        
    }
}
