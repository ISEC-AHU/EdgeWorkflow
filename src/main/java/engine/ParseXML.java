package engine;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ParseXML {
    /**
     * 获取顶点集合的方法
     * @param filePath xml文件路径
     * @return 顶点集合points
     */
    public static List<String> getPoints(String filePath){
        List<String> points = new ArrayList<>();
        SAXReader reader = new SAXReader();// 创建SAXReader对象用于读取xml文件
        try {
            Document doc = reader.read(new File(filePath));// 读取xml文件，获得Document对象
            Element root = doc.getRootElement();// 获取根元素
            List<Element> jobElements = root.elements("job");// 获取根元素下的所有job标签的子元素
            final int N = jobElements.size();// 图的顶点数量信息
            String idStr;// 辅助变量存完整id
            int idInt;// 辅助变量存整形id数字
            for (int i = 0; i < N; i++) {
                idStr = jobElements.get(i).attributeValue("id");
                idInt = Integer.parseInt(idStr.substring(idStr.lastIndexOf("D")+1));
                points.add("" + idInt);
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        return points;
    }


    /**
     * 获取顶点依赖关系集合的方法
     * @param filePath xml文件路径
     * @return 依赖关系集合links
     */
    public static List<Map<String, String>> getLinks(String filePath){
        List<Map<String,String>> links = new ArrayList<>();
        SAXReader reader = new SAXReader();// 创建SAXReader对象用于读取xml文件
        try {
            Document doc = reader.read(new File(filePath));// 读取xml文件，获得Document对象
            Element root = doc.getRootElement();// 获取根元素
            List<Element> childElements = root.elements("child");// 获取根元素下的所有child标签的子元素
            final int N = childElements.size();// child的数量
            for (int i = 0; i < N; i++) {
                String targetStr = childElements.get(i).attributeValue("ref");
                int targetInt = Integer.parseInt(targetStr.substring(targetStr.lastIndexOf("D") + 1));
                String target = "" + targetInt;// 辅助变量存放终点id数字字符串
                List<Element> parents = childElements.get(i).elements("parent");
                for(Element parent : parents){
                    Map<String,String> map = new HashMap<>();// 辅助变量存放一个依赖关系
                    String sourceStr = parent.attributeValue("ref");
                    int sourceInt = Integer.parseInt(sourceStr.substring(sourceStr.lastIndexOf("D") + 1));
                    String source = "" + sourceInt;// 辅助变量存放源点id数字字符串
                    map.put("source",source);
                    map.put("target",target);
                    links.add(map);
                }
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        return links;
    }



    /**
     * 获取顶点集合的方法
     * @param filePath xml文件路径
     * @return 顶点集合points
     */
    public static List<String> getCustomPoints(String filePath){
        List<String> points = new ArrayList<>();
        SAXReader reader = new SAXReader();// 创建SAXReader对象用于读取xml文件
        try {
            Document doc = reader.read(new File(filePath));// 读取xml文件，获得Document对象
            Element root = doc.getRootElement();// 获取根元素
            List<Element> jobElements = root.elements("job");// 获取根元素下的所有job标签的子元素
            final int N = jobElements.size();// 图的顶点数量信息
            String idStr;// 辅助变量存完整id
//            int idInt;// 辅助变量存整形id数字
            for (int i = 0; i < N; i++) {
                idStr = jobElements.get(i).attributeValue("id");
//                idInt = Integer.parseInt(idStr.substring(idStr.lastIndexOf("D")+1));
                points.add("" + idStr);
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        return points;
    }


    /**
     * 获取顶点依赖关系集合的方法
     * @param filePath xml文件路径
     * @return 依赖关系集合links
     */
    public static List<Map<String, String>> getCustomLinks(String filePath){
        List<Map<String,String>> links = new ArrayList<>();
        SAXReader reader = new SAXReader();// 创建SAXReader对象用于读取xml文件
        try {
            Document doc = reader.read(new File(filePath));// 读取xml文件，获得Document对象
            Element root = doc.getRootElement();// 获取根元素
            List<Element> childElements = root.elements("child");// 获取根元素下的所有child标签的子元素
            final int N = childElements.size();// child的数量
            for (int i = 0; i < N; i++) {
                String targetStr = childElements.get(i).attributeValue("ref");
//                int targetInt = Integer.parseInt(targetStr.substring(targetStr.lastIndexOf("D") + 1));
//                String target = "" + targetInt;// 辅助变量存放终点id数字字符串
                String target = "" + targetStr;// 辅助变量存放终点字符串
                List<Element> parents = childElements.get(i).elements("parent");
                for(Element parent : parents){
                    Map<String,String> map = new HashMap<>();// 辅助变量存放一个依赖关系
                    String sourceStr = parent.attributeValue("ref");
//                    int sourceInt = Integer.parseInt(sourceStr.substring(sourceStr.lastIndexOf("D") + 1));
//                    String source = "" + sourceInt;// 辅助变量存放源点id数字字符串
                    String source = "" + sourceStr;// 辅助变量存放源点字符串
                    map.put("source",source);
                    map.put("target",target);
                    links.add(map);
                }
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        return links;
    }

}
