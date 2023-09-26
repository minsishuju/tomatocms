<?php
/**
 * @author qicaifengye
 * @date 2021年2月18日
 *  个人扩展标签可编写到本类中，升级不会覆盖
 * 计划在本类中实现复杂的标签，在ExtLabelController实现简单的标签
 */
namespace app\home\controller;

use core\basic\Url;
use core\basic\Controller;
use app\home\controller\ParserController;
use app\home\controller\ExtLabelController;
use app\home\model\ParserModel;

class TomatoExtensionController extends ParserController
{
    public function __construct()
    {
        $this->model = new ParserModel();
    }
    // 解析指定图文合一
    public function GraphicsboxLabel($content)
    {
        $pattern = '/\{pboot:graphics(\s+[^}]+)?\}([\s\S]*?)\{\/pboot:graphics\}/';
        $pattern2 = '/\[graphics:([\w]+)(\s+[^]]+)?\]/';
        if (preg_match_all($pattern, $content, $matches)) {
            $count = count($matches[0]);
            for ($i = 0; $i < $count; $i ++) {
                // 获取调节参数
                $params = $this->parserParam($matches[1][$i]);
                $id = - 1;

                if (! self::checkLabelLevel($params)) {
                    $content = str_replace($matches[0][$i], '', $content);
                    continue;
                }

                // 跳过未指定id的调用
                if (! array_key_exists('id', $params)) {
                    continue;
                }

                // 跳过未指定field的调用
                if (! array_key_exists('field', $params)) {
                    continue;
                }

                // 分离参数
                foreach ($params as $key => $value) {
                    switch ($key) {
                        case 'id':
                            $id = $value;
                            break;
                        case 'field':
                            $field = $value;
                            break;
                    }
                }

                // 读取内容多图
                if (! ! $checkboxs = $this->model->getContentCheckbox(escape_string($id), escape_string($field))) {
                    $data = explode(',', $checkboxs);
                } else {
                    $data = array();
                }

                // 无内容直接替换为空并跳过
                if (! $data) {
                    $content = str_replace($matches[0][$i], '', $content);
                    continue;
                }

                // 匹配到内部标签
                if (preg_match_all($pattern2, $matches[2][$i], $matches2)) {
                    $count2 = count($matches2[0]); // 循环内的内容标签数量
                } else {
                    $count2 = 0;
                }

                $out_html = '';
                $key = 1;
                $extlabel = new ExtLabelController();
                foreach ($data as $value) { // 按条数循环
                    $one_html = $matches[2][$i];

                    for ($j = 0; $j < $count2; $j ++) { // 循环替换数据
                        $params = $this->parserParam($matches2[2][$j]);
                        switch ($matches2[1][$j]) {
                            case 'n':
                                $one_html = str_replace($matches2[0][$j], $this->adjustLabelData($params, $key) - 1, $one_html);
                                break;
                            case 'i':
                                $one_html = str_replace($matches2[0][$j], $this->adjustLabelData($params, $key), $one_html);
                                break;
                            case 'imgsrc':
                                $one_html = str_replace($matches2[0][$j], $extlabel->ImgAndTxt($value)[0], $one_html);
                                break;
                            case 'imgtitle':
                                $one_html = str_replace($matches2[0][$j], $this->adjustLabelData($params, $extlabel->ImgAndTxt($value)[1]), $one_html);
                                break;
                            case 'imgdesc':
                                $one_html = str_replace($matches2[0][$j], $this->adjustLabelData($params, $extlabel->ImgAndTxt($value)[2]), $one_html);
                                break;
                        }
                    }
                    $key ++;
                    $out_html .= $one_html;
                }
                $content = str_replace($matches[0][$i], $out_html, $content);
            }
        }
        return $content;
    }
    //解析canonical 规范网址 标签
    public function Canonical($content)
    {
        //拼装标准的首页链接
        $Canonical='';
        $uri=rtrim($_SERVER['REQUEST_URI'],'/');
        if($this->config('main_domain')==""){
            $Canonical=(is_https() ? 'https://' : 'http://').$this->parserSiteLabel('{pboot:sitedomain}');
        }else{
            $Canonical=(is_https() ? 'https://' : 'http://').$this->config('main_domain');
        }
        $pattern = '/\{pboot:canonical(\s+[^}]+)?\}/';
        if (preg_match_all($pattern, $content, $matches)) {
            $count = count($matches[0]);
            for ($i = 0; $i < $count; $i++) {
                $params = $this->parserParam($matches[1][$i]);
                $type = '';
                foreach ($params as $key => $value) {
                    switch ($key) {
                        case 'type':
                            $type = $value;
                            break;
                    }
                }
                //type 未空值  就是首页
                if (!$type && !$uri) { $content = str_replace($matches[0][$i], $Canonical, $content);}  //首页
                if (!$type && !empty($uri)) { $content = str_replace($matches[0][$i], $Canonical.$uri, $content);} //search页
                //为单页时
                if($type==1)
                {
                    $url_array = explode('/',$uri);
                    $url_end=array_pop($url_array);
                    if(stripos($url_end,'.')===false)
                    {
                        $content = str_replace($matches[0][$i], $Canonical.$uri.'/', $content);
                    }else{
                        $content = str_replace($matches[0][$i], $Canonical.implode('/',$url_array).'/', $content);
                    }
                }
                //列表页 详情页 tag页
                if ($type==2)
                {
                    if(substr($uri, -strlen('.html'))=='.html' || substr($uri, strlen('/search'))=='/search'){
                        $uri=$Canonical.$uri;
                    }else{
                        $uri=$Canonical.$uri.'/';
                    }
                    $content = str_replace($matches[0][$i], $uri, $content);
                }
            }
        }
        return $content;
    }
    //模仿指定栏目标签，处理指定关联
    public function Associate($content)
    {
        $pattern = '/\{pboot:guanlian(\s+[^}]+)?\}([\s\S]*?)\{\/pboot:guanlian\}/';
        $pattern2 = '/\[guanlian:([\w]+)(\s+[^]]+)?\]/';
        if (preg_match_all($pattern, $content, $matches)) {
            $count = count($matches[0]);
            for ($i = 0; $i < $count; $i ++) {
                // 获取调节参数
                $params = $this->parserParam($matches[1][$i]);
                $id = - 1;
                // 跳过未指定id的文章
                if (! array_key_exists('id', $params)) {
                    continue;
                }
                if (! $this->checkLabelLevel($params)) {
                    $content = str_replace($matches[0][$i], '', $content);
                    continue;
                }
                // 分离相关参数
                foreach ($params as $key => $value) {
                    switch ($key) {
                        case 'id':
                            $id = $value;
                            break;
                        case 'num':
                            $num=(int)$value;
                            break;
                    }
                }
                if (! $id) {
                    $id = - 1;
                }else{$ids=explode(",",trim($id,","));}
                if($id!='-1' && count($ids)>0)
                {
                    $limit=($num>0 && $num<count($ids))?$num:count($ids);
                    // 循环读取文章数据
                    for ($ii=0; $ii < $limit; $ii++) {
                        $data[$ii] = $this->model->getContent(escape_string($ids[$ii]));
                    }
                }

                if (! $data) {
                    $content = str_replace($matches[0][$i], '', $content);
                    continue;
                }
                // 匹配到内部标签
                if (preg_match_all($pattern2, $matches[2][$i], $matches2)) {
                    $count2 = count($matches2[0]); // 循环内的内容标签数量
                } else {
                    $count2 = 0;
                }
                // 无数据直接跳过
                $out_html = '';
                $key = 1;
                foreach ($data as $value) { // 按查询数据条数循环
                    $one_html = $matches[2][$i];

                    for ($j = 0; $j < $count2; $j ++) { // 循环替换数据
                        $params = $this->parserParam($matches2[2][$j]);

                        switch ($matches2[1][$j]) {
                            case 'n':
                                $one_html = str_replace($matches2[0][$j], $this->adjustLabelData($params, $key) - 1, $one_html);
                                break;
                            case 'i':
                                $one_html = str_replace($matches2[0][$j], $this->adjustLabelData($params, $key), $one_html);
                                break;
                            case 'link':
                                if ($value->type == 1) {
                                    if ($value->sortoutlink) {
                                        $one_html = str_replace($matches2[0][$j], $value->sortoutlink, $one_html);
                                    } else {
                                        $one_html = str_replace($matches2[0][$j], $this->parserLink($value->type, $value->urlname, 'about', $value->scode, $value->sortfilename, '', ''),$one_html);
                                    }
                                } else {
                                    if ($value->outlink) {
                                        $one_html = str_replace($matches2[0][$j], $value->outlink, $one_html);
                                    } else {
                                        $one_html = str_replace($matches2[0][$j], $this->parserLink($value->type, $value->urlname, 'content', $value->scode, $value->sortfilename, $value->id, $value->filename), $one_html);
                                    }
                                }
                                break;
                            case 'ico':
                                if ($value->ico) {
                                    if (! preg_match('/^http/', $value->ico)) {
                                        $one_html = str_replace($matches2[0][$j], $this->adjustLabelData($params, SITE_DIR . $value->ico), $one_html);
                                    } else {
                                        $one_html = str_replace($matches2[0][$j], $this->adjustLabelData($params, $value->ico), $one_html);
                                    }
                                } else {
                                    $one_html = str_replace($matches2[0][$j], '', $one_html);
                                }
                                break;
                            case 'pic':
                                if ($value->pic) {
                                    if (! preg_match('/^http/', $value->pic)) {
                                        $one_html = str_replace($matches2[0][$j], $this->adjustLabelData($params, SITE_DIR . $value->pic), $one_html);
                                    } else {
                                        $one_html = str_replace($matches2[0][$j], $this->adjustLabelData($params, $value->pic), $one_html);
                                    }
                                } else {
                                    $one_html = str_replace($matches2[0][$j], '', $one_html);
                                }
                                break;
                            case 'rows':
                                $one_html = str_replace($matches2[0][$j], $this->model->getSortRows($value->scode), $one_html); // 获取分类包含子类的内容数量
                                break;
                            default:
                                if (isset($value->{$matches2[1][$j]})) {
                                    $one_html = str_replace($matches2[0][$j], $this->adjustLabelData($params, $value->{$matches2[1][$j]}), $one_html);
                                }
                        }
                    }
                    $key ++;
                    $out_html .= $one_html;
                }
                // 执行替换
                $content = str_replace($matches[0][$i], $out_html, $content);
            }
        }
        return $content;
    }
    // tags 关键词标签匹配标签  限制在内页使用
    public function Tagsmatch($content)
    {
        $pattern = '/\{pboot:matchtags(\s+[^}]+)?\}([\s\S]*?)\{\/pboot:matchtags\}/';
        $pattern2 = '/\[matchtags:([\w]+)(\s+[^]]+)?\]/';
        if (preg_match_all($pattern, $content, $matches)) {
            $count = count($matches[0]);
            for ($i = 0; $i < $count; $i ++) {
                // 获取调节参数
                $params = $this->parserParam($matches[1][$i]);

                if (! self::checkLabelLevel($params)) {
                    $content = str_replace($matches[0][$i], '', $content);
                    continue;
                }
                $keywd=''; //传入的指定关键词
                $id = ''; // 调取指定内容的tags
                $scode = ''; // 调取指定分类的tags
                $target = 'list'; // 标签跳转目标，可以是内容列表，也可以是独立tags.html页面
                $random=0;
                $num=30;
                // 分离参数
                foreach ($params as $key => $value) {
                    switch ($key) {
                        case 'id':
                            $id = $value;
                            break;
                        case 'scode':
                            $scode = $value;
                            break;
                        case 'num':
                            $num = $value;
                            break;
                        case 'target':
                            $target = $value;
                            break;
                        case 'keywd':
                            $keywd = $value;
                            break;
                        case 'random':
                            $random = $value;
                    }
                }
                // 获取数据
                $data = array();
                if ($id) { // 获取单个内容的tags
                    if (strpos($scode, ',') !== false) {
                        error('模板中指定id输出tags时不允许scode指定多个栏目！');
                    }
                    if (! ! $rs = $this->model->getContentTags(escape_string($id))) {
                        if ($rs->tags) {
                            $tags = explode(',', $rs->tags);
                            $scode = $scode ?: $rs->scode;
                            $sort = $this->model->getSort($scode); // 获取栏目信息
                            foreach ($tags as $key => $value) {
                                $data[] = array(
                                    'sort' => $sort,
                                    'tags' => $value
                                );
                            }
                        }
                    }
                } elseif ($scode) { // 获取指定栏目的tags
                    $scodes = explode(',', $scode); // 多个栏目是分别获取
                    foreach ($scodes as $key => $value) {
                        $sort = $this->model->getSort($value); // 获取栏目信息
                        if (! ! $rs = $this->model->getSortTags($value)) {
                            $scodetags=$tags = implode(',', $rs); // 把栏目tags串起来 这里的$rs是没有容错的、没有过滤同一篇内重复的tags

                            $tagsArrSum = array_count_values(explode(',', $tags)); // @mk-tags_one_sum 把所有tags组成数组并计算每个值得数量
                            $tags = array_unique(explode(',', $tags)); // 再把所有tags组成数组并去重
                            foreach ($tags as $key2 => $value2) {
                                if (! in_array($value2, array_column($data, 'tags'))) { // 避免重复输出
                                    $data[] = array(
                                        'sort' => $sort,
                                        'tags' => $value2
                                    );
                                }
                            }
                        }
                    }
                } else {
                    // 全部栏目时候强制标签页形式
                    $target = 'tag';
                    if (! ! $rs = $this->model->getSortTags('')) {
                        $tags = implode(',', $rs); // 把栏目tags串起来
                        $tagsArrSum = array_count_values(explode(',', $tags)); // @mk-tags_one_sum 把所有tags组成数组并计算每个值得数量
                        $tags = array_unique(explode(',', $tags)); // 再把所有tags组成数组并去重
                        foreach ($tags as $key2 => $value2) {
                            if (! in_array($value2, array_column($data, 'tags'))) { // 避免重复输出
                                $data[] = array(
                                    'tags' => $value2
                                );
                            }
                        }
                    }
                }

                //获取当前url中包含的tag值
                if(strripos(urldecode(get_current_url()),"tag=")){
                    $current_url=urldecode(get_current_url());
                    $current_tag=substr($current_url,strripos($current_url,"tag=")+4);
                    if(strripos($current_tag,"&")){
                        $current_tag= strstr($current_tag,"&","true");
                    }
                }else{$current_tag='';}
                // 无内容直接替换为空并跳过
                if (! $data) {
                    $content = str_replace($matches[0][$i], '', $content);
                    continue;
                }
                //默认限制总量100
                //如果限制总数量，且$data元素数量大于限制数量且随机为真
                if(count($data)>$num && $random=='1'){
                    $result_key=array_rand($data,$num);
                    $data = array_intersect_key($data, array_flip($result_key));
                }elseif (count($data)>$num && $random=='0'){
                    //如果限制总数量，且$data元素数量大于限制数量
                    $data=array_splice($data,0,$num);
                }

                // 匹配到内部标签
                if (preg_match_all($pattern2, $matches[2][$i], $matches2)) {
                    $count2 = count($matches2[0]); // 循环内的内容标签数量
                } else {
                    $count2 = 0;
                }
                //$count2 就是内部标签的数量 例如 text  sum
                $out_html = '';
                $key = 1;
                if($keywd !=""){
                    if (strpos($keywd, ',') !== false) {
                        error('判断某个分类下是不是存在某个tag的文章，不允许同时传入多个tag');
                    }
                    if($count2>1){ error('判断某个分类下是不是存在某个tag的文章，仅仅可以使用sum');}
                    if($scode==''){ error('使用matchtags时，当传入关键词时，分类标签$scode不能为空，必须指定一个分类id，且只能指定一个分类id');}
                    $one_html = $matches[2][$i];
                    $keysum = $tagsArrSum[$keywd]; // 计算特定tag的文章数量
                    $out_html = str_replace($matches2[0], $keysum, $one_html);
                }else{
                    foreach ($data as $value) { // 按条数循环
                        $one_html = $matches[2][$i];
                        for ($j = 0; $j < $count2; $j ++) { // 循环替换数据
                            $params = $this->parserParam($matches2[2][$j]);
                            switch ($matches2[1][$j]) {
                                case 'n':
                                    $one_html = str_replace($matches2[0][$j], $key - 1, $one_html);
                                    break;
                                case 'i':
                                    $one_html = str_replace($matches2[0][$j], $key, $one_html);
                                    break;
                                case 'text':
                                    $one_html = str_replace($matches2[0][$j], $value['tags'], $one_html);
                                    break;
                                case 'current':
                                    $one_html = str_replace($matches2[0][$j],$current_tag, $one_html);
                                    break;
                                case 'sum':
                                    $sum = $tagsArrSum[$value['tags']]; // @mk-tags_one_sum
                                    $one_html = str_replace($matches2[0][$j], $sum, $one_html);
                                    break;
                                case 'link':
                                    $url_rule_type = $this->config('url_rule_type') ?: 3;
                                    if ($target == 'tag') {
                                        if ($url_rule_type == 3) {
                                            $link = Url::home('tag=' . urlencode($value['tags']), false);
                                        } else {
                                            $link = Url::home('tag/' . urlencode($value['tags']), false);
                                        }
                                    } else {
                                        $link = $this->parserLink($value['sort']->type, $value['sort']->urlname, 'list', $value['sort']->scode, $value['sort']->filename, '', '');
                                        if ($url_rule_type == 3) {
                                            $link = $link . '&tag=' . urlencode($value['tags']);
                                        } else {
                                            $link = $link . '?tag=' . urlencode($value['tags']);
                                        }
                                    }
                                    $one_html = str_replace($matches2[0][$j], $link, $one_html);
                                    break;
                            }
                        }
                        $out_html .= $one_html;
                    }
                }
                $content = str_replace($matches[0][$i], $out_html, $content);
            }
        }
        return $content;
    }
    // 分割字段循环输出
    public function LoopSplitLabel($content)
    {
        $pattern = '/\{pboot:splitloop(\s+[^}]+)?\}([\s\S]*?)\{\/pboot:splitloop\}/';
        if (preg_match_all($pattern, $content, $matches)) {
            $count = count($matches[0]);
            for ($i = 0; $i < $count; $i ++) {
                // 获取调节参数
                $params = $this->parserParam($matches[1][$i]);
                $field='';
                $separator = ',';
                $limit = 5;
                $start = 0;

                if (! self::checkLabelLevel($params)) {
                    $content = str_replace($matches[0][$i], '', $content);
                    continue;
                }

                foreach ($params as $key => $value) {
                    switch ($key) {
                        case 'field':
                            $field = $value;
                            break;
                        case 'separator':
                            $separator = $value;
                            break;
                        case 'num':
                            $limit = $value;
                            break;
                        case 'start':
                            $start = $value;
                            break;
                    }
                }
                if($field){
                    $fields= explode("$separator", $field);
                    $fieldsnum=count($fields);
                    // if ($fieldsnum<2) {
                    //     error('splitloop标签在模板中指定的值不是多选字段或未指定分隔符！');
                    // }
                    if($fieldsnum<$start){
                        error('splitloop标签在模板中指定的start限制不能大于字段可循环数！');
                    }
					//如果指定了从第几个开始，则把之前的下标元素都删除
                    if($start>0){
                        for ($kk=0;$kk<$start;$kk++){
                            unset($fields[$kk]);
                        }
                    }
					//限制输出条数，默认输出5条，传入数据可以覆盖5条的限制
					if(($fieldsnum-$start)>$limit){
						for ($kl=$fieldsnum-1;$kl>=($start+$limit);$kl--){
						    unset($fields[$kl]);
						}
					}
                    $out_html = '';
                    foreach ($fields as $k => $v){
                        $one_html = str_replace('[splitloop:n]', $k-$start, $matches[2][$i]);
                        $one_html = str_replace('[splitloop:i]', $k-$start+1, $one_html);
                        $one_html = str_replace('[splitloop:text]', $v, $one_html);
                        $out_html .= $one_html;
                    }
                }

                $content = str_replace($matches[0][$i], $out_html, $content);
            }
        }
        return $content;
    }
    //文章关键词替换  长链优先 兼顾短链
    public function ShortKeyWord($shortkeywords,$content)
    {
        // 将A链接保护起来,alt、titel保护起来
        $rega = "/(<a .*?>.*?<\/a>)|(alt=.*?>)|(title=.*?>)/i";
        preg_match_all($rega, $content, $matches1);
        foreach ($matches1[0] as $key => $value) {
            $content = str_replace($value, '#rega:' . $key . '#', $content);
        }
        // 执行内链替换
        foreach ($shortkeywords as $value) {
            $content = preg_replace('/' . $value->name . '/', '<a href="' . $value->link . '">' . $value->name . '</a>', $content, 1);
        }

        // 还原保护的内容
        $pattern = '/\#rega:([0-9]+)\#/';
        if (preg_match_all($pattern, $content, $matches2)) {
            $count = count($matches2[0]);
            for ($i = 0; $i < $count; $i ++) {
                $content = str_replace($matches2[0][$i], $matches1[0][$matches2[1][$i]], $content);
            }
        }
        return $content;
    }
    //输出今天的日期
    public function tmtoday($content)
    {
        $pattern = '/\{pboot:tmtoday(\s+[^}]+)?\}/';
        if (preg_match_all($pattern, $content, $matches)) {
            $count = count($matches[0]);
            for ($i = 0; $i < $count; $i ++) {
                $params = $this->parserParam($matches[1][$i]);
                $string = '';
                foreach ($params as $key => $value) {
                    switch ($key) {
                        case 'style':
                            $string = $value;
                            break;
                    }
                }
                if (! $string) { // 无内容不解析
                    $string="Y-m-d H:i:s";
                }
                $content = str_replace($matches[0][$i], date($string,time()), $content);
            }
        }
        return $content;
    }
}