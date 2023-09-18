<?php
/**
 * @copyright (C)2021-2099 RY STUDIO.
 * @author Marc
 * @date 2020年03月27日
 *  广告管理模型类
 */
namespace app\admin\model\content;

use core\basic\Model;

class SlideSortModel extends Model
{

    // 获取广告列表
    public function getList()
    {
        return parent::table('ay_slide_sort')->where("acode='" . session('acode') . "'")
            ->order('sorting asc,id asc')
            ->page()
            ->select();
    }

    public function getSort($id)
    {
        return parent::table('ay_slide_sort')->where("acode='" . session('acode') . "'")
            ->where("id='$id'")
            ->find();
    }

    public function modSort($id, $data)
    {
        $result = parent::table('ay_slide_sort')->autoTime()
            ->where("id='$id'")
            ->where("acode='" . session('acode') . "'")
            ->update($data);
        return $result;
    }

    // 获取最后一个code
    public function getLastCode()
    {
        return parent::table('ay_slide_sort')->order('id DESC')->value('id');
    }

    // 添加
    public function addSort(array $data)
    {
        return parent::table('ay_slide_sort')->autoTime()->insert($data);
    }

    // 修改排序
    public function modSortSorting($id, $data)
    {
        $result = parent::table('ay_slide_sort')->autoTime()
            ->where("id='$id'")
            ->where("acode='" . session('acode') . "'")
            ->update($data);
        return $result;
    }

    // 删除
    public function delSort($id)
    {
        return parent::table('ay_slide_sort')->where("acode='" . session('acode') . "'")
            ->where("id='$id'")
            ->delete();
    }

    // 检查
    public function checkName($where)
    {
        return parent::table('ay_slide_sort')->field('id')
            ->where($where)
            ->find();
    }

    // 获取图片列表
    public function getSlideList($gid)
    {
        return parent::table('ay_slide')->where("acode='" . session('acode') . "'")
            ->where("gid='$gid'")
            ->order('sorting asc,id asc')
            ->page()
            ->select();
    }

    // 添加图片
    public function addSlide($gid, array $data)
    {
        return parent::table('ay_slide')->autoTime()->insert($data);
    }

    // 删除图片
    public function delSlide($gid, $id)
    {
        return parent::table('ay_slide')->where("gid=$gid")
            ->where("id=$id")
            ->where("acode='" . session('acode') . "'")
            ->delete();
    }

    // 获取图片列表
    public function getSlide($gid, $id)
    {
        return parent::table('ay_slide')->where("gid=$gid")
            ->where("id=$id")
            ->where("acode='" . session('acode') . "'")
            ->find();
    }

    // 修改图片
    public function modSlide($gid, $id, $data)
    {
        return parent::table('ay_slide')->autoTime()
            ->where("gid=$gid")
            ->where("id=$id")
            ->where("acode='" . session('acode') . "'")
            ->update($data);
    }

    // 前台幻灯片 @mk-sldesort 增加状态判断
    public function getSlides($gid, $num, $start = 1)
    {
        $result = parent::table('ay_slide')->where("status=1")
            ->where("gid='$gid'")
            ->order('sorting ASC,id ASC')
            ->limit($start - 1, $num)
            ->select();
        return $result;
    }
}