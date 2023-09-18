<?php namespace app\admin\controller\system;

use core\basic\Controller;
use core\basic\Config;

class SysfileController extends Controller
{
    //编辑管理 robots 文件内容
    public function robots()
    {
        $robotfile=ROOT_PATH.'/robots.txt';
        if ($_POST) {
             $robot_content=post('robots');
             if(check_file($robotfile))
             {
                 create_file( $robotfile,$robot_content,true);
             }
            success('robots编辑内容保存成功！', url('/admin/Robots/index'));
        }

        if(check_file($robotfile,true,'User-agent: *')){
            $robotdata = file_get_contents($robotfile);
        }
        $robottime=filemtime($robotfile)?date("Y-m-d H:i:s",filemtime($robotfile)):'未能获取到修改时间';

        $this->assign('robottime',$robottime);
        $this->assign('robotcontent',$robotdata);
        $this->display('system/robots.html');
    }

    /*自助生成文件列表*/
    public function index(){
        $listcontent=self::record();
        $listtitle=$listcontent[0]; unset($listcontent[0]);

        //如果填写了主域名，则输出主域名路径，否则输出当前登录域名路径
        if($this->config('main_domain')!=''){
           $this->assign('homeurl',is_https()?'https':'http:'.'//'. $this->config('main_domain'));
        }else{
           $this->assign('homeurl', get_http_url());
        }
        $this->assign('list', true);
        $this->assign('filepath', self::getfilepath());
        $this->assign('group', self::getgroup($listcontent));

        $this->assign('title',$listtitle);
        $this->assign('list_record',$listcontent);
        $this->display('system/readwrite.html');

    }
    //生成新的文件
    public function createfile(){
        $filecontent = post('filecontent'); //文件内容
        $filename    = post('filename');    //文件名称
        $filetype    = post('filetype');    //文件类型
        $group       = post('group');       //文件分组
        $filepath    = post('filepath');    //文件路径
        $remark      = post('remark');      //文件说明
        $is_del      = post('is_del');      //文件属性
        if($filepath=='/根目录'){$filepath='';}
        //拼接要写入记录的内容
        $record=['id'=>'编号','group'=>$group,'path'=>$filepath.'/'.$filename.'.'.$filetype,'desc'=>$remark,'update'=>date('Y-m-d H:m:s',time()),'is_del'=>$is_del];

        //拼接文件路径
        $newfile=ROOT_PATH.$filepath.'/'.$filename.'.'.$filetype;
        if(check_file($newfile,true,$filecontent)){
            if(self::record($record)){
                success('新增成功！', url('/admin/Sysfile/index'));
            }
        }else{alert_back('文件新增保存失败！');}

    }
    //删除文件
    public function del(){
        $recordid = get('id');
        $listcontent=self::record();
        $content=$listcontent[$recordid];
        if(!is_array($content)){alert_back('该记录文件不存在！');}
        if($content['is_del']=='y' && path_delete(ROOT_PATH.$content['path']))
        {
            unset($listcontent[$recordid]);
            if(self::record($listcontent,'del')){
                success('删除成功！', url('/admin/Sysfile/index'));
            }
        }
    }

    //输出去重后的分组信息
    private function getgroup($data){
        return array_unique(array_column($data,'group'));
    }

    //获取可以存放的位置
    private function getfilepath()
    {
        //文件仅允许存放在根目录及特定文件夹下，且目录层级不超过2层
        $listdata=[];$blacklist=['/config','/core','/data','/templatle','/tomatocms','/LICENSE'];
        $filepathlist=scandir(ROOT_PATH);

        foreach ($filepathlist as $list)
        {
            if(strstr($list,'.')==false)
            {
                $listdata[]='/'.$list;
            }
        }
        array_push($listdata,"/根目录");

        return array_diff($listdata,$blacklist);
    }
    //读写配置文件
    private function record($data='',$option='add')
    {
         $records_path=CONF_PATH.'/crate_file_records.php';
        if(!is_array($data) && $option=='add')
        {
            $list_content=[];$file_config=[];
            if(check_file($records_path,true, self::arr_to_str())){
                $file_config= require $records_path;
            }
            if(is_array($file_config)){
                return mult_array_merge($list_content,require $records_path);
            }else{
                alert_back('自定义新增文件配置读取失败！');
            }

        }elseif (is_array($data) && $option=='add')
        {
            $file_config= require $records_path;
            if(count($file_config)==1){
                $data['id']=1;
            }else{
                $data['id']=end($file_config)['id']+1;
            }
            array_push($file_config,$data);
            if(create_file($records_path,self::arr_to_str($file_config),true)){
                return true;
            }else{
                alert_back('文件记录新增失败！');
            }
        }elseif (is_array($data) && $option=='del'){
            if(create_file($records_path,self::arr_to_str($data),true)){
                return true;
            }else{
                alert_back('文件记录清理失败！');
            }
        }
    }

    /**
     * 将数组转换成文本
     * @param null $arr
     * @return string
     */
    private function arr_to_str($arr='')
    {
        $content_head='<?php' . PHP_EOL . '  return array('.PHP_EOL.PHP_EOL;
        $content='';
        $content_end=PHP_EOL.'  );';
        if($arr==''){
            $record[0]=['id'=>'编号','group'=>'分组','path'=>'路径地址','desc'=>'描述','update'=>'修改时间','is_del'=>'删除'];
        }else{
            $record=$arr;
        }
        foreach ($record as $k=>$item)
        {
            $content.= "    '$k'=>array(".PHP_EOL;
            foreach ($item as $key=>$value)
            {
                $content.="      '$key'=>'$value',".PHP_EOL;
            }
            $content.= "    ),".PHP_EOL.PHP_EOL;
        }
        return $content_head.$content.$content_end;
    }

}