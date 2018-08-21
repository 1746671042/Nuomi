<?php
namespace app\common\model;
use think\Model;
//订单处理
class Order extends Model
{
    protected  $autoWriteTimestamp = true;
    public function add($data) {
        $data['status'] = 1;
        //$data['create_time'] = time();
        $this->save($data);
        return $this->id;

    }

    public function updateOrderByOutTradeNo($outTradeTo, $weixinData) {
        if(!empty($weixinData['transaction_id'])) {
            $data['transaction_id'] = $weixinData['transaction_id'];
        }
        if(!empty($weixinData['total_fee'])) {
            $data['pay_amount'] = $weixinData['total_fee'] / 100;
            $data['pay_status'] = 1;
        }

        if(!empty($weixinData['time_end'])) {
            $data['pay_time'] = $weixinData['time_end'];
        }

        return $this->allowField(true)
            ->save($data, ['out_trade_no' => $outTradeTo]);
    }

    
    //获取订单数据
   public function getByOrderStatus($status=0) {
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