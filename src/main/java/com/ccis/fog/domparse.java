package com.ccis.fog;
import java.awt.*;
import java.io.*;
import javax.swing.*;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
public class domparse {

    private static Document doc = null;// 创建一个Document对象
    private static int n = 50;
    private static String [] name = new String[n];//节点名称
    private static  String [] Id = new String[n];//节点id
    private static String [] runtime= new String[n];//节点运行时间
    private static String [] edgeid = new String[n];//边id
    private static String [] sourceref = new String[n];//来源节点或者父节点
    private static String [] targetref= new String[n];//目标节点或者子节点
    private static  String [] data= new String[n];//数据大小
    private static int nodenumber = 0;
    private static int edgenumber=0;
    private static String loction = new String();//存放路径
    private static String [] hasdata= new String[n];//已经处理的边无需再处理

       /* DomParseFile xml = new DomParseFile();
        //String  getfile=xml.selectfile();
        String getfile="B:/Abiye/ActivitiExplorer/src/main/resources/transform/Epigenomics_24 _activiti.xml";
        xml.getDocument(getfile);//加载需要导入的xml文件，并进行解析
        xml.intitialdata();//节点信息初始化
        xml.showintitialdata();//展示数据
        xml.deleteNode();//删除根节点信息进行重构，节点坐标信息仍然保留
        xml.creatNode();//创建xml任务节点
        xml.createdge();//创建xml边
        xml.edgedependency();//创建边依赖
        xml.deleteionode();//删除头尾无用依赖节点
        xml.saveXml();*/
        //xmlto.creatxml();//创建新的xml文件

        // String getfile="B:/Abiye/ActivitiExplorer/src/main/resources/transform/subprocess.xml";

    @Value("${sim.xml_path}")
    private String xml_path;

    @Value("${dagXmlPath}")
    private String dagxmlpath;

    @Value("${activitiXmlPath}")
    private String activitixmlpath;

    //选择文件路径
    public String selectfile(){
        String pathField = "";
        String xmlpath = "";
        JFileChooser fileChooser=new JFileChooser("B:/");//默认首先搜寻路径,可根据自己的需要进行修改
        if(UIManager.getLookAndFeel().isSupportedLookAndFeel()){//使用系统的文件管理器
            final String platform = UIManager.getSystemLookAndFeelClassName();
            if (!UIManager.getLookAndFeel().getName().equals(platform)) {
                try {
                    UIManager.setLookAndFeel(platform);
                } catch (Exception exception) {
                    exception.printStackTrace();
                }
            }
        }
        if(fileChooser.showOpenDialog(null)==JFileChooser.APPROVE_OPTION){

            pathField=fileChooser.getSelectedFile().getPath();//文本框给出路径
            xmlpath = fileChooser.getSelectedFile().getName();//获取加密文件名

            // System.out.println("路径："+pathField);
            // System.out.println("文件名："+xmlpath);
            //xmlpath = pathField.getText() ;
            // xmlpath = xmlpath.substring(0,imgpath.length()-	imgname.length());//获取加密的文件所在的文件夹
        }
        return pathField;
    }


