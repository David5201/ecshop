package com.lbcto.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

public class MailUtil implements Runnable {
	private String email;// 收件人邮箱
    private String code;// 激活码
    private String username;  // 显示用户名

    public MailUtil(String email,String username, String code) {
        this.email = email;
        this.username = username;
        this.code = code;
    }

    public void run() {
        // 1.创建连接对象javax.mail.Session
        // 2.创建邮件对象 javax.mail.Message
        // 3.发送一封激活邮件
        String from = "1042738887@qq.com";// 发件人电子邮箱
        String host = "smtp.qq.com"; // 指定发送邮件的主机smtp.qq.com(QQ)|smtp.163.com(网易)

        Properties properties = System.getProperties();// 获取系统属性

        properties.setProperty("mail.smtp.host", host);// 设置邮件服务器
        properties.setProperty("mail.smtp.auth", "true");// 打开认证

        try {
            //QQ邮箱需要下面这段代码，163邮箱不需要
            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            properties.put("mail.smtp.ssl.enable", "true");
            properties.put("mail.smtp.ssl.socketFactory", sf);


            // 1.获取默认session对象
            Session session = Session.getDefaultInstance(properties, new Authenticator() {
                public PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("admin@ccoder.cc", "tkzxnbhcznzpbedb"); // 发件人邮箱账号、授权码
                }
            });

            // 2.创建邮件对象
            Message message = new MimeMessage(session);
            // 2.1设置发件人
            message.setFrom(new InternetAddress(from));
            // 2.2设置接收人
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            // 2.3设置邮件主题
            message.setSubject("修改密码");
            // 2.4设置邮件内容
            String content = "<html><head></head><body><h1>这是一封来自"+username+"修改密码邮件, 您的密码已经修改，请尽快登录进行修改密码，密码如下：</h1>"+
            		"<h3>"+code+"</h3></body></html>";
            message.setContent(content, "text/html;charset=UTF-8");
            // 3.发送邮件
            Transport.send(message);
            System.out.println("邮件成功发送!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        //这样执行
        //MailUtil mailUtil = new MailUtil("2336722357@qq.com","lubiao147258","45465465465");
        //mailUtil.run();
        //或者这样执行
        // 收件人邮箱   收件人用户名（激活用户名）  激活码
        //new MailUtil("1042738887@qq.com","聪聪","121212121").run();
    	new MailUtil("1033753973@qq.com", "购物官方网站", "454f5d4f45d").run();
    }

}
