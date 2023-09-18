<?php
/**
 * @copyright (C)2021-2099 RY STUDIO.
 * @author Marc
 * @date 2020年03月27日
 *  广告管理控制器
 */
namespace app\admin\controller\content;

use core\basic\Controller;
use app\admin\model\content\SlideSortModel;

class SlideSortController extends Controller
{

    private $count;

    private $blank;

    private $outData = array();

    private $model;

    public function __construct()
    {
        $this->model = new SlideSortModel();
    }

    // 广告分组列表
    public function index()
    {
        if (! ! $gid = get('gid', 'int')) {
            if (get('action') == 'picmanage') {
                $result = $this->model->getSlideList($gid);
                $this->assign('picmanage', true);
                $this->assign('slides', $result);
            }
        } else {
            $this->assign('list', true);
            $sorts = $this->model->getList();
            $this->assign('sorts', $sorts);
        }
        $this->display('content/slidesort.html');
    }

    // 广告分组增加
    public function add()
    {
        // 修改操作
        if ($_POST) {
            // 获取数据
            $name = post('name');
            $note = post('note');
            $status = post('status');

            if (! $name) {
                alert_back('广告名不能为空！');
            }

            // 检查组名
            if ($this->model->checkName("name='$name'")) {
                alert_back('该广告名成已经存在，不能再使用！');
            }

            $lastcode = $this->model->getLastCode();
            $id = get_auto_code($lastcode);

            // 构建数据
            $data = array(
                'acode' => session('acode'),
                'id' => $id,
                'name' => $name,
                'note' => $note,
                'status' => $status,
                'sorting' => 255,
                'create_user' => session('username'),
                'update_user' => session('username')
            );

            // 执行添加
            if ($this->model->addSort($data)) {
                $this->log('新增广告' . $id . '成功！');
                success('新增成功！', url('/admin/SlideSort/index'));
            } else {
                location(- 1);
            }
        } else { // 调取新增内容
            $this->assign('add', true);
            $this->display('content/slidesort.html');
        }
    }

    // 广告分组修改
    public function mod()
    {
        if (! ! $submit = post('submit')) {
            switch ($submit) {
                case 'sorting': // 修改列表排序
                    $listall = post('listall');
                    if ($listall) {
                        $sorting = post('sorting');
                        foreach ($listall as $key => $value) {
                            if ($sorting[$key] === '' || ! is_numeric($sorting[$key]))
                                $sorting[$key] = 255;

                            $this->model->modSortSorting($value, "sorting=" . $sorting[$key]);
                        }
                        $this->log('批量修改栏目排序成功！');
                        success('修改成功！', - 1);
                    } else {
                        alert_back('排序失败，无任何内容！');
                    }
                    break;
            }
        }

        if (! $id = get('id', 'int')) {
            error('传递的参数值错误！', - 1);
        }

        // 单独修改状态
        if (($field = get('field', 'var')) && ! is_null($value = get('value', 'var'))) {
            if ($this->model->modSort($id, "$field='$value',update_user='" . session('username') . "'")) {
                $this->log('修改广告' . $id . '状态' . $value . '成功！');
                location(- 1);
            } else {
                $this->log('修改广告' . $id . '状态' . $value . '失败！');
                alert_back('修改失败！');
            }
        }

        // 修改操作
        if ($_POST) {

            // 获取数据
            $name = post('name');
            $note = post('note');
            $status = post('status', 'int');
            $sorting = post('sorting', 'int');

            if (! $name) {
                alert_back('广告名不能为空！');
            }

            // 构建数据
            $data = array(
                'name' => $name,
                'note' => $note,
                'status' => $status,
                'sorting' => $sorting,
                'update_user' => session('username')
            );

            // 执行添加
            if ($this->model->modSort($id, $data)) {
                $this->log('修改广告' . $id . '成功！');
                success('修改成功！', url('/admin/SlideSort/index'));
            } else {
                location(- 1);
            }
        } else { // 调取修改内容
            $this->assign('mod', true);

            $sort = $this->model->getSort($id);
            if (! $sort) {
                error('编辑的内容已经不存在！', - 1);
            }
            $this->assign('sort', $sort);
            $this->display('content/slidesort.html');
        }
    }

    // 广告分组删除
    public function del()
    {
        if (! $id = get('id', 'int')) {
            error('传递的参数值错误！', - 1);
        }
        if ($this->model->delSort($id)) {
            $this->log('删除广告' . $id . '成功！');
            success('删除成功！', - 1);
        } else {
            $this->log('删除广告' . $id . '失败！');
            error('删除失败！', - 1);
        }
    }

