package com.ccis.fog;

import java.util.Calendar;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jcraft.jsch.JSchException;
import org.apache.commons.io.IOUtils;
import org.apache.commons.math3.stat.descriptive.summary.Product;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.junit.Test;
import org.junit.runners.Parameterized;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.tools.IpUtil;
import javax.xml.transform.*;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;


import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;


import javax.annotation.Resource;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

@Controller
@RequestMapping("/")
public class IndexController {
    @Autowired
    private IndexService indexService;
    @Autowired
    EmailService emailService;



    private static String verCode_email = "";
    @ResponseBody
    @RequestMapping("/email")
    public String sendEmail(@RequestParam("emailAddress") String emailAddress) {
        System.out.println(emailAddress);
        try {
            verCode_email = VerCodeGenerateUtil.generateVerCode();
            emailService.sendEmailVerCode(emailAddress,verCode_email);
            return verCode_email;
        } catch (Exception e) {
            System.out.println(e.toString());
            return "邮件发送失败";
        }
    }

    @ResponseBody
    @RequestMapping("/register_email")
    public String registerEmailCheck(@RequestParam("emailAddress") String emailAddress) {
        System.out.println(emailAddress);
        System.out.println("ssss");
        int flag = indexService.registerEmailCheck(emailAddress);
        if(flag == 0){
            try {
                verCode_email = VerCodeGenerateUtil.generateVerCode();
                emailService.sendEmailVerCode(emailAddress,verCode_email);
                return verCode_email;
            } catch (Exception e) {
                System.out.println(e.toString());
                return "error";
            }
//            return "success";
        }else{
            return "failed";
        }

    }
    //忘记密码校验
    @ResponseBody
    @RequestMapping("/forgotPsw_email")
    public String forgotPswCheck(@RequestParam("emailAddress") String emailAddress) {
        System.out.println(emailAddress);
//        System.out.println("ssss");
        int flag = indexService.registerEmailCheck(emailAddress);
        if(flag != 0){
            try {
                verCode_email = VerCodeGenerateUtil.generateVerCode();
                emailService.sendEmailVerCode(emailAddress,verCode_email);
                return verCode_email;
            } catch (Exception e) {
                System.out.println(e.toString());
                return "邮件发送失败";
            }
//            return "success";
        }else{
            return "none";
        }

    }
//    登录界面
    @RequestMapping("/To_login")
    public  String login(){
        return "userlogin";
    }

    //    加载用户注册界面
    //    @ResponseBody
    @RequestMapping(value = "To_register")
    public String toRegister(){
        return "register";
    }
//    登录校验
    @ResponseBody
    @RequestMapping(value = "login_check")
    public String loginCheck(@RequestBody User user){
//        System.out.println("logincheck");
//        System.out.print("login_check"+user);
        int flag = 0;
        flag = indexService.loginCheck(user);

        if(flag == 2){
            return "success";
        }
        else if(flag == 1){
            return "errorPsw";
        }
        else{
            return "failed";
        }
    }


//    用户注册
    @ResponseBody
    @RequestMapping(value = "register")
    public String register(@RequestBody User user){
//        System.out.println("register:"+user);

        String flag = "";
        flag = indexService.register(user);

        return flag;
    }

//    开发人员按钮
    @RequestMapping("systemInfo")
    public String developerInfo(Model model){

//        return "developerInformation";
        return "systemInfo";
    }


