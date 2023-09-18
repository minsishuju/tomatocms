<?php namespace app\home\controller;
/**
 * @copyright (C)2016-2099 qicaifengye
 * @author qicaifengye
 * @date 2022年07月21日
 *  会员前台扩展控制器
 */
namespace app\home\controller;

use core\basic\Controller;
use app\home\model\MemberModel;
use core\basic\Url;

class TomatoMemberController extends Controller
{
    public function __construct()
    {
        $this->model = new MemberModel();
        $this->parser = new ParserController();
        $this->htmldir = $this->config('tpl_html_dir') ? $this->config('tpl_html_dir') . '/' : '';
    }

    public function profiles()
    {
        // 未登录时跳转到用户登录
        if (! session('tomato_uid')) {
            location(Url::home('member/login'));
        }
        $content = parent::parser($this->htmldir . 'member/profiles.html'); // 框架标签解析
        $content = $this->parser->parserBefore($content); // CMS公共标签前置解析
        $content = str_replace('{pboot:pagetitle}', $this->config('ucenter_title') ?: '个人中心-{pboot:sitetitle}-{pboot:sitesubtitle}', $content);
        $content = $this->parser->parserPositionLabel($content, 0, '个人中心', Url::home('member/ucenter')); // CMS当前位置标签解析
        $content = $this->parser->parserSpecialPageSortLabel($content, - 4, '个人中心', Url::home('member/ucenter')); // 解析分类标签
        $content = $this->parser->parserAfter($content); // CMS公共标签后置解析
        echo $content;
        exit();
    }
    /*会员左侧导航*/
    public function membernav()
    {

        $content = parent::parser($this->htmldir . 'member/member-left.html'); // 框架标签解析

        echo $content;
        exit();
    }
    /**
     * 采用数组的方式输出会员中心左侧导航
    */
    private function nav_arr()
    {
        $array=[
            '0'=>[
                'title'=>'会员资料',
                'son'=>[
                    '0'=>[
                        'title'=>'个人资料',
                        'link'=>'/member/profiles/'
                    ]

                ]
            ]
        ];
        return $array;
    }
}