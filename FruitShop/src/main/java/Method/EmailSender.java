package Method;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.Properties;

public class EmailSender {
    private static final String SMTP_HOST = "smtp.gmail.com"; // SMTP server của Gmail
    private static final int SMTP_PORT = 587;
    private static final String EMAIL_USERNAME = "nguyentin8704@gmail.com"; // Email của bạn
    private static final String EMAIL_PASSWORD = "tkye ylhw hesj zowd"; // Mật khẩu ứng dụng

    /**
     * Gửi email với nội dung cụ thể.
     * 
     * @param recipient Địa chỉ email người nhận.
     * @param subject Chủ đề email.
     * @param message Nội dung email.
     * @return true nếu gửi thành công, ngược lại false.
     */
    public static boolean sendEmail(String recipient, String subject, String message) {
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", SMTP_HOST);
        properties.put("mail.smtp.port", String.valueOf(SMTP_PORT));

        // Xác thực email
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL_USERNAME, EMAIL_PASSWORD);
            }
        });

        try {
            // Tạo thông điệp email
            Message mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress(EMAIL_USERNAME));
            mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
            mimeMessage.setSubject(subject);
            mimeMessage.setText(message);

            // Gửi email
            Transport.send(mimeMessage);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace(); // Log lỗi nếu có
            return false;
        }
    }
}