    private String email = "";
    private String visitIp = "";
    private String visitAddress = "";
    private String visitDate = "";






//    主页面初始化-->重定向到FogWorkflowSim
    @RequestMapping(value = "")
    public String index(HttpServletRequest request){
        email = "";
        visitDate = "";
        visitAddress = "";
        visitIp = "";

//        return "redirect:/FogWorkflowReal";
        return "redirect:/EdgeWorkflowReal";
    }
//    @ResponseBody
    @RequestMapping(value = "login_success")
    public String login_success(RedirectAttributes model, @RequestParam("email") String emailAddress, @RequestParam("visitip") String visitip, @RequestParam("visitaddress") String visitaddress, @RequestParam("visitdate") String visitdate) {
        /*String typeJson = indexService.initTypeList();
        model.addAttribute("typeJson", typeJson);
        return "index";*/
        /*System.out.println("email:" + email);
        System.out.println("visitip:" + visitip);
        System.out.println("visitaddress:" + visitaddress);
        System.out.println("visitdate:" + visitdate);*/

        email = emailAddress;
        model.addFlashAttribute("emailAddress",emailAddress);
        System.out.println(emailAddress);

        VisitCount visitcount = new VisitCount();
        visitcount.setEmail(email);
        visitcount.setVisitAddress(visitaddress);
        visitcount.setVisitDate(visitdate);
        visitcount.setVisitIp(visitip);
//        System.out.println("visitcount"+visitcount);
//        String result = indexService.updateCount(visitcount);
//        return "redirect:/FogWorkflowReal";
        return "redirect:/EdgeWorkflowReal";

    }



//    实际上的初始化界面
    @RequestMapping("EdgeWorkflowReal")
    public String fogWorkflowReal(Model model,HttpServletRequest request){
        /*System.out.println(userName);
        User user = indexService.getUser(userName);
        String userJson = JSONObject.toJSONString(user);

        String typeJson = indexService.initTypeList();
        model.addAttribute("typeJson", typeJson);
        model.addAttribute("userJson",userJson);*/
        VisitCount visitcount = new VisitCount();
        visitcount.setEmail(email);
        visitcount.setVisitAddress(visitAddress);
        visitcount.setVisitDate(visitDate);
        visitcount.setVisitIp(visitIp);
//        记录用户访问次数
//        String result = indexService.updateCount(visitcount);
        String ipAddress = IpUtil.getIpAddr(request);

        //获取系统当前时间
        Date date = new Date();

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currentTime = formatter.format(date);
        System.out.println(formatter.format(date));
        System.out.println(ipAddress);
        String result = indexService.updateCount(ipAddress,currentTime);

        return "index";
    }

//    获取algorithms的参数
    @ResponseBody
    @RequestMapping("getAlgorithms")
    public String getAlgorithms() {
        String typeJson = indexService.initTypeList();
        return typeJson;
    }

    //    获取登录用户的完整信息
    @ResponseBody
    @RequestMapping(value = "getUser")
    public String getUser(@RequestParam String email){
        System.out.println(email);
        String userJson = "";
        if(email != ""){
            User user = indexService.getUser(email);
            userJson = JSONObject.toJSONString(user);
        }
        return userJson;
    }

//    统计网站的访问信息
    @RequestMapping(value = "getVisitCount")
    @ResponseBody
    public Object getVisitCount(HttpServletRequest request){
        JSONObject json = new JSONObject();
        json = indexService.getVisitCount();
        return json;
    }


    private String al_type = "";

//    algorithmsSetting页面
    @RequestMapping("alg/{al_type}")
    public String algorithmsSetting(Model model, @PathVariable("al_type") String alType) {
//        model.addAttribute("al_type", alType);
        al_type = alType;
        return "algorithmsSetting";
    }

//    查询所有系统历史版本
    @RequestMapping(value = "getVersions")
    @ResponseBody
    public String getVersions(){
        String sysVersions = indexService.getVersions();
        return sysVersions;
    }

    //查看系统当前版本号
    @ResponseBody
    @RequestMapping(value = "getCurrentVersion")
    public String getCurrentVersion(){
        String currentVersion = indexService.getCurrentVersion();
        return currentVersion;
    }

    //开发人员信息
    @ResponseBody
    @RequestMapping(value = "getDevelopers")
    public String getDevelopers(){
        String developers = indexService.getDevelopers();
        return developers;
    }

    @ResponseBody
    @RequestMapping("getAlType")
    public String getAlType() {
//        System.out.print(json);
//        String typeJson = indexService.initTypeList();
        return al_type;
    }

    @RequestMapping("fog")
    public String fogSetting(Model model) {
//        model.addAttribute("cloud_number", IndexService.cloudNumber);
//        model.addAttribute("fog_number", IndexService.fogNumber);
//        model.addAttribute("mobile_number", IndexService.mobileNumber);
        return "fogSetting";
    }

