<?php namespace app\home\controller;

use core\basic\Db;
use core\basic\Controller;
use app\admin\model\content\LinkModel;
use app\admin\model\content\ContentModel;
use app\admin\model\content\ContentSortModel;


class ImportController extends Controller
{
    private $ContentModel;
    private $SortModel;

    public function __construct()
    {
        $password=$this->config('collect_password');
        if(!$_POST)exit(_404('您访问的页面不存在，请检查网址是否错误！'));
        if($password!=$_POST['pswd'] || $password=='') exit("入库密码错误，请到后台->全局配置->配置参数->WebApi 中修改");

        $this->SortModel=new ContentSortModel();
        $this->ContentModel=new ContentModel();
        // $this->log('采集用户登入成功!');
    }
    public function index()
    {
        //采用中转方式简化操作
        //http://doamin/index.php/Import/index?type=link
        // type 是操作类型 link 是友情链接 category 是分类 content 是文章内容

        $action=$_GET['type'];$is_escape=$_GET['escape']==null?0:1;
        switch ($action)
        {
            case link:
                self::linksadd();
                break;
            case category:
                self::CategoryImport();
                break;
            default:
                self::ContentImport();
        }
    }
    /*导入友情链接*/
    public function linksadd(){

        $gid = post('gid', 'int');
        $name = post('name');
        $link = post('link');
        $logo = post('logo');
        $sorting = post('sorting');
        $LinkModel=new LinkModel();
        if (! $gid) {$gid = $LinkModel->getMaxGid() + 1;}

        if (! $name) {json(0,'名称不能为空！');}

        if (! $link) {json(0,'链接不能为空！'); }

        if (! $sorting) {$sorting = 255;}

        // logo图缩放
        if ($logo) {
            resize_img(ROOT_PATH . $logo, '', $this->config('ico.max_width'), $this->config('ico.max_height'));
        }

        // 构建数据
        $data = array(
            'acode' => 'cn',
            'gid' => $gid,
            'name' => $name,
            'link' => $link,
            'logo' => $logo,
            'sorting' => $sorting,
            'create_user' => 'import',
            'update_user' => 'import'
        );

        // 执行添加
        if ($LinkModel->addLink($data)) {
            json(1, '新增友情链接成功！');
        } else {
            json(0, '新增友情链接失败！');
        }

    }