    // 广告图片增加
    public function subadd()
    {
        if ($_POST) {
            // 获取数据
            $gid = get('gid', 'int');
            if (! $gid) {
                error('传递的参数值错误！', - 1);
            }
            $pic = post('pic');
            $ico = post('ico');
            $link = post('link');
            $title = post('title');
            $subtitle = post('subtitle');
            $desc = post('desc');
            $sorting = post('sorting', 'int');
            $status = post('status', 'int');

            if (! $pic) {
                alert_back('图片不能为空！');
            }

            // 构建数据
            $data = array(
                'acode' => session('acode'),
                'gid' => $gid,
                'pic' => $pic,
                'ico' => $ico,
                'link' => $link,
                'title' => $title,
                'subtitle' => $subtitle,
                'desc' => $desc,
                'sorting' => $sorting,
                'status' => $status,
                'create_user' => session('username'),
                'update_user' => session('username')
            );

            // 执行添加
            if ($this->model->addSlide($gid, $data)) {
                $this->log('新增图片成功！');
                if (! ! $backurl = get('backurl')) {
                    success('新增成功！', base64_decode($backurl));
                } else {
                    success('新增成功！', url('/admin/SlideSort/index/gid/'.$gid.'/action/picmanage'));
                }
            } else {
                $this->log('新增图片失败！');
                error('新增失败！', - 1);
            }
        } else {
            $this->assign('add', true);
            $this->display('content/slidesort.html');
        }
    }

    // 广告图片删除
    public function subdel()
    {
        $gid = get('gid', 'int');
        $id = get('id', 'int');
        if (!$gid || !$id) {
            error('传递的参数值错误！', - 1);
        }
        if ($this->model->delSlide($gid,$id)) {
            $this->log('删除图片' . $id . '成功！');
            success('删除成功！', - 1);
        } else {
            $this->log('删除图片' . $id . '失败！');
            error('删除失败！', - 1);
        }
    }

    // 广告图片修改
    public function submod()
    {
        $gid = get('gid', 'int');
        if (!$gid) {
            error('传递的参数值错误！', - 1);
        }

        if (! ! $submit = post('submit')) {
            switch ($submit) {
                case 'sorting': // 修改列表排序
                    $listall = post('listall');
                    if ($listall) {
                        $sorting = post('sorting');
                        foreach ($listall as $key => $value) {
                            if ($sorting[$key] === '' || ! is_numeric($sorting[$key]))
                                $sorting[$key] = 255;
                            $this->model->modSlide($gid, $value, "sorting=" . $sorting[$key]);
                        }
                        $this->log('批量修改图片排序成功！');
                        success('修改成功！', - 1);
                    } else {
                        alert_back('排序失败，无任何内容！');
                    }
                    break;
            }
        }

        $id = get('id', 'int');
        if (!$id) {
            error('传递的参数值错误！', - 1);
        }

        // 单独修改状态
        if (($field = get('field', 'var')) && ! is_null($value = get('value', 'var'))) {
            if ($this->model->modSlide($gid, $id, "$field='$value',update_user='" . session('username') . "'")) {
                location(- 1);
            } else {
                alert_back('修改失败！');
            }
        }

        // 修改操作
        if ($_POST) {

            // 获取数据
            $pic = post('pic');
            $ico = post('ico');
            $link = post('link');
            $title = post('title');
            $subtitle = post('subtitle');
            $desc = post('desc');
            $status = post('status');
            $sorting = post('sorting', 'int');
            if (! $pic) {
                alert_back('图片不能为空！');
            }

            // 构建数据
            $data = array(
                'pic' => $pic,
                'ico' => $ico,
                'link' => $link,
                'title' => $title,
                'subtitle' => $subtitle,
                'desc' => $desc,
                'status' => $status,
                'sorting' => $sorting,
                'update_user' => session('username')
            );

            // 执行添加
            if ($this->model->modSlide($gid, $id, $data)) {
                $this->log('修改图片' . $id . '成功！');
                if (! ! $backurl = get('backurl')) {
                    success('修改成功！', base64_decode($backurl));
                } else {
                    success('修改成功！', url('/admin/SlideSort/index/gid/'.$gid.'/action/picmanage'));
                }
            } else {
                location(- 1);
            }
        } else {
            // 调取修改内容
            $this->assign('submod', true);
            if (! $result = $this->model->getSlide($gid,$id)) {
                error('编辑的内容已经不存在！', - 1);
            }
            $this->assign('slide', $result);
            $this->display('content/slidesort.html');
        }
    }
}