    @RequestMapping("fogImport")
    public String fogImport() {
        return "fogImport";
    }

    @RequestMapping("lineChart")
    public String lineChart() {
        return "lineChart";
    }

    @RequestMapping("barChart")
    public String barChart() {
        return "barChart";
    }

//    @RequestMapping("alExport")
//    public void alExport(@RequestParam(required = false, value = "xml") String xml, HttpServletResponse response) throws IOException {
//        response.setContentType("application/force-download");
//        // 设置下载后的文件名以及header
//        response.addHeader("Content-disposition", "attachment;fileName=" + "ga.xml");
//        // 创建输出对象
//        OutputStream os = response.getOutputStream();
//        // 常规操作
//        os.write(xml.getBytes());
//    }

    @ResponseBody
    @RequestMapping("customFile")
    public String customFile(@RequestParam("file") MultipartFile file){
        return indexService.upload(file);
    }

    @ResponseBody
    @RequestMapping("transformFile")
    public String  transformFile(@RequestParam("file") MultipartFile file,HttpServletResponse response) throws IOException {
         domparse xml=new domparse();
         String  getfile=indexService.uploadgetloaction(file);
         System.out.println("上传路径为： "+getfile);
       //*String getfile="B:/Abiye/ActivitiExplorer/src/main/resources/transform/Epigenomics_24 _activiti.xml";*//*
        xml.getDocument(getfile);//加载需要导入的xml文件，并进行解析
        xml.intitialdata();//节点信息初始化
        xml.deleteNode();//删除根节点信息进行重构，节点坐标信息仍然保留
        xml.creatNode();//创建xml任务节点
        xml.createdge();//创建xml边
        xml.edgedependency();//创建边依赖
        xml.deleteionode();//删除头尾无用依赖节点
        xml.saveXml();
        System.out.println("执行完成！");
        return xml.finalName;

        
        //return xml.back();


    }

