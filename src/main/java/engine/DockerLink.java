package engine;


import com.ccis.fog.IndexService;
import com.ccis.fog.OutputEntity;
import org.cloudbus.cloudsim.power.PowerHost;
import org.fog.entities.Controller;
import org.fog.entities.FogDevice;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.SpringBootApplication;


import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.*;

import org.apache.commons.io.IOUtils;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import org.springframework.stereotype.Component;
import org.workflowsim.WorkflowEngine;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jcraft.jsch.JSchException;

public class DockerLink {

    //本地运行
    private static String host = "192.168.81.131";
    private static int port = 22;
    private static String user = "root";
    private static String password = "root";
    private static double cpu_percent = 1.0;

    //fogworkflow 47.98.222.243
    /*private static String host = "47.98.222.243";
    private static int port = 22;
    private static String user = "root";
    private static String password = "ccis@2020";
    private static double cpu_percent = 1.0;*/

    //fogworkflowsim 47.74.84.61
    /*private static String host = "47.74.84.61";
    private static int port = 22;
    private static String user = "root";
    private static String password = "ccis@2019";
    private static double cpu_percent = 1.0;*/


    public static void main(String[] args) throws IOException, JSchException {
//		SpringApplication.run(DockerlinkApplication.class, args);

        //使用镜像名称
        String image = "pi";
        //任务量
//        String runtime_arr = "112,13460,18941,30383,13856,10800,32058,10544,10592,10528,10576,7264,767,10810,21398,21671,43840,134416,2400,395744,8192";


        String runtime_arr = "30336,13858,18993,18954,10800,10570,76864,32149,10590,10543,7264,784,21593,21398,10686,10894,44681,2405,130949,2899,112";
//        String runtime_arr = "19253,30176,13760,13872,18785,13670,13830,10480,10560,10672,10576,43504,10944,10520,10416,32161,21528,10656,10544,10560,10647,10659,32331,43856,10368,10530,10528,24928,2080,21580,10870,43936,10720,43888,21502,10740,235216,4224,482992,10240,112";
        String[] runtime_str = runtime_arr.split(",");

//        字符转int
        /*int[] runtime_int = new int[runtime_str.length];
        for (int i = 0; i < runtime_str.length; i++) {
            runtime_int[i] = Integer.parseInt(runtime_str[i]);
        }
        for(int i = 0; i < runtime_int.length; i++){
            System.out.println("第" + (i+1) + "个元素:");
            int item = runtime_int[i];
            String command = "cd workspaces\n" +
                    "./run.sh" + " " + cpu_percent + " " + image + " " + item;
            String res =exeCommand(host,port,user,password,command);
            System.out.println(res);
        }*/
        double sum_100[] = new double[100];
        for(int i = 0; i < 100; i++){
            String command = "cd workspace\n" +
                    "./run.sh" + " " + cpu_percent + " " + image + " " + runtime_arr;

            String res =exeCommand(host,port,user,password,command);
            String[] res_arr = res.split("\n");
            String realTime = res_arr[res_arr.length - 2];
            realTime = realTime.substring(0,realTime.length() - 1);
//            System.out.println("reaTime:" + realTime);
            String  result_arr[] = realTime.split(" ");
            double sum_temp = 0.0 ;
            for (String item : result_arr) {
                double temp = Double.valueOf(item);
                sum_temp += temp;
            }
            sum_100[i] = sum_temp;
            System.out.println(sum_100[i]);
        }

        System.out.println("方差:" + POP_Variance(sum_100));
        System.out.println("标准差:" + StandardDiviation(sum_100));
        /*String command = "cd workspace\n" +
                "./run.sh" + " " + cpu_percent + " " + image + " " + runtime_arr;

        String res =exeCommand(host,port,user,password,command);
        String[] res_arr = res.split("\n");
        String realTime = res_arr[res_arr.length - 2];
        realTime = realTime.substring(0,realTime.length() - 1);
        System.out.println("reaTime:" + realTime);
        String  result_arr[] = realTime.split(" ");
        double[] result_double = new double[result_arr.length];
        int index = 0 ;
        for (String item : result_arr) {
//            System.out.println(item);
            result_double[index] = Double.valueOf(item);
            index++;
        }*/


        /*double result_arr[] = new double[40];
        int index = 0;
        for (String item: runtime_str) {
            String command = "cd workspace\n" +
                    "./run.sh" + " " + cpu_percent + " " + image + " " + item;

            String res =exeCommand(host,port,user,password,command);

//            System.out.println(res);
            String[] res_arr = res.split("\n");
            *//*for (String item : res_arr) {
                System.out.println("item:");
                System.out.println(item);
            }*//*
            String realTime = res_arr[res_arr.length - 2];
            realTime = realTime.substring(0,realTime.length() - 1);
            System.out.println("reaTime:" + realTime);
            result_arr[index] = Double.parseDouble(realTime);
            index++;
        }*/
        /*String command = "cd workspace\n" +
                "./run.sh" + " " + cpu_percent + " " + image + " " + runtime_arr;

        long startTime = System.currentTimeMillis();

        String res =exeCommand(host,port,user,password,command);

        long endTime = System.currentTimeMillis();

        System.out.println("耗时: " + (endTime - startTime) + " ms");

        System.out.println(res);*/


    }
    //标准差σ=sqrt(s^2)
    public static double StandardDiviation(double[] x) {
        int m=x.length;
        double sum=0;
        for(int i=0;i<m;i++){//求和
            sum+=x[i];
        }
        double dAve=sum/m;//求平均值
        double dVar=0;
        for(int i=0;i<m;i++){//求方差
            dVar+=(x[i]-dAve)*(x[i]-dAve);
        }
        //reture Math.sqrt(dVar/(m-1));
        return Math.sqrt(dVar/m);
    }
    public static double Sum(double[] data) {
        double sum = 0;
        for (int i = 0; i < data.length; i++)
            sum = sum + data[i];
        return sum;
    }