    /**
     * 获得DOM树
     *
     */
    public void getDocument(String getfile) {
        // 得到DOM工厂解析器工厂实例
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        try {
            // 2、从DOM工厂中获得Dom解析器
            DocumentBuilder db = factory.newDocumentBuilder();
            // 3、解析XML文件获得Document对象，即DOM树
            doc = db.parse(getfile);
        } catch (ParserConfigurationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SAXException | IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    /**
     * 子流程转换
     *
     */
    public void  SubprocesstoDAG(){
        NodeList Brandservice = doc.getElementsByTagName("subProcess");//获得所有标签名字为subProcess的节点

    }


    /**
     * 数据初始化
     *
     */
    String finalName =new String();
    public void intitialdata() {
        /*获取任务节点信息*/
        NodeList Brandservice = doc.getElementsByTagName("serviceTask");//获得所有标签名字为serviceTask的节点
        nodenumber=Brandservice.getLength();
        for (int i = 0; i < Brandservice.getLength(); i++  ) {
            Element node = (Element) Brandservice.item(i);
            runtime[i]=node.getElementsByTagName("documentation").item(0).getFirstChild().getNodeValue();//存放任务节点运行时间
            //通过Node对象的getAttributes()方法获取全的属性值
            NamedNodeMap servicemap = node.getAttributes();
            //循环遍每一个任务节点的属性值
            Node  nodename=servicemap.item(1);
            Node  nodeid=servicemap.item(0);
            name[i]=nodename.getNodeValue();
            Id[i]=nodeid.getNodeValue();
        }
        System.out.println("****************任务节点数据存储成功！******************");
        /*获取文件名称信息*/
        NodeList namenodes = doc.getElementsByTagName("process");//获得所有标签名字为process的节点,设置文件名
        Element namenode = (Element) namenodes.item(0);
        NamedNodeMap namemaps = namenode.getAttributes();
        String s=new String();//
        s=namemaps.item(2).getNodeValue();//存放工作流名称
        String node_No = String.valueOf(nodenumber);
        finalName = s+"_"+node_No +".xml";
//        loction="/root/sim/activitiXML/"+s+"_"+node_No +".xml";
//          loction="E:/activitiXML/"+s+"_"+node_No +".xml";
        loction = activitixmlpath +s+"_"+node_No +".xml";
//        loction="E:/"+s+".xml";
//         System.out.println("文件名："+s);
        // s.concat(".xml");

        loction.concat(s);

//        System.out.println("文件名："+loction);
        /*获取边信息*/
        NodeList Brandedge = doc.getElementsByTagName("sequenceFlow");//获得所有标签名字为sequenceFlow的节点
        edgenumber=Brandedge.getLength();
        for (int j = 0; j < Brandedge.getLength(); j++  ) {
            Element edge = (Element) Brandedge.item(j);
            data[j]=edge.getElementsByTagName("documentation").item(0).getFirstChild().getNodeValue();//存放节点输入输出数据
            //通过Node对象的getAttributes()方法获取全的属性值
            NamedNodeMap edgemap = edge.getAttributes();
            //循环遍每一个边的属性值
            Node  edgetargetref=edgemap.item(2);
            Node  edgesourceref=edgemap.item(1);
            Node  edgeidid=edgemap.item(0);
            targetref[j]=edgetargetref.getNodeValue();//子节点
            sourceref[j]=edgesourceref.getNodeValue();//父节点
            edgeid[j]=edgeidid.getNodeValue();//数据大小
        }
        System.out.println("********************边数据存储成功！*********************");
    }
    /**
     * 测试节点属性是否全部加载
     */
    public void showintitialdata() {
        NodeList Brandservice = doc.getElementsByTagName("serviceTask");//获得所有标签名字为serviceTask的节点
        for (int i = 0; i < Brandservice.getLength(); i++  ) {
            System.out.print("ID: "+ Id[i]+"  ");
            System.out.print("节点名称: "+ name[i]+"  ");
            System.out.print("运行时间: "+ runtime[i] +"\n");
        }
        NodeList edgeservice = doc.getElementsByTagName("sequenceFlow");//获得所有标签名字为serviceTask的节点
        for (int j = 0; j < edgeservice.getLength(); j++  ) {
            System.out.print("边ID: "+ edgeid[j]+"  ");
            System.out.print("源节点: "+ sourceref[j]+"  ");
            System.out.print("目标节点: "+ targetref[j] +"   ");
            System.out.print("数据大小: "+ data[j] +"\n");
        }
        System.out.println("******************所有数据完成解析！***********************");
    }

    /*删除根节点   */
    public void deleteNode(){
        NodeList brandsEle = doc.getElementsByTagName("definitions");
        Element rootnode = (Element) brandsEle.item(0);
        String brandAttribute = rootnode.getAttribute("typeLanguage");
        // System.out.println("根节点属性："+brandAttribute);
        if(brandAttribute.equals("http://www.w3.org/2001/XMLSchema")){
            doc.getElementsByTagName("definitions").item(0).getParentNode().removeChild(rootnode);
           // System.out.println("*****************删除无用节点成功!**************");
        }

    }

    /**
     * 更新XML树任务节点
     */
    public void creatNode() {
        // 创建根节点
        Element rootnode = doc.createElement("adga");
        rootnode.setAttribute("jobCount", String.valueOf(nodenumber));
        rootnode.setAttribute("version", "1.0");
        // System.out.println("创建成功!");
        // 创建job节点
      //  System.out.println("**************内存中节点数为："+nodenumber);
        for(int i =0;i<nodenumber;i++){
            Element type = doc.createElement("job");
            type.setAttribute("id", Id[i]);
            type.setAttribute("name", name[i]);
            type.setAttribute("version", "1.0");
            type.setAttribute("runtime",runtime[i]);
            // 把job元素挂到adag上
            rootnode.appendChild(type);
        }
        doc.appendChild(rootnode);
      //  System.out.println("**************XML树任务节点生成成功!**************");
        NodeList Job = doc.getElementsByTagName("job");
        //System.out.println("生成XML树中JOB节点数："+Job.getLength());
    }
    /**
     * 更新xml边信息
     *
     */
    public void createdge() {
        // 创建任务节点输入子节点uses
        for (int ii = 0; ii < edgenumber; ii++) {//生成每个节点的输入边
            Element uses = doc.createElement("uses");
            uses.setAttribute("file", edgeid[ii]);
            uses.setAttribute("link", "input");
            uses.setAttribute("register", "true");
            uses.setAttribute("transfer", "true");
            uses.setAttribute("optional", "false");
            uses.setAttribute("type", "data");
            uses.setAttribute("size", data[ii]);
            NodeList edgeNodes = doc.getElementsByTagName("job");//找到所有的Job结点
            for (int jj = 0; jj < edgeNodes.getLength(); jj++) {
                Node edgenode = edgeNodes.item(jj);
                if (edgenode.getAttributes().item(0).getNodeValue().equals(targetref[ii])) {//判断其是否为源节点
                    // 把输出类型的uses节点挂到job上
                    edgenode.appendChild(uses);
                }
            }
        }
        // 创建任务节点输出子节点uses
        for (int i = 0; i < edgenumber; i++) {//生成每个节点的输入边
            Element uses = doc.createElement("uses");
            uses.setAttribute("file", edgeid[i]);
            uses.setAttribute("link", "output");
            uses.setAttribute("register", "true");
            uses.setAttribute("transfer", "true");
            uses.setAttribute("optional", "false");
            uses.setAttribute("type", "data");
            uses.setAttribute("size", data[i]);
            NodeList edgeNodes = doc.getElementsByTagName("job");//找到所有的Job结点
            for (int j = 0; j < edgeNodes.getLength(); j++) {
                //Node edgenode = edgeNodes.item(j);
                Element edgenode = (Element) edgeNodes.item(j);
                String value=edgenode.getAttributes().item(0).getNodeValue();
                String value1=sourceref[i];
                //System.out.println("值为："+value+"    后者值为："+value1);
                // if(value.isEmpty()||value1.isEmpty())break;
                if (value.equals(value1)) {//判断其是否为源节点
                    // 把输出类型的uses节点挂到job上
                    edgenode.appendChild(uses);
                }
            }
        }
    }

    public void edgedependency() {//添加边依赖
        int number=0;
        NodeList adags = doc.getElementsByTagName("adga");//找到adga根节点
        Node rootnode = adags.item(0);
        for(int i=0;i<edgenumber;i++) {
            Boolean flag = Boolean.TRUE;
            for (int m = 0; m < number; m++) {
                if (hasdata[m].equals(targetref[i])) flag = Boolean.FALSE;//已经添加
            }
            Element child = doc.createElement("child");
            child.setAttribute("ref", targetref[i]);
            if (flag) {//条件满足说明该点并未加入
                hasdata[number] = targetref[i];//添加
                number++;
                for (int j = 0; j < edgenumber; j++) {
                    // if(hasadd(i))break;
                    if (targetref[i].equals(targetref[j])) {
                        Element parent = doc.createElement("parent");
                        parent.setAttribute("ref", sourceref[j]);
                        child.appendChild(parent);
                        rootnode.appendChild(child);
                    }
                }
            }
        }
    }
    public void deleteionode() {
        NodeList outputnodes = doc.getElementsByTagName("child");//获得所有标签名字为child的节点
        for (int i = 0; i < outputnodes.getLength(); i++) {
            Element outputnode = (Element) outputnodes.item(i);
            String brandAttribute = outputnode.getAttribute("ref");
            // System.out.println("根节点属性："+brandAttribute);
            if (brandAttribute.equals("output")) {
                outputnodes.item(i).getParentNode().removeChild(outputnode);
            }
        }
        NodeList ionodes = doc.getElementsByTagName("parent");//获得所有标签名字为child的节点
        for (int j = 0; j < ionodes.getLength(); j++) {
            for (int i = 0; i < ionodes.getLength(); i++) {
                Element ionode = (Element) ionodes.item(i);
                String brandAttribute = ionode.getAttribute("ref");
                // System.out.println("根节点属性："+brandAttribute);
                if (brandAttribute.equals("input")) {
                    Node y = ionodes.item(i).getParentNode();
                    doc.getElementsByTagName("parent").item(i).getParentNode().getParentNode().removeChild(y);
                }
            }
        }
    }




    /**
     * 显示xml文档信息 ！
     */
    public void showInfo() {
        // 获取DOM树Brand节点
        NodeList BrandName = doc.getElementsByTagName("serviceTask");//获得所有标签名字为serviceTask的节点

       /* for (int i = 0; i < BrandName.getLength(); i++  ) {
            // 获取第i个Brand元素的信息（返回i元素）
            Node brand = BrandName.item(i);
            // Element是Node的子类，用Element的getAttribute("属性名")获得元素属性
            Element element = (Element) brand;
            // 获取第i个Brand元素的name属性
            String brandAttribute = element.getAttribute("name");
            // 获得所有的子节点
            NodeList types = element.getChildNodes();
            for (int j = 0; j < types.getLength(); j++ ) {
                Node type = types.item(j);
                // 判断是否是元素节点(使用getChildNodes()就要判断)
                if (type.getNodeType() == Node.ELEMENT_NODE) {
                    Element typeEle = (Element) type;
                    String typeAttribute = typeEle.getAttribute("name");
                    System.out.println("NAME：" +  brandAttribute +  typeAttribute);
                }
            }
        }*/
    }

    /**
     * 更改Brand属性
     *
     */
    public void changeType(){
        //获得节点信息
        NodeList brandElements = doc.getElementsByTagName("Brand");
        //遍历节点
        for (int i = 0; i < brandElements.getLength(); i++  ) {
            Node brands = brandElements.item(i);
            Element brand=(Element) brands;

            String brandAtt = brand.getAttribute("name");
            //判断节点属性值
            if(brandAtt.equals("runtime")){
                brand.setAttribute("name", "111");
            }
        }
    }
    /**
     * 删除指定节点的属性
     */
    public void deleteNode(String name){
        NodeList brandsEle = doc.getElementsByTagName("process");
        for (int i = 0; i < brandsEle.getLength(); i ++ ) {
            Element brand = (Element) brandsEle.item(i);
            String brandAttribute = brand.getAttribute("name");
            if(brandAttribute.equals(name)){
                doc.getElementsByTagName("runtime").item(0).removeChild(brand);
            }

        }
    }



    /**
     * 保存xml文档
     */
    public void saveXml() {
        // 创建转换工厂
        TransformerFactory factory = TransformerFactory.newInstance();
        try {
            // 从工厂中获得转换器
            Transformer Transformer = factory.newTransformer();
            // 进行转换，如果直接转换可能出现乱码，需要进行格式设置
            // 输出文件编码格式设置
            Transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            Transformer.setOutputProperty(OutputKeys.ENCODING, "gb2312");
            // 需要DOM转换的源文件
            DOMSource xmlSource = new DOMSource(doc);
            // 指定目标路径
            StreamResult outputTarget = new StreamResult(new FileOutputStream(
                    loction));

            // 使用transform()进行保存xml文件
            Transformer.transform(xmlSource, outputTarget);
           // System.out.println("*************文件已经保存成功！************");
           // System.out.println("*************文件保存路径为："+loction+"************");
        } catch (TransformerConfigurationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (TransformerException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    public String back(){
        return loction;
    }


    public void creatxml() throws ParserConfigurationException {//新建xml文件

//创建DocumentBuilderFactory对象
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
//创建DocumentBuilder对象
        DocumentBuilder db = dbf.newDocumentBuilder();
//创建Document对象
        Document document = db.newDocument();
//创建根节点
        Element rootnode = document.createElement("adag");
        rootnode.setAttribute("jobCount", "24");
        rootnode.setAttribute("version", "1.0");
//创建job节点
        Element book = document.createElement("job");
//给job节点设置属性和属性值
        book.setAttribute("id", "1");
//将job节点添加到bookstore节点下
        rootnode.appendChild(book);
//将job节点添加到Document对象中
        document.appendChild(rootnode);

        TransformerFactory ttf = TransformerFactory.newInstance();
        try {
            Transformer tf = ttf.newTransformer();
            tf.setOutputProperty(OutputKeys.INDENT, "yes");
            tf.transform(new DOMSource(document), new StreamResult("DOMCreate.xml"));
        } catch (TransformerConfigurationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }catch (TransformerException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}




