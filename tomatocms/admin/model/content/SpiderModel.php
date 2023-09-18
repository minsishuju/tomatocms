<?php
/**
 * @author Marc
 * @email yepengmarc@qq.com
 * @date 2021年12月29日
 *  蜘蛛来访模型类
 */
namespace app\admin\model\content;

use core\basic\Model;

class SpiderModel extends Model
{

    // 获取日志列表
    public function getList()
    {
        return parent::table('ay_spider')->order('id DESC')
            ->page()
            ->select();
    }

    // 删除全部
    public function clearLog()
    {
        return parent::table('ay_spider')->delete();
    }
    // 写入蜘蛛来访日志
    public function write($content, $level = "info", $username = null, $type = 2)
    {
        $username = $username ?: session('username');
        $data = array(
            'level' => $level,
            'event' => escape_string($content),
            'user_ip' => ip2long(get_user_ip()),
            'user_os' => get_user_os(),
            'user_bs' => get_user_bs(),
            'create_user' => $username,
            'create_time' => get_datetime(),
            'type' => $type
        );
        return parent::table('ay_spider')->insert($data);
    }
}