    public static byte[] toByteArrFromFile(String path) throws Exception{
        File inFile = new File(path);
        FileInputStream fileInputStream = new FileInputStream(inFile);
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        int i;
        //转化为字节数组流
        while ((i = fileInputStream.read()) != -1) {
            byteArrayOutputStream.write(i);
        }
        fileInputStream.close();
        // 把文件存在一个字节数组中
        byte[] bytes = byteArrayOutputStream.toByteArray();
        byteArrayOutputStream.close();
        return bytes;
    }
    @ResponseBody
    @RequestMapping("getfinalXML")
    public void getfinalXML(HttpServletRequest request, HttpServletResponse response) throws Exception {
        /*String fileName = request.getParameter("filename");
        byte[] exportBytes = new byte[];
        ByteArrayInputStream in = new ByteArrayInputStream(exportBytes);
        IOUtils.copy(in, response.getOutputStream());
        response.setHeader("Content-Disposition", "attachment; filename=" + fileName);

        response.flushBuffer();*/

        ////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////
        String fileName = request.getParameter("filename");
        System.out.print(fileName);
//        File file = new File("E:", fileName);
        File file = new File("/root/sim/dax/",fileName);
//        response.setContentType("application/octet-stream");
//        response.setHeader("Content-Disposition","attachment;filename=" + fileName);
//        response.setContentLength((int) file.length());
        response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
        FileInputStream fis = null;
        try {
            fis = new FileInputStream(file);
            byte[] buffer = new byte[128];
            int count = 0;
            domparse xml=new domparse();
//            String xmlName = xml.finalName;
//            fileName = new String(xmlName.getBytes(),"ISO-8859-1");
//            response.setHeader("Content-Disposition", "attachment; filename=" + xmlName);
            response.setContentType("bin;charset=iso8859_1");
            while ((count = fis.read(buffer)) > 0) {


                response.getOutputStream().write(buffer, 0, count);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            response.getOutputStream().flush();
            response.getOutputStream().close();
            fis.close();
        }
        //return xml.back();


    }


    @ResponseBody
    @RequestMapping("export")
    public void export(HttpServletResponse response) throws IOException {
//        int count = IndexService.outputMap.size();
//        if(count == 1){
//            Date date = new Date();
//            String d = new SimpleDateFormat("yyyyMMddHHmmss").format(date);
//            try {
//                exportTable(table, null, selectdisplay.getSelectedItem().toString()+"-result-"+d);//结果导出Excel表格
//            } catch (IOException e1) {
//                e1.printStackTrace();
//            }
//        } else {
//            String path = null;
//            for(int i = 0; i < count; i++){
//                selectdisplay.setSelectedIndex(i);
//                Date date = new Date();
//                String d = new SimpleDateFormat("yyyyMMddHHmmss").format(date);
//                if(i == 0)
//                    path = d;
//                try {
//                    exportTable(table, path, selectdisplay.getSelectedItem().toString()+"-result-"+d);//结果导出Excel表格
//                } catch (IOException e1) {
//                    e1.printStackTrace();
//                }
//            }
//            try {
//                Runtime.getRuntime().exec("rundll32 SHELL32.DLL,ShellExec_RunDLL "+ "Explorer.exe /select,"
//                        +new File("results").getAbsolutePath()+"\\"+path);
//            } catch (IOException e1) {
//                e1.printStackTrace();
//            }
//        }

//        response.setContentType("application/force-download");
//        // 设置下载后的文件名以及header
//        response.addHeader("Content-disposition", "attachment;fileName=" + "ga.xml");
//        // 创建输出对象
//        OutputStream os = response.getOutputStream();
//        // 常规操作
//        os.write(xml.getBytes());
    }

    @ResponseBody
    @RequestMapping("alImport")
    public String alImport(@RequestParam("file") MultipartFile file) throws IOException {
        JSONObject jsonObject = new JSONObject();
        // 获取原始名字
        String fileName = file.getOriginalFilename();
        // 获取后缀名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        if (!suffixName.equals(".xml")) {
            jsonObject.put("result", "Please choose xml file.");
            return jsonObject.toJSONString();
        }

        SAXReader reader = new SAXReader();
        InputStream in = null;
        try {
            in = file.getInputStream();
            Document doc = reader.read(in);
            Element root = doc.getRootElement();
            String name = root.getName();
            if (name.equals("GA")) {
                JSONObject ga_json = new JSONObject();
                if (root.element("Population_Size") != null && !root.element("Population_Size").getText().equals("null") && !root.element("Population_Size").getText().isEmpty())
                    ga_json.put("GA-popsize",Double.parseDouble(root.element("Population_Size").getText()));
                if (root.element("Number_of_Iterations") != null && !root.element("Number_of_Iterations").getText().equals("null") && !root.element("Number_of_Iterations").getText().isEmpty())
                    ga_json.put("GA-gmax",Double.parseDouble(root.element("Number_of_Iterations").getText()));
                if (root.element("Cross_Rate") != null && !root.element("Cross_Rate").getText().equals("null") && !root.element("Cross_Rate").getText().isEmpty())
                    ga_json.put("GA-crossoverProb", Double.parseDouble(root.element("Cross_Rate").getText()));
                if (root.element("Mutation_Rate") != null && !root.element("Mutation_Rate").getText().equals("null") && !root.element("Mutation_Rate").getText().isEmpty())
                    ga_json.put("GA-mutationRate", Double.parseDouble(root.element("Mutation_Rate").getText()));
                if (root.element("Repeated_experiment") != null && !root.element("Repeated_experiment").getText().equals("null") && !root.element("Repeated_experiment").getText().isEmpty())
                    ga_json.put("GA-repeat", Double.parseDouble(root.element("Repeated_experiment").getText()));
                jsonObject.put("GA", ga_json);
            } else if (name.equals("PSO")) {
                JSONObject pso_json = new JSONObject();
                if (root.element("Number_of_Particles") != null && !root.element("Number_of_Particles").getText().equals("null") && !root.element("Number_of_Particles").getText().isEmpty())
                    pso_json.put("PSO-particleNum",Double.parseDouble(root.element("Number_of_Particles").getText()));
                if (root.element("Number_of_Iterations") != null && !root.element("Number_of_Iterations").getText().equals("null") && !root.element("Number_of_Iterations").getText().isEmpty())
                    pso_json.put("PSO-iterateNum",Double.parseDouble(root.element("Number_of_Iterations").getText()));
                if (root.element("Learning_Factor_c1") != null && !root.element("Learning_Factor_c1").getText().equals("null") && !root.element("Learning_Factor_c1").getText().isEmpty())
                    pso_json.put("PSO-c1",Double.parseDouble(root.element("Learning_Factor_c1").getText()));
                if (root.element("Learning_Factor_c2") != null && !root.element("Learning_Factor_c2").getText().equals("null") && !root.element("Learning_Factor_c2").getText().isEmpty())
                    pso_json.put("PSO-c2",Double.parseDouble(root.element("Learning_Factor_c2").getText()));
                if (root.element("Inertia_Weight") != null && !root.element("Inertia_Weight").getText().equals("null") && !root.element("Inertia_Weight").getText().isEmpty())
                    pso_json.put("PSO-w",Double.parseDouble(root.element("Inertia_Weight").getText()));
                if (root.element("Repeated_experiment") != null && !root.element("Repeated_experiment").getText().equals("null") && !root.element("Repeated_experiment").getText().isEmpty())
                    pso_json.put("PSO-repeat",Double.parseDouble(root.element("Repeated_experiment").getText()));
                jsonObject.put("PSO", pso_json);
            }
        } catch (FileNotFoundException | DocumentException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            in.close();
        }
        return jsonObject.toJSONString();
    }

//    @ResponseBody
//    @RequestMapping(value = "uploadFile")
//    public String uploadFile(@RequestParam("file") MultipartFile file) {
//        if (!file.isEmpty()) {
//
//        }
//        return null;
//    }

//    @ResponseBody
//    @RequestMapping(value = "changeNumbers")
//    public String changeNumbers(@RequestParam("json") String json) {
//        indexService.initFogSetting(json);
//        return null;
//    }