    public static double Mean(double[] data) {
        double mean = 0;
        mean = Sum(data) / data.length;
        return mean;
    }

    // population variance 总体方差
    public static double POP_Variance(double[] data) {
        double variance = 0;
        for (int i = 0; i < data.length; i++) {
            variance = variance + (Math.pow((data[i] - Mean(data)), 2));
        }
        variance = variance / data.length;
        return variance;
    }

    //连接远程主机，执行命令
    public static String exeCommand(String host, int port, String user, String password, String command) throws JSchException, IOException {
        JSch jsch = new JSch();
        Session session = jsch.getSession(user, host, port);
        session.setConfig("StrictHostKeyChecking", "no");
        //    java.util.Properties config = new java.util.Properties();
        //   config.put("StrictHostKeyChecking", "no");
        session.setPassword(password);
        session.connect();

        ChannelExec channelExec = (ChannelExec) session.openChannel("exec");
        InputStream in = channelExec.getInputStream();
        channelExec.setCommand(command);
        channelExec.setErrStream(System.err);
        channelExec.connect();
        String out = IOUtils.toString(in, "UTF-8");

        channelExec.disconnect();
        session.disconnect();

        return out;
    }

    //设置真实任务的任务量
    public  void setRealWorkLoad(){
        //获取主机信息
        Map<String, String> devicesInfo = IndexService.devicesInfo;

        //仿真数据
        Map<String, List<OutputEntity>> simulationDate = IndexService.outputMap;

        //设置任务量
        for(String key : simulationDate.keySet()){
            List<OutputEntity> outputEntity_list = simulationDate.get(key);
            System.out.println(key + ":");
            int[] workLoad = new int[outputEntity_list.size()];
            String[]  times = new String[outputEntity_list.size()];
            for (int i = 0; i < outputEntity_list.size() ; i++) {
                OutputEntity outputEntity = outputEntity_list.get(i);
                double time = Double.parseDouble(outputEntity.getTime());
                times[i] = outputEntity.getTime();
                String dataCenterId = outputEntity.getDataCenterId();
                String vmId = outputEntity.getVmId();
                int mips = Integer.parseInt(devicesInfo.get(vmId));
//                System.out.println("mips:" + mips);
                int workLoad_item =new  Double(time * mips).intValue();
                System.out.println("workLoad_item:" + workLoad_item);
                workLoad[i] = workLoad_item;
                outputEntity.setWorkLoad(workLoad_item + "");
//                System.out.println(outputEntity.toString());
            }
        }

    }

