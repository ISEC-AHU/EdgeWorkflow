package engine;

import java.util.List;
import java.util.Map;

public class Test {
    public static void main(String[] args){


//        String filePath = "E:\\workflow\\Montage_20.xml";
        String filePath = "E:\\dagXML\\line3_3.xml";
        List<String> points = ParseXML.getPoints(filePath);
        List<Map<String,String>> links = ParseXML.getLinks(filePath);
        System.out.println("points: " + points);
        System.out.println("links:" + links);
    }
}
