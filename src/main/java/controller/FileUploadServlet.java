package controller;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

//@WebServlet(name = "FileUploadServlet", value = "/fileuploadservlet.do")
@Controller
@RequestMapping(value = "/fileuploadservlet.do")
public class FileUploadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String msg = null;
        String fileName = null;
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");

        Enumeration em = request.getParameterNames();
        while (em.hasMoreElements()) {
            String s = (String) em.nextElement();
        }

        ServletFileUpload upload = new ServletFileUpload(
                new DiskFileItemFactory());// 解析    //创建上传文件对象

        try {
            List itemList = upload.parseRequest(request);
            for (Iterator it = itemList.iterator(); it.hasNext(); ) {
                FileItem item = (FileItem) it.next();
                if (!item.isFormField())// 如果是非表单数据
                {
                    if (item.getName().length() <= 0) return;

                    fileName = item.getName().replace("/", "\\");
                    if (fileName.lastIndexOf("\\") != -1) {
                        fileName = fileName.substring(fileName.lastIndexOf("\\"));
                    }

                    //If you need to modify the upload file directory, modify the path
                    String path = "D:\\web_user_resource\\hrmapp_img";

                    //If you need to customize the file name, you can modify the filename
                    File f = new File(path, fileName);
                    f.getParentFile().mkdirs();//

                    InputStream ins = item.getInputStream();
                    OutputStream ous = new FileOutputStream(f);
                    byte[] tmp = new byte[1024];
                    int len = -1;
                    //read and write file to server
                    while ((len = ins.read(tmp)) != -1) {
                        ous.write(tmp, 0, len);
                    }
                    ous.close();
                    ins.close();

                    msg = fileName; //success,return upload file name
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            msg = "upload file failed";
        }

        PrintWriter out = response.getWriter();
        out.write(msg);
    }

    public String getRootPath(String path) {
        String rootpath;
        int pos = path.lastIndexOf("\\");
        rootpath = path.substring(0, pos);
        pos = rootpath.lastIndexOf("\\");
        rootpath = rootpath.substring(0, pos + 1);
        return rootpath;
    }
}