    //获取outputmap仿真数据
    public static void  getSimulationDate() throws IOException, JSchException {

        Map<String, String> devicesInfo = IndexService.devicesInfo;

        for (String key: devicesInfo.keySet()) {
            System.out.print(key + " ");
            System.out.print(devicesInfo.get(key));
            System.out.println();
        }

        //使用镜像名称
        String image = "count";

//        int m_mips = 1000;
//        int f_mips = 1300;
//        int c_mips = 1600;
        Map<String, List<OutputEntity>> simulationDate = IndexService.outputMap;

        /*List<Double[]> record = IndexService.record;
//        List<Double[]> record_double = IndexService.record_double;
//        record_double.clear();
        for (Double[] item : record) {
            for(int i = 0; i < item.length ; i++){
                System.out.print(item[i] + "==");
            }
            System.out.println();
        }*/


        System.out.println("dockerlink out:");
        for(String key : simulationDate.keySet()){
            List<OutputEntity> outputEntity_list = simulationDate.get(key);
            System.out.println(key + ":");
            int[] workLoad = new int[outputEntity_list.size()];
            String[]  times = new String[outputEntity_list.size()];
            for (int i = 0; i < outputEntity_list.size() ; i++) {
                OutputEntity outputEntity = outputEntity_list.get(i);
                double time = Double.parseDouble(outputEntity.getTime());
                times[i] = outputEntity.getTime();
                String dataCenterId = outputEntity.getDataCenterId();
                String vmId = outputEntity.getVmId();
                int mips = Integer.parseInt(devicesInfo.get(vmId));
//                System.out.println("mips:" + mips);
                int workLoad_item =new  Double(time * mips).intValue();
                System.out.println("workLoad_item:" + workLoad_item);
                workLoad[i] = workLoad_item;
                /*if(dataCenterId.contains("m")){
                   int workLoad_item =new  Double(time * m_mips).intValue();
//                    System.out.println(workLoad_item);
                   workLoad[i] = workLoad_item;
                }else if(dataCenterId.contains("f")){
                    int workLoad_item =new  Double(time * f_mips).intValue();
//                    System.out.println(workLoad_item);
                    workLoad[i] = workLoad_item;
                }else if(dataCenterId.contains("c")){
                    int workLoad_item =new  Double(time * c_mips).intValue();
//                    System.out.println(workLoad_item);
                    workLoad[i] = workLoad_item;
                }*/
                System.out.println(outputEntity.toString());
            }
            //任务量
            String runTimeArr_str = "";
            for (int item : workLoad) {
//                System.out.print(item + " ");
                runTimeArr_str += item + ",";

            }
            //仿真时间
            String simTimes = "";
            for (String item :times) {
                simTimes += item + ",";
            }
            simTimes = simTimes.substring(0,simTimes.length() - 1);
            System.out.println("simTimes:" + simTimes);
//            System.out.println(runTimeArr_str);
            runTimeArr_str = runTimeArr_str.substring(0,runTimeArr_str.length() - 1);
            System.out.println(runTimeArr_str);
            String command = "cd workspace\n" +
                    "./run.sh" + " " + cpu_percent + " " + image + " " + runTimeArr_str;
            String res =exeCommand(host,port,user,password,command);
//            System.out.println(res);
            String[] res_arr = res.split("\n");
            /*for (String item : res_arr) {
                System.out.println("item:");
                System.out.println(item);
            }*/
            String realTime = res_arr[res_arr.length - 2];
            realTime = realTime.substring(0,realTime.length() - 1);
            System.out.println("reaTime:" + realTime);

            //统计真实环境下的执行总时间和终端设备执行时间和执行总成本
            int realTotalTime = 0;
            int mobileRealTotalTime = 0;
            double realTotalCost = 0;

            //设置真实执行时间
            String[] realTime_arr = realTime.split(" ");
            for (int i = 0; i < realTime_arr.length; i++) {
                String realTime_item = realTime_arr[i];
                if(realTime_item.equals("0")){
                    System.out.println("realTime item:" + realTime_item);
                    realTime_item = "1";
                    realTime_arr[i] = realTime_item;
                }
                OutputEntity outputEntity = outputEntity_list.get(i);
                outputEntity.setRealTime(realTime_item);
                //计算执行总时间
                realTotalTime += Integer.parseInt(realTime_item);
                double price = 1.0;
                outputEntity.setRealCost(Integer.parseInt(realTime_item) * price + "");

                //计算执行总成本
                realTotalCost += Double.parseDouble(outputEntity.getRealCost());

                //筛选出终端设备执行时间
                String dataCenterId = outputEntity.getDataCenterId();
                if(dataCenterId.contains("m")){
                    int realTime_mobile = Integer.parseInt(outputEntity.getRealTime());
                    mobileRealTotalTime += realTime_mobile;
                }

//                System.out.println(outputEntity.toString());
            }
            System.out.println("realTotalTime:" + realTotalTime);
            System.out.println("mobileRealTotalTime:" + mobileRealTotalTime);
            System.out.println("realTotalCost:" + realTotalCost);
        }

    }


