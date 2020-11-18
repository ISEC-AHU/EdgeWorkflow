package engine;

import java.util.*;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DagGraphUtil {

    private final int MAX_LENGTH_X = 2000;
    private final int MAX_LENGTH_Y = 2000;
    private int maxX;
    private Map<String, Integer> toNum;
    private Map<String, Integer> xPosition;
    private Map<String, Integer> yPosition;
    private Map<String, Integer> pointWeight;
    private List<Integer> ySize;
    private List<String> points;
    private List<Map<String, String>> links;

    public DagGraphUtil(List<String> points, List<Map<String, String>> links) {
        this.points = points;
        this.links = links;
        toNum = new HashMap<>(points.size());
        xPosition = new HashMap<>(points.size());
        yPosition = new HashMap<>(points.size());
        pointWeight = new HashMap<>(points.size());
        maxX = 0;
        ySize = new ArrayList<>();

        for (String point : points) {
            toNum.put(point, 0);
            pointWeight.put(point, 0);
        }
        for (Map<String, String> link : links) {
            String toPoint = link.get("target");
            addMapValue(toNum, toPoint, 1);
        }
    }

    public Map<String, Object> drawDagGraph() {
        Map<String, Object> result = new HashMap<>(3);
        dfs(0);
        List<Map<String, Object>> pList = new ArrayList<>(points.size());
        for (String point : points) {
            int xUnitLength = MAX_LENGTH_X / maxX;
            int x = xPosition.get(point) * xUnitLength + xUnitLength / 2;
            int yUnitLength = MAX_LENGTH_Y / ySize.get(xPosition.get(point));
            int y = yPosition.get(point) * yUnitLength + yUnitLength / 2;
            Map<String, Object> map = new HashMap<>(3);
            map.put("name", point);
            map.put("x", x);
            map.put("y", y);
            pList.add(map);
        }
        result.put("points", pList);
        result.put("links", links);
        return result;
    }

    private void dfs(int depth) {
        List<String> currentPoints = new ArrayList<>();
        for (String key : toNum.keySet()) {
            if (toNum.get(key) == 0) {
                currentPoints.add(key);
                addMapValue(toNum, key, -1);
            }
        }
        if (currentPoints.isEmpty()) {
            return;
        }
        maxX = depth + 1;
        ySize.add(currentPoints.size());
        Collections.sort(currentPoints, new Comparator<String>() {

            public int compare(String o1, String o2) {
                return pointWeight.get(o1) - pointWeight.get(o2);
            }
        });
        for (int i = 0, len = currentPoints.size(); i < len; i++) {
            String point = currentPoints.get(i);
            xPosition.put(point, depth);
            yPosition.put(point, i);
            for (Map<String, String> link : links) {
                if (link.get("source").equals(point)) {
                    maxMapValue(pointWeight, link.get("target"), i + 1);
                    addMapValue(toNum, link.get("target"), -1);
                }
            }
        }
        dfs(depth + 1);
    }

    private void addMapValue(Map<String, Integer> map, String key, Integer value) {
        if (map.containsKey(key)) {
            map.put(key, map.get(key) + value);
        } else {
            map.put(key, value);
        }
    }

    private void maxMapValue(Map<String, Integer> map, String key, Integer value) {
        if (!map.containsKey(key) || map.get(key) == 0 || map.get(key) < value) {
            map.put(key, value);
        }
    }


}
