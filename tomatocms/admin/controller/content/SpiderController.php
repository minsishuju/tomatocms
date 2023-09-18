<?php
/**
 * @author Marc
 * @email yepengmarc@qq.com
 * @date 2021年12月29日
 *  蜘蛛来访控制器
 */
namespace app\admin\controller\content;

use core\basic\Controller;
use app\admin\model\content\SpiderModel;

class SpiderController extends Controller
{

    private $model;

    public function __construct()
    {
        $this->model = new SpiderModel();
    }

    // 日志列表
    public function index()
    {
        $this->assign('spiderlogs', $this->model->getList());
        $this->display('content/spider.html');
    }

    // 清理日志
    public function clear()
    {
        if ($this->model->clearLog()) {
            success('清空成功！', url('/admin/Spider/index'));
        } else {
            alert_location('清空失败！', url('/admin/Spider/index'));
        }
    }
}