package com.craft.service.impl;

import com.craft.common.result.JsonResponse;
import com.craft.service.IEmailService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;


@Service
public class EmailServiceImpl implements IEmailService {

    Logger logger = LogManager.getLogger(EmailServiceImpl.class);

    @Value("${email.account}")
    public String myEmailAccount;
    @Value("${email.password}")
    public String myEmailPassword;
    @Value("${smtp.host}")
    public String myEmailSMTPHost;
    @Value("${smtp.port}")
    public String SMTPPort;

    @Value("${email.ssl}")
    public boolean SSL;


    /**
     * 发送邮件
     *
     * @return
     */
    @Override
    public Object sendEmail(String receiveMail, String content,
                            String subject) {

        Properties props = new Properties();                    // 参数配置
        props.setProperty("mail.transport.protocol", "smtp");   // 使用的协议（JavaMail规范要求）
        props.setProperty("mail.smtp.host", myEmailSMTPHost);   // 发件人的邮箱的 SMTP 服务器地址
        props.setProperty("mail.smtp.auth", "true");            // 需要请求认证

        if (SSL) {
            props.setProperty("mail.smtp.port", SMTPPort);
            props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.setProperty("mail.smtp.socketFactory.fallback", "false");
            props.setProperty("mail.smtp.socketFactory.port", SMTPPort);
        }

        Session session = Session.getDefaultInstance(props);

        try {
            // 3. 创建一封邮件
            MimeMessage message = createMimeMessage(session, myEmailAccount, receiveMail, content, subject);

            Transport transport = session.getTransport();

            transport.connect(myEmailAccount, myEmailPassword);

            transport.sendMessage(message, message.getAllRecipients());

            // 7. 关闭连接
            transport.close();

            return JsonResponse.createBySuccessMessage("发送邮件成功");
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(" 发送邮件失败 {}", e.toString());
            return JsonResponse.createByErrorMessage("发送邮件失败");
        }

    }


    /**
     * 创建一封只包含文本的简单邮件
     *
     * @param session     和服务器交互的会话
     * @param sendMail    发件人邮箱
     * @param receiveMail 收件人邮箱
     * @param content     内容
     * @param subject     主题
     * @return
     * @throws Exception
     */
    public MimeMessage createMimeMessage(Session session, String sendMail, String receiveMail, String content,
                                         String subject) throws Exception {
        // 1. 创建一封邮件
        MimeMessage message = new MimeMessage(session);


        message.setFrom(new InternetAddress(sendMail, sendMail, "UTF-8"));


        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, receiveMail, "UTF-8"));

        message.setSubject(subject, "UTF-8");


        message.setContent(content, "text/html;charset=UTF-8");

        // 6. 设置发件时间
        message.setSentDate(new Date());

        // 7. 保存设置
        message.saveChanges();

        return message;
    }
}
