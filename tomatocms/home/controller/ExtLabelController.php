<?php
/**
 * @author qicaifengye
 * @date 2021年2月18日
 *  个人扩展标签可编写到本类中，升级不会覆盖
 */

namespace app\home\controller;

use core\basic\Controller;
use app\home\controller\TomatoExtensionController;

class ExtLabelController
{

    protected $content;

    public function __construct()
    {
        $this->TomatoTag = new TomatoExtensionController();
    }

    /* 必备启动函数 */
    public function run($content)
    {
        // 接收数据
        $this->content = $content;
        /**新增的基础函数**/
        //获取默认语言
        $this->default_lang();
        //判断是不是手机
        $this->isMobile();
        //执行当天日期函数
        $this->tmtoday();
        //执行canonical 规范网址 标签函数
        $this->canonical();
        //执行分割字符循环输出函数
        $this->LoopSplitLabel();
        /**对原有函数的增强**/
        //执行对tags标签增强 函数
        $this->tagsmatch();
        /**新增的标签函数**/
        // 执行图文合一标签函数
        $this->graphics();
        //执行关联内容标签函数
        $this->associate();

        // 返回数据
        return $this->content;
    }

    /**
     * 新增的基础函数
     */
    //获取默认语言
    public function default_lang()
    {
        $this->content = str_replace('{pboot:language}', default_lang(), $this->content);
    }
    //判断是不是手机访问
    public function isMobile()
    {
        $m_or_p = isMobile() ? 1 : 0;
        //is_mobile();//系统自带的，判断不是很全面
        $this->content = str_replace('{pboot:ismobile}', $m_or_p, $this->content);
    }
    //输出今天的日期
    public function tmtoday()
    {
        $this->content = $this->TomatoTag->tmtoday($this->content);
    }
    //规范网址 标签函数
    private function canonical()
    {
        $this->content = $this->TomatoTag->Canonical($this->content);
    }

    //分割字符循环输出函数
    private function LoopSplitLabel()
    {
        $this->content = $this->TomatoTag->LoopSplitLabel($this->content);
    }

    /**
     * 对原有函数的增强
     */
    //tags标签增强函数
    private function tagsmatch()
    {
        $this->content = $this->TomatoTag->Tagsmatch($this->content);
    }

    /**
     * 新增的标签函数
     */
    //图文合一标签实现
    private function graphics()
    {
        $this->content = $this->TomatoTag->GraphicsboxLabel($this->content);
    }

    //关联内容标签函数
    private function associate()
    {
        $this->content = $this->TomatoTag->Associate($this->content);
    }


    /**
     * 非必备函数
     */
    //分割字符串
    public function ImgAndTxt($data)
    {
        return $imgarr = explode("|", $data);
    }

}