    //在真实环境中执行单个任务
    public String getSingleData(OutputEntity output) throws IOException, JSchException {

        String workLoad = output.getWorkLoad();
        String workType = output.getWorkType();

        //使用镜像名称
//        String image = "pi";
        String image = "";
        if(workType.equals("pi")){
            System.out.println("pi");
            image = "pi";
        }else if(workType.equals("kmp")){
            System.out.println("kmp");
            image = "kmp";
        }else if(workType.equals("levenshtein")){
            System.out.println("levenshtein");
            image = "levenshtein";
        }else if(workType.equals("selectsort")){
            System.out.println("selectsort");
            image = "selectsort";
        }

        System.out.println("dockerlink out:");
        String command = "cd workspace\n" +
                "./run.sh" + " " + cpu_percent + " " + image + " " + workLoad;
        String res = exeCommand(host,port,user,password,command);
//            System.out.println(res);
        String[] res_arr = res.split("\n");
            /*for (String item : res_arr) {
                System.out.println("item:");
                System.out.println(item);
            }*/
        String realTime = res_arr[res_arr.length - 2];
        realTime = realTime.substring(0,realTime.length() - 1);
        double price = 0.8;
        BigDecimal bd   =   new   BigDecimal(Double.parseDouble(realTime) * price + "");
//        String realCost_string   =   bd.setScale(2,BigDecimal.ROUND_HALF_UP) + "";
//        String realCost = Double.parseDouble(realTime) * price + "";
        String realCost = bd.setScale(2,BigDecimal.ROUND_HALF_UP) + "";
        System.out.println("reaTime:" + realTime);
//        System.out.println("realCost:" + realCost);

        //修改真实环境下的执行参数
        output.setRealTime(Double.valueOf(realTime) + "");
        output.setRealCost(realCost);
        output.setRealStatus("SUCCESS");
        output.setRealStartTime(output.getStartTime());

        DecimalFormat dft = new DecimalFormat("######0.00");
        double realFinishTime = Double.valueOf(output.getStartTime()) + Double.valueOf(realTime);
//        System.out.println("realFinishTime:" + realFinishTime);
//        System.out.println("realFinishTime-dft:" + dft.format(realFinishTime));
        output.setRealFinishTime(dft.format(realFinishTime) + "");

        System.out.println(output.toString());
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("real_outputEntity", output);

        return jsonObject.toJSONString();
    }
}