    @ResponseBody
    @RequestMapping(value = "simulation")
    public String simulation(@RequestParam("json") String json) {
        JSONObject jsonObject = JSON.parseObject(json);
        JSONObject retJson = indexService.doSim(jsonObject);
//        return JSON.toJSONString(IndexService.outputMap);
        return retJson.toJSONString();
    }

    @ResponseBody
    @RequestMapping(value = "compare")
    public String compare(@RequestParam("json") String json) {
        JSONObject jsonObject = JSON.parseObject(json);
        JSONObject retJson = indexService.doSim(jsonObject);
//        return JSON.toJSONString(IndexService.outputMap);
        return retJson.toJSONString();
    }

    @RequestMapping("drawWorkflow")
    public String drawWorkflow(Model model) {
        return "drawWorkflow";
    }

    String nodeType = "";
    @RequestMapping(value = "node_edit")
    public String nodeInfo(@RequestParam("nodetype") String nodetype){
        nodeType = nodetype;
        return "DrawWorkflow/nodeInfo";
    }

    @RequestMapping(value = "getnodeType")
    @ResponseBody
    public String getnodeType(){
        return nodeType;
    }

    @RequestMapping(value = "recommendations")
    public String recommendations(){
        return "recommendations";
    }

    //提交建议
    @ResponseBody
    @RequestMapping(value = "submitAdvices")
    public String submitAdvices(@RequestBody Advices advices){
        System.out.println(advices);
        String result = indexService.updateAdvices(advices);
        return result;
    }

    //查询建议
    @RequestMapping(value = "allRecommendations")
    public String allRecommendations(){

        return "allRecommendations";
    }

    //查询所有建议
    @ResponseBody
    @RequestMapping(value = "getRecommendations")
    public String getRecommendations(){
        String advices = indexService.getRecommendations();
        return advices;
    }


    @RequestMapping(value = "forgotPsw")
    public String forgotPsw(){
        return "forgotPsw";
    }

    //找回密码
    @ResponseBody
    @RequestMapping(value = "resetPsw")
    public String resetPsw(@RequestParam("emailAddress") String emailAddress , @RequestParam("password") String password){
        String result = indexService.resetPsw(emailAddress , password);
        return result;
    }

    //跳转到自定义工作流文件列表页面
    @RequestMapping("selectCustomFile")
    public String selectCustomFile(Model model) {

        return "customFileChose";
    }