    //分类导入
    public function CategoryImport(){

        $scode = post('scode');
        $pcode = post('pcode', 'var');
        $name = post('name');
        $mcode = post('mcode');
        $listtpl = basename(post('listtpl'));
        $contenttpl = basename(post('contenttpl'));
        $status = post('status');
        $subname = post('subname');
        $filename = trim(post('filename'), '/');
        $outlink = post('outlink');
        $ico = post('ico');
        $pic = post('pic');
        $title = post('title');
        $keywords = post('keywords');
        $description = post('description');
        $sorting = post('sorting');
        $acode = post('acode') ?: 'cn';
        $gid = post('gid', 'int') ?: 0;
        $gtype = post('gtype', 'int') ?: 4;
        $gnote = post('gnote');

        $def1 = post('def1');
        $def2 = post('def2');
        $def3 = post('def3');

        if (! $scode){echo json_encode(["id"=>0,'target'=>'','desc'=>'','error'=>'编码不能为空！','state'=>0]);die();}
        if (! $pcode){$pcode = 0;}// 父编码默认为0
        if (! $name) {echo json_encode(["id"=>0,'target'=>'','desc'=>'','error'=>'栏目名不能为空！','state'=>0]); die();}
        if (! $mcode){echo json_encode(["id"=>0,'target'=>'','desc'=>'','error'=>'栏目模型必须选择！','state'=>0]); die();}
        if ($filename && ! preg_match('/^[a-zA-Z0-9\-\/]+$/', $filename)) {
            echo json_encode(["id"=>0,'target'=>'','desc'=>'','error'=>'URL名称只允许字母、数字、横线、斜线组成!当前url为：'.$filename,'state'=>0]);die();
        }
        if ($filename && $this->SortModel->checkUrlname($filename)) {
            echo json_encode(["id"=>0,'target'=>'','desc'=>'','error'=>'URL名称与模型URL名称冲突，请换一个名称！当前url为：'.$filename,'state'=>0]);die();
        }
        // 缩放缩略图
        if ($ico) {resize_img(ROOT_PATH . $ico, '', $this->config('ico.max_width'), $this->config('ico.max_height'));}
        // 检查编码
        if ( $this->SortModel->checkSort("scode='$scode'"))
        {
            echo json_encode(['id'=>0,'target'=>'','desc'=>'','error'=>'该内容栏目编号已经存在，不能再使用！','state'=>0]);die();
        }

        // 检查自定义URL名称
        if ($filename) {
            while ($this->SortModel->checkFilename($filename)) {
                $filename = $filename . '_' . mt_rand(1, 20);
            }
        }

        // 构建数据
        $data = array(
            'acode' => $acode,
            'pcode' => $pcode,
            'scode' => $scode,
            'name' => $name,
            'mcode' => $mcode,
            'listtpl' => $listtpl,
            'contenttpl' => $contenttpl,
            'status' => $status,
            'gid' => $gid,
            'gtype' => $gtype,
            'gnote' => $gnote,
            'subname' => $subname,
            'def1' => $def1,
            'def2' => $def2,
            'def3' => $def3,
            'filename' => $filename,
            'outlink' => $outlink,
            'ico' => $ico,
            'pic' => $pic,
            'title' => $title,
            'keywords' => $keywords,
            'description' => $description,
            'sorting' => $sorting,
            'create_user' => 'admin',
            'update_user' => 'admin'
        );

        // 执行添加
        if ($this->SortModel->addSort($data)) {
            //单页类栏目自动生成文章内容，功能取消
            $this->log('新增数据内容栏目' . $scode . '成功！');
            echo json_encode(['id'=>$scode,'target'=>'','desc'=>'栏目新增成功！','error'=>'']);
        } else {
            $this->log('新增数据内容栏目' . $scode . '失败！');
            echo json_encode(['id'=>0,'target'=>'','desc'=>'','error'=>'新增失败！','state'=>0]);
        }

    }
    // 文章导入
    public function ContentImport()
    {
        unset($_POST['pswd']);

        if ($_POST) {
            // 获取数据
            $scode =post('scode');
            $subscode = post('subscode');
            $title = post('title');
            $titlecolor = post('titlecolor');
            $subtitle = post('subtitle');
            $filename = trim(post('filename'), '/');
            $author = post('author');
            $source = post('source');
            $outlink = post('outlink');
            $date = date('Y-m-d H:i:s',post('date'));
            $ico = post('ico');
            $pics = post('pics');


            // 获取多图标题
            $picstitle = post('picstitle');
            if ($picstitle) {
                $picstitle = implode(',', $picstitle);
            }
            $content=str_replace('$','/',str_replace('#','=',str_replace('_','+',post('content'))));
            $content = escape_string(base64_decode($content));
            $tags = str_replace('，', ',', post('tags'));
            $enclosure = post('enclosure');
            $keywords = str_replace('，', ',',post('keywords'));
            $description = post('description');
            $status = post('status', 'int');
            $istop = post('istop', 'int', '', '', 0);
            $isrecommend = post('isrecommend', 'int', '', '', 0);
            $isheadline = post('isheadline', 'int', '', '', 0);
            $sorting=post('sorting')?post('sorting'):255;
            $visits=post('visits')?post('visits'):0;

            $gid = post('gid', 'int') ?: 0;
            $gtype = post('gtype', 'int') ?: 4;
            $gnote = post('gnote');
            $acode= isset($acode)?$acode:"cn";
            $date = isset($date)?$date:date('Y-m-d H:i:s',time());
            $author = isset($author)?$author:"管理员";
            $source = isset($source)?$source:"本站";
            $status = isset($status)?$status:1;

            if (! $scode) {
                if(trim($_POST['catename']))
                {
                    $scode=self::getsort(trim($_POST['catename']),'scode')['scode'];
                }
                else
                {
                    echo json_encode(['id'=>0,'target'=>'','desc'=>'','error'=>'内容分类不能为空！','state'=>0]);die();
                }
            }
            if (! $title)
            {
                if(self::getsort($scode,'name')['type']==1){
                    $title=self::getsort($scode,'name')['name'];  //如果栏目类型为单页，且没有提交title字段，则将栏目名称当做文章标题
                }
                else{
                    echo json_encode(['id'=>0,'target'=>'','desc'=>'','error'=>'非单页类内容，标题不能为空！','state'=>0]);die();
                }
            }

            if ($filename && ! preg_match('/^[a-zA-Z0-9\-\/]+$/', $filename)) {
                alert_back('内容URL名称只允许字母、数字、横线组成!');
            }

            // 自动提起前一百个字符为描述
            if (! $description && isset($content)) {
                $description = escape_string(clear_html_blank(substr_both(strip_tags(base64_decode($content)), 0, 150)));
            }
            // 无缩略图时，自动提取文章第一张图为缩略图
            if (! $ico && preg_match('/<img\s+.*?src=\s?[\'|\"](.*?(\.gif|\.jpg|\.png|\.jpeg))[\'|\"].*?[\/]?>/i', decode_string($content), $srcs) && isset($srcs[1])) {
                $ico = $srcs[1];
            }
            // 缩放缩略图
            if ($ico) {
                resize_img(ROOT_PATH . $ico, '', $this->config('ico.max_width'), $this->config('ico.max_height'));
            }
            // 检查自定义URL名称
            if ($filename) {
                while ($this->model->checkFilename($filename)) {
                    $filename = $filename . '-' . mt_rand(1, 20);
                }
            }
            // 构建数据
            $data = array(
                'acode' => $acode,
                'scode' => $scode,
                'subscode' => $subscode,
                'title' => $title,
                'titlecolor' => $titlecolor,
                'subtitle' => $subtitle,
                'filename' => $filename,
                'author' => $author,
                'source' => $source,
                'outlink' => $outlink,
                'date' => $date,
                'ico' => $ico,
                'pics' => $pics,
                'content' => $content,
                'tags' => $tags,
                'enclosure' => $enclosure,
                'keywords' => $keywords,
                'description' => clear_html_blank($description),
                'sorting' => $sorting,
                'status' => $status,
                'istop' => $istop,
                'isrecommend' => $isrecommend,
                'isheadline' => $isheadline,
                'visits' => $visits,
                'likes' => 0,
                'oppose' => 0,
                'create_user' =>'import',
                'update_user' =>'import'
            );
            if(isset($_POST['id'])){$data['id']=post('id');} //如果不是单页就添加id的值

            // 执行添加
            if (! ! $id = $this->ContentModel->addContent($data)) {
                // 扩展内容添加
                foreach ($_POST as $key => $value) {
                    if (preg_match('/^ext_[\w\-]+$/', $key)) {
                        if (! isset($data2['contentid'])) {
                            $data2['contentid'] = $id;
                        }
                        $temp = post($key);
                        if (is_array($temp)) {
                            $data2[$key] = implode(',', $temp);
                        } else {
                            $data2[$key] = str_replace("\r\n", '<br>', $temp);
                        }
                    }
                }
                if (isset($data2)) {
                    if (! $this->ContentModel->addContentExt($data2)) {
                        $this->ContentModel->delContent($id);
                        echo json_encode(['id'=>0,'target'=>'','desc'=>'','error'=>'新增文章内容失败！','state'=>0]);die();
                    }
                }
                echo json_encode(['id'=>$id,'target'=>'_blank','desc'=>$title,'error'=>'']);
            } else {
                echo json_encode(['id'=>0,'target'=>'','desc'=>'','error'=>'新增文章内容失败！','state'=>0]);
            }
        } else {
            echo json_encode(['id'=>0,'target'=>'','desc'=>'','error'=>'提交数据不能为空哦！','state'=>0]);
        }
    }

    //获取栏目数据
    /**
     * 获取栏目数据
     * @param string $data  栏目名称或是栏目编号
     * @param string $select 返回内容(name 返回栏目名称，scode返回栏目编号)
     */
    private function getsort($data,$select='name')
    {
        session('acode','cn');//设置默认语言
        if($select=='name'){
            $where='s.scode='.$data;
        }else{
            $where='s.name="'.$data.'"';
        }

        $join = array(
            'ay_model m',
            's.mcode=m.mcode',
            'LEFT'
        );

        return (array)Db::table('ay_content_sort s')->field('s.scode,s.name,m.type')->where($where)->join($join)->find();
    }

}