    @ResponseBody
    @RequestMapping(value = "getxmlfile")
    public String getXmlFile(@RequestBody User user){

       /* String path = "E:\\activitiXML";
//        String path = "/root/sim/dagXML/";
        File file = new File(path);
        File[] files = file.listFiles();
        JSONArray xmlName = new JSONArray();
        JSONArray xmlTime = new JSONArray();
        JSONArray xmlDetail = new JSONArray();
        for (File img:files) {
            Calendar cal = Calendar.getInstance();
            long time = file.lastModified();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            cal.setTimeInMillis(time);
            System.out.println("修改时间 " + formatter.format(cal.getTime()));
            xmlName.add(img.getName());
            xmlTime.add(formatter.format(cal.getTime()));
        }
        xmlDetail.add(xmlName);
        xmlDetail.add(xmlTime);
        System.out.print(xmlDetail);
        return xmlDetail.toJSONString();*/

//        System.out.println(user);
        String result = indexService.getXmlFile(user);
       return result;
    }
    //跳转到示例工作流文件列表页面
    @RequestMapping("selectExampleFile")
    public String exampleFileChose() {
        return "exampleFileChose";
    }

    @Resource
    public JdbcTemplate jdbcTemplate;//fog项目后台代码
    @ResponseBody
    @RequestMapping( value = "/transmitUser")
    public void  transmitUSER(@RequestParam("email") String Email){
        System.out.println("transmitUser");
        System.out.println(Email);
        String id="test_1024";//更新current_use表,使得后fogdesign项目获得值
        String sql1 = "update current_user_tabler set email = ? where Identi = ?";
        int temp1 = jdbcTemplate.update(sql1, email,id);
        if(temp1 > 0) {
            System.out.println("current_use表中账户密码增加成功");
        }
        else
            System.out.println("current_use表中账户密码增加失败");
    }

    //在真实环境中执行单个任务
    @ResponseBody
    @RequestMapping(value = "realOperate")
    public String realOperate(@RequestBody OutputEntity outputEntity) throws IOException, JSchException {

        String real_result = indexService.realOperate(outputEntity);

        System.out.println(real_result);
        return real_result;
    }

    //获取真实环境中执行的总时间，能耗，成本
    @ResponseBody
    @RequestMapping(value = "getRealTotal")
    public String getRealTotal(@RequestBody JSONObject outputJson){

        String real_result = indexService.getRealTotal(outputJson);

//        System.out.println(real_result);
        return real_result;
    }


    //版本信息
    @RequestMapping("versionInfo")
    public String versionInfo(){

        return "systemVersions";
    }

    //开发人员信息
    @RequestMapping("developersInfo")
    public String developersInfo(){

        return "developerInformation";
    }

    //帮助文档
    @RequestMapping("documentsInfo")
    public String documentsInfo(){

        return "documentInfo";
    }

    //更新用户的plan
    @ResponseBody
    @RequestMapping(value = "updatePlan")
    public String updatePlan(@RequestParam("json") String plan){

        JSONObject planJson = JSON.parseObject(plan);
        String result = indexService.updatePlan(planJson);

//        System.out.println(real_result);
        return result;
    }

    //删除用户的plan
    @ResponseBody
    @RequestMapping(value = "delPlan")
    public String delPlan(@RequestParam("json") String plan){

        JSONObject planJson = JSON.parseObject(plan);
        String result = indexService.delPlan(planJson);

        return result;
    }
    //获取用户所有的plan
    @ResponseBody
    @RequestMapping(value = "getPlans")
    public String getPlans(@RequestParam("email") String email){

        String result = indexService.getPlans(email);

        return result;
    }

    //设置参数弹窗
    @RequestMapping("setMEC")
    public String setMEC(){

        return "setStep";
    }

    //获得Dag图片
    @ResponseBody
    @RequestMapping(value = "getDag")
    public String getDag(@RequestParam("dagXml") String dagXml , @RequestParam("customXml") String customXml){


        String result = indexService.getDag(dagXml, customXml);

        return result;
    }

    //展示Dag图
    @RequestMapping("showDag")
    public String showDag(){

        return "DagStructure";
    }
}

